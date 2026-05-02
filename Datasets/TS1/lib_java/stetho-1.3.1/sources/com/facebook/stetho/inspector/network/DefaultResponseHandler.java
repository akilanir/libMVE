package com.facebook.stetho.inspector.network;

import java.io.IOException;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/network/DefaultResponseHandler.class */
public class DefaultResponseHandler implements ResponseHandler {
    private final NetworkEventReporter mEventReporter;
    private final String mRequestId;
    private int mBytesRead = 0;
    private int mDecodedBytesRead = -1;

    public DefaultResponseHandler(NetworkEventReporter eventReporter, String requestId) {
        this.mEventReporter = eventReporter;
        this.mRequestId = requestId;
    }

    @Override // com.facebook.stetho.inspector.network.ResponseHandler
    public void onRead(int numBytes) {
        this.mBytesRead += numBytes;
    }

    @Override // com.facebook.stetho.inspector.network.ResponseHandler
    public void onReadDecoded(int numBytes) {
        if (this.mDecodedBytesRead == -1) {
            this.mDecodedBytesRead = 0;
        }
        this.mDecodedBytesRead += numBytes;
    }

    @Override // com.facebook.stetho.inspector.network.ResponseHandler
    public void onEOF() {
        reportDataReceived();
        this.mEventReporter.responseReadFinished(this.mRequestId);
    }

    @Override // com.facebook.stetho.inspector.network.ResponseHandler
    public void onError(IOException e) {
        reportDataReceived();
        this.mEventReporter.responseReadFailed(this.mRequestId, e.toString());
    }

    private void reportDataReceived() {
        this.mEventReporter.dataReceived(this.mRequestId, this.mBytesRead, this.mDecodedBytesRead >= 0 ? this.mDecodedBytesRead : this.mBytesRead);
    }
}
