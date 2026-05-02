package org.springframework.core.io;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import org.springframework.util.ResourceUtils;

/* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/core/io/AbstractFileResolvingResource.class */
public abstract class AbstractFileResolvingResource extends AbstractResource {
    @Override // org.springframework.core.io.AbstractResource, org.springframework.core.io.Resource
    public File getFile() throws IOException {
        URL url = getURL();
        return ResourceUtils.getFile(url, getDescription());
    }

    @Override // org.springframework.core.io.AbstractResource
    protected File getFileForLastModifiedCheck() throws IOException {
        URL url = getURL();
        if (ResourceUtils.isJarURL(url)) {
            URL actualUrl = ResourceUtils.extractJarFileURL(url);
            return ResourceUtils.getFile(actualUrl, "Jar URL");
        }
        return getFile();
    }

    protected File getFile(URI uri) throws IOException {
        return ResourceUtils.getFile(uri, getDescription());
    }

    @Override // org.springframework.core.io.AbstractResource, org.springframework.core.io.Resource
    public boolean exists() {
        try {
            URL url = getURL();
            if (ResourceUtils.isFileURL(url)) {
                return getFile().exists();
            }
            URLConnection con = url.openConnection();
            con.setUseCaches(false);
            HttpURLConnection httpCon = con instanceof HttpURLConnection ? (HttpURLConnection) con : null;
            if (httpCon != null) {
                httpCon.setRequestMethod("HEAD");
                int code = httpCon.getResponseCode();
                if (code == 200) {
                    return true;
                }
                if (code == 404) {
                    return false;
                }
            }
            if (con.getContentLength() >= 0) {
                return true;
            }
            if (httpCon != null) {
                httpCon.disconnect();
                return false;
            }
            InputStream is = getInputStream();
            is.close();
            return true;
        } catch (IOException e) {
            return false;
        }
    }

    @Override // org.springframework.core.io.AbstractResource, org.springframework.core.io.Resource
    public boolean isReadable() {
        try {
            URL url = getURL();
            if (ResourceUtils.isFileURL(url)) {
                File file = getFile();
                if (file.canRead()) {
                    if (!file.isDirectory()) {
                        return true;
                    }
                }
                return false;
            }
            return true;
        } catch (IOException e) {
            return false;
        }
    }

    @Override // org.springframework.core.io.AbstractResource, org.springframework.core.io.Resource
    public long contentLength() throws IOException {
        URL url = getURL();
        if (ResourceUtils.isFileURL(url)) {
            return super.contentLength();
        }
        URLConnection con = url.openConnection();
        con.setUseCaches(false);
        if (con instanceof HttpURLConnection) {
            ((HttpURLConnection) con).setRequestMethod("HEAD");
        }
        return con.getContentLength();
    }

    @Override // org.springframework.core.io.AbstractResource, org.springframework.core.io.Resource
    public long lastModified() throws IOException {
        URL url = getURL();
        if (ResourceUtils.isFileURL(url) || ResourceUtils.isJarURL(url)) {
            return super.lastModified();
        }
        URLConnection con = url.openConnection();
        con.setUseCaches(false);
        if (con instanceof HttpURLConnection) {
            ((HttpURLConnection) con).setRequestMethod("HEAD");
        }
        return con.getLastModified();
    }
}
