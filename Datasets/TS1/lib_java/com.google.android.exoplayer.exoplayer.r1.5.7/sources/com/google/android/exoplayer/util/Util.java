package com.google.android.exoplayer.util;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.text.TextUtils;
import com.google.android.exoplayer.ExoPlayerLibraryInfo;
import com.google.android.exoplayer.text.eia608.ClosedCaptionCtrl;
import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.upstream.DataSpec;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/util/Util.class */
public final class Util {
    public static final int SDK_INT;
    public static final String DEVICE;
    public static final String MANUFACTURER;
    public static final String MODEL;
    public static final int TYPE_DASH = 0;
    public static final int TYPE_SS = 1;
    public static final int TYPE_HLS = 2;
    public static final int TYPE_OTHER = 3;
    private static final Pattern XS_DATE_TIME_PATTERN;
    private static final Pattern XS_DURATION_PATTERN;
    private static final Pattern ESCAPED_CHARACTER_PATTERN;
    private static final long MAX_BYTES_TO_DRAIN = 2048;

    static {
        SDK_INT = (Build.VERSION.SDK_INT == 23 && Build.VERSION.CODENAME.charAt(0) == 'N') ? 24 : Build.VERSION.SDK_INT;
        DEVICE = Build.DEVICE;
        MANUFACTURER = Build.MANUFACTURER;
        MODEL = Build.MODEL;
        XS_DATE_TIME_PATTERN = Pattern.compile("(\\d\\d\\d\\d)\\-(\\d\\d)\\-(\\d\\d)[Tt](\\d\\d):(\\d\\d):(\\d\\d)(\\.(\\d+))?([Zz]|((\\+|\\-)(\\d\\d):(\\d\\d)))?");
        XS_DURATION_PATTERN = Pattern.compile("^(-)?P(([0-9]*)Y)?(([0-9]*)M)?(([0-9]*)D)?(T(([0-9]*)H)?(([0-9]*)M)?(([0-9.]*)S)?)?$");
        ESCAPED_CHARACTER_PATTERN = Pattern.compile("%([A-Fa-f0-9]{2})");
    }

    private Util() {
    }

    @SuppressLint({"InlinedApi"})
    public static boolean isAndroidTv(Context context) {
        return context.getPackageManager().hasSystemFeature("android.software.leanback");
    }

    public static byte[] toByteArray(InputStream inputStream) throws IOException {
        byte[] buffer = new byte[MpegAudioHeader.MAX_FRAME_SIZE_BYTES];
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        while (true) {
            int bytesRead = inputStream.read(buffer);
            if (bytesRead != -1) {
                outputStream.write(buffer, 0, bytesRead);
            } else {
                return outputStream.toByteArray();
            }
        }
    }

    public static boolean isLocalFileUri(Uri uri) {
        String scheme = uri.getScheme();
        return TextUtils.isEmpty(scheme) || scheme.equals("file");
    }

    public static boolean areEqual(Object o1, Object o2) {
        return o1 == null ? o2 == null : o1.equals(o2);
    }

    public static boolean contains(Object[] items, Object item) {
        for (Object obj : items) {
            if (areEqual(obj, item)) {
                return true;
            }
        }
        return false;
    }

    public static ExecutorService newSingleThreadExecutor(final String threadName) {
        return Executors.newSingleThreadExecutor(new ThreadFactory() { // from class: com.google.android.exoplayer.util.Util.1
            @Override // java.util.concurrent.ThreadFactory
            public Thread newThread(Runnable r) {
                return new Thread(r, threadName);
            }
        });
    }

    public static ScheduledExecutorService newSingleThreadScheduledExecutor(final String threadName) {
        return Executors.newSingleThreadScheduledExecutor(new ThreadFactory() { // from class: com.google.android.exoplayer.util.Util.2
            @Override // java.util.concurrent.ThreadFactory
            public Thread newThread(Runnable r) {
                return new Thread(r, threadName);
            }
        });
    }

