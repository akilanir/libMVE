package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import com.einmalfel.earl.ItunesItem;
import com.einmalfel.earl.MediaItem;
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

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/RSSItem.class */
public class RSSItem implements Item {
    static final String XML_TAG = "item";
    private static final String TAG = "Earl.RSSItem";

    @Nullable
    public final String title;

    @Nullable
    public final URL link;

    @Nullable
    public final String description;

    @Nullable
    public final String author;

    @NonNull
    public final List<RSSCategory> categories;

    @Nullable
    public final URL comments;

    @NonNull
    public final List<RSSEnclosure> enclosures;

    @Nullable
    public final RSSGuid guid;

    @Nullable
    public final Date pubDate;

    @Nullable
    public final RSSSource source;

    @Nullable
    public final ItunesItem itunes;

    @Nullable
    public final MediaItem media;

    /* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/RSSItem$ST.class */
    private enum ST {
        title,
        link,
        description,
        author,
        comments,
        pubDate
    }

    @NonNull
    static RSSItem read(@NonNull XmlPullParser parser) throws IOException, XmlPullParserException {
        String tagName;
        parser.require(2, BuildConfig.FLAVOR, XML_TAG);
        Map<ST, String> map = new HashMap<>(5);
        List<RSSEnclosure> enclosures = new LinkedList<>();
        List<RSSCategory> categories = new LinkedList<>();
        RSSGuid guid = null;
        RSSSource source = null;
        ItunesItem.ItunesItemBuilder itunesBuilder = null;
        MediaItem.MediaItemBuilder mediaBuilder = null;
        while (parser.nextTag() == 2) {
            String namespace = parser.getNamespace();
            if (BuildConfig.FLAVOR.equals(namespace)) {
                tagName = parser.getName();
                switch (tagName) {
                    case "enclosure":
                        enclosures.add(RSSEnclosure.read(parser));
                        break;
                    case "category":
                        categories.add(RSSCategory.read(parser));
                        break;
                    case "source":
                        source = RSSSource.read(parser);
                        break;
                    case "guid":
                        guid = RSSGuid.read(parser);
                        break;
                    default:
                        try {
                            map.put(ST.valueOf(tagName), parser.nextText());
                            break;
                        } catch (IllegalArgumentException e) {
                            Log.w(TAG, "Unknown RSS item tag " + tagName);
                            Utils.skipTag(parser);
                            break;
                        }
                }
            } else if ("http://www.itunes.com/dtds/podcast-1.0.dtd".equalsIgnoreCase(namespace)) {
                if (itunesBuilder == null) {
                    itunesBuilder = new ItunesItem.ItunesItemBuilder();
                }
                itunesBuilder.parseTag(parser);
            } else if ("http://search.yahoo.com/mrss/".equalsIgnoreCase(namespace)) {
                if (mediaBuilder == null) {
                    mediaBuilder = new MediaItem.MediaItemBuilder();
                }
                if (!mediaBuilder.parseTag(parser)) {
                    Log.w(TAG, "Unknown mrss tag on item level");
                    Utils.skipTag(parser);
                }
            } else {
                Log.w(TAG, "Unknown namespace in RSS item " + parser.getNamespace());
                Utils.skipTag(parser);
            }
            Utils.finishTag(parser);
        }
        return new RSSItem(map.remove(ST.title), map.containsKey(ST.link) ? Utils.tryParseUrl(map.remove(ST.link)) : null, map.remove(ST.description), map.remove(ST.author), categories, map.containsKey(ST.comments) ? Utils.tryParseUrl(map.remove(ST.comments)) : null, enclosures, guid, map.containsKey(ST.pubDate) ? Utils.parseRFC822Date(map.remove(ST.pubDate)) : null, source, itunesBuilder == null ? null : itunesBuilder.build(), mediaBuilder == null ? null : mediaBuilder.build());
    }

    public RSSItem(@Nullable String title, @Nullable URL link, @Nullable String description, @Nullable String author, @NonNull List<RSSCategory> categories, @Nullable URL comments, @NonNull List<RSSEnclosure> enclosures, @Nullable RSSGuid guid, @Nullable Date pubDate, @Nullable RSSSource source, @Nullable ItunesItem itunes, @Nullable MediaItem media) {
        this.title = title;
        this.link = link;
        this.description = description;
        this.author = author;
        this.categories = Collections.unmodifiableList(categories);
        this.comments = comments;
        this.enclosures = Collections.unmodifiableList(enclosures);
        this.guid = guid;
        this.pubDate = pubDate;
        this.source = source;
        this.itunes = itunes;
        this.media = media;
    }

    @Override // com.einmalfel.earl.Item
    @Nullable
    public String getLink() {
        if (this.link == null) {
            return null;
        }
        return this.link.toString();
    }

    @Override // com.einmalfel.earl.Item
    @Nullable
    public Date getPublicationDate() {
        return this.pubDate;
    }

    @Override // com.einmalfel.earl.Item
    @Nullable
    public String getTitle() {
        if (this.title != null) {
            return this.title;
        }
        if (this.media != null && this.media.title != null) {
            return this.media.title.value;
        }
        if (this.itunes != null && this.itunes.subtitle != null) {
            return this.itunes.subtitle;
        }
        return null;
    }

    @Override // com.einmalfel.earl.Item
    @Nullable
    public String getDescription() {
        if (this.description != null) {
            return this.description;
        }
        if (this.itunes != null && this.itunes.subtitle != null) {
            return this.itunes.subtitle;
        }
        if (this.itunes != null && this.itunes.summary != null) {
            return this.itunes.summary;
        }
        if (this.media != null && this.media.description != null) {
            return this.media.description.value;
        }
        return null;
    }

    @Override // com.einmalfel.earl.Item
    @Nullable
    public String getImageLink() {
        if (this.itunes != null && this.itunes.image != null) {
            return this.itunes.image.toString();
        }
        if (this.media != null && !this.media.thumbnails.isEmpty()) {
            return this.media.thumbnails.get(0).url.toString();
        }
        return null;
    }

    @Override // com.einmalfel.earl.Item
    @Nullable
    public String getAuthor() {
        if (this.author != null) {
            return this.author;
        }
        if (this.itunes != null && this.itunes.author != null) {
            return this.itunes.author;
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

    @Override // com.einmalfel.earl.Item
    @NonNull
    public List<? extends Enclosure> getEnclosures() {
        return this.enclosures;
    }

    @Override // com.einmalfel.earl.Item
    @Nullable
    public String getId() {
        if (this.guid == null) {
            return null;
        }
        return this.guid.value;
    }
}
