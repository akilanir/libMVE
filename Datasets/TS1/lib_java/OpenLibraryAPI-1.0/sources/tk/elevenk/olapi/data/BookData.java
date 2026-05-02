package tk.elevenk.olapi.data;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import tk.elevenk.olapi.Library;
import tk.elevenk.olapi.books.BookQuery;
import tk.elevenk.olapi.logging.Log;
import tk.elevenk.olapi.read.ReadQuery;
import tk.elevenk.olapi.search.SearchQuery;

/* loaded from: OpenLibraryAPI-1.0.jar:tk/elevenk/olapi/data/BookData.class */
public class BookData {
    private static final String EDITION_KEY = "edition_key";
    private static final String TITLE_SEARCH = "title";
    private static final String TITLE_SUGGEST = "title_suggest";
    private static final String AUTHOR = "author_name";
    private static final String SUBJECT = "subject";
    private static final String PUBLISH_DATE = "publish_date";
    private static final String NUM_EBOOKS = "ebook_count_i";
    private static final String COVER_ID = "cover_i";
    private static final String HAS_FULL_TEXT = "has_fulltext";
    private static final String OCLC = "oclc";
    private static final String ISBN = "isbn";
    private static final String TEXT_SEARCH = "text";
    private static final String AUTHOR_KEY = "author_key";
    private static final String PUBLISHER = "publisher";
    private static final String COVER_EDITION_KEY = "cover_edition_key";
    private static final String PUBLISH_YEARS = "publish_year";
    private static final String FIRST_PUBLISHED_YEAR = "first_publish_year";
    private static final String CONTRIBUTOR = "contributor";
    private static final String NUM_EDITIONS = "edition_count";
    private static final String PUBLIC_SCANNED_BOOK = "public_scan_b";
    private static final String IA_LOADED_ID = "ia_loaded_id";
    private static final String SEED = "seed";
    private static final String IA = "ia";
    private static final String IA_COLLECTION_S = "ia_collection_s";
    private static final String TYPE = "type";
    private static final String PUBLISH_PLACE = "publish_place";
    private static final String IA_BOX_ID = "ia_box_id";
    private static final String OVERDIRVE_S = "overdrive_s";
    private static final String ID_LIBRIS = "id_libris";
    private static final String KEY_SEARCH = "key";
    private static final String ID_GOODREADS = "id_goodreads";
    private static final String AUTHOR_ALTERNATIVE_NAME = "author_alternative_name";
    private static final String ID_OVERDRIVE = "id_overdrive";
    private static final String LANGUAGE = "language";
    private static final String LCCN = "lccn";
    private static final String LAST_MODIFIED_I = "last_modified_i";
    private static final String ID_LIBRARYTHING = "id_librarything";
    private static final String FIRST_SENTENCE = "first_sentence";
    private static final String PERSON = "person";
    private static final String PRINT_DISABLED_S = "printdisabled_s";
    private static final String ID_DNB = "id_dnb";
    private static final String TITLE_BOOK = "title";
    private static final String PUBLISHERS = "publishers";
    private static final String PUBLISHERS_NAME = "name";
    private static final String NUM_PAGES = "number_of_pages";
    private static final String IDENTIFIERS = "identifiers";
    private static final String LINKS = "links";
    private static final String URL = "url";
    private static final String COVERS = "cover";
    private static final String SUBJECTS = "subjects";
    private static final String KEY_BOOK = "key";
    private static final String AUTHORS = "authors";
    private static final String BY_STATEMENT = "by_statement";
    private static final String EXCEPTS = "excerpts";
    private static final String PUBLISH_PLACES = "publish_places";
    private static final String NOTES = "notes";
    private static final String EBOOKS = "ebooks";
    private static final String WEIGHT = "weight";
    private static final String FORMATS = "formats";
    private static final String EPUB = "epub";
    private static final String PDF = "pdf";
    private static final String DJVU = "djvu";
    private static final String TEXT_BOOK = "text";
    private static final String OLID = "OLID:";
    private static final String TABLE_OF_CONTENTS = "table_of_contents";
    private static final String TOC_TITLE = "title";
    private static final String TOC_LABEL = "label";
    private static final String TOC_PAGENUM = "pagenum";
    private static final String TOC_LEVEL = "level";
    private static final String PAGINATION = "pagination";
    private static final String CLASSIFICATIONS = "classifications";
    private static final String RECORDS = "records";
    private static final String BOOKS = "/books/";
    private static final String DATA = "data";
    private static final String ITEMS = "items";
    private static final String STATUS = "status";
    private static final String FULL_ACCESS = "full access";
    private static final String OL_EDITION_ID = "ol-edition-id";
    private static final String OILD_LOWERCASE = "olid:";
    private JSONObject bookDataFromSearch;
    private JSONObject bookDataFromApi;
    private JSONObject readingDataFromApi;
    private String epubUrl;
    private String olid;
    private String title;
    private String firstPublishedYear;
    private String url;
    private String byStatement;
    private String coverEditionKey;
    private String notes;
    private String pagination;
    private String publishDate;
    private String key;
    private List<String> publishers;
    private List<String> subjects;
    private List<String> authors;
    private List<String> excerpts;
    private List<String> publishPlaces;
    private List<String> publishYears;
    private List<String> oclcs;
    private List<String> editionKeys;
    private List<String> authorKeys;
    private List<String> publishDates;
    private List<String> isbns;
    private List<String> contributors;
    private List<String> authorAlternativeNames;
    private List<String> languages;
    private List<String> firstSentences;
    private List<String> persons;
    private Integer numEditions;
    private Integer numPages;
    private Integer numEbooks;
    private Integer coverId;
    private Boolean fullText;
    private Boolean publicScannedBook;
    private Map<String, String> covers;
    private Map<String, List> identifiers;
    private Map<String, List> classifications;
    private List<Map<String, String>> tableOfContents;
    private List<Map<String, String>> links;
    private List<Map<String, String>> subjectsMap;
    private List<Map<String, String>> authorsMap;
    private Object coverImage;

