import Foundation

struct Test: Decodable {
    let buttonTitle: String
    let content: String?
    let isLive: Bool
    
    private enum CodingKeys: String, CodingKey {
        case buttonTitle = "button_title"
        case content
        case isLive = "is_live"
    }
}

let json = "{\r\n  \"button_title\": \"VISIT US\",\r\n  \"content\": \"We are doing it again! Let's hope it doesn't rain this time. \r\n\r\nWe’re hopping on a ferry and going to an island in the south. Lazarus island offers great views but there’s zero shops there, so make sure you bring everything you need! That includes, lots of water, sustenance, sunscreen, bathing suit etc. We’ll bring some picnic goods too! \r\n\r\nMeeting Venue: Marina South Pier MRT \r\nDate & Time: 11 May 2019, 10:30am\r\n\r\nMake sure you have $20 cash for the ferry ride and don’t be late! The ferry leaves promptly at 11am. We’ll leave Lazarus for mainland at 3pm.\",\r\n  \"is_live\": true\r\n}".replacingOccurrences(of: "\r\n ", with: "")
    .replacingOccurrences(of: "\r\n}", with: " }")
    .replacingOccurrences(of: "\r", with: "\\r")
    .replacingOccurrences(of: "\n", with: "\\n")


let obj = try JSONDecoder().decode(Test.self, from: json.data(using: .utf8)!)
print(obj)
//print(obj?.date)

//struct Demo: Encodable {
//    let date: Date
//}
//let d = Demo(date: Date())
//let data = JSONEncoder().encode(d)
//let jsonString = String(data: data, encoding: .utf8)
//print(jsonString)
