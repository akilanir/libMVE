package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaText.class */
public class MediaText {
    static final String XML_TAG = "text";

    @Nullable
    public final String type;

    @Nullable
    public final String lang;

    @Nullable
    public final Integer start;

    @Nullable
    public final Integer end;

    @NonNull
    public final String value;

    @NonNull
    static MediaText read(XmlPullParser parser) throws XmlPullParserException, IOException {
        parser.require(2, null, XML_TAG);
        String start = parser.getAttributeValue(BuildConfig.FLAVOR, "start");
        String end = parser.getAttributeValue(BuildConfig.FLAVOR, "end");
        return new MediaText(parser.getAttributeValue(BuildConfig.FLAVOR, "type"), parser.getAttributeValue(BuildConfig.FLAVOR, "lang"), start == null ? null : Utils.parseRFC2326NPT(start), end == null ? null : Utils.parseRFC2326NPT(end), parser.nextText());
    }

    public MediaText(@Nullable String type, @Nullable String lang, @Nullable Integer start, @Nullable Integer end, @NonNull String value) {
        this.type = type;
        this.lang = lang;
        this.start = start;
        this.end = end;
        this.value = value;
    }
}
