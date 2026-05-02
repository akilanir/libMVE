package oauth.signpost.http;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: signpost-core-1.2.1.2.jar:oauth/signpost/http/HttpResponse.class */
public interface HttpResponse {
    int getStatusCode() throws IOException;

    String getReasonPhrase() throws Exception;

    InputStream getContent() throws IOException;

    Object unwrap();
}
