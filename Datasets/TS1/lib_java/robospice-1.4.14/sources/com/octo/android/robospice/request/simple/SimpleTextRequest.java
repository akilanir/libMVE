package com.octo.android.robospice.request.simple;

import com.octo.android.robospice.request.SpiceRequest;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import org.apache.commons.io.IOUtils;
import roboguice.util.temp.Ln;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/simple/SimpleTextRequest.class */
public class SimpleTextRequest extends SpiceRequest<String> {
    private final String url;

    public SimpleTextRequest(String url) {
        super(String.class);
        this.url = url;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.octo.android.robospice.request.SpiceRequest
    public String loadDataFromNetwork() throws Exception {
        try {
            Ln.d("Call web service " + this.url, new Object[0]);
            return IOUtils.toString(new InputStreamReader(new URL(this.url).openStream(), "UTF-8"));
        } catch (MalformedURLException e) {
            Ln.e(e, "Unable to create URL", new Object[0]);
            throw e;
        } catch (IOException e2) {
            Ln.e(e2, "Unable to download content", new Object[0]);
            throw e2;
        }
    }

    protected final String getUrl() {
        return this.url;
    }
}
