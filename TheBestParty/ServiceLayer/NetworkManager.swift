import Foundation

protocol NetworkServiceProtocol {
    func getCocktails(searchTerm: String, completion: @escaping((Result<CocktailModel, APIError>) -> Void))
}

public enum APIError: Error {
    case internalError
    case serverError
    case parsingError
}

final class NetworkService: NetworkServiceProtocol {
    struct Constants {
        static let cocktail = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s="
//        "https://www.thecocktaildb.com/api/json/v1/1/random.php"
//        static let searchCocktail = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s="
    }

    private enum Method: String {
        case GET
    }

    public func getCocktails(searchTerm: String, completion: @escaping((Result<CocktailModel, APIError>) -> Void)) {
        request(with: Constants.cocktail, searchTerm: searchTerm, method: .GET, completion: completion)
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


////import Combine
//import Foundation
//
//protocol NetworkProvider {
//    func getRandomCocktail(completion: @escaping((Result<CocktailModel, APIError>) -> Void))
//    func getCocktails(searchItem: String, completion: @escaping((Result<CocktailModel, APIError>) -> Void))
////    func getRandomCocktail() -> AnyPublisher<CocktailModel, APIError>
//}
//
//public enum APIError: Error {
//    case internalError
//    case serverError
//    case parsingError
//}
//
//final class NetworkManager: NetworkProvider {
//    struct Constants {
//        static let randomCocktail = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
//        static let searchCocktail = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s="
//    }
//
//    private enum Method: String {
//        case GET
//    }
//
//    public func getRandomCocktail(completion: @escaping((Result<CocktailModel, APIError>) -> Void)) {
//        request(with: Constants.randomCocktail, searchItem: "", method: .GET, completion: completion)
//    }
//
//    public func getCocktails(searchItem: String, completion: @escaping((Result<CocktailModel, APIError>) -> Void)) {
//        request(with: Constants.searchCocktail, searchItem: searchItem, method: .GET, completion: completion)
//    }
////
////    public func getRandomCocktail() -> AnyPublisher<CocktailModel, APIError> {
////        return call(method: .GET)
////    }
//
//    private func request<T: Codable>(with url: String, searchItem: String, method: Method, completion: @escaping((Result<T, APIError>) -> Void)) {
//        let path = url + searchItem
//
//        guard let url = URL(string: path) else {
//            completion(.failure(.internalError))
//            print("Invalid url")
//
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "\(method)"
//        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
//
//        call(with: request, completion: completion)
//    }
//
//    private func call<T: Codable>(with request: URLRequest, completion: @escaping((Result<T, APIError>) -> Void)) {
//        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            guard error == nil else {
//                completion(.failure(.serverError))
//                print("Server error")
//                print(String(describing: error))
//
//                return
//            }
//            do {
//                guard let data = data else {
//                    completion(.failure(.serverError))
//                    print("Server error")
//                    print(String(describing: error))
//
//                    return
//                }
//
//                let object = try JSONDecoder().decode(T.self, from: data)
//                completion(Result.success(object))
//            } catch {
//                completion(Result.failure(.parsingError))
//                print(String(describing: error))
//            }
//        }
//
//        dataTask.resume()
//    }
//
////    private func request(method: Method) -> URLRequest {
////        let path = Constants.randomCocktail
////
////        guard let url = URL(string: path) else {
////            preconditionFailure("Invalid url string")
////        }
////
////        var request = URLRequest(url: url)
////        request.httpMethod = "\(method)"
////        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
////
////        return request
////    }
////
////    private func call<T: Codable>(method: Method) -> AnyPublisher<T, APIError> {
////        let urlRequest = request(method: method)
////
////        return URLSession.shared.dataTaskPublisher(for: urlRequest)
////            .mapError { _ in APIError.serverError }
////            .map { $0.data }
////            .decode(type: T.self, decoder: JSONDecoder())
////            .mapError { _ in APIError.parsingError }
////            .eraseToAnyPublisher()
////    }
//}