package ezvcard.io.html;

import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.io.StreamReader;
import ezvcard.property.Categories;
import ezvcard.property.Email;
import ezvcard.property.Label;
import ezvcard.property.Nickname;
import ezvcard.property.Telephone;
import ezvcard.property.Url;
import ezvcard.util.HtmlUtils;
import ezvcard.util.IOUtils;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/html/HCardParser.class */
public class HCardParser extends StreamReader {
    private final String pageUrl;
    private final Elements vcardElements;
    private final Iterator<Element> vcardElementsIt;
    private final List<Label> labels;
    private VCard vcard;
    private Elements embeddedVCards;
    private Nickname nickname;
    private Categories categories;
    private final String urlPropertyName;
    private final String categoriesName;
    private final String emailName;
    private final String telName;

    public HCardParser(URL url) throws IOException {
        this(Jsoup.parse(url, 30000), url.toString());
    }

    public HCardParser(InputStream in) throws IOException {
        this(in, (String) null);
    }

    public HCardParser(InputStream in, String pageUrl) throws IOException {
        this(pageUrl == null ? Jsoup.parse(in, (String) null, "") : Jsoup.parse(in, (String) null, pageUrl), pageUrl);
    }

    public HCardParser(File file) throws IOException {
        this(file, (String) null);
    }

    public HCardParser(File file, String pageUrl) throws IOException {
        this(pageUrl == null ? Jsoup.parse(file, (String) null, "") : Jsoup.parse(file, (String) null, pageUrl), pageUrl);
    }

    public HCardParser(Reader reader) throws IOException {
        this(reader, (String) null);
    }

    public HCardParser(Reader reader, String pageUrl) throws IOException {
        this(IOUtils.toString(reader), pageUrl);
    }

    public HCardParser(String html) {
        this(html, (String) null);
    }

    public HCardParser(String html, String pageUrl) {
        this(pageUrl == null ? Jsoup.parse(html) : Jsoup.parse(html, pageUrl), pageUrl);
    }

    public HCardParser(Document document) {
        this(document, (String) null);
    }

    public HCardParser(Document document, String pageUrl) {
        this.labels = new ArrayList();
        this.embeddedVCards = new Elements();
        this.urlPropertyName = this.index.getPropertyScribe(Url.class).getPropertyName().toLowerCase();
        this.categoriesName = this.index.getPropertyScribe(Categories.class).getPropertyName().toLowerCase();
        this.emailName = this.index.getPropertyScribe(Email.class).getPropertyName().toLowerCase();
        this.telName = this.index.getPropertyScribe(Telephone.class).getPropertyName().toLowerCase();
        this.pageUrl = pageUrl;
        String anchor = null;
        if (pageUrl != null) {
            try {
                URL url = new URL(pageUrl);
                anchor = url.getRef();
            } catch (MalformedURLException e) {
                anchor = null;
            }
        }
        Document elementById = anchor != null ? document.getElementById(anchor) : null;
        this.vcardElements = (elementById == null ? document : elementById).getElementsByClass("vcard");
        this.vcardElementsIt = this.vcardElements.iterator();
    }

    private HCardParser(Element embeddedVCard, String pageUrl) {
        this.labels = new ArrayList();
        this.embeddedVCards = new Elements();
        this.urlPropertyName = this.index.getPropertyScribe(Url.class).getPropertyName().toLowerCase();
        this.categoriesName = this.index.getPropertyScribe(Categories.class).getPropertyName().toLowerCase();
        this.emailName = this.index.getPropertyScribe(Email.class).getPropertyName().toLowerCase();
        this.telName = this.index.getPropertyScribe(Telephone.class).getPropertyName().toLowerCase();
        this.pageUrl = pageUrl;
        this.vcardElements = new Elements(new Element[]{embeddedVCard});
        this.vcardElementsIt = this.vcardElements.iterator();
    }

    @Override // ezvcard.io.StreamReader
    public VCard readNext() {
        try {
            return super.readNext();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override // ezvcard.io.StreamReader
    protected VCard _readNext() {
        if (!this.vcardElementsIt.hasNext()) {
            return null;
        }
        Element next = this.vcardElementsIt.next();
        while (true) {
            Element vcardElement = next;
            if (HtmlUtils.isChildOf(vcardElement, this.vcardElements)) {
                if (!this.vcardElementsIt.hasNext()) {
                    return null;
                }
                next = this.vcardElementsIt.next();
            } else {
                parseVCardElement(vcardElement);
                return this.vcard;
            }
        }
    }

    private void parseVCardElement(Element vcardElement) {
        this.labels.clear();
        this.nickname = null;
        this.categories = null;
        this.vcard = new VCard();
        this.vcard.setVersion(VCardVersion.V3_0);
        if (this.pageUrl != null) {
            this.vcard.addSource(this.pageUrl);
        }
        Iterator i$ = vcardElement.children().iterator();
        while (i$.hasNext()) {
            Element child = (Element) i$.next();
            visit(child);
        }
        assignLabels(this.vcard, this.labels);
    }

    /* JADX WARN: Removed duplicated region for block: B:104:0x0186 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:105:0x0174 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:40:0x014a A[Catch: SkipMeException -> 0x0207, CannotParseException -> 0x0224, EmbeddedVCardException -> 0x0259, LOOP:1: B:38:0x0140->B:40:0x014a, LOOP_END, TryCatch #4 {CannotParseException -> 0x0224, EmbeddedVCardException -> 0x0259, SkipMeException -> 0x0207, blocks: (B:37:0x0125, B:38:0x0140, B:40:0x014a, B:41:0x0165, B:43:0x0174, B:44:0x0186, B:46:0x018e, B:48:0x019c, B:49:0x01b0, B:51:0x01c5, B:53:0x01cd, B:55:0x01db, B:56:0x01ef), top: B:95:0x0125 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void visit(org.jsoup.nodes.Element r10) {
        /*
            Method dump skipped, instructions count: 854
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: ezvcard.io.html.HCardParser.visit(org.jsoup.nodes.Element):void");
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
    }
}
