package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaLocation.class */
public class MediaLocation {
    static final String XML_TAG = "location";

    @Nullable
    public final String description;

    @Nullable
    public final Integer start;

    @Nullable
    public final Integer end;

    @NonNull
    static MediaLocation read(XmlPullParser parser) throws XmlPullParserException, IOException {
        parser.require(2, null, XML_TAG);
        String start = parser.getAttributeValue(BuildConfig.FLAVOR, "start");
        String end = parser.getAttributeValue(BuildConfig.FLAVOR, "end");
        MediaLocation result = new MediaLocation(parser.getAttributeValue(BuildConfig.FLAVOR, "description"), start == null ? null : Utils.parseMediaRssTime(start), end == null ? null : Utils.parseMediaRssTime(end));
        Utils.skipTag(parser);
        return result;
    }

    public MediaLocation(@Nullable String description, @Nullable Integer start, @Nullable Integer end) {
        this.description = description;
        this.start = start;
        this.end = end;
    }
}
