package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/RSSCategory.class */
public class RSSCategory {
    static final String XML_TAG = "category";

    @NonNull
    public final String value;

    @Nullable
    public final String domain;

    @NonNull
    static RSSCategory read(@NonNull XmlPullParser parser) throws IOException, XmlPullParserException {
        parser.require(2, BuildConfig.FLAVOR, XML_TAG);
        return new RSSCategory(Utils.nonNullString(parser.nextText()), parser.getAttributeValue(BuildConfig.FLAVOR, "domain"));
    }

    public RSSCategory(@NonNull String value, @Nullable String domain) {
        this.value = value;
        this.domain = domain;
    }
}
