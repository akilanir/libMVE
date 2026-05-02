package nl.siegmann.epublib.epub;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import nl.siegmann.epublib.domain.Book;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/epub/BookProcessorPipeline.class */
public class BookProcessorPipeline implements BookProcessor {
    private Logger log;
    private List<BookProcessor> bookProcessors;

    public BookProcessorPipeline() {
        this(null);
    }

    public BookProcessorPipeline(List<BookProcessor> bookProcessingPipeline) {
        this.log = LoggerFactory.getLogger(BookProcessorPipeline.class);
        this.bookProcessors = bookProcessingPipeline;
    }

    @Override // nl.siegmann.epublib.epub.BookProcessor
    public Book processBook(Book book) {
        if (this.bookProcessors == null) {
            return book;
        }
        for (BookProcessor bookProcessor : this.bookProcessors) {
            try {
                book = bookProcessor.processBook(book);
            } catch (Exception e) {
                this.log.error(e.getMessage(), e);
            }
        }
        return book;
    }

    public void addBookProcessor(BookProcessor bookProcessor) {
        if (this.bookProcessors == null) {
            this.bookProcessors = new ArrayList();
        }
        this.bookProcessors.add(bookProcessor);
    }

    public void addBookProcessors(Collection<BookProcessor> bookProcessors) {
        if (this.bookProcessors == null) {
            this.bookProcessors = new ArrayList();
        }
        this.bookProcessors.addAll(bookProcessors);
    }

    public List<BookProcessor> getBookProcessors() {
        return this.bookProcessors;
    }

    public void setBookProcessingPipeline(List<BookProcessor> bookProcessingPipeline) {
        this.bookProcessors = bookProcessingPipeline;
    }
}
