package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaRestriction.class */
public class MediaRestriction {
    static final String XML_TAG = "restriction";

    @Nullable
    public final String relationship;

    @Nullable
    public final String type;

    @NonNull
    public final String value;

    @NonNull
    static MediaRestriction read(XmlPullParser parser) throws XmlPullParserException, IOException {
        return new MediaRestriction(parser.getAttributeValue(BuildConfig.FLAVOR, "relationship"), parser.getAttributeValue(BuildConfig.FLAVOR, "type"), parser.nextText());
    }

    public MediaRestriction(@Nullable String relationship, @Nullable String type, @NonNull String value) {
        this.relationship = relationship;
        this.type = type;
        this.value = value;
    }
}