    private BookData(JSONObject search, JSONObject api, JSONObject reading) {
        this.bookDataFromSearch = search;
        this.bookDataFromApi = api;
        this.readingDataFromApi = reading;
    }

    public static BookData bookFromSearch(JSONObject data) {
        return new BookData(data, new JSONObject(), new JSONObject());
    }

    public static BookData bookFromBookApi(JSONObject data) {
        return new BookData(new JSONObject(), data, new JSONObject());
    }

    public static BookData bookFromReadingApi(JSONObject data) {
        return new BookData(new JSONObject(), new JSONObject(), data);
    }

    public String getByStatement() {
        if (this.byStatement == null && this.bookDataFromApi != null) {
            try {
                this.byStatement = this.bookDataFromApi.getString(BY_STATEMENT);
            } catch (Exception e) {
                Log.e("Unable to get by statement", e);
            }
        }
        return this.byStatement;
    }

    public String getKey() {
        if (this.key == null) {
            this.key = "";
            if (this.bookDataFromApi != null) {
                try {
                    this.key = this.bookDataFromApi.getString("key");
                } catch (Exception e) {
                    Log.e("Unable to get key", e);
                }
            }
            if (this.key.isEmpty() && this.bookDataFromSearch != null) {
                try {
                    this.key = this.bookDataFromSearch.getString("key").replaceAll("/.*/", "");
                } catch (Exception e2) {
                    try {
                        this.key = getEditionKeys().get(0);
                    } catch (Exception e22) {
                        e22.addSuppressed(e2);
                        Log.e("Unable to get key", e22);
                    }
                }
            }
        }
        return this.key;
    }

    public String getPublishDate() {
        if (this.publishDate == null && this.bookDataFromApi != null) {
            try {
                this.publishDate = this.bookDataFromApi.getString(NOTES);
            } catch (Exception e) {
                Log.e("Unable to get publish date", e);
            }
        }
        return this.publishDate;
    }

    public Map<String, String> getCovers() {
        if (this.covers == null && this.bookDataFromApi != null) {
            try {
                this.covers = new HashMap();
                JSONObject object = this.bookDataFromApi.getJSONObject(COVERS);
                Iterator<String> iterator = object.keys();
                while (iterator.hasNext()) {
                    String key = iterator.next();
                    this.covers.put(key, object.getString(key));
                }
            } catch (Exception e) {
                Log.e("Unable to get covers", e);
            }
        }
        return this.covers;
    }

