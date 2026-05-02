package com.einmalfel.earl;

import android.support.annotation.NonNull;
import java.io.IOException;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/ItunesCategory.class */
public class ItunesCategory {
    static final String XML_TAG = "category";

    @NonNull
    public final String text;

    @NonNull
    public final List<ItunesCategory> subCategories;

    @NonNull
    static ItunesCategory read(@NonNull XmlPullParser parser) throws IOException, XmlPullParserException {
        parser.require(2, null, XML_TAG);
        String value = parser.getAttributeValue(BuildConfig.FLAVOR, "text");
        List<ItunesCategory> subCategories = new LinkedList<>();
        while (parser.nextTag() != 3) {
            subCategories.add(read(parser));
        }
        return new ItunesCategory(Utils.nonNullString(value), subCategories);
    }

    public ItunesCategory(@NonNull String text, @NonNull List<ItunesCategory> subCategories) {
        this.text = text;
        this.subCategories = Collections.unmodifiableList(subCategories);
    }
}
