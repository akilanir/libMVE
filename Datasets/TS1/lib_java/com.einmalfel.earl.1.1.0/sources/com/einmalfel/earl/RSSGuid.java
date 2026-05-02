package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/RSSGuid.class */
public class RSSGuid {
    static final String XML_TAG = "guid";

    @NonNull
    public final String value;

    @Nullable
    public final Boolean isPermalink;

    @NonNull
    static RSSGuid read(@NonNull XmlPullParser parser) throws IOException, XmlPullParserException {
        parser.require(2, BuildConfig.FLAVOR, XML_TAG);
        String permalink = parser.getAttributeValue(BuildConfig.FLAVOR, "isPermalink");
        return new RSSGuid(Utils.nonNullString(parser.nextText()), permalink == null ? null : Boolean.valueOf(permalink));
    }

    public RSSGuid(@NonNull String value, @Nullable Boolean isPermalink) {
        this.value = value;
        this.isPermalink = isPermalink;
    }
}
