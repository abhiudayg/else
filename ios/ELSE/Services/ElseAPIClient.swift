import Foundation

struct HealthResponse: Decodable {
    let status: String
    let service: String?
    let product: String?
}

actor ElseAPIClient {
    var baseURL: URL = URL(string: "http://localhost:8080")!

    func health() async throws -> HealthResponse {
        let (data, response) = try await URLSession.shared.data(from: baseURL.appending(path: "api/v1/health"))
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(HealthResponse.self, from: data)
    }
}
