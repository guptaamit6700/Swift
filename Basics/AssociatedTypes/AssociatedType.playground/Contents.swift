import UIKit
import Foundation

var greeting = "Hello, playground"

// Expectation - TextFileParser should return String but HTML parser should return array

protocol Parser {
    associatedtype Input
    associatedtype Output
    func parse(input: Input) -> Output
}
class TextFileParser: Parser {
    func parse(input: String) -> String {
        "TextFileString"
    }
}
class HTMLParser: Parser {
    func parse(input: String) -> [String] {
        return ["a", "b", "c"]
    }
}
class JsonParser: Parser {
    typealias Input = String
    
    typealias Output = [String: String]
    func parse(input: Input) -> Output {
        return ["": ""]
    }
}

func runParser<P: Parser>(parser: P, input: [P.Input]) where P.Input == JsonParser {
    
}
