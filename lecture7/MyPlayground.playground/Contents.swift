import UIKit

struct Book {
    let id: Int
    let name: String
    var count: Int
}

enum LibraryInventoryError : Error {
    case bookNotFound
    case bookOutOfStock
}

class LibraryInventory {
    var books = [1: Book(id: 1, name: "Swift", count: 20), 2: Book(id: 2, name: "Apple IOS", count: 20)]
    
    func borrow(bookId: Int) -> (Book?, LibraryInventoryError?) {
        guard let book = books[bookId] else {
            return (nil, LibraryInventoryError.bookNotFound)
        }
        
        guard book.count > 1 else {
            return (nil, LibraryInventoryError.bookOutOfStock)
        }
        
        var newBook = book
        newBook.count -= 1
        
        return (newBook, nil)
    }
    
    func borrow(bookid: Int) throws -> Book  {
        guard let book = books[bookid] else {
            throw LibraryInventoryError.bookNotFound
        }
        
        guard book.count > 1 else {
            throw LibraryInventoryError.bookOutOfStock
        }
        
        var newBook = book
        newBook.count -= 1
        
        return newBook
    }
}

let library = LibraryInventory()

let result = library.borrow(bookId: 1)

if let book = result.0 {
    print("borrowed book named: \(book.name)")
} else if let error = result.1 {
    print("exception occured \(error.localizedDescription)")
}

do {
    let bookItem = try library.borrow(bookid: 1)
    print("borrowed book named: \(bookItem.name)")
} catch LibraryInventoryError.bookNotFound {
    print("Book not found")
} catch LibraryInventoryError.bookOutOfStock {
    print("Book out of stock")
} catch let error {
    print("Unknown error occured \(error.localizedDescription)")
}
