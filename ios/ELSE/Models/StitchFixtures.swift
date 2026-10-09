import Foundation

enum StitchFixtures {
    static let decideClothes = ContextObject(
        id: UUID(),
        source: "camera",
        content: "Navy wool vs black twill shirts",
        question: "Which shirt should I wear?",
        job: .decide,
        verdict: "Pick the navy one.",
        reason: "It works with more of your existing wardrobe and is easier to dress up or down.",
        confidence: .veryLikely,
        engine: .init(engine: "Apple on-device", mode: .automatic, provider: "Apple"),
        topic: "Attire",
        deadline: nil,
        createdAt: Date(),
        saved: true,
        relationships: ["Oxford", "Chino"]
    )

    static let actDocument = ContextObject(
        id: UUID(),
        source: "photo",
        content: "Return notice §4.2",
        question: "Do I need to do anything?",
        job: .act,
        verdict: "Return this by October 22.",
        reason: "The document states that the item must be returned within the stated 14-day return period.",
        confidence: .veryLikely,
        engine: .init(engine: "Apple on-device", mode: .automatic, provider: "Apple"),
        topic: "Documents",
        deadline: Calendar.current.date(from: DateComponents(year: 2026, month: 10, day: 22)),
        createdAt: Date(),
        saved: true,
        relationships: ["Notice Ref: #882-QX"]
    )

    static let shoesSkip = ContextObject(
        id: UUID(),
        source: "camera",
        content: "Common Projects Achilles Low Match",
        question: "Should I buy these shoes?",
        job: .decide,
        verdict: "No — I’d skip them.",
        reason: "They overlap with a pair you already own and the price is relatively high.",
        confidence: .likely,
        engine: .init(engine: "Apple on-device", mode: .automatic, provider: "Apple"),
        topic: "Shopping",
        deadline: nil,
        createdAt: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(),
        saved: true,
        relationships: ["Oliver Cabell Low 1"]
    )

    static var sampleHistory: [ContextObject] {
        [decideClothes, shoesSkip, actDocument]
    }
}
