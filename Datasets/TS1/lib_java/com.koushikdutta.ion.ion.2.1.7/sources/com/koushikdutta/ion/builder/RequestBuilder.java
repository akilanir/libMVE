package com.koushikdutta.ion.builder;

import android.app.ProgressDialog;
import android.os.Handler;
import android.widget.ProgressBar;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.koushikdutta.async.http.NameValuePair;
import com.koushikdutta.ion.HeadersCallback;
import com.koushikdutta.ion.ProgressCallback;
import com.koushikdutta.ion.builder.Builders;
import com.koushikdutta.ion.builder.MultipartBodyBuilder;
import com.koushikdutta.ion.builder.RequestBuilder;
import com.koushikdutta.ion.builder.UrlEncodedBuilder;
import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import org.w3c.dom.Document;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/builder/RequestBuilder.class */
public interface RequestBuilder<F, R extends RequestBuilder, M extends MultipartBodyBuilder, U extends UrlEncodedBuilder> extends MultipartBodyBuilder<M>, UrlEncodedBuilder<U> {
    R setLogging(String str, int i);

    R proxy(String str, int i);

    R progress(ProgressCallback progressCallback);

    R progressHandler(ProgressCallback progressCallback);

    R progressBar(ProgressBar progressBar);

    R progressDialog(ProgressDialog progressDialog);

    R uploadProgress(ProgressCallback progressCallback);

    R uploadProgressHandler(ProgressCallback progressCallback);

    R uploadProgressBar(ProgressBar progressBar);

    R uploadProgressDialog(ProgressDialog progressDialog);

    R setHandler(Handler handler);

    R setHeader(String str, String str2);

    R setHeader(NameValuePair... nameValuePairArr);

    R noCache();

    R followRedirect(boolean z);

    R addHeader(String str, String str2);

    R addHeaders(Map<String, List<String>> map);

    R addQuery(String str, String str2);

    R addQueries(Map<String, List<String>> map);

    R userAgent(String str);

    R setTimeout(int i);

    R onHeaders(HeadersCallback headersCallback);

    R basicAuthentication(String str, String str2);

    F setJsonObjectBody(JsonObject jsonObject);

    <T> F setJsonPojoBody(T t, TypeToken<T> typeToken);

    <T> F setJsonPojoBody(T t);

    F setJsonArrayBody(JsonArray jsonArray);

    F setStringBody(String str);

    F setDocumentBody(Document document);

    F setFileBody(File file);

    F setByteArrayBody(byte[] bArr);

    Builders.Any.F setStreamBody(InputStream inputStream);

    Builders.Any.F setStreamBody(InputStream inputStream, int i);
}
