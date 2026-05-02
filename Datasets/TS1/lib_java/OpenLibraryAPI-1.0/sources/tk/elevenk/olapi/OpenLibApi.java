package tk.elevenk.olapi;

import java.util.HashMap;
import java.util.Map;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.cookie.Cookie;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.cookie.BasicClientCookie;
import org.json.JSONException;
import org.json.JSONObject;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;
import tk.elevenk.olapi.logging.Log;
import tk.elevenk.olapi.search.SearchQuery;

/* loaded from: OpenLibraryAPI-1.0.jar:tk/elevenk/olapi/OpenLibApi.class */
public class OpenLibApi implements LibraryApi {
    private static final String BOOKS_API_URL = "https://openlibrary.org/api/books";
    private static final String READ_API_URL = "https://openlibrary.org/api/volumes/brief/json/";
    private static final String SEARCH_API_URL = "https://openlibrary.org/search.json";
    private static final String SUBJECTS_API_URL = "https://openlibrary.org/subjects/<subject>.json";
    private static final String LOGIN_API_URL = "https://openlibrary.org/account/login";
    private static final String SUBJECT_DATA_KEY = "subject";
    private static final String LOGIN_SET_COOKIE_HEADER = "Set-Cookie";
    private HttpClient httpClient;
    private HttpUriRequest currentRequest;
    public static final String BASE_URL = "https://openlibrary.org";
    private static final String COVERS_API_URL = BASE_URL.replace("//", "//covers.") + "/b/";
    private static final Map BOOKS_API_KEYS = new HashMap<String, String>() { // from class: tk.elevenk.olapi.OpenLibApi.1
        {
            put("bibkeys", null);
            put("format", "json");
            put("callback", null);
            put("jscmd", "data");
        }
    };
    private static final Map SEARCH_API_KEYS = new HashMap<String, String>() { // from class: tk.elevenk.olapi.OpenLibApi.2
        {
            put(SearchQuery.QUERY, null);
            put(SearchQuery.AUTHOR, null);
            put(SearchQuery.TITLE, null);
            put(SearchQuery.HAS_FULL_TEXT, null);
            put("isbn", null);
            put("subject", null);
            put(SearchQuery.PLACE, null);
            put(SearchQuery.PERSON, null);
            put(SearchQuery.PUBLISHER, null);
            put(SearchQuery.PAGE, null);
            put(SearchQuery.SORT, null);
        }
    };
    private static final Map SUBJECTS_API_KEYS = new HashMap<String, String>() { // from class: tk.elevenk.olapi.OpenLibApi.3
        {
            put("details", "true");
            put("ebooks", "true");
            put("published_in", null);
            put("limit", null);
            put("offset", null);
        }
    };

    public OpenLibApi() {
        this(new DefaultHttpClient());
    }

    public OpenLibApi(HttpClient client) {
        this.httpClient = client;
    }

    private String addQueryParams(String baseUrl, Map data, Map keys) {
        String baseUrl2 = baseUrl + "?";
        for (Object key : keys.keySet()) {
            if (data.containsKey(key) && data.get(key) != null && !data.get(key).equals("")) {
                baseUrl2 = baseUrl2 + key.toString() + "=" + data.get(key).toString().replaceAll(" ", "+").replaceAll("[^\\w\\+]", "") + "&";
            } else if (keys.get(key) != null && !keys.get(key).equals("")) {
                baseUrl2 = baseUrl2 + key.toString() + "=" + keys.get(key).toString().replaceAll(" ", "+").replaceAll("[^\\w\\+]", "") + "&";
            }
        }
        Log.d("URL with query params: " + baseUrl2);
        return baseUrl2;
    }

    private JSONObject makeRequest(HttpUriRequest request) {
        this.currentRequest = request;
        JSONObject responseData = new JSONObject();
        if (request != null) {
            try {
                HttpResponse response = this.httpClient.execute(request);
                if (response.getStatusLine().getStatusCode() == 200) {
                    String responseBody = ApiHelpers.convertStreamToString(response.getEntity().getContent());
                    responseData = new JSONObject(responseBody);
                }
            } catch (Exception e) {
                Log.e("", e);
            }
        }
        return responseData;
    }

