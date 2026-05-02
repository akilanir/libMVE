package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.net.URL;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaCommon.class */
public class MediaCommon {

    @Nullable
    public final Boolean adult;

    @Nullable
    public final MediaRating rating;

    @Nullable
    public final MediaTitle title;

    @Nullable
    public final MediaTitle description;

    @NonNull
    public final List<String> keywords;

    @NonNull
    public final List<MediaThumbnail> thumbnails;

    @NonNull
    public final List<MediaCategory> categories;

    @Nullable
    public final MediaHash hash;

    @Nullable
    public final MediaPlayer player;

    @NonNull
    public final List<MediaCredit> credits;

    @Nullable
    public final MediaCopyright copyright;

    @NonNull
    public final List<MediaText> texts;

    @NonNull
    public final List<MediaRestriction> restrictions;

    @Nullable
    public final MediaCommunity community;

    @NonNull
    public final List<String> comments;

    @Nullable
    public final MediaEmbed embed;

    @NonNull
    public final List<String> responses;

    @NonNull
    public final List<URL> backLinks;

    @Nullable
    public final MediaStatus status;

    @NonNull
    public final List<MediaPrice> prices;

    @Nullable
    public final MediaLicense license;

    @NonNull
    public final List<MediaSubTitle> subTitles;

    @Nullable
    public final MediaPeerLink peerLink;

    @Nullable
    public final MediaLocation location;

    @Nullable
    public final MediaRights rights;

    @NonNull
    public final List<MediaScene> scenes;

    /* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaCommon$MediaCommonBuilder.class */
    static class MediaCommonBuilder {
        private Boolean adult;
        private MediaRating rating;
        private MediaTitle title;
        private MediaTitle description;
        private List<String> keywords;
        private MediaHash hash;
        private MediaPlayer player;
        private MediaCopyright copyright;
        private MediaCommunity community;
        private MediaEmbed embed;
        private MediaStatus status;
        private MediaLicense license;
        private MediaPeerLink peerLink;
        private MediaLocation location;
        private MediaRights rights;
        private List<MediaThumbnail> thumbnails = new LinkedList();
        private List<MediaCategory> categories = new LinkedList();
        private List<MediaCredit> credits = new LinkedList();
        private List<MediaText> texts = new LinkedList();
        private List<MediaRestriction> restrictions = new LinkedList();
        private List<String> comments = new LinkedList();
        private List<String> responses = new LinkedList();
        private List<URL> backLinks = new LinkedList();
        private List<MediaPrice> prices = new LinkedList();
        private List<MediaSubTitle> subTitles = new LinkedList();
        private List<MediaScene> scenes = new LinkedList();

        MediaCommonBuilder() {
        }

        /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
        boolean parseTag(XmlPullParser parser) throws XmlPullParserException, IOException {
            switch (parser.getName()) {
                case "adult":
                    this.adult = Boolean.valueOf(Boolean.parseBoolean(parser.nextText()));
                    return true;
                case "rating":
                    this.rating = MediaRating.read(parser);
                    return true;
                case "title":
                    this.title = MediaTitle.read(parser);
                    return true;
                case "description":
                    this.description = MediaTitle.read(parser);
                    return true;
                case "keywords":
                    this.keywords = Arrays.asList(parser.nextText().split(","));
                    return true;
                case "thumbnail":
                    this.thumbnails.add(MediaThumbnail.read(parser));
                    return true;
                case "category":
                    this.categories.add(MediaCategory.read(parser));
                    return true;
                case "hash":
                    this.hash = MediaHash.read(parser);
                    return true;
                case "player":
                    this.player = MediaPlayer.read(parser);
                    return true;
                case "credit":
                    this.credits.add(MediaCredit.read(parser));
                    return true;
                case "copyright":
                    this.copyright = MediaCopyright.read(parser);
                    return true;
                case "text":
                    this.texts.add(MediaText.read(parser));
                    return true;
                case "restriction":
                    this.restrictions.add(MediaRestriction.read(parser));
                    return true;
                case "community":
                    this.community = MediaCommunity.read(parser);
                    return true;
                case "comments":
                    while (parser.nextTag() == 2) {
                        parser.require(2, null, "comment");
                        this.comments.add(parser.nextText());
                    }
                    return true;
                case "embed":
                    this.embed = MediaEmbed.read(parser);
                    return true;
                case "responses":
                    while (parser.nextTag() == 2) {
                        parser.require(2, null, "response");
                        this.responses.add(parser.nextText());
                    }
                    return true;
                case "backLinks":
                    while (parser.nextTag() == 2) {
                        parser.require(2, null, "backLink");
                        this.backLinks.add(Utils.nonNullUrl(parser.nextText()));
                    }
                    return true;
                case "status":
                    this.status = MediaStatus.read(parser);
                    return true;
                case "price":
                    this.prices.add(MediaPrice.read(parser));
                    return true;
                case "license":
                    this.license = MediaLicense.read(parser);
                    return true;
                case "subTitle":
                    this.subTitles.add(MediaSubTitle.read(parser));
                    return true;
                case "peerLink":
                    this.peerLink = MediaPeerLink.read(parser);
                    return true;
                case "location":
                    this.location = MediaLocation.read(parser);
                    return true;
                case "rights":
                    this.rights = MediaRights.read(parser);
                    return true;
                case "scenes":
                    while (parser.nextTag() == 2) {
                        parser.require(2, null, "scene");
                        this.scenes.add(MediaScene.read(parser));
                    }
                    return true;
                default:
                    return false;
            }
        }

