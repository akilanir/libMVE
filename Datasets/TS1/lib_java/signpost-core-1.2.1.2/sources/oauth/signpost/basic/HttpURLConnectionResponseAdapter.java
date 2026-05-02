package oauth.signpost.basic;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import oauth.signpost.http.HttpResponse;

/* loaded from: signpost-core-1.2.1.2.jar:oauth/signpost/basic/HttpURLConnectionResponseAdapter.class */
public class HttpURLConnectionResponseAdapter implements HttpResponse {
    private HttpURLConnection connection;

    public HttpURLConnectionResponseAdapter(HttpURLConnection connection) {
        this.connection = connection;
    }

    @Override // oauth.signpost.http.HttpResponse
    public InputStream getContent() throws IOException {
        try {
            return this.connection.getInputStream();
        } catch (IOException e) {
            return this.connection.getErrorStream();
        }
    }

    @Override // oauth.signpost.http.HttpResponse
    public int getStatusCode() throws IOException {
        return this.connection.getResponseCode();
    }

    @Override // oauth.signpost.http.HttpResponse
    public String getReasonPhrase() throws Exception {
        return this.connection.getResponseMessage();
    }

    @Override // oauth.signpost.http.HttpResponse
    public Object unwrap() {
        return this.connection;
    }
}
