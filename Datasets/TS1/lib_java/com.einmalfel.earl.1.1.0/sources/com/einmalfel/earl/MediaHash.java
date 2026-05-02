package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaHash.class */
public class MediaHash {
    static final String XML_TAG = "hash";

    @Nullable
    public final String algo;

    @NonNull
    public final String value;

    @NonNull
    static MediaHash read(XmlPullParser parser) throws XmlPullParserException, IOException {
        parser.require(2, null, XML_TAG);
        return new MediaHash(parser.getAttributeValue(BuildConfig.FLAVOR, "algo"), parser.nextText());
    }

    public MediaHash(@Nullable String algo, @NonNull String value) {
        this.algo = algo;
        this.value = value;
    }
}
