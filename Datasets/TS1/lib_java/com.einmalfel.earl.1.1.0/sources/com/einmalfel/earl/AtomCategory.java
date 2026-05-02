package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.net.URI;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/AtomCategory.class */
public class AtomCategory extends AtomCommonAttributes {
    static final String XML_TAG = "category";

    @NonNull
    public final String term;

    @Nullable
    public final URI scheme;

    @Nullable
    public final String label;

    @NonNull
    static AtomCategory read(XmlPullParser parser) throws XmlPullParserException, IOException {
        parser.require(2, null, XML_TAG);
        String schemeString = parser.getAttributeValue(BuildConfig.FLAVOR, "scheme");
        AtomCategory result = new AtomCategory(new AtomCommonAttributes(parser), Utils.nonNullString(parser.getAttributeValue(BuildConfig.FLAVOR, "term")), schemeString == null ? null : Utils.tryParseUri(schemeString), parser.getAttributeValue(BuildConfig.FLAVOR, "label"));
        parser.nextTag();
        return result;
    }

    public AtomCategory(@Nullable AtomCommonAttributes atomCommonAttributes, @NonNull String term, @Nullable URI scheme, @Nullable String label) {
        super(atomCommonAttributes);
        this.term = term;
        this.scheme = scheme;
        this.label = label;
    }
}
