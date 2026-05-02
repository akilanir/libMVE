package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.net.URL;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaThumbnail.class */
public class MediaThumbnail {
    static final String XML_TAG = "thumbnail";
    private static final String TAG = "Earl.MediaThumbnail";

    @NonNull
    public final URL url;

    @Nullable
    public final Integer width;

    @Nullable
    public final Integer height;

    @Nullable
    public final Integer time;

    @NonNull
    static MediaThumbnail read(XmlPullParser parser) throws XmlPullParserException, IOException {
        parser.require(2, null, XML_TAG);
        String width = parser.getAttributeValue(BuildConfig.FLAVOR, "width");
        String height = parser.getAttributeValue(BuildConfig.FLAVOR, "height");
        String time = parser.getAttributeValue(BuildConfig.FLAVOR, "time");
        MediaThumbnail result = new MediaThumbnail(Utils.nonNullUrl(parser.getAttributeValue(BuildConfig.FLAVOR, "url")), width == null ? null : Utils.tryParseInt(width), height == null ? null : Utils.tryParseInt(height), time == null ? null : Utils.parseRFC2326NPT(time));
        parser.nextTag();
        return result;
    }

    public MediaThumbnail(@NonNull URL url, @Nullable Integer width, @Nullable Integer height, @Nullable Integer time) {
        this.url = url;
        this.width = width;
        this.height = height;
        this.time = time;
    }
}