    public String getNotes() {
        if (this.notes == null && this.bookDataFromApi != null) {
            try {
                this.notes = this.bookDataFromApi.getString(NOTES);
            } catch (Exception e) {
                Log.e("Unable to get notes", e);
            }
        }
        return this.notes;
    }

    public String getPagination() {
        if (this.pagination == null && this.bookDataFromApi != null) {
            try {
                this.url = this.bookDataFromApi.getString(PAGINATION);
            } catch (Exception e) {
                Log.e("Unable to get pagination", e);
            }
        }
        return this.pagination;
    }

    public String getUrl() {
        if (this.url == null) {
            this.url = "";
            if (this.bookDataFromApi != null) {
                try {
                    this.url = this.bookDataFromApi.getString(URL);
                } catch (Exception e) {
                    Log.e("Unable to get URL", e);
                }
            }
            if (this.url.isEmpty() && this.bookDataFromSearch != null) {
                try {
                    this.url = this.bookDataFromSearch.getString("key");
                } catch (Exception e2) {
                    Log.e("Unable to get url", e2);
                }
            }
        }
        return this.url;
    }

    public Map<String, List> getClassifications() {
        if (this.classifications == null && this.bookDataFromApi != null) {
            try {
                this.classifications = new HashMap();
                JSONObject object = this.bookDataFromApi.getJSONObject(CLASSIFICATIONS);
                Iterator<String> iterator = object.keys();
                while (iterator.hasNext()) {
                    String key = iterator.next();
                    JSONArray array = object.getJSONArray(key);
                    List<String> list = new ArrayList<>();
                    for (int i = 0; i < array.length(); i++) {
                        list.add(array.getString(i));
                    }
                    this.classifications.put(key, list);
                }
            } catch (Exception e) {
                Log.e("Unable to parse classifications", e);
            }
        }
        return this.classifications;
    }

    public Map<String, List> getIdentifiers() {
        if (this.identifiers == null && this.bookDataFromApi != null) {
            try {
                this.identifiers = new HashMap();
                JSONObject object = this.bookDataFromApi.getJSONObject(IDENTIFIERS);
                Iterator<String> iterator = object.keys();
                while (iterator.hasNext()) {
                    String key = iterator.next();
                    JSONArray array = object.getJSONArray(key);
                    List<String> list = new ArrayList<>();
                    for (int i = 0; i < array.length(); i++) {
                        list.add(array.getString(i));
                    }
                    this.identifiers.put(key, list);
                }
            } catch (Exception e) {
                Log.e("Unable to parse identifiers", e);
            }
        }
        return this.identifiers;
    }

    public List<Map<String, String>> getLinks() {
        if (this.links == null && this.bookDataFromApi != null) {
            try {
                this.links = convertJSONArrayOfJSONObjectsToListOfMaps(this.bookDataFromApi.getJSONArray(LINKS));
            } catch (Exception e) {
                Log.e("Unable to parse links", e);
            }
        }
        return this.links;
    }

    public List<Map<String, String>> getAuthorsMap() {
        if (this.authorsMap == null && this.bookDataFromApi != null) {
            try {
                this.authorsMap = convertJSONArrayOfJSONObjectsToListOfMaps(this.bookDataFromApi.getJSONArray(AUTHORS));
            } catch (Exception e) {
                Log.e("Unable to parse subjects", e);
            }
        }
        return this.authorsMap;
    }

    public List<Map<String, String>> getSubjectsMap() {
        if (this.subjectsMap == null && this.bookDataFromApi != null) {
            try {
                this.subjectsMap = convertJSONArrayOfJSONObjectsToListOfMaps(this.bookDataFromApi.getJSONArray(SUBJECTS));
            } catch (Exception e) {
                Log.e("Unable to parse subjects", e);
            }
        }
        return this.subjectsMap;
    }

