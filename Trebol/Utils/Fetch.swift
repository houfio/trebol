import Foundation

class Fetch {
    private let url: String = "https://trefle.io/api/"
    private let token: String = "YU5XeXBybjMwMCsydTJzOWkvOUsyZz09"
    
    public func get<T: Codable>(route: String, completion: @escaping (T) -> ()) {
        if let url = URL(string: "\(self.url)\(route)?token=\(self.token)") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                    if let json = try? decoder.decode(T.self, from: data) {
                        DispatchQueue.main.async {
                            completion(json)
                        }
                    }
                }
            }.resume()
        }
    }
}
