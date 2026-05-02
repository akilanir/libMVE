package com.bumptech.glide.load;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/Key.class */
public interface Key {
    public static final String STRING_CHARSET_NAME = "UTF-8";

    void updateDiskCacheKey(MessageDigest messageDigest) throws UnsupportedEncodingException;

    boolean equals(Object obj);

    int hashCode();
}