    private JSONObject makeApiCall(Map data, Map paramKeys, String pUrl) {
        HttpGet apiRequest;
        String url = pUrl.replaceAll(" ", "%20");
        if (paramKeys != null && data != null) {
            apiRequest = new HttpGet(addQueryParams(url, data, paramKeys));
        } else {
            apiRequest = new HttpGet(url);
        }
        return makeRequest(apiRequest);
    }

    @Override // tk.elevenk.olapi.LibraryApi
    public JSONObject books(Map data) {
        return makeApiCall(data, BOOKS_API_KEYS, BOOKS_API_URL);
    }

    @Override // tk.elevenk.olapi.LibraryApi
    public JSONObject covers(Map data) {
        JSONObject imageData = new JSONObject();
        try {
            for (Object key : data.keySet()) {
                String coverUrl = COVERS_API_URL + key + "/" + data.get(key);
                imageData.put("small", coverUrl + "-S.jpg");
                imageData.put("medium", coverUrl + "-M.jpg");
                imageData.put("large", coverUrl + "-L.jpg");
            }
        } catch (JSONException e) {
            Log.e("", e);
        }
        return imageData;
    }

    @Override // tk.elevenk.olapi.LibraryApi
    public JSONObject lists(Map data) {
        throw new NotImplementedException();
    }

    @Override // tk.elevenk.olapi.LibraryApi
    public JSONObject read(Map data) {
        String requestUrl = READ_API_URL;
        for (Object key : data.keySet()) {
            requestUrl = requestUrl + key.toString() + ":" + data.get(key).toString() + "%7C";
        }
        return makeApiCall(null, null, requestUrl);
    }

    @Override // tk.elevenk.olapi.LibraryApi
    public JSONObject recentChanges(Map data) {
        throw new NotImplementedException();
    }

    @Override // tk.elevenk.olapi.LibraryApi
    public JSONObject search(Map data) {
        return makeApiCall(data, SEARCH_API_KEYS, SEARCH_API_URL);
    }

    @Override // tk.elevenk.olapi.LibraryApi
    public JSONObject searchInside(Map data) {
        throw new NotImplementedException();
    }

    @Override // tk.elevenk.olapi.LibraryApi
    public JSONObject subjects(Map data) {
        String subject = data.get("subject").toString();
        String apiUrl = SUBJECTS_API_URL.replace("<subject>", subject);
        return makeApiCall(data, SUBJECTS_API_KEYS, apiUrl);
    }

    @Override // tk.elevenk.olapi.LibraryApi
    public Cookie login(Map data) {
        HttpPost loginRequest = new HttpPost(LOGIN_API_URL);
        JSONObject jsonData = new JSONObject(data);
        Cookie cookie = null;
        try {
            StringEntity entity = new StringEntity(jsonData.toString());
            entity.setContentType("application/json");
            loginRequest.setEntity(entity);
            HttpResponse response = this.httpClient.execute(loginRequest);
            if (response.getStatusLine().getStatusCode() == 200) {
                Header setCookie = response.getFirstHeader(LOGIN_SET_COOKIE_HEADER);
                String[] headerVal = setCookie.getValue().split(";");
                String[] sessionData = headerVal[0].split("=");
                String[] pathData = headerVal[1].split("=");
                cookie = new BasicClientCookie(sessionData[0], sessionData[1]);
                ((BasicClientCookie) cookie).setPath(pathData[1]);
            }
        } catch (Exception e) {
            Log.e("", e);
        }
        return cookie;
    }

    @Override // tk.elevenk.olapi.LibraryApi
    public void cancelRequest() {
        try {
            this.currentRequest.abort();
        } catch (Exception e) {
            Log.e("Unable to abort request", e);
        }
    }

    @Override // tk.elevenk.olapi.LibraryApi
    public String getBaseUrl() {
        return BASE_URL;
    }
}
