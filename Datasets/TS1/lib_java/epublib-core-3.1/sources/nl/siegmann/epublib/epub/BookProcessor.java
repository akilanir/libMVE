package nl.siegmann.epublib.epub;

import nl.siegmann.epublib.domain.Book;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/epub/BookProcessor.class */
public interface BookProcessor {
    public static final BookProcessor IDENTITY_BOOKPROCESSOR = new BookProcessor() { // from class: nl.siegmann.epublib.epub.BookProcessor.1
        @Override // nl.siegmann.epublib.epub.BookProcessor
        public Book processBook(Book book) {
            return book;
        }
    };

    Book processBook(Book book);
}
