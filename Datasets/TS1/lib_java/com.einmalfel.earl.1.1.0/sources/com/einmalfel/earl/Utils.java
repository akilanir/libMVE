package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import com.einmalfel.earl.tools.NPTParser;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/Utils.class */
class Utils {
    static final String ATOM_NAMESPACE = "http://www.w3.org/2005/Atom";
    static final String MEDIA_NAMESPACE = "http://search.yahoo.com/mrss/";
    static final String ITUNES_NAMESPACE = "http://www.itunes.com/dtds/podcast-1.0.dtd";
    private static final String TAG = "Earl.Utils";
    private static DateFormat RFC3339;
    private static DateFormat RFC3339Ms;
    private static DateFormat RFC3339Tz;
    private static DateFormat RFC3339TzMs;
    private static final DateFormat rfc822DateTimeFormat = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z", Locale.US);
    private static DateFormat[] itunesDurationFormats = null;

    Utils() {
    }

    @Nullable
    static Date parseRFC822Date(@NonNull String dateString) {
        try {
            return rfc822DateTimeFormat.parse(dateString);
        } catch (ParseException e) {
            Log.w(TAG, "Malformed date " + dateString);
            return null;
        }
    }

    static void setupRFC3339() {
        RFC3339 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", Locale.US);
        RFC3339Ms = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'", Locale.US);
        RFC3339Ms.setLenient(true);
        RFC3339Tz = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ", Locale.US);
        RFC3339TzMs = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ", Locale.US);
        RFC3339TzMs.setLenient(true);
    }

    @Nullable
    public static Date parseRFC3339Date(@NonNull String string) {
        Date date;
        Date date2;
        if (RFC3339 == null) {
            setupRFC3339();
        }
        try {
            if (string.endsWith("Z")) {
                try {
                    date = RFC3339.parse(string);
                } catch (ParseException e) {
                    date = RFC3339Ms.parse(string);
                }
                return date;
            }
            String firstPart = string.substring(0, string.lastIndexOf(45));
            String secondPart = string.substring(string.lastIndexOf(45));
            string = firstPart + (secondPart.substring(0, secondPart.indexOf(58)) + secondPart.substring(secondPart.indexOf(58) + 1));
            try {
                date2 = RFC3339Tz.parse(string);
            } catch (ParseException e2) {
                date2 = RFC3339TzMs.parse(string);
            }
            return date2;
        } catch (ParseException exception) {
            Log.w(TAG, "Failed to parse RFC3339 string " + string, exception);
            return null;
        }
        Log.w(TAG, "Failed to parse RFC3339 string " + string, exception);
        return null;
    }

    @Nullable
    static Integer parseRFC2326NPT(@NonNull String string) {
        try {
            return Integer.valueOf((int) new NPTParser(string).parse());
        } catch (ParseException exception) {
            Log.w(TAG, "Failed to parse media:rating time", exception);
            return null;
        }
    }

    static void setupItunesDateFormats() {
        itunesDurationFormats = new DateFormat[]{new SimpleDateFormat("HH:mm:ss", Locale.US), new SimpleDateFormat("H:mm:ss", Locale.US), new SimpleDateFormat("mm:ss", Locale.US), new SimpleDateFormat("m:ss", Locale.US)};
        TimeZone utc = TimeZone.getTimeZone("UTC");
        for (DateFormat format : itunesDurationFormats) {
            format.setTimeZone(utc);
        }
    }

    @Nullable
    static Integer parseItunesDuration(@NonNull String dateString) {
        if (itunesDurationFormats == null) {
            setupItunesDateFormats();
        }
        for (DateFormat format : itunesDurationFormats) {
            try {
                Date date = format.parse(dateString);
                return Integer.valueOf((int) (date.getTime() / 1000));
            } catch (ParseException e) {
            }
        }
        return tryParseInt(dateString);
    }

    @Nullable
    static Integer parseMediaRssTime(@NonNull String time) {
        Integer result;
        Integer result2 = parseItunesDuration(time);
        if (result2 == null) {
            result = parseRFC2326NPT(time);
        } else {
            result = Integer.valueOf(result2.intValue() * 1000);
        }
        return result;
    }

    static void finishTag(@NonNull XmlPullParser parser) throws XmlPullParserException, IOException {
        while (parser.getEventType() != 3) {
            if (parser.getEventType() == 2) {
                skipTag(parser);
            }
            parser.next();
        }
    }

    static void skipTag(@NonNull XmlPullParser parser) throws XmlPullParserException, IOException {
        if (parser.getEventType() != 2) {
            throw new IllegalStateException();
        }
        int depth = 1;
        while (depth != 0) {
            switch (parser.next()) {
                case 2:
                    depth++;
                    break;
                case 3:
                    depth--;
                    break;
            }
        }
    }

    @Nullable
    static Integer tryParseInt(@Nullable String string) {
        if (string == null) {
            Log.w(TAG, "Null value while parsing integer", new NullPointerException());
            return null;
        }
        try {
            return Integer.valueOf(string);
        } catch (NumberFormatException exception) {
            Log.w(TAG, "Error parsing integer value '" + string + "'", exception);
            return null;
        }
    }

    @NonNull
    static Integer nonNullInt(@Nullable String string) {
        Integer result = tryParseInt(string);
        if (result == null) {
            Log.w(TAG, "Malformed integer string replaced with '-1'");
            return -1;
        }
        return result;
    }

    @NonNull
    static String nonNullString(@Nullable String string) {
        if (string == null) {
            Log.w(TAG, "Unexpectedly got null string. Replaced with empty", new NullPointerException());
            return BuildConfig.FLAVOR;
        }
        return string;
    }

    @Nullable
    static URL tryParseUrl(@Nullable String string) {
        if (string == null) {
            Log.w(TAG, "Null value while parsing url", new NullPointerException());
            return null;
        }
        try {
            return new URL(string);
        } catch (MalformedURLException exception) {
            Log.w(TAG, "Error parsing url value '" + string + "'", exception);
            return null;
        }
    }

    @NonNull
    static URL nonNullUrl(@Nullable String string) {
        URL result = tryParseUrl(string);
        if (result == null) {
            Log.w(TAG, "Malformed URL replaced with 'http://'");
            try {
                result = new URL("http://");
            } catch (MalformedURLException e) {
                throw new AssertionError("Should never get here");
            }
        }
        return result;
    }

    @Nullable
    static URI tryParseUri(@Nullable String string) {
        if (string == null) {
            Log.w(TAG, "Null value while parsing uri", new NullPointerException());
            return null;
        }
        try {
            return new URI(string);
        } catch (URISyntaxException exception) {
            Log.w(TAG, "Error parsing uri value '" + string + "'", exception);
            return null;
        }
    }

    @NonNull
    static URI nonNullUri(@Nullable String string) {
        URI result = tryParseUri(string);
        if (result == null) {
            Log.w(TAG, "Malformed URI replaced with 'http://'");
            try {
                result = new URI("http:///");
            } catch (URISyntaxException e) {
                throw new AssertionError("Should never get here");
            }
        }
        return result;
    }
}
