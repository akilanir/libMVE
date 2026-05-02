package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaTitle.class */
public class MediaTitle {

    @Nullable
    public final String type;

    @NonNull
    public final String value;

    @NonNull
    static MediaTitle read(XmlPullParser parser) throws XmlPullParserException, IOException {
        return new MediaTitle(parser.getAttributeValue(BuildConfig.FLAVOR, "type"), parser.nextText());
    }

    public MediaTitle(@Nullable String type, @NonNull String value) {
        this.type = type;
        this.value = value;
    }
}