    public List<Map<String, String>> getTableOfContents() {
        if (this.tableOfContents == null && this.bookDataFromApi != null) {
            try {
                this.tableOfContents = convertJSONArrayOfJSONObjectsToListOfMaps(this.bookDataFromApi.getJSONArray(TABLE_OF_CONTENTS));
            } catch (Exception e) {
                Log.e("Unable to parse table of contents", e);
            }
        }
        return this.tableOfContents;
    }

    public List<String> getPersons() {
        if (this.persons == null && this.bookDataFromSearch != null) {
            try {
                this.persons = convertJSONArrayToStringList(this.bookDataFromSearch.getJSONArray(PUBLISH_PLACE));
            } catch (JSONException e) {
                Log.e("Unable to get publish places", e);
            }
        }
        return this.persons;
    }

    public List<String> getFirstSentences() {
        if (this.firstSentences == null && this.bookDataFromSearch != null) {
            try {
                this.firstSentences = convertJSONArrayToStringList(this.bookDataFromSearch.getJSONArray(FIRST_SENTENCE));
            } catch (JSONException e) {
                Log.e("Unable to get publish places", e);
            }
        }
        return this.firstSentences;
    }

    public List<String> getLanguages() {
        if (this.languages == null && this.bookDataFromSearch != null) {
            try {
                this.languages = convertJSONArrayToStringList(this.bookDataFromSearch.getJSONArray("language"));
            } catch (JSONException e) {
                Log.e("Unable to get publish places", e);
            }
        }
        return this.languages;
    }

    public List<String> getAuthorAlternativeNames() {
        if (this.authorAlternativeNames == null && this.bookDataFromSearch != null) {
            try {
                this.authorAlternativeNames = convertJSONArrayToStringList(this.bookDataFromSearch.getJSONArray(AUTHOR_ALTERNATIVE_NAME));
            } catch (JSONException e) {
                Log.e("Unable to get author alternative names", e);
            }
        }
        return this.authorAlternativeNames;
    }

    public List<String> getPublishPlaces() {
        if (this.publishPlaces == null) {
            this.publishPlaces = new ArrayList();
            if (this.bookDataFromSearch != null) {
                try {
                    this.publishPlaces = convertJSONArrayToStringList(this.bookDataFromSearch.getJSONArray(PUBLISH_PLACE));
                } catch (JSONException e) {
                    Log.e("Unable to get publish places", e);
                }
            }
            if (this.publishPlaces.size() == 0 && this.bookDataFromApi != null) {
                try {
                    List<Map<String, String>> mapList = convertJSONArrayOfJSONObjectsToListOfMaps(this.bookDataFromApi.getJSONArray(PUBLISH_PLACES));
                    for (Map<String, String> map : mapList) {
                        this.publishPlaces.add(map.values().iterator().next());
                    }
                } catch (Exception e2) {
                    Log.e("Unable to parse publish places", e2);
                }
            }
        }
        return this.publishPlaces;
    }

    public String getTitle() {
        if (this.title == null) {
            this.title = "";
            if (this.bookDataFromApi != null) {
                try {
                    this.title = this.bookDataFromApi.getString(SearchQuery.TITLE);
                } catch (JSONException e) {
                    Log.e("Unable to get title", e);
                }
            }
            if (this.title.isEmpty() && this.bookDataFromSearch != null) {
                try {
                    this.title = this.bookDataFromSearch.getString(SearchQuery.TITLE);
                } catch (JSONException e2) {
                    Log.e("Unable to get title", e2);
                }
            }
        }
        return this.title;
    }

    public List<String> getAuthorNames() {
        if (this.authors == null && this.bookDataFromSearch != null) {
            try {
                this.authors = convertJSONArrayToStringList(this.bookDataFromSearch.getJSONArray(AUTHOR));
            } catch (JSONException e) {
                Log.e("Unable to get author name", e);
            }
        }
        return this.authors;
    }

    public List<String> getSubjects() {
        if (this.subjects == null && this.bookDataFromSearch != null) {
            try {
                this.subjects = convertJSONArrayToStringList(this.bookDataFromSearch.getJSONArray("subject"));
            } catch (JSONException e) {
                Log.e("Unable to get subject", e);
            }
        }
        return this.subjects;
    }

