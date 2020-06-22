import Foundation
import Combine

final class TrefleService {
    func fetchPlant(_ id: Int) -> AnyPublisher<PlantDetailContainer, Error> {
        let url = self.createURL("/plants/\(id)")

        return self.receiveData(url)
    }

    func fetchPlants(_ search: String = "") -> AnyPublisher<[PlantContainer], Error> {
        let url = self.createURL("/plants", query: [URLQueryItem(name: "q", value: search)])

        return self.receiveData(url)
    }

    private func receiveData<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
        let decoder = JSONDecoder()

        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { response in
                response.data
            }
            .decode(type: T.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    private func createURL(_ path: String, query: [URLQueryItem] = []) -> URL {
        var components = URLComponents()

        components.scheme = "https"
        components.host = "trefle.io"
        components.path = "/api" + path
        components.queryItems = [URLQueryItem(name: "token", value: "YU5XeXBybjMwMCsydTJzOWkvOUsyZz09")] + query

        return components.url!
    }
}

struct PlantContainer: Decodable, Hashable {
    let id: Int
    let scientificName: String
}

struct PlantDetailContainer: Decodable, Encodable, Hashable {
    let id: Int
    let scientificName: String
    let images: [ImageContainer]
}

struct ImageContainer: Decodable, Encodable, Hashable {
    let url: String
}
