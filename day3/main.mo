import Book "book";
import List "mo:base/List";

actor {

    // 6. In main.mo import the type List from the Base Library and create a list that stores books.
    type Book = Book.Book;
    var booklist = List.nil<Book>();
    // In main.mo create a function called add_book that takes a book as parameter and 
    // returns nothing this function should add this book to your list.
    public func add_book(book : Book): async (){
      booklist := List.push<Book>(book, booklist);
    };
    // Then create a second function called get_books that takes no parameter
    // but returns an Array that contains all books stored in the list.
    public func get_books(): async [Book]{
      return List.toArray(booklist);
    }

};