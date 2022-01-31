import Foundation

protocol NetworkProviderForCocktails {
    func getCocktails(searchTerm: String, completion: @escaping((Result<CocktailModelObject, APIError>) -> Void))
}

protocol NetworkProviderForRandomCocktail {
    func getRandomCocktail(completion: @escaping((Result<CocktailModelObject, APIError>) -> Void))
}

fileprivate typealias NetworkServiceProtocol = NetworkProviderForCocktails & NetworkProviderForRandomCocktail

public enum APIError: Error {
    case internalError
    case serverError
    case parsingError
}

final class NetworkService: NetworkServiceProtocol {
    private enum Constants: String {
        case searchForCocktail = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s="
        case randomCocktail = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
    }

    private enum Method: String {
        case GET
    }

    public func getCocktails(searchTerm: String, completion: @escaping((Result<CocktailModelObject, APIError>) -> Void)) {
        request(with: Constants.searchForCocktail.rawValue, searchTerm: searchTerm, method: .GET, completion: completion)
    }
    
    public func getRandomCocktail(completion: @escaping((Result<CocktailModelObject, APIError>) -> Void)) {
        request(with: Constants.randomCocktail.rawValue, searchTerm: "", method: .GET, completion: completion)
    }

    private func request<T: Codable>(with url: String, searchTerm: String, method: Method, completion: @escaping((Result<T, APIError>) -> Void)) {
        let path = url + searchTerm

        guard let url = URL(string: path) else {
            completion(.failure(.internalError))
            print("Invalid url")

            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "\(method)"
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]

        call(with: request, completion: completion)
    }

    private func call<T: Codable>(with request: URLRequest, completion: @escaping((Result<T, APIError>) -> Void)) {
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.serverError))
                print("Server error")
                print(String(describing: error))

                return
            }
            do {
                guard let data = data else {
                    completion(.failure(.serverError))
                    print("Server error")
                    print(String(describing: error))

                    return
                }

                let object = try JSONDecoder().decode(T.self, from: data)
                completion(Result.success(object))
            } catch {
                completion(Result.failure(.parsingError))
                print(String(describing: error))
            }
        }

        dataTask.resume()
    }
}
