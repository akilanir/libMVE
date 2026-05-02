package com.octo.android.robospice.request.simple;

import com.octo.android.robospice.request.ProgressByteProcessor;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.commons.io.IOUtils;
import roboguice.util.temp.Ln;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/simple/BigBinaryRequest.class */
public class BigBinaryRequest extends BinaryRequest {
    protected File cacheFile;

    public BigBinaryRequest(String url, File cacheFile) {
        super(url);
        this.cacheFile = cacheFile;
    }

    @Override // com.octo.android.robospice.request.simple.BinaryRequest
    public InputStream processStream(int contentLength, InputStream inputStream) throws IOException {
        OutputStream fileOutputStream = null;
        try {
            boolean isTouchedNow = this.cacheFile.setLastModified(System.currentTimeMillis());
            if (!isTouchedNow) {
                Ln.d("Modification time of file %s could not be changed normally ", new Object[]{this.cacheFile.getAbsolutePath()});
            }
            fileOutputStream = new FileOutputStream(this.cacheFile);
            readBytes(inputStream, new ProgressByteProcessor(this, fileOutputStream, contentLength));
            FileInputStream fileInputStream = new FileInputStream(this.cacheFile);
            IOUtils.closeQuietly(fileOutputStream);
            return fileInputStream;
        } catch (Throwable th) {
            IOUtils.closeQuietly(fileOutputStream);
            throw th;
        }
    }

    public File getCacheFile() {
        return this.cacheFile;
    }
}
