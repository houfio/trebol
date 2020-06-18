import Foundation

struct Plant: Codable, Identifiable {
    public let id: Int
    public let scientificName: String
    public let slug: String
}
