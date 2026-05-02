package com.nostra13.universalimageloader.utils;

import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/utils/IoUtils.class */
public final class IoUtils {
    public static final int DEFAULT_BUFFER_SIZE = 32768;
    public static final int DEFAULT_IMAGE_TOTAL_SIZE = 512000;
    public static final int CONTINUE_LOADING_PERCENTAGE = 75;

    /* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/utils/IoUtils$CopyListener.class */
    public interface CopyListener {
        boolean onBytesCopied(int i, int i2);
    }

    private IoUtils() {
    }

    public static boolean copyStream(InputStream is, OutputStream os, CopyListener listener) throws IOException {
        return copyStream(is, os, listener, 32768);
    }

    public static boolean copyStream(InputStream is, OutputStream os, CopyListener listener, int bufferSize) throws IOException {
        int current = 0;
        int total = is.available();
        if (total <= 0) {
            total = 512000;
        }
        byte[] bytes = new byte[bufferSize];
        if (shouldStopLoading(listener, 0, total)) {
            return false;
        }
        do {
            int count = is.read(bytes, 0, bufferSize);
            if (count != -1) {
                os.write(bytes, 0, count);
                current += count;
            } else {
                os.flush();
                return true;
            }
        } while (!shouldStopLoading(listener, current, total));
        return false;
    }

    private static boolean shouldStopLoading(CopyListener listener, int current, int total) {
        if (listener != null) {
            boolean shouldContinue = listener.onBytesCopied(current, total);
            if (!shouldContinue && (100 * current) / total < 75) {
                return true;
            }
            return false;
        }
        return false;
    }

    public static void readAndCloseStream(InputStream is) {
        byte[] bytes = new byte[32768];
        do {
            try {
            } catch (IOException e) {
                closeSilently(is);
                return;
            } catch (Throwable th) {
                closeSilently(is);
                throw th;
            }
        } while (is.read(bytes, 0, 32768) != -1);
        closeSilently(is);
    }

    public static void closeSilently(Closeable closeable) {
        try {
            closeable.close();
        } catch (Exception e) {
        }
    }
}
