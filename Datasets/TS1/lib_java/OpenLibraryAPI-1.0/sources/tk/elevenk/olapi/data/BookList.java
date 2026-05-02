package tk.elevenk.olapi.data;

import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import tk.elevenk.olapi.logging.Log;

/* loaded from: OpenLibraryAPI-1.0.jar:tk/elevenk/olapi/data/BookList.class */
public class BookList extends ArrayList<BookData> {
    public BookList() {
    }

    public BookList(JSONArray jsonArray) {
        this();
        processBooks(jsonArray);
    }

    private List<BookData> processBooks(JSONArray jsonArray) {
        for (int i = 0; i < jsonArray.length(); i++) {
            try {
                add(BookData.bookFromSearch((JSONObject) jsonArray.get(i)));
            } catch (JSONException e) {
                Log.e("", e);
            }
        }
        return this;
    }

    @Override // java.util.ArrayList, java.util.AbstractList, java.util.List
    public BookData get(int index) {
        BookData book;
        if (index < size()) {
            book = (BookData) super.get(index);
        } else {
            book = BookData.bookFromSearch(new JSONObject());
        }
        return book;
    }
}
