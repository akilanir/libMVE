package tk.elevenk.olapi;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.RedirectHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.cookie.Cookie;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.DefaultRedirectHandler;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;
import org.json.JSONObject;
import tk.elevenk.olapi.books.BookQuery;
import tk.elevenk.olapi.data.BookData;
import tk.elevenk.olapi.data.Credential;
import tk.elevenk.olapi.data.LibraryPreferences;
import tk.elevenk.olapi.logging.Log;
import tk.elevenk.olapi.read.ReadQuery;
import tk.elevenk.olapi.search.SearchQuery;
import tk.elevenk.olapi.search.SearchResults;

/* loaded from: OpenLibraryAPI-1.0.jar:tk/elevenk/olapi/OpenLibrary.class */
public class OpenLibrary implements Library {
    private static final String AND_USER_AGENT = "Mozilla/5.0 (Android;) DailybRead/0.1";
    private static final String LOGIN_COOKIE_PARAMETER = "Cookie";
    private static LibraryApi api;
    private static HttpClient client;
    private LibraryPreferences preferences;
    private boolean cancelled;

    public static OpenLibrary genericLibrary(LibraryPreferences preferences) {
        client = new DefaultHttpClient();
        ((DefaultHttpClient) client).setRedirectHandler(getRedirectHandler());
        return new OpenLibrary(new OpenLibApi(client), preferences);
    }

    public static OpenLibrary androidLibrary(LibraryPreferences preferences) {
        client = new DefaultHttpClient();
        ((DefaultHttpClient) client).setRedirectHandler(getRedirectHandler());
        return new OpenLibrary(new OpenLibApi(client), preferences);
    }

    @Override // tk.elevenk.olapi.Library
    public SearchResults search(SearchQuery search) {
        return new SearchResults(api.search(search));
    }

    @Override // tk.elevenk.olapi.Library
    public BookData getBookDetails(BookQuery bookQuery) {
        return BookData.bookFromBookApi(api.books(bookQuery));
    }

    @Override // tk.elevenk.olapi.Library
    public BookData getReadingDetails(ReadQuery readQuery) {
        return BookData.bookFromReadingApi(api.read(readQuery));
    }

    @Override // tk.elevenk.olapi.Library
    public Object getEbook(BookData bookData) {
        Object ebook = null;
        switch (this.preferences.getPreferredEbookType()) {
            case EPUB:
                ebook = getEpub(bookData);
                if (ebook != null) {
                }
                break;
        }
        return ebook;
    }

    private Object getEpub(BookData bookData) {
        Object ebook = null;
        try {
            bookData.addBookDetails(this);
            String fileUrl = bookData.getEpubUrl().toString();
            ebook = downloadTempEbook(fileUrl, "epub");
        } catch (Exception e) {
            Log.e("", e);
        }
        return ebook;
    }

    private File downloadTempEbook(String url, String extension) {
        HttpResponse response = null;
        File temp = null;
        try {
            HttpGet httpGet = new HttpGet(url);
            response = client.execute(httpGet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (response != null && response.getStatusLine().getStatusCode() == 200) {
            try {
                temp = File.createTempFile("openlib" + new Random().nextInt(), extension);
                response.getEntity().writeTo(new FileOutputStream(temp));
            } catch (IOException e2) {
                Log.e("", e2);
            }
        }
        return temp;
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x01b6  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x01bd A[EDGE_INSN: B:59:0x01bd->B:46:0x01bd BREAK  A[LOOP:0: B:3:0x000a->B:61:?], SYNTHETIC] */
    @Override // tk.elevenk.olapi.Library
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public tk.elevenk.olapi.data.BookData findRandomBook(tk.elevenk.olapi.Library.LibraryCallbacks r5) {
        /*
            Method dump skipped, instructions count: 461
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: tk.elevenk.olapi.OpenLibrary.findRandomBook(tk.elevenk.olapi.Library$LibraryCallbacks):tk.elevenk.olapi.data.BookData");
    }

    @Override // tk.elevenk.olapi.Library
    public boolean login(Credential creds) {
        boolean loggedIn = false;
        Map<String, String> data = new HashMap<>();
        data.put("username", creds.getUsername());
        data.put("password", creds.getPassword());
        Cookie sessionCookie = api.login(data);
        if (sessionCookie != null) {
            HttpParams params = client.getParams();
            params.setParameter(LOGIN_COOKIE_PARAMETER, sessionCookie.getName() + "=" + sessionCookie.getValue());
            loggedIn = true;
        }
        return loggedIn;
    }

    @Override // tk.elevenk.olapi.Library
    public Map getCoverUrls(Object key, Object value) {
        Map<String, String> data = new HashMap<>();
        if (key != null && value != null) {
            data.put(key.toString(), value.toString());
            JSONObject object = api.covers(data);
            data.clear();
            Iterator iterator = object.keys();
            while (iterator.hasNext()) {
                String objKey = iterator.next().toString();
                data.put(objKey, object.get(objKey).toString());
            }
        }
        return data;
    }

    private static RedirectHandler getRedirectHandler() {
        return new DefaultRedirectHandler() { // from class: tk.elevenk.olapi.OpenLibrary.1
            @Override // org.apache.http.impl.client.DefaultRedirectHandler, org.apache.http.client.RedirectHandler
            public boolean isRedirectRequested(HttpResponse response, HttpContext context) {
                int responseCode;
                boolean isRedirect = super.isRedirectRequested(response, context);
                if (!isRedirect && ((responseCode = response.getStatusLine().getStatusCode()) == 301 || responseCode == 302)) {
                    return true;
                }
                return isRedirect;
            }
        };
    }

    private OpenLibrary() {
    }

    private OpenLibrary(LibraryApi lapi, LibraryPreferences preferences) {
        this();
        api = lapi;
        this.preferences = preferences;
    }

    @Override // tk.elevenk.olapi.Library
    public void cancelRequest() {
        this.cancelled = true;
        api.cancelRequest();
    }

    @Override // tk.elevenk.olapi.Library
    public String getBaseUrl() {
        return api.getBaseUrl();
    }
}
