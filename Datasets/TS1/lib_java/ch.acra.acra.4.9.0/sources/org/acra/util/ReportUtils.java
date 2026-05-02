package org.acra.util;

import android.content.Context;
import android.os.Build;
import android.os.Environment;
import android.os.StatFs;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.telephony.TelephonyManager;
import java.io.File;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.Locale;
import org.acra.ACRA;
import org.acra.ACRAConstants;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/util/ReportUtils.class */
public final class ReportUtils {
    private ReportUtils() {
    }

    public static long getAvailableInternalMemorySize() {
        long blockSize;
        long availableBlocks;
        File path = Environment.getDataDirectory();
        StatFs stat = new StatFs(path.getPath());
        if (Build.VERSION.SDK_INT >= 18) {
            blockSize = stat.getBlockSizeLong();
            availableBlocks = stat.getAvailableBlocksLong();
        } else {
            blockSize = stat.getBlockSize();
            availableBlocks = stat.getAvailableBlocks();
        }
        return availableBlocks * blockSize;
    }

    public static long getTotalInternalMemorySize() {
        long blockSize;
        long totalBlocks;
        File path = Environment.getDataDirectory();
        StatFs stat = new StatFs(path.getPath());
        if (Build.VERSION.SDK_INT >= 18) {
            blockSize = stat.getBlockSizeLong();
            totalBlocks = stat.getBlockCountLong();
        } else {
            blockSize = stat.getBlockSize();
            totalBlocks = stat.getBlockCount();
        }
        return totalBlocks * blockSize;
    }

    @Nullable
    public static String getDeviceId(@NonNull Context context) {
        try {
            TelephonyManager tm = (TelephonyManager) context.getSystemService("phone");
            return tm.getDeviceId();
        } catch (RuntimeException e) {
            ACRA.log.w(ACRA.LOG_TAG, "Couldn't retrieve DeviceId for : " + context.getPackageName(), e);
            return null;
        }
    }

    @NonNull
    public static String getApplicationFilePath(@NonNull Context context) {
        File filesDir = context.getFilesDir();
        if (filesDir != null) {
            return filesDir.getAbsolutePath();
        }
        ACRA.log.w(ACRA.LOG_TAG, "Couldn't retrieve ApplicationFilePath for : " + context.getPackageName());
        return "Couldn't retrieve ApplicationFilePath";
    }

    @NonNull
    public static String getLocalIpAddress() {
        StringBuilder result = new StringBuilder();
        boolean first = true;
        try {
            Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces();
            while (en.hasMoreElements()) {
                NetworkInterface intf = en.nextElement();
                Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses();
                while (enumIpAddr.hasMoreElements()) {
                    InetAddress inetAddress = enumIpAddr.nextElement();
                    if (!inetAddress.isLoopbackAddress()) {
                        if (!first) {
                            result.append('\n');
                        }
                        result.append(inetAddress.getHostAddress());
                        first = false;
                    }
                }
            }
        } catch (SocketException ex) {
            ACRA.log.w(ACRA.LOG_TAG, ex.toString());
        }
        return result.toString();
    }

    @NonNull
    public static String getTimeString(@NonNull Calendar time) {
        SimpleDateFormat format = new SimpleDateFormat(ACRAConstants.DATE_TIME_FORMAT_STRING, Locale.ENGLISH);
        return format.format(Long.valueOf(time.getTimeInMillis()));
    }
}
