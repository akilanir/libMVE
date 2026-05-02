package oauth.signpost.http;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

/* loaded from: signpost-core-1.2.1.2.jar:oauth/signpost/http/HttpRequest.class */
public interface HttpRequest {
    String getMethod();

    String getRequestUrl();

    void setRequestUrl(String str);

    void setHeader(String str, String str2);

    String getHeader(String str);

    Map<String, String> getAllHeaders();

    InputStream getMessagePayload() throws IOException;

    String getContentType();

    Object unwrap();
}