    public static void closeQuietly(DataSource dataSource) {
        try {
            dataSource.close();
        } catch (IOException e) {
        }
    }

    public static void closeQuietly(OutputStream outputStream) {
        try {
            outputStream.close();
        } catch (IOException e) {
        }
    }

    public static String toLowerInvariant(String text) {
        if (text == null) {
            return null;
        }
        return text.toLowerCase(Locale.US);
    }

    public static int ceilDivide(int numerator, int denominator) {
        return ((numerator + denominator) - 1) / denominator;
    }

    public static long ceilDivide(long numerator, long denominator) {
        return ((numerator + denominator) - 1) / denominator;
    }

    public static int binarySearchFloor(long[] a, long key, boolean inclusive, boolean stayInBounds) {
        int index = Arrays.binarySearch(a, key);
        int index2 = index < 0 ? -(index + 2) : inclusive ? index : index - 1;
        return stayInBounds ? Math.max(0, index2) : index2;
    }

    public static int binarySearchCeil(long[] a, long key, boolean inclusive, boolean stayInBounds) {
        int index = Arrays.binarySearch(a, key);
        int index2 = index < 0 ? index ^ (-1) : inclusive ? index : index + 1;
        return stayInBounds ? Math.min(a.length - 1, index2) : index2;
    }

    public static <T> int binarySearchFloor(List<? extends Comparable<? super T>> list, T key, boolean inclusive, boolean stayInBounds) {
        int index = Collections.binarySearch(list, key);
        int index2 = index < 0 ? -(index + 2) : inclusive ? index : index - 1;
        return stayInBounds ? Math.max(0, index2) : index2;
    }

    public static <T> int binarySearchCeil(List<? extends Comparable<? super T>> list, T key, boolean inclusive, boolean stayInBounds) {
        int index = Collections.binarySearch(list, key);
        int index2 = index < 0 ? index ^ (-1) : inclusive ? index : index + 1;
        return stayInBounds ? Math.min(list.size() - 1, index2) : index2;
    }

    public static int[] firstIntegersArray(int length) {
        int[] firstIntegers = new int[length];
        for (int i = 0; i < length; i++) {
            firstIntegers[i] = i;
        }
        return firstIntegers;
    }

    public static long parseXsDuration(String value) {
        Matcher matcher = XS_DURATION_PATTERN.matcher(value);
        if (matcher.matches()) {
            boolean negated = !TextUtils.isEmpty(matcher.group(1));
            String years = matcher.group(3);
            double durationSeconds = years != null ? Double.parseDouble(years) * 3.1556908E7d : 0.0d;
            String months = matcher.group(5);
            double durationSeconds2 = durationSeconds + (months != null ? Double.parseDouble(months) * 2629739.0d : 0.0d);
            String days = matcher.group(7);
            double durationSeconds3 = durationSeconds2 + (days != null ? Double.parseDouble(days) * 86400.0d : 0.0d);
            String hours = matcher.group(10);
            double durationSeconds4 = durationSeconds3 + (hours != null ? Double.parseDouble(hours) * 3600.0d : 0.0d);
            String minutes = matcher.group(12);
            double durationSeconds5 = durationSeconds4 + (minutes != null ? Double.parseDouble(minutes) * 60.0d : 0.0d);
            String seconds = matcher.group(14);
            long durationMillis = (long) ((durationSeconds5 + (seconds != null ? Double.parseDouble(seconds) : 0.0d)) * 1000.0d);
            return negated ? -durationMillis : durationMillis;
        }
        return (long) (Double.parseDouble(value) * 3600.0d * 1000.0d);
    }

