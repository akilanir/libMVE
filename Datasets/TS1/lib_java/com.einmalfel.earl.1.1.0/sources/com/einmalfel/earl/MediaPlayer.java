package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.net.URL;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaPlayer.class */
public class MediaPlayer {
    static final String XML_TAG = "player";

    @NonNull
    public final URL url;

    @Nullable
    public final Integer height;

    @Nullable
    public final Integer width;

    @NonNull
    static MediaPlayer read(XmlPullParser parser) throws XmlPullParserException, IOException {
        parser.require(2, null, XML_TAG);
        String width = parser.getAttributeValue(BuildConfig.FLAVOR, "width");
        String height = parser.getAttributeValue(BuildConfig.FLAVOR, "height");
        MediaPlayer result = new MediaPlayer(Utils.nonNullUrl(parser.getAttributeValue(BuildConfig.FLAVOR, "url")), width == null ? null : Utils.tryParseInt(width), height == null ? null : Utils.tryParseInt(height));
        parser.nextTag();
        return result;
    }

    public MediaPlayer(@NonNull URL url, @Nullable Integer height, @Nullable Integer width) {
        this.url = url;
        this.height = height;
        this.width = width;
    }
}
