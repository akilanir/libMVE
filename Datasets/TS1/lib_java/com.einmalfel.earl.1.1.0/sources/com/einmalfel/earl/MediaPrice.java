package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaPrice.class */
public class MediaPrice {
    static final String XML_TAG = "price";

    @Nullable
    public final String type;

    @Nullable
    public final String info;

    @Nullable
    public final String price;

    @Nullable
    public final String currency;

    @NonNull
    static MediaPrice read(XmlPullParser parser) throws XmlPullParserException, IOException {
        MediaPrice result = new MediaPrice(parser.getAttributeValue(BuildConfig.FLAVOR, "type"), parser.getAttributeValue(BuildConfig.FLAVOR, "info"), parser.getAttributeValue(BuildConfig.FLAVOR, XML_TAG), parser.getAttributeValue(BuildConfig.FLAVOR, "currency"));
        parser.nextTag();
        return result;
    }

    public MediaPrice(@Nullable String type, @Nullable String info, @Nullable String price, @Nullable String currency) {
        this.type = type;
        this.info = info;
        this.price = price;
        this.currency = currency;
    }
}
