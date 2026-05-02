package com.squareup.picasso;

import android.annotation.TargetApi;
import android.app.ActivityManager;
import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Process;
import android.os.StatFs;
import android.provider.Settings;
import android.util.Log;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.concurrent.ThreadFactory;

/* loaded from: picasso-2.5.2.jar:com/squareup/picasso/Utils.class */
final class Utils {
    static final String THREAD_PREFIX = "Picasso-";
    static final String THREAD_IDLE_NAME = "Picasso-Idle";
    static final int DEFAULT_READ_TIMEOUT_MILLIS = 20000;
    static final int DEFAULT_WRITE_TIMEOUT_MILLIS = 20000;
    static final int DEFAULT_CONNECT_TIMEOUT_MILLIS = 15000;
    private static final String PICASSO_CACHE = "picasso-cache";
    private static final int KEY_PADDING = 50;
    private static final int MIN_DISK_CACHE_SIZE = 5242880;
    private static final int MAX_DISK_CACHE_SIZE = 52428800;
    static final int THREAD_LEAK_CLEANING_MS = 1000;
    static final char KEY_SEPARATOR = '\n';
    static final StringBuilder MAIN_THREAD_KEY_BUILDER = new StringBuilder();
    static final String OWNER_MAIN = "Main";
    static final String OWNER_DISPATCHER = "Dispatcher";
    static final String OWNER_HUNTER = "Hunter";
    static final String VERB_CREATED = "created";
    static final String VERB_CHANGED = "changed";
    static final String VERB_IGNORED = "ignored";
    static final String VERB_ENQUEUED = "enqueued";
    static final String VERB_CANCELED = "canceled";
    static final String VERB_BATCHED = "batched";
    static final String VERB_RETRYING = "retrying";
    static final String VERB_EXECUTING = "executing";
    static final String VERB_DECODED = "decoded";
    static final String VERB_TRANSFORMED = "transformed";
    static final String VERB_JOINED = "joined";
    static final String VERB_REMOVED = "removed";
    static final String VERB_DELIVERED = "delivered";
    static final String VERB_REPLAYING = "replaying";
    static final String VERB_COMPLETED = "completed";
    static final String VERB_ERRORED = "errored";
    static final String VERB_PAUSED = "paused";
    static final String VERB_RESUMED = "resumed";
    private static final int WEBP_FILE_HEADER_SIZE = 12;
    private static final String WEBP_FILE_HEADER_RIFF = "RIFF";
    private static final String WEBP_FILE_HEADER_WEBP = "WEBP";

    private Utils() {
    }

    static int getBitmapBytes(Bitmap bitmap) {
        int result;
        if (Build.VERSION.SDK_INT >= WEBP_FILE_HEADER_SIZE) {
            result = BitmapHoneycombMR1.getByteCount(bitmap);
        } else {
            result = bitmap.getRowBytes() * bitmap.getHeight();
        }
        if (result < 0) {
            throw new IllegalStateException("Negative size: " + bitmap);
        }
        return result;
    }

    static <T> T checkNotNull(T value, String message) {
        if (value == null) {
            throw new NullPointerException(message);
        }
        return value;
    }

    static void checkNotMain() {
        if (isMain()) {
            throw new IllegalStateException("Method call should not happen from the main thread.");
        }
    }

    static void checkMain() {
        if (!isMain()) {
            throw new IllegalStateException("Method call should happen from the main thread.");
        }
    }

    static boolean isMain() {
        return Looper.getMainLooper().getThread() == Thread.currentThread();
    }

    static String getLogIdsForHunter(BitmapHunter hunter) {
        return getLogIdsForHunter(hunter, "");
    }

    static String getLogIdsForHunter(BitmapHunter hunter, String prefix) {
        StringBuilder builder = new StringBuilder(prefix);
        Action action = hunter.getAction();
        if (action != null) {
            builder.append(action.request.logId());
        }
        List<Action> actions = hunter.getActions();
        if (actions != null) {
            int count = actions.size();
            for (int i = 0; i < count; i++) {
                if (i > 0 || action != null) {
                    builder.append(", ");
                }
                builder.append(actions.get(i).request.logId());
            }
        }
        return builder.toString();
    }

    static void log(String owner, String verb, String logId) {
        log(owner, verb, logId, "");
    }

    static void log(String owner, String verb, String logId, String extras) {
        Log.d("Picasso", String.format("%1$-11s %2$-12s %3$s %4$s", owner, verb, logId, extras));
    }

