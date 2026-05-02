package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/AtomText.class */
public class AtomText extends AtomCommonAttributes {

    @Nullable
    public final String type;

    @NonNull
    public final String value;

    @NonNull
    static AtomText read(XmlPullParser parser) throws XmlPullParserException, IOException {
        return new AtomText(new AtomCommonAttributes(parser), parser.getAttributeValue(BuildConfig.FLAVOR, "type"), parser.nextText());
    }

    public AtomText(@Nullable AtomCommonAttributes atomCommonAttributes, @Nullable String type, @NonNull String value) {
        super(atomCommonAttributes);
        this.type = type;
        this.value = value;
    }

    AtomText(@NonNull AtomText source) {
        super(source);
        this.type = source.type;
        this.value = source.value;
    }
}
