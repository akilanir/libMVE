package com.bumptech.glide.signature;

import com.bumptech.glide.load.Key;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.security.MessageDigest;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/signature/MediaStoreSignature.class */
public class MediaStoreSignature implements Key {
    private final String mimeType;
    private final long dateModified;
    private final int orientation;

    public MediaStoreSignature(String mimeType, long dateModified, int orientation) {
        this.mimeType = mimeType;
        this.dateModified = dateModified;
        this.orientation = orientation;
    }

    @Override // com.bumptech.glide.load.Key
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        MediaStoreSignature that = (MediaStoreSignature) o;
        if (this.dateModified != that.dateModified || this.orientation != that.orientation) {
            return false;
        }
        if (this.mimeType != null) {
            if (!this.mimeType.equals(that.mimeType)) {
                return false;
            }
            return true;
        }
        if (that.mimeType != null) {
            return false;
        }
        return true;
    }

    @Override // com.bumptech.glide.load.Key
    public int hashCode() {
        int result = this.mimeType != null ? this.mimeType.hashCode() : 0;
        return (31 * ((31 * result) + ((int) (this.dateModified ^ (this.dateModified >>> 32))))) + this.orientation;
    }

    @Override // com.bumptech.glide.load.Key
    public void updateDiskCacheKey(MessageDigest messageDigest) throws UnsupportedEncodingException {
        byte[] data = ByteBuffer.allocate(12).putLong(this.dateModified).putInt(this.orientation).array();
        messageDigest.update(data);
        messageDigest.update(this.mimeType.getBytes(Key.STRING_CHARSET_NAME));
    }
}
