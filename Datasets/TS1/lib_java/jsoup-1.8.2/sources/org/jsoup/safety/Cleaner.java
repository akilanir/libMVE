package org.jsoup.safety;

import java.util.Iterator;
import org.jsoup.helper.Validate;
import org.jsoup.nodes.Attribute;
import org.jsoup.nodes.Attributes;
import org.jsoup.nodes.DataNode;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.nodes.TextNode;
import org.jsoup.parser.Tag;
import org.jsoup.select.NodeTraversor;
import org.jsoup.select.NodeVisitor;

/* loaded from: jsoup-1.8.2.jar:org/jsoup/safety/Cleaner.class */
public class Cleaner {
    private Whitelist whitelist;

    public Cleaner(Whitelist whitelist) {
        Validate.notNull(whitelist);
        this.whitelist = whitelist;
    }

    public Document clean(Document dirtyDocument) {
        Validate.notNull(dirtyDocument);
        Document clean = Document.createShell(dirtyDocument.baseUri());
        if (dirtyDocument.body() != null) {
            copySafeNodes(dirtyDocument.body(), clean.body());
        }
        return clean;
    }

    public boolean isValid(Document dirtyDocument) {
        Validate.notNull(dirtyDocument);
        Document clean = Document.createShell(dirtyDocument.baseUri());
        int numDiscarded = copySafeNodes(dirtyDocument.body(), clean.body());
        return numDiscarded == 0;
    }

    /* loaded from: jsoup-1.8.2.jar:org/jsoup/safety/Cleaner$CleaningVisitor.class */
    private final class CleaningVisitor implements NodeVisitor {
        private int numDiscarded;
        private final Element root;
        private Element destination;

        private CleaningVisitor(Element root, Element destination) {
            this.numDiscarded = 0;
            this.root = root;
            this.destination = destination;
        }

        @Override // org.jsoup.select.NodeVisitor
        public void head(Node source, int depth) {
            if (source instanceof Element) {
                Element sourceEl = (Element) source;
                if (!Cleaner.this.whitelist.isSafeTag(sourceEl.tagName())) {
                    if (source != this.root) {
                        this.numDiscarded++;
                        return;
                    }
                    return;
                } else {
                    ElementMeta meta = Cleaner.this.createSafeElement(sourceEl);
                    Element destChild = meta.el;
                    this.destination.appendChild(destChild);
                    this.numDiscarded += meta.numAttribsDiscarded;
                    this.destination = destChild;
                    return;
                }
            }
            if (!(source instanceof TextNode)) {
                if ((source instanceof DataNode) && Cleaner.this.whitelist.isSafeTag(source.parent().nodeName())) {
                    DataNode sourceData = (DataNode) source;
                    DataNode destData = new DataNode(sourceData.getWholeData(), source.baseUri());
                    this.destination.appendChild(destData);
                    return;
                }
                this.numDiscarded++;
                return;
            }
            TextNode sourceText = (TextNode) source;
            TextNode destText = new TextNode(sourceText.getWholeText(), source.baseUri());
            this.destination.appendChild(destText);
        }

        @Override // org.jsoup.select.NodeVisitor
        public void tail(Node source, int depth) {
            if ((source instanceof Element) && Cleaner.this.whitelist.isSafeTag(source.nodeName())) {
                this.destination = this.destination.parent();
            }
        }
    }

    private int copySafeNodes(Element source, Element dest) {
        CleaningVisitor cleaningVisitor = new CleaningVisitor(source, dest);
        NodeTraversor traversor = new NodeTraversor(cleaningVisitor);
        traversor.traverse(source);
        return cleaningVisitor.numDiscarded;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ElementMeta createSafeElement(Element sourceEl) {
        String sourceTag = sourceEl.tagName();
        Attributes destAttrs = new Attributes();
        Element dest = new Element(Tag.valueOf(sourceTag), sourceEl.baseUri(), destAttrs);
        int numDiscarded = 0;
        Attributes sourceAttrs = sourceEl.attributes();
        Iterator i$ = sourceAttrs.iterator();
        while (i$.hasNext()) {
            Attribute sourceAttr = i$.next();
            if (this.whitelist.isSafeAttribute(sourceTag, sourceEl, sourceAttr)) {
                destAttrs.put(sourceAttr);
            } else {
                numDiscarded++;
            }
        }
        Attributes enforcedAttrs = this.whitelist.getEnforcedAttributes(sourceTag);
        destAttrs.addAll(enforcedAttrs);
        return new ElementMeta(dest, numDiscarded);
    }

    /* loaded from: jsoup-1.8.2.jar:org/jsoup/safety/Cleaner$ElementMeta.class */
    private static class ElementMeta {
        Element el;
        int numAttribsDiscarded;

        ElementMeta(Element el, int numAttribsDiscarded) {
            this.el = el;
            this.numAttribsDiscarded = numAttribsDiscarded;
        }
    }
}