    public List<String> getPublishDates() {
        if (this.publishDates == null && this.bookDataFromSearch != null) {
            try {
                this.publishDates = convertJSONArrayToStringList(this.bookDataFromSearch.getJSONArray(PUBLISH_DATE));
            } catch (JSONException e) {
                Log.e("Unable to get publish date", e);
            }
        }
        return this.publishDates;
    }

    public List<String> getOclcs() {
        if (this.oclcs == null && this.bookDataFromSearch != null) {
            try {
                this.oclcs = convertJSONArrayToStringList(this.bookDataFromSearch.getJSONArray("oclc"));
            } catch (JSONException e) {
                Log.e("Unable to get oclc", e);
            }
        }
        return this.oclcs;
    }

    public List<String> getPublishers() {
        if (this.publishers == null) {
            this.publishers = new ArrayList();
            if (this.bookDataFromSearch != null) {
                try {
                    this.publishers = convertJSONArrayToStringList(this.bookDataFromSearch.getJSONArray("publisher"));
                } catch (JSONException e) {
                    Log.e("Unable to get publisher", e);
                }
            }
            if (this.publishers.size() == 0 && this.bookDataFromApi != null) {
                try {
                    JSONArray array = this.bookDataFromApi.getJSONArray(PUBLISHERS);
                    for (int i = 0; i < array.length(); i++) {
                        this.publishers.add(array.getJSONObject(i).getString(PUBLISHERS_NAME));
                    }
                } catch (Exception e2) {
                    Log.e("Unable to get publishers", e2);
                }
            }
        }
        return this.publishers;
    }

    public List<String> getPublishYears() {
        if (this.publishYears == null && this.bookDataFromSearch != null) {
            try {
                this.publishYears = convertJSONArrayToStringList(this.bookDataFromSearch.getJSONArray(PUBLISH_YEARS));
            } catch (JSONException e) {
                Log.e("Unable to get publish year", e);
            }
        }
        return this.publishYears;
    }

    public String getFirstPublishYear() {
        if (this.firstPublishedYear == null && this.bookDataFromSearch != null) {
            try {
                this.firstPublishedYear = this.bookDataFromSearch.getString(FIRST_PUBLISHED_YEAR);
            } catch (JSONException e) {
                Log.e("Unable to get first published year", e);
            }
        }
        return this.firstPublishedYear;
    }

    public int getNumEditions() {
        if (this.numEditions == null) {
            this.numEditions = 0;
            if (this.bookDataFromSearch != null) {
                try {
                    this.numEditions = Integer.valueOf(this.bookDataFromSearch.getInt(NUM_EDITIONS));
                } catch (JSONException e) {
                    Log.e("Unable to get num editions", e);
                }
            }
        }
        return this.numEditions.intValue();
    }

    public int getNumPages() {
        if (this.numPages == null) {
            this.numPages = 0;
            if (this.bookDataFromSearch != null) {
                try {
                    this.numPages = Integer.valueOf(this.bookDataFromSearch.getInt(NUM_PAGES));
                } catch (JSONException e) {
                    Log.e("Unable to get num pages", e);
                }
            }
        }
        return this.numPages.intValue();
    }

    public int getNumEbooks() {
        if (this.numEbooks == null) {
            this.numEbooks = 0;
            if (this.bookDataFromSearch != null) {
                try {
                    this.numEbooks = Integer.valueOf(this.bookDataFromSearch.getInt(NUM_EBOOKS));
                } catch (JSONException e) {
                    Log.e("Unable to get num ebooks", e);
                }
            }
        }
        return this.numEbooks.intValue();
    }

    public List<String> getAuthorKeys() {
        if (this.authorKeys == null && this.bookDataFromSearch != null) {
            try {
                this.authorKeys = convertJSONArrayToStringList(this.bookDataFromSearch.getJSONArray(AUTHOR_KEY));
            } catch (JSONException e) {
                Log.e("Unable to get author key", e);
            }
        }
        return this.authorKeys;
    }

    public int getCoverId() {
        if (this.coverId == null) {
            this.coverId = 0;
            if (this.bookDataFromSearch != null) {
                try {
                    this.coverId = Integer.valueOf(this.bookDataFromSearch.getInt(COVER_ID));
                } catch (JSONException e) {
                    Log.e("Unable to get cover id", e);
                }
            }
        }
        return this.coverId.intValue();
    }

