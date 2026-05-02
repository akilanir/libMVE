package com.octo.android.robospice.request.simple;

import com.octo.android.robospice.request.ProgressByteProcessor;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/simple/SmallBinaryRequest.class */
public class SmallBinaryRequest extends BinaryRequest {
    public SmallBinaryRequest(String url) {
        super(url);
    }

    @Override // com.octo.android.robospice.request.simple.BinaryRequest
    public InputStream processStream(int contentLength, InputStream inputStream) throws IOException {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        readBytes(inputStream, new ProgressByteProcessor(this, bos, contentLength));
        byte[] bytes = bos.toByteArray();
        return new ByteArrayInputStream(bytes);
    }
}
