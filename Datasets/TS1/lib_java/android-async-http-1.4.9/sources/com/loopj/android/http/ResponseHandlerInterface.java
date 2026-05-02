package com.loopj.android.http;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpResponse;
import java.io.IOException;
import java.net.URI;

/* loaded from: android-async-http-1.4.9.jar:com/loopj/android/http/ResponseHandlerInterface.class */
public interface ResponseHandlerInterface {
    void sendResponseMessage(HttpResponse httpResponse) throws IOException;

    void sendStartMessage();

    void sendFinishMessage();

    void sendProgressMessage(long j, long j2);

    void sendCancelMessage();

    void sendSuccessMessage(int i, Header[] headerArr, byte[] bArr);

    void sendFailureMessage(int i, Header[] headerArr, byte[] bArr, Throwable th);

    void sendRetryMessage(int i);

    URI getRequestURI();

    void setRequestURI(URI uri);

    Header[] getRequestHeaders();

    void setRequestHeaders(Header[] headerArr);

    boolean getUseSynchronousMode();

    void setUseSynchronousMode(boolean z);

    boolean getUsePoolThread();

    void setUsePoolThread(boolean z);

    void onPreProcessResponse(ResponseHandlerInterface responseHandlerInterface, HttpResponse httpResponse);

    void onPostProcessResponse(ResponseHandlerInterface responseHandlerInterface, HttpResponse httpResponse);

    Object getTag();

    void setTag(Object obj);
}