    public String getCoverEditionKey() {
        if (this.coverEditionKey == null && this.bookDataFromSearch != null) {
            try {
                this.coverEditionKey = this.bookDataFromSearch.getString(COVER_EDITION_KEY);
            } catch (JSONException e) {
                Log.e("Unable to get cover edition key", e);
            }
        }
        return this.coverEditionKey;
    }

    public boolean hasFullText() {
        if (this.fullText == null) {
            this.fullText = false;
            if (this.bookDataFromSearch != null) {
                try {
                    this.fullText = Boolean.valueOf(this.bookDataFromSearch.getBoolean("has_fulltext"));
                } catch (JSONException e) {
                    Log.e("Unable to get fullText", e);
                }
            }
        }
        return this.fullText.booleanValue();
    }

    public List<String> getEditionKeys() {
        if (this.editionKeys == null && this.bookDataFromSearch != null) {
            try {
                this.editionKeys = convertJSONArrayToStringList(this.bookDataFromSearch.getJSONArray(EDITION_KEY));
            } catch (JSONException e) {
                Log.e("Unable to get edition keys", e);
            }
        }
        return this.editionKeys;
    }

    public String getOlid() {
        if (this.olid == null && this.bookDataFromApi != null) {
            try {
                this.olid = this.bookDataFromApi.keys().next().replaceAll("OLID:?", "");
            } catch (Exception e) {
                try {
                    this.olid = getIdentifiers().get("openlibrary").get(0).toString();
                } catch (Exception e2) {
                    try {
                        String key = getKey();
                        if (key.contains("OL")) {
                            this.olid = key;
                        }
                    } catch (Exception e3) {
                        e2.addSuppressed(e);
                        e3.addSuppressed(e2);
                        Log.e("Unable to get olid", e3);
                    }
                }
            }
        }
        return this.olid;
    }

    public boolean isPublicScannedBook() {
        if (this.publicScannedBook == null) {
            this.publicScannedBook = false;
            if (this.bookDataFromSearch != null) {
                try {
                    this.publicScannedBook = Boolean.valueOf(this.bookDataFromSearch.getBoolean(PUBLIC_SCANNED_BOOK));
                } catch (Exception e) {
                    Log.e("Unable to get public scanned book", e);
                }
            }
        }
        return this.publicScannedBook.booleanValue();
    }

    public List<String> getIsbns() {
        if (this.isbns == null && this.bookDataFromSearch != null) {
            try {
                this.isbns = convertJSONArrayToStringList(this.bookDataFromSearch.getJSONArray("isbn"));
            } catch (JSONException e) {
                Log.e("Unable to get ISBNs", e);
            }
        }
        return this.isbns;
    }

    public List<String> getContributors() {
        if (this.contributors == null && this.bookDataFromSearch != null) {
            try {
                this.contributors = convertJSONArrayToStringList(this.bookDataFromSearch.getJSONArray(CONTRIBUTOR));
            } catch (JSONException e) {
                Log.e("Unable to get contributors", e);
            }
        }
        return this.contributors;
    }

    public void addBookDetails(Library lib) {
        addBookDetails(lib, 0);
    }

    public void addBookDetails(Library lib, int edition) {
        if (this.bookDataFromApi.length() <= 0) {
            BookQuery query = new BookQuery();
            try {
                query.olid(getEditionKeys().get(edition));
            } catch (Exception e) {
                try {
                    query.olid(getKey().replaceAll("/.*/", ""));
                } catch (Exception e2) {
                    try {
                        query.olid(getOlid());
                    } catch (Exception e3) {
                        e2.addSuppressed(e);
                        e3.addSuppressed(e2);
                        Log.e("Unable to add book details", e3);
                    }
                }
            }
            if (query.size() > 0) {
                this.bookDataFromApi = lib.getBookDetails(query).getBookData();
            }
        }
    }

    public void addReadingDetails(Library lib) {
        addReadingDetails(lib, 0);
    }