    public static long parseXsDateTime(String value) throws ParseException {
        int timezoneShift;
        Matcher matcher = XS_DATE_TIME_PATTERN.matcher(value);
        if (!matcher.matches()) {
            throw new ParseException("Invalid date/time format: " + value, 0);
        }
        if (matcher.group(9) == null || matcher.group(9).equalsIgnoreCase("Z")) {
            timezoneShift = 0;
        } else {
            timezoneShift = (Integer.parseInt(matcher.group(12)) * 60) + Integer.parseInt(matcher.group(13));
            if (matcher.group(11).equals("-")) {
                timezoneShift *= -1;
            }
        }
        Calendar dateTime = new GregorianCalendar(TimeZone.getTimeZone("GMT"));
        dateTime.clear();
        dateTime.set(Integer.parseInt(matcher.group(1)), Integer.parseInt(matcher.group(2)) - 1, Integer.parseInt(matcher.group(3)), Integer.parseInt(matcher.group(4)), Integer.parseInt(matcher.group(5)), Integer.parseInt(matcher.group(6)));
        if (!TextUtils.isEmpty(matcher.group(8))) {
            BigDecimal bd = new BigDecimal("0." + matcher.group(8));
            dateTime.set(14, bd.movePointRight(3).intValue());
        }
        long time = dateTime.getTimeInMillis();
        if (timezoneShift != 0) {
            time -= timezoneShift * 60000;
        }
        return time;
    }

    public static long scaleLargeTimestamp(long timestamp, long multiplier, long divisor) {
        if (divisor >= multiplier && divisor % multiplier == 0) {
            long divisionFactor = divisor / multiplier;
            return timestamp / divisionFactor;
        }
        if (divisor < multiplier && multiplier % divisor == 0) {
            long multiplicationFactor = multiplier / divisor;
            return timestamp * multiplicationFactor;
        }
        double multiplicationFactor2 = multiplier / divisor;
        return (long) (timestamp * multiplicationFactor2);
    }

    public static long[] scaleLargeTimestamps(List<Long> timestamps, long multiplier, long divisor) {
        long[] scaledTimestamps = new long[timestamps.size()];
        if (divisor >= multiplier && divisor % multiplier == 0) {
            long divisionFactor = divisor / multiplier;
            for (int i = 0; i < scaledTimestamps.length; i++) {
                scaledTimestamps[i] = timestamps.get(i).longValue() / divisionFactor;
            }
        } else if (divisor < multiplier && multiplier % divisor == 0) {
            long multiplicationFactor = multiplier / divisor;
            for (int i2 = 0; i2 < scaledTimestamps.length; i2++) {
                scaledTimestamps[i2] = timestamps.get(i2).longValue() * multiplicationFactor;
            }
        } else {
            double multiplicationFactor2 = multiplier / divisor;
            for (int i3 = 0; i3 < scaledTimestamps.length; i3++) {
                scaledTimestamps[i3] = (long) (timestamps.get(i3).longValue() * multiplicationFactor2);
            }
        }
        return scaledTimestamps;
    }

    public static void scaleLargeTimestampsInPlace(long[] timestamps, long multiplier, long divisor) {
        if (divisor >= multiplier && divisor % multiplier == 0) {
            long divisionFactor = divisor / multiplier;
            for (int i = 0; i < timestamps.length; i++) {
                int i2 = i;
                timestamps[i2] = timestamps[i2] / divisionFactor;
            }
            return;
        }
        if (divisor < multiplier && multiplier % divisor == 0) {
            long multiplicationFactor = multiplier / divisor;
            for (int i3 = 0; i3 < timestamps.length; i3++) {
                int i4 = i3;
                timestamps[i4] = timestamps[i4] * multiplicationFactor;
            }
            return;
        }
        double multiplicationFactor2 = multiplier / divisor;
        for (int i5 = 0; i5 < timestamps.length; i5++) {
            timestamps[i5] = (long) (timestamps[i5] * multiplicationFactor2);
        }
    }

    public static int[] toArray(List<Integer> list) {
        if (list == null) {
            return null;
        }
        int length = list.size();
        int[] intArray = new int[length];
        for (int i = 0; i < length; i++) {
            intArray[i] = list.get(i).intValue();
        }
        return intArray;
    }

