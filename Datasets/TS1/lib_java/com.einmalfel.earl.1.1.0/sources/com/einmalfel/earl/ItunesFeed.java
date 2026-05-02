package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import java.io.IOException;
import java.net.URL;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/ItunesFeed.class */
public class ItunesFeed {
    private static final String TAG = "Earl.ItunesFeed";

    @Nullable
    public final String author;

    @Nullable
    public final Boolean block;

    @NonNull
    public final List<ItunesCategory> categories;

    @Nullable
    public final URL image;

    @Nullable
    public final String explicit;

    @Nullable
    public final Boolean complete;

    @Nullable
    public final URL newFeedURL;

    @Nullable
    public final ItunesOwner owner;

    @Nullable
    public final String subtitle;

    @Nullable
    public final String summary;

    /* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/ItunesFeed$ST.class */
    private enum ST {
        author,
        block,
        explicit,
        complete,
        subtitle,
        summary
    }

    /* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/ItunesFeed$ItunesFeedBuilder.class */
    static class ItunesFeedBuilder {
        final Map<ST, String> map = new HashMap();
        final List<ItunesCategory> categories = new LinkedList();
        ItunesOwner owner;
        URL image;
        URL newFeedURL;

        ItunesFeedBuilder() {
        }

        void parseTag(@NonNull XmlPullParser parser) throws IOException, XmlPullParserException {
            String tagName;
            tagName = parser.getName();
            switch (tagName) {
                case "category":
                    this.categories.add(ItunesCategory.read(parser));
                    break;
                case "owner":
                    this.owner = ItunesOwner.read(parser);
                    break;
                case "image":
                    this.image = Utils.tryParseUrl(parser.getAttributeValue(BuildConfig.FLAVOR, "href"));
                    parser.nextToken();
                    break;
                case "new-feed-url":
                    this.newFeedURL = Utils.tryParseUrl(parser.nextText());
                    break;
                default:
                    try {
                        this.map.put(ST.valueOf(tagName), parser.nextText());
                        break;
                    } catch (IllegalArgumentException e) {
                        Log.w(ItunesFeed.TAG, "Unknown Itunes feed tag " + tagName + " skipping..");
                        Utils.skipTag(parser);
                    }
            }
        }

        @NonNull
        ItunesFeed build() {
            return new ItunesFeed(this.map.remove(ST.author), this.map.containsKey(ST.block) ? Boolean.valueOf("yes".equals(this.map.remove(ST.block))) : null, this.categories, this.image, this.map.remove(ST.explicit), this.map.containsKey(ST.complete) ? Boolean.valueOf("yes".equals(this.map.remove(ST.complete))) : null, this.newFeedURL, this.owner, this.map.remove(ST.subtitle), this.map.remove(ST.summary));
        }
    }

    public ItunesFeed(@Nullable String author, @Nullable Boolean block, @NonNull List<ItunesCategory> categories, @Nullable URL image, @Nullable String explicit, @Nullable Boolean complete, @Nullable URL newFeedURL, @Nullable ItunesOwner owner, @Nullable String subtitle, @Nullable String summary) {
        this.author = author;
        this.block = block;
        this.categories = Collections.unmodifiableList(categories);
        this.image = image;
        this.explicit = explicit;
        this.complete = complete;
        this.newFeedURL = newFeedURL;
        this.owner = owner;
        this.subtitle = subtitle;
        this.summary = summary;
    }
}
