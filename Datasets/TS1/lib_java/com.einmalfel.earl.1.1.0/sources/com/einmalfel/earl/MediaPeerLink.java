package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.net.URL;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaPeerLink.class */
public class MediaPeerLink {
    static final String XML_TAG = "peerLink";

    @Nullable
    public final String type;

    @NonNull
    public final URL href;

    @NonNull
    static MediaPeerLink read(XmlPullParser parser) throws XmlPullParserException, IOException {
        parser.require(2, null, XML_TAG);
        MediaPeerLink result = new MediaPeerLink(parser.getAttributeValue(BuildConfig.FLAVOR, "type"), Utils.nonNullUrl(parser.getAttributeValue(BuildConfig.FLAVOR, "href")));
        parser.nextTag();
        return result;
    }

    public MediaPeerLink(@Nullable String type, @NonNull URL href) {
        this.type = type;
        this.href = href;
    }
}
