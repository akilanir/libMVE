package com.loopj.android.http;

import android.os.Message;
import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.util.ByteArrayBuffer;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: android-async-http-1.4.9.jar:com/loopj/android/http/DataAsyncHttpResponseHandler.class */
public abstract class DataAsyncHttpResponseHandler extends AsyncHttpResponseHandler {
    protected static final int PROGRESS_DATA_MESSAGE = 7;
    private static final String LOG_TAG = "DataAsyncHttpRH";

    public static byte[] copyOfRange(byte[] original, int start, int end) throws ArrayIndexOutOfBoundsException, IllegalArgumentException, NullPointerException {
        if (start > end) {
            throw new IllegalArgumentException();
        }
        int originalLength = original.length;
        if (start < 0 || start > originalLength) {
            throw new ArrayIndexOutOfBoundsException();
        }
        int resultLength = end - start;
        int copyLength = Math.min(resultLength, originalLength - start);
        byte[] result = new byte[resultLength];
        System.arraycopy(original, start, result, 0, copyLength);
        return result;
    }

    public void onProgressData(byte[] responseBody) {
        AsyncHttpClient.log.d(LOG_TAG, "onProgressData(byte[]) was not overriden, but callback was received");
    }

    public final void sendProgressDataMessage(byte[] responseBytes) {
        sendMessage(obtainMessage(PROGRESS_DATA_MESSAGE, new Object[]{responseBytes}));
    }

    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    protected void handleMessage(Message message) {
        super.handleMessage(message);
        switch (message.what) {
            case PROGRESS_DATA_MESSAGE /* 7 */:
                Object[] response = (Object[]) message.obj;
                if (response != null && response.length >= 1) {
                    try {
                        onProgressData((byte[]) response[0]);
                        break;
                    } catch (Throwable t) {
                        AsyncHttpClient.log.e(LOG_TAG, "custom onProgressData contains an error", t);
                        return;
                    }
                } else {
                    AsyncHttpClient.log.e(LOG_TAG, "PROGRESS_DATA_MESSAGE didn't got enough params");
                    break;
                }
                break;
        }
    }

    /* JADX WARN: Finally extract failed */
    @Override // com.loopj.android.http.AsyncHttpResponseHandler
    byte[] getResponseData(HttpEntity entity) throws IOException {
        InputStream instream;
        byte[] responseBody = null;
        if (entity != null && (instream = entity.getContent()) != null) {
            long contentLength = entity.getContentLength();
            if (contentLength > 2147483647L) {
                throw new IllegalArgumentException("HTTP entity too large to be buffered in memory");
            }
            if (contentLength < 0) {
                contentLength = 4096;
            }
            try {
                ByteArrayBuffer buffer = new ByteArrayBuffer((int) contentLength);
                try {
                    byte[] tmp = new byte[4096];
                    while (true) {
                        int l = instream.read(tmp);
                        if (l == -1 || Thread.currentThread().isInterrupted()) {
                            break;
                        }
                        buffer.append(tmp, 0, l);
                        sendProgressDataMessage(copyOfRange(tmp, 0, l));
                        sendProgressMessage(0, contentLength);
                    }
                    AsyncHttpClient.silentCloseInputStream(instream);
                    responseBody = buffer.toByteArray();
                } catch (Throwable th) {
                    AsyncHttpClient.silentCloseInputStream(instream);
                    throw th;
                }
            } catch (OutOfMemoryError e) {
                System.gc();
                throw new IOException("File too large to fit into available memory");
            }
        }
        return responseBody;
    }
}
