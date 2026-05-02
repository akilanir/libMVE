package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.net.URI;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaCredit.class */
public class MediaCredit {
    static final String XML_TAG = "credit";

    @Nullable
    public final String role;

    @Nullable
    public final URI scheme;

    @NonNull
    public final String value;

    @NonNull
    static MediaCredit read(XmlPullParser parser) throws XmlPullParserException, IOException {
        parser.require(2, null, XML_TAG);
        String scheme = parser.getAttributeValue(BuildConfig.FLAVOR, "scheme");
        return new MediaCredit(parser.getAttributeValue(BuildConfig.FLAVOR, "scheme"), scheme == null ? null : Utils.tryParseUri(scheme), parser.nextText());
    }

    public MediaCredit(@Nullable String role, @Nullable URI scheme, @NonNull String value) {
        this.role = role;
        this.scheme = scheme;
        this.value = value;
    }
}
