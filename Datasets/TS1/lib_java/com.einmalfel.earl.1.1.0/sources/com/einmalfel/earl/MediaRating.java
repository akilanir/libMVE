package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.net.URI;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaRating.class */
public class MediaRating {
    static final String XML_TAG = "rating";

    @Nullable
    public final URI scheme;

    @NonNull
    public final String value;

    @NonNull
    static MediaRating read(XmlPullParser parser) throws XmlPullParserException, IOException {
        parser.require(2, null, XML_TAG);
        String uri = parser.getAttributeValue(BuildConfig.FLAVOR, "uri");
        return new MediaRating(uri == null ? null : Utils.tryParseUri(uri), parser.nextText());
    }

    public MediaRating(@Nullable URI scheme, @NonNull String value) {
        this.scheme = scheme;
        this.value = value;
    }
}
