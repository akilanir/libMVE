package tk.elevenk.olapi.books;

import java.util.HashMap;

/* loaded from: OpenLibraryAPI-1.0.jar:tk/elevenk/olapi/books/BookQuery.class */
public class BookQuery extends HashMap<String, String> {
    private static final String BIBKEYS = "bibkeys";
    private static final String FORMAT = "format";
    private static final String CALLBACK = "callback";
    private static final String JSCMD = "jscmd";

    public void isbn(String value) {
        put(BIBKEYS, "ISBN:" + value);
    }

    public void oclc(String value) {
        put(BIBKEYS, "OCLC:" + value);
    }

    public void lccn(String value) {
        put(BIBKEYS, "LCCN:" + value);
    }

    public void olid(String value) {
        put(BIBKEYS, "OLID:" + value);
    }

    public void format(String value) {
        put(FORMAT, value);
    }

    public void callback(String value) {
        put(CALLBACK, value);
    }

    public void jscmd(String value) {
        put(JSCMD, value);
    }
}
