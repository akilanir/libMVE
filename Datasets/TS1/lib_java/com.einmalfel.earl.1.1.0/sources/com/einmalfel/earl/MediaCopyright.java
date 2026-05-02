package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.net.URL;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaCopyright.class */
public class MediaCopyright {
    static final String XML_TAG = "copyright";

    @Nullable
    public final URL url;

    @NonNull
    public final String value;

    @NonNull
    static MediaCopyright read(XmlPullParser parser) throws XmlPullParserException, IOException {
        parser.require(2, null, XML_TAG);
        String url = parser.getAttributeValue(BuildConfig.FLAVOR, "url");
        return new MediaCopyright(url == null ? null : Utils.tryParseUrl(url), parser.nextText());
    }

    public MediaCopyright(@Nullable URL url, @NonNull String value) {
        this.url = url;
        this.value = value;
    }
}
