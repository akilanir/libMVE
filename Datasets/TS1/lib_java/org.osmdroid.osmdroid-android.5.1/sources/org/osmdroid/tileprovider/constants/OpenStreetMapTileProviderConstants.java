package org.osmdroid.tileprovider.constants;

import android.os.Environment;
import android.util.Log;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Locale;
import org.osmdroid.api.IMapView;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants.class */
public class OpenStreetMapTileProviderConstants {
    private static File OSMDROID_PATH = new File(Environment.getExternalStorageDirectory(), "osmdroid");
    public static File TILE_PATH_BASE = new File(OSMDROID_PATH, "tiles");
    public static boolean DEBUGMODE;
    public static boolean DEBUG_TILE_PROVIDERS;
    public static String USER_AGENT;
    private static String USER_AGENT_VALUE;
    public static final int MINIMUM_ZOOMLEVEL = 0;
    public static final String TILE_PATH_EXTENSION = ".tile";
    public static final int CACHE_MAPTILECOUNT_DEFAULT = 9;
    private static int NUMBER_OF_TILE_DOWNLOAD_THREADS;
    public static final short NUMBER_OF_TILE_FILESYSTEM_THREADS = 8;
    public static final long ONE_SECOND = 1000;
    public static final long ONE_MINUTE = 60000;
    public static final long ONE_HOUR = 3600000;
    public static final long ONE_DAY = 86400000;
    public static final long ONE_WEEK = 604800000;
    public static final long ONE_YEAR = 31536000000L;
    public static final long DEFAULT_MAXIMUM_CACHED_FILE_AGE = 604800000;
    public static final short TILE_DOWNLOAD_MAXIMUM_QUEUE_SIZE = 40;
    public static final short TILE_FILESYSTEM_MAXIMUM_QUEUE_SIZE = 40;
    public static final long TILE_EXPIRY_TIME_MILLISECONDS = 2592000000L;
    public static long TILE_MAX_CACHE_SIZE_BYTES;
    public static long TILE_TRIM_CACHE_SIZE_BYTES;
    public static final String HTTP_EXPIRES_HEADER = "Expires";
    public static final String HTTP_EXPIRES_HEADER_FORMAT = "EEE, dd MMM yyyy HH:mm:ss z";
    public static final SimpleDateFormat HTTP_HEADER_SDF;

    static {
        try {
            TILE_PATH_BASE.mkdirs();
            new File(TILE_PATH_BASE + "/.nomedia").createNewFile();
        } catch (Exception ex) {
            Log.e(IMapView.LOGTAG, "unable to create a nomedia file. downloaded tiles may be visible to the gallery. " + ex.getMessage());
        }
        DEBUGMODE = false;
        DEBUG_TILE_PROVIDERS = false;
        USER_AGENT = "User-Agent";
        USER_AGENT_VALUE = "osmdroid";
        NUMBER_OF_TILE_DOWNLOAD_THREADS = 2;
        TILE_MAX_CACHE_SIZE_BYTES = 629145600L;
        TILE_TRIM_CACHE_SIZE_BYTES = 524288000L;
        HTTP_HEADER_SDF = new SimpleDateFormat(HTTP_EXPIRES_HEADER_FORMAT, Locale.US);
    }

    public static File getBasePath() {
        return OSMDROID_PATH;
    }

    public static String getUserAgentValue() {
        return USER_AGENT_VALUE;
    }

    public static void setUserAgentValue(String val) {
        USER_AGENT_VALUE = val;
    }

    public static int getNumberOfTileDownloadThreads() {
        return NUMBER_OF_TILE_DOWNLOAD_THREADS;
    }

    public void setNumberOfTileDownloadThreads(int threads) {
        if (threads > 12) {
            NUMBER_OF_TILE_DOWNLOAD_THREADS = 12;
        } else if (threads < 1) {
            NUMBER_OF_TILE_DOWNLOAD_THREADS = 1;
        } else {
            NUMBER_OF_TILE_DOWNLOAD_THREADS = threads;
        }
    }

    public static void setCachePath(String newFullPath) {
        File f = new File(newFullPath);
        if (f.exists()) {
            TILE_PATH_BASE = f.getAbsoluteFile();
            try {
                new File(TILE_PATH_BASE + "/.nomedia").createNewFile();
            } catch (Exception ex) {
                Log.e(IMapView.LOGTAG, "unable to create a nomedia file. downloaded tiles may be visible to the gallery.", ex);
            }
        }
    }

    public static void setCacheSizes(long maxCacheSize, long trimCacheSize) {
        TILE_MAX_CACHE_SIZE_BYTES = maxCacheSize * 1024 * 1024;
        TILE_TRIM_CACHE_SIZE_BYTES = trimCacheSize * 1024 * 1024;
    }

    public static void setOfflineMapsPath(String path) {
        OSMDROID_PATH = new File(path);
    }
}
