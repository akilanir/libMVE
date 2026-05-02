package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import com.einmalfel.earl.ItunesFeed;
import com.einmalfel.earl.MediaCommon;
import java.io.IOException;
import java.net.URL;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/RSSFeed.class */
public class RSSFeed implements Feed {
    static final String XML_TAG = "channel";
    private static final String TAG = "Earl.RSSFeed";

    @NonNull
    public final String title;

    @NonNull
    public final URL link;

    @NonNull
    public final String description;

    @Nullable
    public final String language;

    @Nullable
    public final String copyright;

    @Nullable
    public final String managingEditor;

    @Nullable
    public final String webMaster;

    @Nullable
    public final Date pubDate;

    @Nullable
    public final Date lastBuildDate;

    @NonNull
    public final List<RSSCategory> categories;

    @Nullable
    public final String generator;

    @Nullable
    public final URL docs;

    @Nullable
    public final RSSCloud cloud;

    @Nullable
    public final Integer ttl;

    @Nullable
    public final String rating;

    @Nullable
    public final RSSImage image;

    @Nullable
    public final RSSTextInput textInput;

    @NonNull
    public final List<Integer> skipHours;

    @NonNull
    public final List<String> skipDays;

    @NonNull
    public final List<RSSItem> items;

    @Nullable
    public final ItunesFeed itunes;

    @Nullable
    public final MediaCommon media;

    /* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/RSSFeed$ST.class */
    private enum ST {
        title,
        link,
        description,
        language,
        copyright,
        managingEditor,
        webMaster,
        pubDate,
        lastBuildDate,
        generator,
        docs,
        ttl,
        rating
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @NonNull
    static RSSFeed read(@NonNull XmlPullParser parser, int maxItems) throws IOException, XmlPullParserException {
        String tagName;
        parser.require(2, BuildConfig.FLAVOR, XML_TAG);
        Map<ST, String> map = new HashMap<>(5);
        List<RSSItem> items = new LinkedList<>();
        List<RSSCategory> categories = new LinkedList<>();
        RSSCloud cloud = null;
        RSSImage image = null;
        RSSTextInput textInput = null;
        List<Integer> skipHours = new LinkedList<>();
        List<String> skipDays = new LinkedList<>();
        ItunesFeed.ItunesFeedBuilder itunesBuilder = null;
        MediaCommon.MediaCommonBuilder mediaBuilder = null;
        while (parser.nextTag() == 2 && (maxItems < 1 || items.size() < maxItems)) {
            String namespace = parser.getNamespace();
            if (BuildConfig.FLAVOR.equalsIgnoreCase(namespace)) {
                tagName = parser.getName();
                switch (tagName) {
                    case "item":
                        items.add(RSSItem.read(parser));
                        break;
                    case "category":
                        categories.add(RSSCategory.read(parser));
                        break;
                    case "cloud":
                        cloud = RSSCloud.read(parser);
                        break;
                    case "image":
                        image = RSSImage.read(parser);
                        break;
                    case "textInput":
                        textInput = RSSTextInput.read(parser);
                        break;
                    case "skipHours":
                        while (parser.nextTag() == 2 && "hour".equals(parser.getName())) {
                            skipHours.add(Utils.tryParseInt(parser.nextText()));
                            Utils.finishTag(parser);
                        }
                        break;
                    case "skipDays":
                        while (parser.nextTag() == 2 && "day".equals(parser.getName())) {
                            skipDays.add(parser.nextText());
                            Utils.finishTag(parser);
                        }
                        break;
                    default:
                        try {
                            map.put(ST.valueOf(tagName), parser.nextText());
                            break;
                        } catch (IllegalArgumentException e) {
                            Log.w(TAG, "Unknown RSS feed tag " + tagName);
                            Utils.skipTag(parser);
                            break;
                        }
                }
            } else if ("http://www.itunes.com/dtds/podcast-1.0.dtd".equalsIgnoreCase(namespace)) {
                if (itunesBuilder == null) {
                    itunesBuilder = new ItunesFeed.ItunesFeedBuilder();
                }
                itunesBuilder.parseTag(parser);
            } else if ("http://search.yahoo.com/mrss/".equalsIgnoreCase(namespace)) {
                if (mediaBuilder == null) {
                    mediaBuilder = new MediaCommon.MediaCommonBuilder();
                }
                if (!mediaBuilder.parseTag(parser)) {
                    Log.w(TAG, "Unknown mrss tag on feed level");
                    Utils.skipTag(parser);
                }
            } else {
                Log.w(TAG, "Unknown RSS feed extension " + parser.getNamespace());
                Utils.skipTag(parser);
            }
            Utils.finishTag(parser);
        }
        return new RSSFeed(Utils.nonNullString(map.remove(ST.title)), Utils.nonNullUrl(map.remove(ST.link)), Utils.nonNullString(map.remove(ST.description)), map.remove(ST.language), map.remove(ST.copyright), map.remove(ST.managingEditor), map.remove(ST.webMaster), map.containsKey(ST.pubDate) ? Utils.parseRFC822Date(map.remove(ST.pubDate)) : null, map.containsKey(ST.lastBuildDate) ? Utils.parseRFC822Date(map.remove(ST.lastBuildDate)) : null, categories, map.remove(ST.generator), map.containsKey(ST.docs) ? Utils.tryParseUrl(map.remove(ST.docs)) : null, cloud, map.containsKey(ST.ttl) ? Utils.tryParseInt(map.remove(ST.ttl)) : null, map.remove(ST.rating), image, textInput, skipHours, skipDays, items, itunesBuilder == null ? null : itunesBuilder.build(), mediaBuilder == null ? null : mediaBuilder.build());
    }

