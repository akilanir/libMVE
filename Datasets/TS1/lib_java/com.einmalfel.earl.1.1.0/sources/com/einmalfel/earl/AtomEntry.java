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

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/AtomEntry.class */
public class AtomEntry extends AtomCommonAttributes implements Item {
    static final String XML_TAG = "entry";
    private static final String TAG = "Earl.AtomEntry";

    @NonNull
    public final URI id;

    @NonNull
    public final AtomText title;

    @NonNull
    public final AtomDate updated;

    @NonNull
    public final List<AtomPerson> authors;

    @Nullable
    public final AtomContent content;

    @NonNull
    public final List<AtomLink> links;

    @Nullable
    public final AtomText summary;

    @NonNull
    public final List<AtomCategory> categories;

    @NonNull
    public final List<AtomPerson> contributors;

    @Nullable
    public final AtomDate published;

    @Nullable
    public final AtomFeed source;

    @Nullable
    public final AtomText rights;

    @NonNull
    static AtomEntry read(XmlPullParser parser) throws XmlPullParserException, IOException {
        parser.require(2, null, XML_TAG);
        List<AtomPerson> authors = new LinkedList<>();
        List<AtomLink> links = new LinkedList<>();
        List<AtomCategory> categories = new LinkedList<>();
        List<AtomPerson> contributors = new LinkedList<>();
        AtomText title = null;
        AtomText summary = null;
        AtomText rights = null;
        AtomContent content = null;
        AtomFeed source = null;
        String id = null;
        AtomDate updated = null;
        AtomDate published = null;
        AtomCommonAttributes atomCommonAttributes = new AtomCommonAttributes(parser);
        while (parser.nextTag() == 2) {
            if ("http://www.w3.org/2005/Atom".equalsIgnoreCase(parser.getNamespace())) {
                switch (parser.getName()) {
                    case "link":
                        links.add(AtomLink.read(parser));
                        break;
                    case "category":
                        categories.add(AtomCategory.read(parser));
                        break;
                    case "contributor":
                        contributors.add(AtomPerson.read(parser));
                        break;
                    case "author":
                        authors.add(AtomPerson.read(parser));
                        break;
                    case "title":
                        title = AtomText.read(parser);
                        break;
                    case "summary":
                        summary = AtomText.read(parser);
                        break;
                    case "rights":
                        rights = AtomText.read(parser);
                        break;
                    case "id":
                        id = parser.nextText();
                        break;
                    case "published":
                        published = AtomDate.read(parser);
                        break;
                    case "updated":
                        updated = AtomDate.read(parser);
                        break;
                    case "content":
                        content = AtomContent.read(parser);
                        break;
                    case "feed":
                        source = AtomFeed.read(parser, 0);
                        break;
                    default:
                        Log.w(TAG, "Unknown tag in Atom entry " + parser.getName());
                        Utils.skipTag(parser);
                        break;
                }
            } else {
                Log.w(TAG, "Unknown namespace in Atom item " + parser.getNamespace());
                Utils.skipTag(parser);
            }
            Utils.finishTag(parser);
        }
        if (title == null) {
            Log.w(TAG, "No title found for atom entry", new NullPointerException());
            title = new AtomText(null, null, BuildConfig.FLAVOR);
        }
        if (updated == null) {
            Log.w(TAG, "No updated found for atom entry, replaced with zero", new NullPointerException());
            updated = new AtomDate(null, new Date(0L));
        }
        return new AtomEntry(atomCommonAttributes, Utils.nonNullUri(id), title, updated, authors, content, links, summary, categories, contributors, published, source, rights);
    }

    public AtomEntry(@Nullable AtomCommonAttributes atomCommonAttributes, @NonNull URI id, @NonNull AtomText title, @NonNull AtomDate updated, @NonNull List<AtomPerson> authors, @Nullable AtomContent content, @NonNull List<AtomLink> links, @Nullable AtomText summary, @NonNull List<AtomCategory> categories, @NonNull List<AtomPerson> contributors, @Nullable AtomDate published, @Nullable AtomFeed source, @Nullable AtomText rights) {
        super(atomCommonAttributes);
        this.id = id;
        this.title = title;
        this.updated = updated;
        this.authors = Collections.unmodifiableList(authors);
        this.content = content;
        this.links = Collections.unmodifiableList(links);
        this.summary = summary;
        this.categories = Collections.unmodifiableList(categories);
        this.contributors = Collections.unmodifiableList(contributors);
        this.published = published;
        this.source = source;
        this.rights = rights;
    }

    @Override // com.einmalfel.earl.Item
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

    @Override // com.einmalfel.earl.Item
    @NonNull
    public Date getPublicationDate() {
        return this.published == null ? this.updated.date : this.published.date;
    }

    @Override // com.einmalfel.earl.Item
    @NonNull
    public String getTitle() {
        return this.title.value;
    }

    @Override // com.einmalfel.earl.Item
    @Nullable
    public String getDescription() {
        if (this.summary != null) {
            return this.summary.value;
        }
        if (this.content == null) {
            return null;
        }
        return this.content.value;
    }

    @Override // com.einmalfel.earl.Item
    @Nullable
    public String getImageLink() {
        return null;
    }

    @Override // com.einmalfel.earl.Item
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

    @Override // com.einmalfel.earl.Item
    @NonNull
    public List<? extends Enclosure> getEnclosures() {
        List<Enclosure> result = new LinkedList<>();
        for (AtomLink link : this.links) {
            if (link.type != null && "enclosure".equals(link.type)) {
                result.add(link);
            }
        }
        return result;
    }

    @Override // com.einmalfel.earl.Item
    @NonNull
    public String getId() {
        return this.id.toString();
    }
}
