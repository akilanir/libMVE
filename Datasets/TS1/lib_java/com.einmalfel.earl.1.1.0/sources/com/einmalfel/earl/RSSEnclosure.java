package com.einmalfel.earl;

import android.support.annotation.NonNull;
import java.io.IOException;
import java.net.URL;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/RSSEnclosure.class */
public class RSSEnclosure implements Enclosure {
    static final String XML_TAG = "enclosure";

    @NonNull
    public final URL url;

    @NonNull
    public final Integer length;

    @NonNull
    public final String type;

    @NonNull
    static RSSEnclosure read(@NonNull XmlPullParser parser) throws IOException, XmlPullParserException {
        parser.require(2, BuildConfig.FLAVOR, XML_TAG);
        RSSEnclosure result = new RSSEnclosure(Utils.nonNullUrl(parser.getAttributeValue(BuildConfig.FLAVOR, "url")), Utils.nonNullInt(parser.getAttributeValue(BuildConfig.FLAVOR, "length")), Utils.nonNullString(parser.getAttributeValue(BuildConfig.FLAVOR, "type")));
        parser.nextText();
        return result;
    }

    public RSSEnclosure(@NonNull URL url, @NonNull Integer length, @NonNull String type) {
        this.url = url;
        this.length = length;
        this.type = type;
    }

    @Override // com.einmalfel.earl.Enclosure
    @NonNull
    public String getLink() {
        return this.url.toString();
    }

    @Override // com.einmalfel.earl.Enclosure
    @NonNull
    public Integer getLength() {
        return this.length;
    }

    @Override // com.einmalfel.earl.Enclosure
    @NonNull
    public String getType() {
        return this.type;
    }
}