    static String createKey(Request data) {
        String result = createKey(data, MAIN_THREAD_KEY_BUILDER);
        MAIN_THREAD_KEY_BUILDER.setLength(0);
        return result;
    }

    static String createKey(Request data, StringBuilder builder) {
        if (data.stableKey != null) {
            builder.ensureCapacity(data.stableKey.length() + KEY_PADDING);
            builder.append(data.stableKey);
        } else if (data.uri != null) {
            String path = data.uri.toString();
            builder.ensureCapacity(path.length() + KEY_PADDING);
            builder.append(path);
        } else {
            builder.ensureCapacity(KEY_PADDING);
            builder.append(data.resourceId);
        }
        builder.append('\n');
        if (data.rotationDegrees != 0.0f) {
            builder.append("rotation:").append(data.rotationDegrees);
            if (data.hasRotationPivot) {
                builder.append('@').append(data.rotationPivotX).append('x').append(data.rotationPivotY);
            }
            builder.append('\n');
        }
        if (data.hasSize()) {
            builder.append("resize:").append(data.targetWidth).append('x').append(data.targetHeight);
            builder.append('\n');
        }
        if (data.centerCrop) {
            builder.append("centerCrop").append('\n');
        } else if (data.centerInside) {
            builder.append("centerInside").append('\n');
        }
        if (data.transformations != null) {
            int count = data.transformations.size();
            for (int i = 0; i < count; i++) {
                builder.append(data.transformations.get(i).key());
                builder.append('\n');
            }
        }
        return builder.toString();
    }

    static void closeQuietly(InputStream is) {
        if (is == null) {
            return;
        }
        try {
            is.close();
        } catch (IOException e) {
        }
    }

    static boolean parseResponseSourceHeader(String header) {
        if (header == null) {
            return false;
        }
        String[] parts = header.split(" ", 2);
        if ("CACHE".equals(parts[0])) {
            return true;
        }
        if (parts.length == 1) {
            return false;
        }
        try {
            if ("CONDITIONAL_CACHE".equals(parts[0])) {
                if (Integer.parseInt(parts[1]) == 304) {
                    return true;
                }
            }
            return false;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    static Downloader createDefaultDownloader(Context context) {
        try {
            Class.forName("com.squareup.okhttp.OkHttpClient");
            return OkHttpLoaderCreator.create(context);
        } catch (ClassNotFoundException e) {
            return new UrlConnectionDownloader(context);
        }
    }

    static File createDefaultCacheDir(Context context) {
        File cache = new File(context.getApplicationContext().getCacheDir(), PICASSO_CACHE);
        if (!cache.exists()) {
            cache.mkdirs();
        }
        return cache;
    }

    static long calculateDiskCacheSize(File dir) {
        long size = 5242880;
        try {
            StatFs statFs = new StatFs(dir.getAbsolutePath());
            long available = statFs.getBlockCount() * statFs.getBlockSize();
            size = available / 50;
        } catch (IllegalArgumentException e) {
        }
        return Math.max(Math.min(size, 52428800L), 5242880L);
    }

    static int calculateMemoryCacheSize(Context context) {
        ActivityManager am = (ActivityManager) getService(context, "activity");
        boolean largeHeap = (context.getApplicationInfo().flags & 1048576) != 0;
        int memoryClass = am.getMemoryClass();
        if (largeHeap && Build.VERSION.SDK_INT >= 11) {
            memoryClass = ActivityManagerHoneycomb.getLargeMemoryClass(am);
        }
        return (1048576 * memoryClass) / 7;
    }

    static boolean isAirplaneModeOn(Context context) {
        ContentResolver contentResolver = context.getContentResolver();
        try {
            return Settings.System.getInt(contentResolver, "airplane_mode_on", 0) != 0;
        } catch (NullPointerException e) {
            return false;
        }
    }

    static <T> T getService(Context context, String str) {
        return (T) context.getSystemService(str);
    }

    static boolean hasPermission(Context context, String permission) {
        return context.checkCallingOrSelfPermission(permission) == 0;
    }

    static byte[] toByteArray(InputStream input) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        while (true) {
            int n = input.read(buffer);
            if (-1 != n) {
                byteArrayOutputStream.write(buffer, 0, n);
            } else {
                return byteArrayOutputStream.toByteArray();
            }
        }
    }

    static boolean isWebPFile(InputStream stream) throws IOException {
        byte[] fileHeaderBytes = new byte[WEBP_FILE_HEADER_SIZE];
        boolean isWebPFile = false;
        if (stream.read(fileHeaderBytes, 0, WEBP_FILE_HEADER_SIZE) == WEBP_FILE_HEADER_SIZE) {
            isWebPFile = WEBP_FILE_HEADER_RIFF.equals(new String(fileHeaderBytes, 0, 4, "US-ASCII")) && WEBP_FILE_HEADER_WEBP.equals(new String(fileHeaderBytes, 8, 4, "US-ASCII"));
        }
        return isWebPFile;
    }

    static int getResourceId(Resources resources, Request data) throws FileNotFoundException {
        int id;
        if (data.resourceId != 0 || data.uri == null) {
            return data.resourceId;
        }
        String pkg = data.uri.getAuthority();
        if (pkg == null) {
            throw new FileNotFoundException("No package provided: " + data.uri);
        }
        List<String> segments = data.uri.getPathSegments();
        if (segments == null || segments.isEmpty()) {
            throw new FileNotFoundException("No path segments: " + data.uri);
        }
        if (segments.size() == 1) {
            try {
                id = Integer.parseInt(segments.get(0));
            } catch (NumberFormatException e) {
                throw new FileNotFoundException("Last path segment is not a resource ID: " + data.uri);
            }
        } else if (segments.size() == 2) {
            String type = segments.get(0);
            String name = segments.get(1);
            id = resources.getIdentifier(name, type, pkg);
        } else {
            throw new FileNotFoundException("More than two path segments: " + data.uri);
        }
        return id;
    }

    static Resources getResources(Context context, Request data) throws FileNotFoundException {
        if (data.resourceId != 0 || data.uri == null) {
            return context.getResources();
        }
        String pkg = data.uri.getAuthority();
        if (pkg == null) {
            throw new FileNotFoundException("No package provided: " + data.uri);
        }
        try {
            PackageManager pm = context.getPackageManager();
            return pm.getResourcesForApplication(pkg);
        } catch (PackageManager.NameNotFoundException e) {
            throw new FileNotFoundException("Unable to obtain resources for package: " + data.uri);
        }
    }

    static void flushStackLocalLeaks(Looper looper) {
        Handler handler = new Handler(looper) { // from class: com.squareup.picasso.Utils.1
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                sendMessageDelayed(obtainMessage(), 1000L);
            }
        };
        handler.sendMessageDelayed(handler.obtainMessage(), 1000L);
    }

