package retrofit;

import com.squareup.okhttp.Headers;
import com.squareup.okhttp.MediaType;
import com.squareup.okhttp.Request;

/* loaded from: retrofit-2.0.0-beta2.jar:retrofit/RequestFactory.class */
final class RequestFactory {
    private final String method;
    private final BaseUrl baseUrl;
    private final String relativeUrl;
    private final Headers headers;
    private final MediaType contentType;
    private final boolean hasBody;
    private final boolean isFormEncoded;
    private final boolean isMultipart;
    private final RequestBuilderAction[] requestBuilderActions;

    RequestFactory(String method, BaseUrl baseUrl, String relativeUrl, Headers headers, MediaType contentType, boolean hasBody, boolean isFormEncoded, boolean isMultipart, RequestBuilderAction[] requestBuilderActions) {
        this.method = method;
        this.baseUrl = baseUrl;
        this.relativeUrl = relativeUrl;
        this.headers = headers;
        this.contentType = contentType;
        this.hasBody = hasBody;
        this.isFormEncoded = isFormEncoded;
        this.isMultipart = isMultipart;
        this.requestBuilderActions = requestBuilderActions;
    }

    Request create(Object... args) {
        RequestBuilder requestBuilder = new RequestBuilder(this.method, this.baseUrl.url(), this.relativeUrl, this.headers, this.contentType, this.hasBody, this.isFormEncoded, this.isMultipart);
        if (args != null) {
            RequestBuilderAction[] actions = this.requestBuilderActions;
            if (actions.length != args.length) {
                throw new IllegalArgumentException("Argument count (" + args.length + ") doesn't match action count (" + actions.length + ")");
            }
            int count = args.length;
            for (int i = 0; i < count; i++) {
                actions[i].perform(requestBuilder, args[i]);
            }
        }
        return requestBuilder.build();
    }
}
