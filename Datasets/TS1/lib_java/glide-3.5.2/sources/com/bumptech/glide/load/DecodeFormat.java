package com.bumptech.glide.load;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/DecodeFormat.class */
public enum DecodeFormat {
    ALWAYS_ARGB_8888,
    PREFER_ARGB_8888,
    PREFER_RGB_565;

    public static final DecodeFormat DEFAULT = PREFER_RGB_565;
}
