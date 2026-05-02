package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.net.URL;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaLicense.class */
public class MediaLicense {
    static final String XML_TAG = "license";

    @Nullable
    public final String type;

    @Nullable
    public final URL href;

    @NonNull
    public final String value;

    @NonNull
    static MediaLicense read(XmlPullParser parser) throws XmlPullParserException, IOException {
        String href = parser.getAttributeValue(BuildConfig.FLAVOR, "href");
        return new MediaLicense(parser.getAttributeValue(BuildConfig.FLAVOR, "type"), href == null ? null : Utils.tryParseUrl(href), parser.nextText());
    }

    public MediaLicense(@Nullable String type, @Nullable URL href, @NonNull String value) {
        this.type = type;
        this.href = href;
        this.value = value;
    }
}
