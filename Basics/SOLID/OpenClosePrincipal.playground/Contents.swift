import UIKit

/// Open Close Principal
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

class BookFilter {
    // Filter books by name
    func filterByName(_ books: [Book], _ name: String) -> [Book] {
        var result = [Book]()
        for book in books {
            if book.name == name {
                result.append(book)
            }
        }
        return result
    }
    //Filter Book by Published Date
    func filterBookBy(name: String, date: String, books: [Book]) -> [Book] {
        var result = [Book]()
        for book in books {
            if book.publishedDate == date, book.name == name {
                result.append(book)
            }
        }
        return result
    }
}
/// Protocol oriented approach
protocol Specification {
    associatedtype T
    func isSatisfied(_ item: T) -> Bool
}
protocol Filter {
    associatedtype T
    func filter<Spec: Specification>(_ items: [T], _ spec: Spec) -> [T]
    where Spec.T == T;
}
class NameSpecification: Specification {
    typealias T = Book
    let name: String
    init(_ name: String) {
        self.name = name
    }
    func isSatisfied(_ item: Book) -> Bool {
        return item.name == self.name
    }
}
class AuthorSpecification: Specification {
    typealias T = Book
    let author: String
    init(_ author: String) {
        self.author = author
    }
    func isSatisfied(_ item: Book) -> Bool {
        return item.author == self.author
    }
}
class AndSpecification<T,
                       SpecA: Specification,
                       SpecB: Specification> : Specification
where  T == SpecA.T, T == SpecB.T {
    let first: SpecA
    let second: SpecB
    init(_ first: SpecA, _ second: SpecB) {
        self.first = first
        self.second = second
    }
    func isSatisfied(_ item: T) -> Bool {
        return first.isSatisfied(item) && second.isSatisfied(item)
    }
}
    


class NewFilter: Filter {
    typealias T = Book

    func filter<Spec: Specification>(_ items: [Book], _ spec: Spec) -> [Book] where Book == Spec.T {
        var result = [Book]()
        for item in items {
            if spec.isSatisfied(item) {
                result.append(item)
            }
        }
        return result
    }
}

let library = Library()
library.add(Book(name: "Harry Poter", author: "JK Rawling", publishedDate: "July 21st 2007"))
library.add(Book(name: "Three Mistake of my life", author: "Chetan Bhagat", publishedDate: "July 21st 2007"))

print(library.description)
let bookFilter = BookFilter()
bookFilter.filterByName(library.entries, "Harry Poter")

let newFilter  = NewFilter()
let filteredBooks = newFilter.filter(library.entries, NameSpecification("Three Mistake of my life"))

for book in filteredBooks {
    print("New books filtered by New Filter is\n \(book.name)")
}

let filteredByNameANdAuthorBooks = newFilter.filter(library.entries, AndSpecification(NameSpecification("Three Mistake of my life"), AuthorSpecification("Chetan Bhagat")))

for book in filteredByNameANdAuthorBooks {
    print("New books filtered by name and Author is\n \(book.name)")
}
// Now if we want to apply the filter on the basis of multiple specification with And condition then we can do this way

