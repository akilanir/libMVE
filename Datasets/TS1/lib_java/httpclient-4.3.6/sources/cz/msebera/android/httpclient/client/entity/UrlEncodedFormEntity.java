package cz.msebera.android.httpclient.client.entity;

import cz.msebera.android.httpclient.NameValuePair;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.client.utils.URLEncodedUtils;
import cz.msebera.android.httpclient.entity.ContentType;
import cz.msebera.android.httpclient.entity.StringEntity;
import cz.msebera.android.httpclient.protocol.HTTP;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.List;

@NotThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/entity/UrlEncodedFormEntity.class */
public class UrlEncodedFormEntity extends StringEntity {
    public UrlEncodedFormEntity(List<? extends NameValuePair> parameters, String charset) throws UnsupportedEncodingException {
        super(URLEncodedUtils.format(parameters, charset != null ? charset : HTTP.DEF_CONTENT_CHARSET.name()), ContentType.create(URLEncodedUtils.CONTENT_TYPE, charset));
    }

    public UrlEncodedFormEntity(Iterable<? extends NameValuePair> parameters, Charset charset) {
        super(URLEncodedUtils.format(parameters, charset != null ? charset : HTTP.DEF_CONTENT_CHARSET), ContentType.create(URLEncodedUtils.CONTENT_TYPE, charset));
    }

    public UrlEncodedFormEntity(List<? extends NameValuePair> parameters) throws UnsupportedEncodingException {
        this(parameters, (Charset) null);
    }

    public UrlEncodedFormEntity(Iterable<? extends NameValuePair> parameters) {
        this(parameters, (Charset) null);
    }
}
