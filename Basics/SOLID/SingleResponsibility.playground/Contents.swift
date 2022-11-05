import UIKit

// Single Responsibility Principal

struct Book {
    let name: String
    let author: String
    let publishedDate: String
}

class Library {
    var entries = [Book]()
    var count = 0
    
    func add(_ book: Book) -> Int {
        count += 1
        entries.append(book)
        return count
    }
    func removeEntry(at index: Int) {
        entries.remove(at: index)
    }
    var description: String {
        return entries.compactMap({$0.name}).joined(separator: "\n,")
    }
    /////////////////////// Breaking Single responsibility principal
    func saveToFile(_ book: Book) {
        // save to file
    }
    func loadFromFile(_ book: Book) {
        // load file from Filemanager or from cloud
    }
}
class Storage {
    func saveToFile(name: String) {
        
    }
}

let library = Library()
library.add(Book(name: "Harry Poter", author: "JK Rawling", publishedDate: "July 21st 2007"))
library.add(Book(name: "Three Mistake of my life", author: "Chetan Bhagat", publishedDate: "July 21st 2007"))

print(library.description)
library.removeEntry(at: 0)
print(library.description)

