import Foundation
import Alamofire

final class NetworkingManager {
    
    static let shared = NetworkingManager()
    
    private enum Constants {
        static let baseURL = "https://jsonplaceholder.typicode.com"
    }
    
    private enum EndPoints {
        static let todos = "/todos"
    }
    
    public func getData (completion: @escaping(([ToDo]) -> Void)) {
        AF.request(Constants.baseURL + EndPoints.todos).responseDecodable(of: [ToDo].self) { response in
            switch response.result {
            case .success(let model):
                completion(model)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private init() {}
}
