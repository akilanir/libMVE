package com.einmalfel.earl;

import android.support.annotation.NonNull;
import java.io.IOException;
import java.net.URL;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/RSSSource.class */
public class RSSSource {
    static final String XML_TAG = "source";

    @NonNull
    public final String value;

    @NonNull
    public final URL url;

    @NonNull
    static RSSSource read(@NonNull XmlPullParser parser) throws IOException, XmlPullParserException {
        parser.require(2, BuildConfig.FLAVOR, XML_TAG);
        URL url = Utils.nonNullUrl(parser.getAttributeValue(BuildConfig.FLAVOR, "url"));
        return new RSSSource(Utils.nonNullString(parser.nextText()), url);
    }

    public RSSSource(@NonNull String value, @NonNull URL url) {
        this.value = value;
        this.url = url;
    }
}
