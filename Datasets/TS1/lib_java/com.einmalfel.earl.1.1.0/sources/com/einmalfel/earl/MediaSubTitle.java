package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.net.URL;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaSubTitle.class */
public class MediaSubTitle {
    static final String XML_TAG = "subTitle";

    @Nullable
    public final String type;

    @Nullable
    public final String lang;

    @NonNull
    public final URL href;

    @NonNull
    static MediaSubTitle read(XmlPullParser parser) throws XmlPullParserException, IOException {
        MediaSubTitle result = new MediaSubTitle(parser.getAttributeValue(BuildConfig.FLAVOR, "type"), parser.getAttributeValue(BuildConfig.FLAVOR, "lang"), Utils.nonNullUrl(parser.getAttributeValue(BuildConfig.FLAVOR, "href")));
        parser.nextTag();
        return result;
    }

    public MediaSubTitle(@Nullable String type, @Nullable String lang, @NonNull URL href) {
        this.type = type;
        this.lang = lang;
        this.href = href;
    }
}
