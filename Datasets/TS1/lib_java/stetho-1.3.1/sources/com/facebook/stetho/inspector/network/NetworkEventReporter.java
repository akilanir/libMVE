package com.facebook.stetho.inspector.network;

import java.io.IOException;
import java.io.InputStream;
import javax.annotation.Nullable;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/network/NetworkEventReporter.class */
public interface NetworkEventReporter {

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/network/NetworkEventReporter$InspectorHeaders.class */
    public interface InspectorHeaders {
        int headerCount();

        String headerName(int i);

        String headerValue(int i);

        @Nullable
        String firstHeaderValue(String str);
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/network/NetworkEventReporter$InspectorRequest.class */
    public interface InspectorRequest extends InspectorHeaders {
        String id();

        String friendlyName();

        @Nullable
        Integer friendlyNameExtra();

        String url();

        String method();

        @Nullable
        byte[] body() throws IOException;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/network/NetworkEventReporter$InspectorResponse.class */
    public interface InspectorResponse extends InspectorHeaders {
        String requestId();

        String url();

        int statusCode();

        String reasonPhrase();

        boolean connectionReused();

        int connectionId();

        boolean fromDiskCache();
    }

    boolean isEnabled();

    void requestWillBeSent(InspectorRequest inspectorRequest);

    void responseHeadersReceived(InspectorResponse inspectorResponse);

    void httpExchangeFailed(String str, String str2);

    @Nullable
    InputStream interpretResponseStream(String str, @Nullable String str2, @Nullable String str3, @Nullable InputStream inputStream, ResponseHandler responseHandler);

    void responseReadFailed(String str, String str2);

    void responseReadFinished(String str);

    void dataSent(String str, int i, int i2);

    void dataReceived(String str, int i, int i2);
}
