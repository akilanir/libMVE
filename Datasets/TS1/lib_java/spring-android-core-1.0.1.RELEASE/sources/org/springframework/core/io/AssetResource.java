package org.springframework.core.io;

import android.content.res.AssetManager;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import org.springframework.util.Assert;

/* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/core/io/AssetResource.class */
public class AssetResource extends AbstractResource {
    private final AssetManager assetManager;
    private final String fileName;

    public AssetResource(AssetManager assetManager, String fileName) {
        Assert.notNull(assetManager, "assetManager must not be null");
        Assert.notNull(fileName, "fileName must not be null");
        this.assetManager = assetManager;
        this.fileName = fileName;
    }

    @Override // org.springframework.core.io.AbstractResource, org.springframework.core.io.Resource
    public boolean exists() {
        try {
            InputStream inputStream = this.assetManager.open(this.fileName);
            if (inputStream != null) {
                return true;
            }
            return false;
        } catch (IOException e) {
            return false;
        }
    }

    @Override // org.springframework.core.io.AbstractResource, org.springframework.core.io.Resource
    public long contentLength() throws IOException {
        return this.assetManager.openFd(this.fileName).getLength();
    }

    @Override // org.springframework.core.io.Resource
    public String getDescription() {
        return "asset [" + this.fileName + "]";
    }

    @Override // org.springframework.core.io.InputStreamSource
    public InputStream getInputStream() throws IOException {
        InputStream inputStream = this.assetManager.open(this.fileName);
        if (inputStream == null) {
            throw new FileNotFoundException(getDescription() + " cannot be opened because it does not exist");
        }
        return inputStream;
    }

    @Override // org.springframework.core.io.AbstractResource
    public boolean equals(Object obj) {
        return obj == this || ((obj instanceof AssetResource) && this.fileName.equals(((AssetResource) obj).fileName));
    }

    @Override // org.springframework.core.io.AbstractResource
    public int hashCode() {
        return this.fileName.hashCode();
    }
}
