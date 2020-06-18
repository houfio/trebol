import Foundation

struct Plant: Codable, Identifiable {
    public let id: Int
    public let scientificName: String
    //public let commonName: String
    public let slug: String
}
