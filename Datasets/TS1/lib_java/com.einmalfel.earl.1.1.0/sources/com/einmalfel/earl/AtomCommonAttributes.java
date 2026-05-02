package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.net.URI;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/AtomCommonAttributes.class */
public class AtomCommonAttributes {

    @Nullable
    public final URI base;

    @Nullable
    public final String lang;

    public AtomCommonAttributes(@Nullable URI base, @Nullable String lang) {
        this.base = base;
        this.lang = lang;
    }

    AtomCommonAttributes(@NonNull XmlPullParser parser) {
        String baseString = parser.getAttributeValue(BuildConfig.FLAVOR, "base");
        this.base = baseString == null ? null : Utils.tryParseUri(baseString);
        this.lang = parser.getAttributeValue(BuildConfig.FLAVOR, "lang");
    }

    AtomCommonAttributes(@Nullable AtomCommonAttributes source) {
        if (source == null) {
            this.base = null;
            this.lang = null;
        } else {
            this.base = source.base;
            this.lang = source.lang;
        }
    }
}
