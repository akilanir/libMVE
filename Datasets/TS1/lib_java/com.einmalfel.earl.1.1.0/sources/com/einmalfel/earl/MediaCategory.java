package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.net.URI;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaCategory.class */
public class MediaCategory {
    static final String XML_TAG = "category";

    @Nullable
    public final URI scheme;

    @Nullable
    public final String label;

    @NonNull
    public final String value;

    @NonNull
    static MediaCategory read(XmlPullParser parser) throws XmlPullParserException, IOException {
        parser.require(2, null, XML_TAG);
        String scheme = parser.getAttributeValue(BuildConfig.FLAVOR, "scheme");
        return new MediaCategory(scheme == null ? null : Utils.tryParseUri(scheme), parser.getAttributeValue(BuildConfig.FLAVOR, "label"), parser.nextText());
    }

    public MediaCategory(@Nullable URI scheme, @Nullable String label, @NonNull String value) {
        this.scheme = scheme;
        this.label = label;
        this.value = value;
    }
}