    public RSSFeed(@NonNull String title, @NonNull URL link, @NonNull String description, @Nullable String language, @Nullable String copyright, @Nullable String managingEditor, @Nullable String webMaster, @Nullable Date pubDate, @Nullable Date lastBuildDate, @NonNull List<RSSCategory> categories, @Nullable String generator, @Nullable URL docs, @Nullable RSSCloud cloud, @Nullable Integer ttl, @Nullable String rating, @Nullable RSSImage image, @Nullable RSSTextInput textInput, @NonNull List<Integer> skipHours, @NonNull List<String> skipDays, @NonNull List<RSSItem> items, @Nullable ItunesFeed itunes, @Nullable MediaCommon media) {
        this.title = title;
        this.link = link;
        this.description = description;
        this.language = language;
        this.copyright = copyright;
        this.managingEditor = managingEditor;
        this.webMaster = webMaster;
        this.pubDate = pubDate;
        this.lastBuildDate = lastBuildDate;
        this.categories = Collections.unmodifiableList(categories);
        this.generator = generator;
        this.docs = docs;
        this.cloud = cloud;
        this.ttl = ttl;
        this.rating = rating;
        this.image = image;
        this.textInput = textInput;
        this.skipHours = Collections.unmodifiableList(skipHours);
        this.skipDays = Collections.unmodifiableList(skipDays);
        this.items = Collections.unmodifiableList(items);
        this.itunes = itunes;
        this.media = media;
    }

    @Override // com.einmalfel.earl.Feed
    @Nullable
    public String getLink() {
        return this.link.toString();
    }

    @Override // com.einmalfel.earl.Feed
    @Nullable
    public Date getPublicationDate() {
        return this.pubDate;
    }

    @Override // com.einmalfel.earl.Feed
    @NonNull
    public String getTitle() {
        return this.title;
    }

    @Override // com.einmalfel.earl.Feed
    @NonNull
    public String getDescription() {
        return this.description;
    }

    @Override // com.einmalfel.earl.Feed
    @Nullable
    public String getCopyright() {
        if (this.copyright != null) {
            return this.copyright;
        }
        if (this.media != null && this.media.license != null) {
            return this.media.license.value;
        }
        return null;
    }

    @Override // com.einmalfel.earl.Feed
    @Nullable
    public String getImageLink() {
        if (this.image != null) {
            return this.image.url.toString();
        }
        if (this.itunes != null && this.itunes.image != null) {
            return this.itunes.image.toString();
        }
        if (this.media != null && !this.media.thumbnails.isEmpty()) {
            return this.media.thumbnails.get(0).url.toString();
        }
        return null;
    }

    @Override // com.einmalfel.earl.Feed
    @Nullable
    public String getAuthor() {
        if (this.managingEditor != null) {
            return this.managingEditor;
        }
        if (this.itunes != null && this.itunes.author != null) {
            return this.itunes.author;
        }
        if (this.itunes != null && this.itunes.owner != null) {
            return this.itunes.owner.name;
        }
        if (this.media != null && !this.media.credits.isEmpty()) {
            for (MediaCredit credit : this.media.credits) {
                if ("author".equalsIgnoreCase(credit.role)) {
                    return credit.value;
                }
            }
            return this.media.credits.get(0).value;
        }
        return null;
    }

    @Override // com.einmalfel.earl.Feed
    @NonNull
    public List<? extends Item> getItems() {
        return this.items;
    }
}
