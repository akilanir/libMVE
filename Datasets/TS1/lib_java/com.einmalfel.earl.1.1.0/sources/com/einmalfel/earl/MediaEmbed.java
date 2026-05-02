package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.net.URL;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaEmbed.class */
public class MediaEmbed {
    static final String XML_TAG = "embed";

    @Nullable
    public final URL url;

    @Nullable
    public final Integer width;

    @Nullable
    public final Integer height;

    @NonNull
    public final Map<String, String> values;

    @NonNull
    static MediaEmbed read(XmlPullParser parser) throws XmlPullParserException, IOException {
        parser.require(2, null, XML_TAG);
        String url = parser.getAttributeValue(BuildConfig.FLAVOR, "url");
        String width = parser.getAttributeValue(BuildConfig.FLAVOR, "width");
        String height = parser.getAttributeValue(BuildConfig.FLAVOR, "height");
        Map<String, String> values = new HashMap<>();
        while (parser.nextTag() == 2) {
            parser.require(2, null, "param");
            values.put(Utils.nonNullString(parser.getAttributeValue(BuildConfig.FLAVOR, "name")), parser.nextText());
        }
        return new MediaEmbed(url == null ? null : Utils.tryParseUrl(url), width == null ? null : Utils.tryParseInt(width), height == null ? null : Utils.tryParseInt(height), values);
    }

    public MediaEmbed(@Nullable URL url, @Nullable Integer width, @Nullable Integer height, @NonNull Map<String, String> values) {
        this.url = url;
        this.width = width;
        this.height = height;
        this.values = Collections.unmodifiableMap(values);
    }
}
