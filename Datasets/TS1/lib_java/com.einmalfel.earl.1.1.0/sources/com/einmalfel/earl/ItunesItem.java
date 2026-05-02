package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import java.io.IOException;
import java.net.URL;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/ItunesItem.class */
public class ItunesItem {
    private static final String TAG = "Earl.ItunesItem";

    @Nullable
    public final String author;

    @Nullable
    public final Boolean block;

    @Nullable
    public final URL image;

    @Nullable
    public final Integer duration;

    @Nullable
    public final String explicit;

    @Nullable
    public final Boolean isClosedCaptioned;

    @Nullable
    public final Integer order;

    @Nullable
    public final String subtitle;

    @Nullable
    public final String summary;

    @NonNull
    public final List<String> keywords;

    /* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/ItunesItem$ST.class */
    private enum ST {
        author,
        block,
        duration,
        explicit,
        isClosedCaptioned,
        order,
        subtitle,
        summary
    }

    /* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/ItunesItem$ItunesItemBuilder.class */
    static class ItunesItemBuilder {
        final Map<ST, String> map = new HashMap();
        URL image;
        List<String> keywords;

        ItunesItemBuilder() {
        }

        void parseTag(@NonNull XmlPullParser parser) throws IOException, XmlPullParserException {
            String tagName;
            tagName = parser.getName();
            switch (tagName) {
                case "image":
                    String imageStr = parser.getAttributeValue(BuildConfig.FLAVOR, "href");
                    this.image = imageStr == null ? null : Utils.tryParseUrl(imageStr);
                    parser.nextText();
                    break;
                case "keywords":
                    this.keywords = Arrays.asList(parser.nextText().split(" "));
                    break;
                default:
                    try {
                        this.map.put(ST.valueOf(tagName), parser.nextText());
                        break;
                    } catch (IllegalArgumentException e) {
                        Log.w(ItunesItem.TAG, "Unknown itunes item tag " + tagName);
                        Utils.skipTag(parser);
                    }
            }
        }

        @NonNull
        ItunesItem build() {
            return new ItunesItem(this.map.remove(ST.author), this.map.containsKey(ST.block) ? Boolean.valueOf("yes".equals(this.map.remove(ST.block))) : null, this.image, this.map.containsKey(ST.duration) ? Utils.parseItunesDuration(this.map.remove(ST.duration)) : null, this.map.remove(ST.explicit), this.map.containsKey(ST.isClosedCaptioned) ? Boolean.valueOf(" yes".equals(this.map.remove(ST.isClosedCaptioned))) : null, this.map.containsKey(ST.order) ? Utils.tryParseInt(this.map.remove(ST.order)) : null, this.map.remove(ST.subtitle), this.map.remove(ST.summary), this.keywords == null ? new LinkedList() : this.keywords);
        }
    }

    public ItunesItem(@Nullable String author, @Nullable Boolean block, @Nullable URL image, @Nullable Integer duration, @Nullable String explicit, @Nullable Boolean isClosedCaptioned, @Nullable Integer order, @Nullable String subtitle, @Nullable String summary, @NonNull List<String> keywords) {
        this.author = author;
        this.block = block;
        this.image = image;
        this.duration = duration;
        this.explicit = explicit;
        this.isClosedCaptioned = isClosedCaptioned;
        this.order = order;
        this.subtitle = subtitle;
        this.summary = summary;
        this.keywords = Collections.unmodifiableList(keywords);
    }
}
