package org.springframework.web.client;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import org.springframework.http.HttpStatus;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/client/HttpStatusCodeException.class */
public abstract class HttpStatusCodeException extends RestClientException {
    private static final long serialVersionUID = 1;
    private static final Charset DEFAULT_CHARSET = Charset.forName("ISO-8859-1");
    private final HttpStatus statusCode;
    private final String statusText;
    private final byte[] responseBody;
    private final Charset responseCharset;

    protected HttpStatusCodeException(HttpStatus statusCode) {
        this(statusCode, statusCode.name(), null, null);
    }

    protected HttpStatusCodeException(HttpStatus statusCode, String statusText) {
        this(statusCode, statusText, null, null);
    }

    protected HttpStatusCodeException(HttpStatus statusCode, String statusText, byte[] responseBody, Charset responseCharset) {
        super(statusCode.value() + " " + statusText);
        this.statusCode = statusCode;
        this.statusText = statusText;
        this.responseBody = responseBody != null ? responseBody : new byte[0];
        this.responseCharset = responseCharset != null ? responseCharset : DEFAULT_CHARSET;
    }

    public HttpStatus getStatusCode() {
        return this.statusCode;
    }

    public String getStatusText() {
        return this.statusText;
    }

    public byte[] getResponseBodyAsByteArray() {
        return this.responseBody;
    }

    public String getResponseBodyAsString() {
        try {
            return new String(this.responseBody, this.responseCharset.name());
        } catch (UnsupportedEncodingException ex) {
            throw new InternalError(ex.getMessage());
        }
    }
}
