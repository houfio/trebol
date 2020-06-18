import Foundation

struct Plant: Codable, Identifiable {
    public let id: Int
    public let scientificName: String
    public let familyCommonName: String?
    public let commonName: String?
    public let images: [Picture]?
}
