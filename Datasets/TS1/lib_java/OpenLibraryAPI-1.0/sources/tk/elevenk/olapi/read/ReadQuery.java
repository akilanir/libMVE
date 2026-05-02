package tk.elevenk.olapi.read;

import java.util.HashMap;

/* loaded from: OpenLibraryAPI-1.0.jar:tk/elevenk/olapi/read/ReadQuery.class */
public class ReadQuery extends HashMap<String, String> {
    public static final String ISBN = "isbn";
    public static final String LCCN = "lccn";
    public static final String OCLC = "oclc";
    public static final String OLID = "olid";

    public void olid(String value) {
        put(OLID, value);
    }

    public void isbn(String value) {
        put("isbn", value);
    }

    public void lccn(String value) {
        put(LCCN, value);
    }

    public void oclc(String value) {
        put(OCLC, value);
    }
}