        MediaCommon build() {
            if (this.keywords == null) {
                this.keywords = new LinkedList();
            }
            return new MediaCommon(this.adult, this.rating, this.title, this.description, this.keywords, this.thumbnails, this.categories, this.hash, this.player, this.credits, this.copyright, this.texts, this.restrictions, this.community, this.comments, this.embed, this.responses, this.backLinks, this.status, this.prices, this.license, this.subTitles, this.peerLink, this.location, this.rights, this.scenes);
        }
    }

    @NonNull
    static MediaCommon read(XmlPullParser parser) throws XmlPullParserException, IOException {
        MediaCommonBuilder builder = new MediaCommonBuilder();
        while (parser.nextTag() == 2) {
            builder.parseTag(parser);
        }
        return builder.build();
    }

    public MediaCommon(@Nullable Boolean adult, @Nullable MediaRating rating, @Nullable MediaTitle title, @Nullable MediaTitle description, @NonNull List<String> keywords, @NonNull List<MediaThumbnail> thumbnails, @NonNull List<MediaCategory> categories, @Nullable MediaHash hash, @Nullable MediaPlayer player, @NonNull List<MediaCredit> credits, @Nullable MediaCopyright copyright, @NonNull List<MediaText> texts, @NonNull List<MediaRestriction> restrictions, @Nullable MediaCommunity community, @NonNull List<String> comments, @Nullable MediaEmbed embed, @NonNull List<String> responses, @NonNull List<URL> backLinks, @Nullable MediaStatus status, @NonNull List<MediaPrice> prices, @Nullable MediaLicense license, @NonNull List<MediaSubTitle> subTitles, @Nullable MediaPeerLink peerLink, @Nullable MediaLocation location, @Nullable MediaRights rights, @NonNull List<MediaScene> scenes) {
        this.adult = adult;
        this.rating = rating;
        this.title = title;
        this.description = description;
        this.keywords = Collections.unmodifiableList(keywords);
        this.thumbnails = Collections.unmodifiableList(thumbnails);
        this.categories = Collections.unmodifiableList(categories);
        this.hash = hash;
        this.player = player;
        this.credits = Collections.unmodifiableList(credits);
        this.copyright = copyright;
        this.texts = Collections.unmodifiableList(texts);
        this.restrictions = Collections.unmodifiableList(restrictions);
        this.community = community;
        this.comments = Collections.unmodifiableList(comments);
        this.embed = embed;
        this.responses = Collections.unmodifiableList(responses);
        this.backLinks = Collections.unmodifiableList(backLinks);
        this.status = status;
        this.prices = Collections.unmodifiableList(prices);
        this.license = license;
        this.subTitles = Collections.unmodifiableList(subTitles);
        this.peerLink = peerLink;
        this.location = location;
        this.rights = rights;
        this.scenes = Collections.unmodifiableList(scenes);
    }

    public MediaCommon(@NonNull MediaCommon source) {
        this.adult = source.adult;
        this.rating = source.rating;
        this.title = source.title;
        this.description = source.description;
        this.keywords = source.keywords;
        this.thumbnails = source.thumbnails;
        this.categories = source.categories;
        this.hash = source.hash;
        this.player = source.player;
        this.credits = source.credits;
        this.copyright = source.copyright;
        this.texts = source.texts;
        this.restrictions = source.restrictions;
        this.community = source.community;
        this.comments = source.comments;
        this.embed = source.embed;
        this.responses = source.responses;
        this.backLinks = source.backLinks;
        this.status = source.status;
        this.prices = source.prices;
        this.license = source.license;
        this.subTitles = source.subTitles;
        this.peerLink = source.peerLink;
        this.location = source.location;
        this.rights = source.rights;
        this.scenes = source.scenes;
    }
}
