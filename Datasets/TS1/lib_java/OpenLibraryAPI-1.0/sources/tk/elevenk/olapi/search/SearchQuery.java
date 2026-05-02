package tk.elevenk.olapi.search;

import java.util.HashMap;

/* loaded from: OpenLibraryAPI-1.0.jar:tk/elevenk/olapi/search/SearchQuery.class */
public class SearchQuery extends HashMap<String, String> {
    public static final String QUERY = "q";
    public static final String HAS_FULL_TEXT = "has_fulltext";
    public static final String TITLE = "title";
    public static final String AUTHOR = "author";
    public static final String ISBN = "isbn";
    public static final String SUBJECT = "subject";
    public static final String PLACE = "place";
    public static final String PERSON = "person";
    public static final String PUBLISHER = "publisher";
    public static final String PAGE = "page";
    public static final String LANGUAGE = "language";
    public static final String SORT = "sort";

    public String query(String query) {
        if (query != null && query.length() > 0) {
            return put(QUERY, query.trim());
        }
        return null;
    }

    public String hasFullText() {
        return hasFullText("true");
    }

    public String hasFullText(boolean flag) {
        return hasFullText(String.valueOf(flag));
    }

    private String hasFullText(String bool) {
        return put(HAS_FULL_TEXT, bool);
    }

    public String title(String title) {
        if (title != null && title.length() > 0) {
            return put(TITLE, title.trim());
        }
        return null;
    }

    public String author(String author) {
        if (author != null && author.length() > 0) {
            return put(AUTHOR, author.trim());
        }
        return null;
    }

    public String isbn(String isbn) {
        if (isbn != null && isbn.length() > 0) {
            return put("isbn", isbn.trim());
        }
        return null;
    }

    public String subject(String subject) {
        if (subject != null && subject.length() > 0) {
            return put(SUBJECT, subject.trim());
        }
        return null;
    }

    public String place(String place) {
        if (place != null && place.length() > 0) {
            return put(PLACE, place.trim());
        }
        return null;
    }

    public String person(String person) {
        if (person != null && person.length() > 0) {
            return put(PERSON, person.trim());
        }
        return null;
    }

    public String publisher(String publisher) {
        if (publisher != null && publisher.length() > 0) {
            return put(PUBLISHER, publisher.trim());
        }
        return null;
    }

    public String page(int page) {
        if (page > 0) {
            return page(String.valueOf(page).trim());
        }
        return null;
    }

    private String page(String page) {
        if (page != null && page.length() > 0) {
            return put(PAGE, page.trim());
        }
        return null;
    }

    public String language(String lang) {
        if (lang != null && lang.length() > 0) {
            return put(LANGUAGE, lang);
        }
        return null;
    }

    public String sort(String method) {
        if (method != null && method.length() > 0) {
            return put(SORT, method.trim());
        }
        return null;
    }
}