    @TargetApi(11)
    /* loaded from: picasso-2.5.2.jar:com/squareup/picasso/Utils$ActivityManagerHoneycomb.class */
    private static class ActivityManagerHoneycomb {
        private ActivityManagerHoneycomb() {
        }

        static int getLargeMemoryClass(ActivityManager activityManager) {
            return activityManager.getLargeMemoryClass();
        }
    }

    /* loaded from: picasso-2.5.2.jar:com/squareup/picasso/Utils$PicassoThreadFactory.class */
    static class PicassoThreadFactory implements ThreadFactory {
        PicassoThreadFactory() {
        }

        @Override // java.util.concurrent.ThreadFactory
        public Thread newThread(Runnable r) {
            return new PicassoThread(r);
        }
    }

    /* loaded from: picasso-2.5.2.jar:com/squareup/picasso/Utils$PicassoThread.class */
    private static class PicassoThread extends Thread {
        public PicassoThread(Runnable r) {
            super(r);
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            Process.setThreadPriority(Utils.KEY_SEPARATOR);
            super.run();
        }
    }

    @TargetApi(Utils.WEBP_FILE_HEADER_SIZE)
    /* loaded from: picasso-2.5.2.jar:com/squareup/picasso/Utils$BitmapHoneycombMR1.class */
    private static class BitmapHoneycombMR1 {
        private BitmapHoneycombMR1() {
        }

        static int getByteCount(Bitmap bitmap) {
            return bitmap.getByteCount();
        }
    }

    /* loaded from: picasso-2.5.2.jar:com/squareup/picasso/Utils$OkHttpLoaderCreator.class */
    private static class OkHttpLoaderCreator {
        private OkHttpLoaderCreator() {
        }

        static Downloader create(Context context) {
            return new OkHttpDownloader(context);
        }
    }
}