    public static void maybeTerminateInputStream(HttpURLConnection connection, long bytesRemaining) {
        if (SDK_INT != 19 && SDK_INT != 20) {
            return;
        }
        try {
            InputStream inputStream = connection.getInputStream();
            if (bytesRemaining == -1) {
                if (inputStream.read() == -1) {
                    return;
                }
            } else if (bytesRemaining <= MAX_BYTES_TO_DRAIN) {
                return;
            }
            String className = inputStream.getClass().getName();
            if (className.equals("com.android.okhttp.internal.http.HttpTransport$ChunkedInputStream") || className.equals("com.android.okhttp.internal.http.HttpTransport$FixedLengthInputStream")) {
                Class<?> superclass = inputStream.getClass().getSuperclass();
                Method unexpectedEndOfInput = superclass.getDeclaredMethod("unexpectedEndOfInput", new Class[0]);
                unexpectedEndOfInput.setAccessible(true);
                unexpectedEndOfInput.invoke(inputStream, new Object[0]);
            }
        } catch (IOException e) {
        } catch (Exception e2) {
        }
    }

    public static DataSpec getRemainderDataSpec(DataSpec dataSpec, int bytesLoaded) {
        if (bytesLoaded == 0) {
            return dataSpec;
        }
        long remainingLength = dataSpec.length == -1 ? -1L : dataSpec.length - bytesLoaded;
        return new DataSpec(dataSpec.uri, dataSpec.position + bytesLoaded, remainingLength, dataSpec.key, dataSpec.flags);
    }

    public static int getIntegerCodeForString(String string) {
        int length = string.length();
        Assertions.checkArgument(length <= 4);
        int result = 0;
        for (int i = 0; i < length; i++) {
            result = (result << 8) | string.charAt(i);
        }
        return result;
    }

    public static int getTopInt(long value) {
        return (int) (value >>> 32);
    }

    public static int getBottomInt(long value) {
        return (int) value;
    }

    public static long getLong(int topInteger, int bottomInteger) {
        return (topInteger << 32) | (bottomInteger & 4294967295L);
    }

    public static String getHexStringFromBytes(byte[] data, int beginIndex, int endIndex) {
        StringBuilder dataStringBuilder = new StringBuilder(endIndex - beginIndex);
        for (int i = beginIndex; i < endIndex; i++) {
            dataStringBuilder.append(String.format(Locale.US, "%02X", Byte.valueOf(data[i])));
        }
        return dataStringBuilder.toString();
    }

    public static byte[] getBytesFromHexString(String hexString) {
        byte[] data = new byte[hexString.length() / 2];
        for (int i = 0; i < data.length; i++) {
            int stringOffset = i * 2;
            data[i] = (byte) ((Character.digit(hexString.charAt(stringOffset), 16) << 4) + Character.digit(hexString.charAt(stringOffset + 1), 16));
        }
        return data;
    }

