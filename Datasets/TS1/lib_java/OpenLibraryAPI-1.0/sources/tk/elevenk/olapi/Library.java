package tk.elevenk.olapi;

import java.util.Map;
import tk.elevenk.olapi.books.BookQuery;
import tk.elevenk.olapi.data.BookData;
import tk.elevenk.olapi.data.Credential;
import tk.elevenk.olapi.read.ReadQuery;
import tk.elevenk.olapi.search.SearchQuery;
import tk.elevenk.olapi.search.SearchResults;

/* loaded from: OpenLibraryAPI-1.0.jar:tk/elevenk/olapi/Library.class */
public interface Library {

    /* loaded from: OpenLibraryAPI-1.0.jar:tk/elevenk/olapi/Library$LibraryCallbacks.class */
    public interface LibraryCallbacks {
        void onSearchUpdate(Object obj);
    }

    SearchResults search(SearchQuery searchQuery);

    BookData getBookDetails(BookQuery bookQuery);

    BookData getReadingDetails(ReadQuery readQuery);

    Object getEbook(BookData bookData);

    Object findRandomBook(LibraryCallbacks libraryCallbacks);

    boolean login(Credential credential);

    void cancelRequest();

    Map getCoverUrls(Object obj, Object obj2);

    String getBaseUrl();
}
