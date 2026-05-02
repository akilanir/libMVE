package com.bumptech.glide.util;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.os.Build;
import android.os.Looper;
import com.bumptech.glide.gifdecoder.GifDecoder;
import java.util.ArrayDeque;
import java.util.Queue;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/util/Util.class */
public final class Util {
    private static final char[] HEX_CHAR_ARRAY = "0123456789abcdef".toCharArray();
    private static final char[] SHA_256_CHARS = new char[64];
    private static final char[] SHA_1_CHARS = new char[40];

    private Util() {
    }

    public static String sha256BytesToHex(byte[] bytes) {
        return bytesToHex(bytes, SHA_256_CHARS);
    }

    public static String sha1BytesToHex(byte[] bytes) {
        return bytesToHex(bytes, SHA_1_CHARS);
    }

    private static String bytesToHex(byte[] bytes, char[] hexChars) {
        for (int j = 0; j < bytes.length; j++) {
            int v = bytes[j] & 255;
            hexChars[j * 2] = HEX_CHAR_ARRAY[v >>> 4];
            hexChars[(j * 2) + 1] = HEX_CHAR_ARRAY[v & 15];
        }
        return new String(hexChars);
    }

    @Deprecated
    public static int getSize(Bitmap bitmap) {
        return getBitmapByteSize(bitmap);
    }

    @TargetApi(19)
    public static int getBitmapByteSize(Bitmap bitmap) {
        if (Build.VERSION.SDK_INT >= 19) {
            try {
                return bitmap.getAllocationByteCount();
            } catch (NullPointerException e) {
            }
        }
        return bitmap.getHeight() * bitmap.getRowBytes();
    }

    public static int getBitmapByteSize(int width, int height, Bitmap.Config config) {
        return width * height * getBytesPerPixel(config);
    }

    private static int getBytesPerPixel(Bitmap.Config config) {
        int bytesPerPixel;
        if (config == null) {
            config = Bitmap.Config.ARGB_8888;
        }
        switch (AnonymousClass1.$SwitchMap$android$graphics$Bitmap$Config[config.ordinal()]) {
            case 1:
                bytesPerPixel = 1;
                break;
            case 2:
            case GifDecoder.STATUS_PARTIAL_DECODE /* 3 */:
                bytesPerPixel = 2;
                break;
            case 4:
            default:
                bytesPerPixel = 4;
                break;
        }
        return bytesPerPixel;
    }

    /* renamed from: com.bumptech.glide.util.Util$1, reason: invalid class name */
    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/util/Util$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$android$graphics$Bitmap$Config = new int[Bitmap.Config.values().length];

        static {
            try {
                $SwitchMap$android$graphics$Bitmap$Config[Bitmap.Config.ALPHA_8.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$android$graphics$Bitmap$Config[Bitmap.Config.RGB_565.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$android$graphics$Bitmap$Config[Bitmap.Config.ARGB_4444.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$android$graphics$Bitmap$Config[Bitmap.Config.ARGB_8888.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
        }
    }

    public static boolean isValidDimensions(int width, int height) {
        return isValidDimension(width) && isValidDimension(height);
    }

    private static boolean isValidDimension(int dimen) {
        return dimen > 0 || dimen == Integer.MIN_VALUE;
    }

    public static void assertMainThread() {
        if (!isOnMainThread()) {
            throw new IllegalArgumentException("You must call this method on the main thread");
        }
    }

    public static void assertBackgroundThread() {
        if (!isOnBackgroundThread()) {
            throw new IllegalArgumentException("YOu must call this method on a background thread");
        }
    }

    public static boolean isOnMainThread() {
        return Looper.myLooper() == Looper.getMainLooper();
    }

    public static boolean isOnBackgroundThread() {
        return !isOnMainThread();
    }

    public static <T> Queue<T> createQueue(int size) {
        return new ArrayDeque(size);
    }
}
