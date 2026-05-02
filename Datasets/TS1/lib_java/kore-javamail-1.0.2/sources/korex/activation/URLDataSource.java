package korex.activation;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;

/* loaded from: kore-javamail-1.0.2.jar:korex/activation/URLDataSource.class */
public class URLDataSource implements DataSource {
    private URL url;
    private URLConnection url_conn = null;

    public URLDataSource(URL url) {
        this.url = null;
        this.url = url;
    }

    @Override // korex.activation.DataSource
    public String getContentType() {
        String type = null;
        try {
            if (this.url_conn == null) {
                this.url_conn = this.url.openConnection();
            }
        } catch (IOException e) {
        }
        if (this.url_conn != null) {
            type = this.url_conn.getContentType();
        }
        if (type == null) {
            type = "application/octet-stream";
        }
        return type;
    }

    @Override // korex.activation.DataSource
    public String getName() {
        return this.url.getFile();
    }

    @Override // korex.activation.DataSource
    public InputStream getInputStream() throws IOException {
        return this.url.openStream();
    }

    @Override // korex.activation.DataSource
    public OutputStream getOutputStream() throws IOException {
        this.url_conn = this.url.openConnection();
        if (this.url_conn != null) {
            this.url_conn.setDoOutput(true);
            return this.url_conn.getOutputStream();
        }
        return null;
    }

    public URL getURL() {
        return this.url;
    }
}
