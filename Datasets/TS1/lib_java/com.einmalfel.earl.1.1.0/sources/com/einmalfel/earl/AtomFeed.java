package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import java.io.IOException;
import java.net.URI;
import java.util.Collections;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/AtomFeed.class */
public class AtomFeed extends AtomCommonAttributes implements Feed {
    static final String XML_TAG = "feed";
    private static final String TAG = "Earl.AtomFeed";

    @NonNull
    public final URI id;

    @NonNull
    public final AtomText title;

    @NonNull
    public final AtomDate updated;

    @NonNull
    public final List<AtomPerson> authors;

    @NonNull
    public final List<AtomLink> links;

    @NonNull
    public final List<AtomCategory> categories;

    @NonNull
    public final List<AtomPerson> contributors;

    @Nullable
    public final AtomGenerator generator;

    @Nullable
    public final URI icon;

    @Nullable
    public final URI logo;

    @Nullable
    public final AtomText rights;

    @Nullable
    public final AtomText subtitle;

    @NonNull
    public final List<AtomEntry> entries;

    @NonNull
    static AtomFeed read(XmlPullParser parser, int maxItm) throws IOException, XmlPullParserException {
        parser.require(2, null, XML_TAG);
        List<AtomEntry> entries = new LinkedList<>();
        List<AtomPerson> contributors = new LinkedList<>();
        List<AtomPerson> authors = new LinkedList<>();
        List<AtomLink> links = new LinkedList<>();
        List<AtomCategory> categories = new LinkedList<>();
        AtomText title = null;
        AtomGenerator generator = null;
        AtomText rights = null;
        AtomText subtitle = null;
        String id = null;
        URI icon = null;
        URI logo = null;
        AtomDate updated = null;
        AtomCommonAttributes atomCommonAttributes = new AtomCommonAttributes(parser);
        while (parser.nextTag() == 2 && (maxItm < 1 || entries.size() < maxItm)) {
            if ("http://www.w3.org/2005/Atom".equalsIgnoreCase(parser.getNamespace())) {
                String tagName = parser.getName();
                switch (tagName) {
                    case "entry":
                        entries.add(AtomEntry.read(parser));
                        break;
                    case "contributor":
                        contributors.add(AtomPerson.read(parser));
                        break;
                    case "author":
                        authors.add(AtomPerson.read(parser));
                        break;
                    case "link":
                        links.add(AtomLink.read(parser));
                        break;
                    case "category":
                        categories.add(AtomCategory.read(parser));
                        break;
                    case "generator":
                        generator = AtomGenerator.read(parser);
                        break;
                    case "title":
                        title = AtomText.read(parser);
                        break;
                    case "rights":
                        rights = AtomText.read(parser);
                        break;
                    case "subtitle":
                        subtitle = AtomText.read(parser);
                        break;
                    case "id":
                        id = parser.nextText();
                        break;
                    case "icon":
                        icon = Utils.tryParseUri(parser.nextText());
                        break;
                    case "logo":
                        logo = Utils.tryParseUri(parser.nextText());
                        break;
                    case "updated":
                        updated = AtomDate.read(parser);
                        break;
                    default:
                        Log.w(TAG, "Unknown Atom feed tag " + parser.getName());
                        Utils.skipTag(parser);
                        break;
                }
            } else {
                Log.w(TAG, "Unknown Atom feed extension " + parser.getNamespace());
                Utils.skipTag(parser);
            }
            Utils.finishTag(parser);
        }
        if (title == null) {
            Log.w(TAG, "Missing title tag in atom feed, replacing with empty string");
            title = new AtomText(null, null, BuildConfig.FLAVOR);
        }
        if (updated == null) {
            Log.w(TAG, "Missing title tag in atom feed, replacing with empty string");
            updated = new AtomDate(null, new Date(0L));
        }
        return new AtomFeed(atomCommonAttributes, Utils.nonNullUri(id), title, updated, authors, contributors, generator, icon, logo, rights, subtitle, links, categories, entries);
    }

    public AtomFeed(@Nullable AtomCommonAttributes atomCommonAttributes, @NonNull URI id, @NonNull AtomText title, @NonNull AtomDate updated, @NonNull List<AtomPerson> authors, @NonNull List<AtomPerson> contributors, @Nullable AtomGenerator generator, @Nullable URI icon, @Nullable URI logo, @Nullable AtomText rights, @Nullable AtomText subtitle, @NonNull List<AtomLink> links, @NonNull List<AtomCategory> categories, @NonNull List<AtomEntry> entries) {
        super(atomCommonAttributes);
        this.id = id;
        this.title = title;
        this.updated = updated;
        this.authors = Collections.unmodifiableList(authors);
        this.contributors = Collections.unmodifiableList(contributors);
        this.generator = generator;
        this.icon = icon;
        this.logo = logo;
        this.rights = rights;
        this.subtitle = subtitle;
        this.links = Collections.unmodifiableList(links);
        this.categories = Collections.unmodifiableList(categories);
        this.entries = Collections.unmodifiableList(entries);
    }

    @Override // com.einmalfel.earl.Feed
    @Nullable
    public String getLink() {
        if (this.links.isEmpty()) {
            return null;
        }
        for (AtomLink link : this.links) {
            if (link.type != null && "alternate".equals(link.type)) {
                return link.href.toString();
            }
        }
        for (AtomLink link2 : this.links) {
            if (link2.type != null && "via".equals(link2.type)) {
                return link2.href.toString();
            }
        }
        for (AtomLink link3 : this.links) {
            if (link3.type != null && "related".equals(link3.type)) {
                return link3.href.toString();
            }
        }
        for (AtomLink link4 : this.links) {
            if (link4.type == null) {
                return link4.href.toString();
            }
        }
        for (AtomLink link5 : this.links) {
            if (link5.type != null && !"enclosure".equals(link5.type) && !"self".equals(link5.type)) {
                return link5.href.toString();
            }
        }
        return this.links.get(0).href.toString();
    }

    @Override // com.einmalfel.earl.Feed
    @NonNull
    public Date getPublicationDate() {
        return this.updated.date;
    }

    @Override // com.einmalfel.earl.Feed
    @NonNull
    public String getTitle() {
        return this.title.value;
    }

    @Override // com.einmalfel.earl.Feed
    @Nullable
    public String getDescription() {
        if (this.subtitle == null) {
            return null;
        }
        return this.subtitle.value;
    }

    @Override // com.einmalfel.earl.Feed
    @Nullable
    public String getCopyright() {
        if (this.rights == null) {
            return null;
        }
        return this.rights.value;
    }

    @Override // com.einmalfel.earl.Feed
    @Nullable
    public String getImageLink() {
        if (this.logo != null) {
            return this.logo.toString();
        }
        if (this.icon == null) {
            return null;
        }
        return this.icon.toString();
    }

    @Override // com.einmalfel.earl.Feed
    @Nullable
    public String getAuthor() {
        if (this.authors.isEmpty()) {
            if (this.contributors.isEmpty()) {
                return null;
            }
            return this.contributors.get(0).name;
        }
        return this.authors.get(0).name;
    }

    @Override // com.einmalfel.earl.Feed
    @NonNull
    public List<? extends Item> getItems() {
        return this.entries;
    }
}