    public static <T> String getCommaDelimitedSimpleClassNames(T[] objects) {
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < objects.length; i++) {
            stringBuilder.append(objects[i].getClass().getSimpleName());
            if (i < objects.length - 1) {
                stringBuilder.append(", ");
            }
        }
        return stringBuilder.toString();
    }

    public static String getUserAgent(Context context, String applicationName) {
        String versionName;
        try {
            String packageName = context.getPackageName();
            PackageInfo info = context.getPackageManager().getPackageInfo(packageName, 0);
            versionName = info.versionName;
        } catch (PackageManager.NameNotFoundException e) {
            versionName = "?";
        }
        return applicationName + "/" + versionName + " (Linux;Android " + Build.VERSION.RELEASE + ") ExoPlayerLib/" + ExoPlayerLibraryInfo.VERSION;
    }

    public static byte[] executePost(String url, byte[] data, Map<String, String> requestProperties) throws IOException {
        HttpURLConnection urlConnection = null;
        try {
            urlConnection = (HttpURLConnection) new URL(url).openConnection();
            urlConnection.setRequestMethod("POST");
            urlConnection.setDoOutput(data != null);
            urlConnection.setDoInput(true);
            if (requestProperties != null) {
                for (Map.Entry<String, String> requestProperty : requestProperties.entrySet()) {
                    urlConnection.setRequestProperty(requestProperty.getKey(), requestProperty.getValue());
                }
            }
            if (data != null) {
                OutputStream out = urlConnection.getOutputStream();
                try {
                    out.write(data);
                    out.close();
                } catch (Throwable th) {
                    out.close();
                    throw th;
                }
            }
            InputStream inputStream = urlConnection.getInputStream();
            try {
                byte[] byteArray = toByteArray(inputStream);
                inputStream.close();
                if (urlConnection != null) {
                    urlConnection.disconnect();
                }
                return byteArray;
            } catch (Throwable th2) {
                inputStream.close();
                throw th2;
            }
        } catch (Throwable th3) {
            if (urlConnection != null) {
                urlConnection.disconnect();
            }
            throw th3;
        }
    }

    public static int inferContentType(String fileName) {
        if (fileName == null) {
            return 3;
        }
        if (fileName.endsWith(".mpd")) {
            return 0;
        }
        if (fileName.endsWith(".ism")) {
            return 1;
        }
        if (fileName.endsWith(".m3u8")) {
            return 2;
        }
        return 3;
    }

    public static String escapeFileName(String fileName) {
        int length = fileName.length();
        int charactersToEscapeCount = 0;
        for (int i = 0; i < length; i++) {
            if (shouldEscapeCharacter(fileName.charAt(i))) {
                charactersToEscapeCount++;
            }
        }
        if (charactersToEscapeCount == 0) {
            return fileName;
        }
        int i2 = 0;
        StringBuilder builder = new StringBuilder(length + (charactersToEscapeCount * 2));
        while (charactersToEscapeCount > 0) {
            int i3 = i2;
            i2++;
            char c = fileName.charAt(i3);
            if (shouldEscapeCharacter(c)) {
                builder.append('%').append(Integer.toHexString(c));
                charactersToEscapeCount--;
            } else {
                builder.append(c);
            }
        }
        if (i2 < length) {
            builder.append((CharSequence) fileName, i2, length);
        }
        return builder.toString();
    }

    private static boolean shouldEscapeCharacter(char c) {
        switch (c) {
            case '\"':
            case ClosedCaptionCtrl.ROLL_UP_CAPTIONS_2_ROWS /* 37 */:
            case '*':
            case ClosedCaptionCtrl.END_OF_CAPTION /* 47 */:
            case ':':
            case '<':
            case '>':
            case '?':
            case '\\':
            case '|':
                return true;
            default:
                return false;
        }
    }

    public static String unescapeFileName(String fileName) {
        int length = fileName.length();
        int percentCharacterCount = 0;
        for (int i = 0; i < length; i++) {
            if (fileName.charAt(i) == '%') {
                percentCharacterCount++;
            }
        }
        if (percentCharacterCount == 0) {
            return fileName;
        }
        int expectedLength = length - (percentCharacterCount * 2);
        StringBuilder builder = new StringBuilder(expectedLength);
        Matcher matcher = ESCAPED_CHARACTER_PATTERN.matcher(fileName);
        int endOfLastMatch = 0;
        while (percentCharacterCount > 0 && matcher.find()) {
            char unescapedCharacter = (char) Integer.parseInt(matcher.group(1), 16);
            builder.append((CharSequence) fileName, endOfLastMatch, matcher.start()).append(unescapedCharacter);
            endOfLastMatch = matcher.end();
            percentCharacterCount--;
        }
        if (endOfLastMatch < length) {
            builder.append((CharSequence) fileName, endOfLastMatch, length);
        }
        if (builder.length() != expectedLength) {
            return null;
        }
        return builder.toString();
    }
}
