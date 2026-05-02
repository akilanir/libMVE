package tk.elevenk.olapi;

import java.util.Map;
import org.apache.http.cookie.Cookie;
import org.json.JSONObject;

/* loaded from: OpenLibraryAPI-1.0.jar:tk/elevenk/olapi/LibraryApi.class */
public interface LibraryApi {
    JSONObject books(Map map);

    JSONObject covers(Map map);

    JSONObject lists(Map map);

    JSONObject read(Map map);

    JSONObject recentChanges(Map map);

    JSONObject search(Map map);

    JSONObject searchInside(Map map);

    JSONObject subjects(Map map);

    Cookie login(Map map);

    void cancelRequest();

    String getBaseUrl();
}
