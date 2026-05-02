package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.net.URI;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/AtomContent.class */
public class AtomContent extends AtomText {
    static final String XML_TAG = "content";

    @Nullable
    public final URI src;

    @NonNull
    static AtomContent read(XmlPullParser parser) throws XmlPullParserException, IOException {
        parser.require(2, null, XML_TAG);
        String srcString = parser.getAttributeValue(BuildConfig.FLAVOR, "src");
        return new AtomContent(srcString == null ? null : Utils.tryParseUri(srcString), AtomText.read(parser));
    }

    public AtomContent(@Nullable URI src, @NonNull AtomText atomText) {
        super(atomText);
        this.src = src;
    }
}