    public void addReadingDetails(Library lib, int edition) {
        if (this.readingDataFromApi.length() <= 0) {
            ReadQuery query = new ReadQuery();
            try {
                query.olid(getEditionKeys().get(edition));
            } catch (NullPointerException e) {
                try {
                    query.olid(getOlid());
                } catch (Exception e2) {
                    Log.e("Unable to get olid for reading api", e2);
                }
            }
            if (query.size() > 0) {
                this.readingDataFromApi = lib.getReadingDetails(query).getReadingData();
            }
        }
    }

    public JSONObject getSearchData() {
        return this.bookDataFromSearch;
    }

    public JSONObject getBookData() {
        return this.bookDataFromApi;
    }

    public JSONObject getReadingData() {
        return this.readingDataFromApi;
    }

    public boolean hasEpubUrl() {
        boolean value = false;
        getEpubUrl();
        if (this.epubUrl != null && !this.epubUrl.isEmpty()) {
            value = true;
        }
        return value;
    }

    public Object getEpubUrl() {
        Object data;
        if (this.epubUrl == null) {
            data = getEbookUrl(EPUB);
            if (data instanceof String) {
                this.epubUrl = data.toString();
            }
        } else {
            data = this.epubUrl;
        }
        return data;
    }

    public Object getPdfUrl() {
        return getEbookUrl(PDF);
    }

    public Object getDjvuUrl() {
        return getEbookUrl(DJVU);
    }

    public Object getTextUrl() {
        return getEbookUrl("text");
    }

    private Object getEbookUrl(String format) {
        String data = "";
        Object returnedData = data;
        ArrayList<String> alternatives = new ArrayList<>();
        if (this.bookDataFromApi.length() > 0) {
            try {
                data = this.bookDataFromApi.getJSONObject(this.bookDataFromApi.keys().next()).getJSONArray(EBOOKS).getJSONObject(0).getJSONObject(FORMATS).getJSONObject(format).getString(URL);
            } catch (JSONException e) {
                Log.e("Unable to get ebook data", e);
            }
        }
        if (data.isEmpty() && this.readingDataFromApi.length() > 0) {
            try {
                data = this.readingDataFromApi.getJSONObject(this.readingDataFromApi.keys().next()).getJSONObject(RECORDS).getJSONObject(BOOKS + getOlid()).getJSONObject(DATA).getJSONArray(EBOOKS).getJSONObject(0).getJSONObject(FORMATS).getJSONObject(format).getString(URL);
            } catch (JSONException e2) {
                Log.e("Unable to get ebook data", e2);
            }
        }
        if (data.isEmpty() && this.readingDataFromApi.length() > 0) {
            try {
                JSONArray items = this.readingDataFromApi.getJSONObject(this.readingDataFromApi.keys().next()).getJSONArray(ITEMS);
                for (int i = 0; i < items.length(); i++) {
                    JSONObject object = (JSONObject) items.get(i);
                    if (object.get(STATUS).equals(FULL_ACCESS)) {
                        alternatives.add(object.getString(OL_EDITION_ID));
                    }
                }
                if (alternatives.size() > 0) {
                    returnedData = alternatives;
                }
            } catch (JSONException e3) {
                Log.e("", e3);
            }
        } else {
            returnedData = data;
        }
        return returnedData;
    }

    private List<String> convertJSONArrayToStringList(JSONArray array) {
        List<String> list = new ArrayList<>();
        for (int i = 0; i < array.length(); i++) {
            list.add(array.getString(i));
        }
        return list;
    }

    private List<Map<String, String>> convertJSONArrayOfJSONObjectsToListOfMaps(JSONArray array) {
        List<Map<String, String>> list = new ArrayList<>();
        for (int i = 0; i < array.length(); i++) {
            Map<String, String> map = new HashMap<>();
            JSONObject object = array.getJSONObject(i);
            Iterator<String> iterator = object.keys();
            while (iterator.hasNext()) {
                String key = iterator.next();
                map.put(key, object.getString(key));
            }
            list.add(map);
        }
        return list;
    }

    public Object getCoverImage() {
        return this.coverImage;
    }

    public void setCoverImage(Object coverImage) {
        this.coverImage = coverImage;
    }
}
