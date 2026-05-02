package com.octo.android.robospice.request;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/ProgressByteProcessor.class */
public class ProgressByteProcessor {
    private final OutputStream bos;
    private long progress;
    private final long total;
    private SpiceRequest<?> spiceRequest;

    public ProgressByteProcessor(SpiceRequest<?> spiceRequest, OutputStream bos, long total) {
        this.bos = bos;
        this.total = total;
        this.spiceRequest = spiceRequest;
    }

    public boolean processBytes(byte[] buffer, int offset, int length) throws IOException {
        this.bos.write(buffer, offset, length);
        this.progress += length - offset;
        this.spiceRequest.publishProgress(this.progress / this.total);
        return !Thread.interrupted();
    }
}
