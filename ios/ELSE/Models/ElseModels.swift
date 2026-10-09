import Foundation

enum ElseJob: String, CaseIterable, Identifiable, Codable {
    case decide = "Decide"
    case understand = "Understand"
    case act = "Act"
    var id: String { rawValue }
}

enum EngineMode: String, CaseIterable, Identifiable, Codable {
    case automatic = "Automatic"
    case onDeviceOnly = "On-device only"
    case myOwnModel = "My own model"
    var id: String { rawValue }
}

enum ConfidenceLabel: String, Codable {
    case veryLikely = "Very likely"
    case likely = "Likely"
    case ambiguous = "Ambiguous"
    case notCertain = "Not certain"
}

struct EngineRecord: Codable, Hashable {
    var engine: String
    var mode: EngineMode
    var provider: String?
}

struct ContextObject: Identifiable, Codable, Hashable {
    var id: UUID
    var source: String
    var content: String
    var question: String
    var job: ElseJob
    var verdict: String
    var reason: String
    var confidence: ConfidenceLabel
    var engine: EngineRecord
    var topic: String
    var deadline: Date?
    var createdAt: Date
    var saved: Bool
    var relationships: [String]
}

struct HistoryDayGroup: Identifiable {
    var id: String { title }
    var title: String
    var subtitle: String
    var items: [ContextObject]
}
