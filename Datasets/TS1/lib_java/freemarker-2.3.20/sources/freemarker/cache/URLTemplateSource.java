package freemarker.cache;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.JarURLConnection;
import java.net.URL;
import java.net.URLConnection;

/* loaded from: freemarker-2.3.20.jar:freemarker/cache/URLTemplateSource.class */
class URLTemplateSource {
    private final URL url;
    private URLConnection conn;
    private InputStream inputStream;

    URLTemplateSource(URL url) throws IOException {
        this.url = url;
        this.conn = url.openConnection();
    }

    public boolean equals(Object o) {
        if (o instanceof URLTemplateSource) {
            return this.url.equals(((URLTemplateSource) o).url);
        }
        return false;
    }

    public int hashCode() {
        return this.url.hashCode();
    }

    public String toString() {
        return this.url.toString();
    }

    long lastModified() {
        if (this.conn instanceof JarURLConnection) {
            URL jarURL = ((JarURLConnection) this.conn).getJarFileURL();
            if (jarURL.getProtocol().equals("file")) {
                return new File(jarURL.getFile()).lastModified();
            }
            URLConnection jarConn = null;
            try {
                jarConn = jarURL.openConnection();
                long lastModified = jarConn.getLastModified();
                if (jarConn != null) {
                    try {
                        jarConn.getInputStream().close();
                    } catch (IOException e) {
                    }
                }
                return lastModified;
            } catch (IOException e2) {
                if (jarConn != null) {
                    try {
                        jarConn.getInputStream().close();
                    } catch (IOException e3) {
                        return -1L;
                    }
                }
                return -1L;
            } catch (Throwable th) {
                if (jarConn != null) {
                    try {
                        jarConn.getInputStream().close();
                    } catch (IOException e4) {
                        throw th;
                    }
                }
                throw th;
            }
        }
        long lastModified2 = this.conn.getLastModified();
        if (lastModified2 == -1 && this.url.getProtocol().equals("file")) {
            return new File(this.url.getFile()).lastModified();
        }
        return lastModified2;
    }

    InputStream getInputStream() throws IOException {
        this.inputStream = this.conn.getInputStream();
        return this.inputStream;
    }

    void close() throws IOException {
        try {
            if (this.inputStream != null) {
                this.inputStream.close();
            } else {
                this.conn.getInputStream().close();
            }
        } finally {
            this.inputStream = null;
            this.conn = null;
        }
    }
}
