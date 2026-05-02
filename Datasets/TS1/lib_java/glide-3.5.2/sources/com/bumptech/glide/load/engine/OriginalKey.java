package com.bumptech.glide.load.engine;

import com.bumptech.glide.load.Key;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/OriginalKey.class */
class OriginalKey implements Key {
    private final String id;
    private final Key signature;

    public OriginalKey(String id, Key signature) {
        this.id = id;
        this.signature = signature;
    }

    @Override // com.bumptech.glide.load.Key
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        OriginalKey that = (OriginalKey) o;
        if (!this.id.equals(that.id) || !this.signature.equals(that.signature)) {
            return false;
        }
        return true;
    }

    @Override // com.bumptech.glide.load.Key
    public int hashCode() {
        int result = this.id.hashCode();
        return (31 * result) + this.signature.hashCode();
    }

    @Override // com.bumptech.glide.load.Key
    public void updateDiskCacheKey(MessageDigest messageDigest) throws UnsupportedEncodingException {
        messageDigest.update(this.id.getBytes(Key.STRING_CHARSET_NAME));
        this.signature.updateDiskCacheKey(messageDigest);
    }
}
