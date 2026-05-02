package com.koushikdutta.async.http.server;

import com.koushikdutta.async.AsyncSocket;
import com.koushikdutta.async.DataSink;
import com.koushikdutta.async.callback.CompletedCallback;
import com.koushikdutta.async.http.AsyncHttpResponse;
import com.koushikdutta.async.http.Headers;
import java.io.File;
import java.io.InputStream;
import org.json.JSONObject;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/server/AsyncHttpServerResponse.class */
public interface AsyncHttpServerResponse extends DataSink, CompletedCallback {
    @Override // com.koushikdutta.async.DataSink
    void end();

    void send(String str, byte[] bArr);

    void send(String str, String str2);

    void send(String str);

    void send(JSONObject jSONObject);

    void sendFile(File file);

    void sendStream(InputStream inputStream, long j);

    AsyncHttpServerResponse code(int i);

    int code();

    Headers getHeaders();

    void writeHead();

    void setContentType(String str);

    void redirect(String str);

    void proxy(AsyncHttpResponse asyncHttpResponse);

    @Override // com.koushikdutta.async.callback.CompletedCallback
    void onCompleted(Exception exc);

    AsyncSocket getSocket();
}
