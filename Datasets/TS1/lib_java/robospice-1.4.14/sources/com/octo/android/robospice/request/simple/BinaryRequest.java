package com.octo.android.robospice.request.simple;

import com.octo.android.robospice.request.ProgressByteProcessor;
import com.octo.android.robospice.request.SpiceRequest;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import org.apache.commons.io.IOUtils;
import roboguice.util.temp.Ln;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/simple/BinaryRequest.class */
public abstract class BinaryRequest extends SpiceRequest<InputStream> {
    private static final int BUF_SIZE = 4096;
    protected String url;

    public abstract InputStream processStream(int i, InputStream inputStream) throws IOException;

    public BinaryRequest(String url) {
        super(InputStream.class);
        this.url = url;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.octo.android.robospice.request.SpiceRequest
    public final InputStream loadDataFromNetwork() throws Exception {
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(this.url).openConnection();
            return processStream(httpURLConnection.getContentLength(), httpURLConnection.getInputStream());
        } catch (MalformedURLException e) {
            Ln.e(e, "Unable to create URL", new Object[0]);
            throw e;
        } catch (IOException e2) {
            Ln.e(e2, "Unable to download binary", new Object[0]);
            throw e2;
        }
    }

    protected final String getUrl() {
        return this.url;
    }

    protected void readBytes(InputStream in, ProgressByteProcessor processor) throws IOException {
        int amt;
        byte[] buf = new byte[BUF_SIZE];
        do {
            try {
                amt = in.read(buf);
                if (amt == -1) {
                    break;
                }
            } finally {
                IOUtils.closeQuietly(in);
            }
        } while (processor.processBytes(buf, 0, amt));
    }
}
