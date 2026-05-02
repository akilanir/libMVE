package org.springframework.core.io;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import org.springframework.core.NestedIOException;
import org.springframework.util.ResourceUtils;

/* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/core/io/AbstractResource.class */
public abstract class AbstractResource implements Resource {
    @Override // org.springframework.core.io.Resource
    public boolean exists() {
        try {
            return getFile().exists();
        } catch (IOException e) {
            try {
                InputStream is = getInputStream();
                is.close();
                return true;
            } catch (Throwable th) {
                return false;
            }
        }
    }

    @Override // org.springframework.core.io.Resource
    public boolean isReadable() {
        return true;
    }

    @Override // org.springframework.core.io.Resource
    public boolean isOpen() {
        return false;
    }

    @Override // org.springframework.core.io.Resource
    public URL getURL() throws IOException {
        throw new FileNotFoundException(getDescription() + " cannot be resolved to URL");
    }

    @Override // org.springframework.core.io.Resource
    public URI getURI() throws IOException {
        URL url = getURL();
        try {
            return ResourceUtils.toURI(url);
        } catch (URISyntaxException ex) {
            throw new NestedIOException("Invalid URI [" + url + "]", ex);
        }
    }

    @Override // org.springframework.core.io.Resource
    public File getFile() throws IOException {
        throw new FileNotFoundException(getDescription() + " cannot be resolved to absolute file path");
    }

    @Override // org.springframework.core.io.Resource
    public long contentLength() throws IOException {
        return getFile().length();
    }

    @Override // org.springframework.core.io.Resource
    public long lastModified() throws IOException {
        long lastModified = getFileForLastModifiedCheck().lastModified();
        if (lastModified == 0) {
            throw new FileNotFoundException(getDescription() + " cannot be resolved in the file system for resolving its last-modified timestamp");
        }
        return lastModified;
    }

    protected File getFileForLastModifiedCheck() throws IOException {
        return getFile();
    }

    @Override // org.springframework.core.io.Resource
    public Resource createRelative(String relativePath) throws IOException {
        throw new FileNotFoundException("Cannot create a relative resource for " + getDescription());
    }

    @Override // org.springframework.core.io.Resource
    public String getFilename() throws IllegalStateException {
        throw new IllegalStateException(getDescription() + " does not have a filename");
    }

    public String toString() {
        return getDescription();
    }

    public boolean equals(Object obj) {
        return obj == this || ((obj instanceof Resource) && ((Resource) obj).getDescription().equals(getDescription()));
    }

    public int hashCode() {
        return getDescription().hashCode();
    }
}
