import Foundation

class Fetch {
    private static let url: String = "https://trefle.io/api/"
    private static let token: String = "YU5XeXBybjMwMCsydTJzOWkvOUsyZz09"
    
    public static func get<T: Codable>(route: String, query: String? = "", completion: @escaping (T) -> Void) {
        if let url = URL(string: "\(self.url)\(route)?token=\(self.token)\(query ?? "")") {
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
