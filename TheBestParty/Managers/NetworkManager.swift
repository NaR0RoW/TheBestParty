import Foundation

protocol NetworkProvider {
    func getRandomCocktail(completion: @escaping((Result<CocktailModel, APIError>) -> Void))
}

enum APIError: Error {
    case internalError
    case serverError
    case parsingError
}

final class NetworkManager: NetworkProvider {
    struct Constants {
        static let randomCocktail = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
    }

    private enum Method: String {
        case GET
    }

    func getRandomCocktail(completion: @escaping((Result<CocktailModel, APIError>) -> Void)) {
        request(method: .GET, completion: completion)
    }

    private func request<T: Codable>(method: Method, completion: @escaping((Result<T, APIError>) -> Void)) {
        let path = Constants.randomCocktail

        guard let url = URL(string: path) else {
            completion(.failure(.internalError))
            print("Invalid url string")

            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "\(method)"
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]

        call(with: request, completion: completion)
    }

    func call<T: Codable>(with request: URLRequest, completion: @escaping((Result<T, APIError>) -> Void)) {
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
