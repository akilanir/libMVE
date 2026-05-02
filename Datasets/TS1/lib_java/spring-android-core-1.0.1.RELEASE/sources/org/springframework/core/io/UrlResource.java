package org.springframework.core.io;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

/* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/core/io/UrlResource.class */
public class UrlResource extends AbstractFileResolvingResource {
    private final URL url;
    private final URL cleanedUrl;
    private final URI uri;

    public UrlResource(URL url) {
        Assert.notNull(url, "URL must not be null");
        this.url = url;
        this.cleanedUrl = getCleanedUrl(this.url, url.toString());
        this.uri = null;
    }

    public UrlResource(URI uri) throws MalformedURLException {
        Assert.notNull(uri, "URI must not be null");
        this.url = uri.toURL();
        this.cleanedUrl = getCleanedUrl(this.url, uri.toString());
        this.uri = uri;
    }

    public UrlResource(String path) throws MalformedURLException {
        Assert.notNull(path, "Path must not be null");
        this.url = new URL(path);
        this.cleanedUrl = getCleanedUrl(this.url, path);
        this.uri = null;
    }

    private URL getCleanedUrl(URL originalUrl, String originalPath) {
        try {
            return new URL(StringUtils.cleanPath(originalPath));
        } catch (MalformedURLException e) {
            return originalUrl;
        }
    }

    @Override // org.springframework.core.io.InputStreamSource
    public InputStream getInputStream() throws IOException {
        URLConnection con = this.url.openConnection();
        con.setUseCaches(false);
        try {
            return con.getInputStream();
        } catch (IOException ex) {
            if (con instanceof HttpURLConnection) {
                ((HttpURLConnection) con).disconnect();
            }
            throw ex;
        }
    }

    @Override // org.springframework.core.io.AbstractResource, org.springframework.core.io.Resource
    public URL getURL() throws IOException {
        return this.url;
    }

    @Override // org.springframework.core.io.AbstractResource, org.springframework.core.io.Resource
    public URI getURI() throws IOException {
        if (this.uri != null) {
            return this.uri;
        }
        return super.getURI();
    }

    @Override // org.springframework.core.io.AbstractFileResolvingResource, org.springframework.core.io.AbstractResource, org.springframework.core.io.Resource
    public File getFile() throws IOException {
        if (this.uri != null) {
            return super.getFile(this.uri);
        }
        return super.getFile();
    }

    @Override // org.springframework.core.io.AbstractResource, org.springframework.core.io.Resource
    public Resource createRelative(String relativePath) throws MalformedURLException {
        if (relativePath.startsWith("/")) {
            relativePath = relativePath.substring(1);
        }
        return new UrlResource(new URL(this.url, relativePath));
    }

    @Override // org.springframework.core.io.AbstractResource, org.springframework.core.io.Resource
    public String getFilename() {
        return new File(this.url.getFile()).getName();
    }

    @Override // org.springframework.core.io.Resource
    public String getDescription() {
        return "URL [" + this.url + "]";
    }

    @Override // org.springframework.core.io.AbstractResource
    public boolean equals(Object obj) {
        return obj == this || ((obj instanceof UrlResource) && this.cleanedUrl.equals(((UrlResource) obj).cleanedUrl));
    }

    @Override // org.springframework.core.io.AbstractResource
    public int hashCode() {
        return this.cleanedUrl.hashCode();
    }
}
