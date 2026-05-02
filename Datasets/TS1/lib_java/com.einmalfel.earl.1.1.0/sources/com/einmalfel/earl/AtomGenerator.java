package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.net.URI;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/AtomGenerator.class */
public class AtomGenerator extends AtomCommonAttributes {
    static final String XML_TAG = "generator";

    @Nullable
    public final URI uri;

    @Nullable
    public final String version;

    @NonNull
    public final String value;

    @NonNull
    static AtomGenerator read(XmlPullParser parser) throws XmlPullParserException, IOException {
        parser.require(2, null, XML_TAG);
        String uri = parser.getAttributeValue(BuildConfig.FLAVOR, "uri");
        return new AtomGenerator(new AtomCommonAttributes(parser), uri == null ? null : Utils.tryParseUri(uri), parser.getAttributeValue(BuildConfig.FLAVOR, "uri"), parser.nextText());
    }

    public AtomGenerator(@Nullable AtomCommonAttributes atomCommonAttributes, @Nullable URI uri, @Nullable String version, @NonNull String value) {
        super(atomCommonAttributes);
        this.uri = uri;
        this.version = version;
        this.value = value;
    }
}
