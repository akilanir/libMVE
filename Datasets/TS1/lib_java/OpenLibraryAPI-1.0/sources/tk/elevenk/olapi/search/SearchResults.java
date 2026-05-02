package tk.elevenk.olapi.search;

import org.json.JSONException;
import org.json.JSONObject;
import tk.elevenk.olapi.data.BookList;

/* loaded from: OpenLibraryAPI-1.0.jar:tk/elevenk/olapi/search/SearchResults.class */
public class SearchResults {
    public static final String STARTING_BOOK_NUM = "start";
    public static final String NUMBER_OF_RESULTS = "num_found";
    public static final String BOOKS = "docs";
    private JSONObject results;

    public SearchResults(JSONObject json) {
        this.results = json;
    }

    public BookList getBooks() {
        BookList list;
        try {
            list = new BookList(this.results.getJSONArray(BOOKS));
        } catch (JSONException e) {
            list = new BookList();
        }
        return list;
    }

    public int getStartingBookNum() {
        try {
            return this.results.getInt(STARTING_BOOK_NUM);
        } catch (JSONException e) {
            return -1;
        }
    }

    public int getNumberOfResults() {
        try {
            return this.results.getInt(NUMBER_OF_RESULTS);
        } catch (JSONException e) {
            return -1;
        }
    }

    public JSONObject getUnderlyingJSON() {
        return this.results;
    }
}
