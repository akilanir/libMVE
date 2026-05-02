package retrofit.client;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import retrofit.mime.TypedOutput;

/* loaded from: retrofit-1.9.0.jar:retrofit/client/Request.class */
public final class Request {
    private final String method;
    private final String url;
    private final List<Header> headers;
    private final TypedOutput body;

    public Request(String method, String url, List<Header> headers, TypedOutput body) {
        if (method == null) {
            throw new NullPointerException("Method must not be null.");
        }
        if (url == null) {
            throw new NullPointerException("URL must not be null.");
        }
        this.method = method;
        this.url = url;
        if (headers == null) {
            this.headers = Collections.emptyList();
        } else {
            this.headers = Collections.unmodifiableList(new ArrayList(headers));
        }
        this.body = body;
    }

    public String getMethod() {
        return this.method;
    }

    public String getUrl() {
        return this.url;
    }

    public List<Header> getHeaders() {
        return this.headers;
    }

    public TypedOutput getBody() {
        return this.body;
    }
}
