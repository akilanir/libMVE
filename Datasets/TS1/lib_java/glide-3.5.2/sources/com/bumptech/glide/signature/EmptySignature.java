package com.bumptech.glide.signature;

import com.bumptech.glide.load.Key;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/signature/EmptySignature.class */
public final class EmptySignature implements Key {
    private static final EmptySignature EMPTY_KEY = new EmptySignature();

    public static EmptySignature obtain() {
        return EMPTY_KEY;
    }

    private EmptySignature() {
    }

    @Override // com.bumptech.glide.load.Key
    public void updateDiskCacheKey(MessageDigest messageDigest) throws UnsupportedEncodingException {
    }
}
