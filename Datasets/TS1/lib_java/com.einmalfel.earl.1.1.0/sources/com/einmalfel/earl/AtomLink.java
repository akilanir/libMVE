package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.net.URI;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/AtomLink.class */
public class AtomLink extends AtomCommonAttributes implements Enclosure {
    private static final String TAG = "Earl.AtomLink";
    static final String XML_TAG = "link";

    @NonNull
    public final URI href;

    @Nullable
    public final String rel;

    @Nullable
    public final String type;

    @Nullable
    public final String hreflang;

    @Nullable
    public final String title;

    @Nullable
    public final Integer length;

    @NonNull
    static AtomLink read(XmlPullParser parser) throws XmlPullParserException, IOException {
        parser.require(2, null, XML_TAG);
        String length = parser.getAttributeValue(BuildConfig.FLAVOR, "length");
        AtomLink result = new AtomLink(new AtomCommonAttributes(parser), Utils.nonNullUri(parser.getAttributeValue(BuildConfig.FLAVOR, "href")), parser.getAttributeValue(BuildConfig.FLAVOR, "rel"), parser.getAttributeValue(BuildConfig.FLAVOR, "type"), parser.getAttributeValue(BuildConfig.FLAVOR, "hreflang"), parser.getAttributeValue(BuildConfig.FLAVOR, "title"), length == null ? null : Utils.tryParseInt(length));
        parser.nextTag();
        return result;
    }

    public AtomLink(@Nullable AtomCommonAttributes atomCommonAttributes, @NonNull URI href, @Nullable String rel, @Nullable String type, @Nullable String hreflang, @Nullable String title, @Nullable Integer length) {
        super(atomCommonAttributes);
        this.href = href;
        this.rel = rel;
        this.type = type;
        this.hreflang = hreflang;
        this.title = title;
        this.length = length;
    }

    @Override // com.einmalfel.earl.Enclosure
    @NonNull
    public String getLink() {
        return this.href.toString();
    }

    @Override // com.einmalfel.earl.Enclosure
    @Nullable
    public Integer getLength() {
        return this.length;
    }

    @Override // com.einmalfel.earl.Enclosure
    @Nullable
    public String getType() {
        return this.type;
    }
}
