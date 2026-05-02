package com.einmalfel.earl;

import android.support.annotation.NonNull;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaRights.class */
public class MediaRights {
    static final String XML_TAG = "rights";

    @NonNull
    public final String status;

    @NonNull
    static MediaRights read(XmlPullParser parser) throws XmlPullParserException, IOException {
        parser.require(2, null, XML_TAG);
        MediaRights result = new MediaRights(Utils.nonNullString(parser.getAttributeValue(BuildConfig.FLAVOR, "status")));
        parser.nextTag();
        return result;
    }

    public MediaRights(@NonNull String status) {
        this.status = status;
    }
}
