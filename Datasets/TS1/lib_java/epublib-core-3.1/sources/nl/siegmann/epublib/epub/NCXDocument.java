package nl.siegmann.epublib.epub;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import nl.siegmann.epublib.Constants;
import nl.siegmann.epublib.domain.Author;
import nl.siegmann.epublib.domain.Book;
import nl.siegmann.epublib.domain.Identifier;
import nl.siegmann.epublib.domain.Resource;
import nl.siegmann.epublib.domain.TOCReference;
import nl.siegmann.epublib.domain.TableOfContents;
import nl.siegmann.epublib.epub.PackageDocumentBase;
import nl.siegmann.epublib.service.MediatypeService;
import nl.siegmann.epublib.util.ResourceUtil;
import nl.siegmann.epublib.util.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xmlpull.v1.XmlSerializer;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/epub/NCXDocument.class */
public class NCXDocument {
    public static final String NAMESPACE_NCX = "http://www.daisy.org/z3986/2005/ncx/";
    public static final String PREFIX_NCX = "ncx";
    public static final String NCX_ITEM_ID = "ncx";
    public static final String DEFAULT_NCX_HREF = "toc.ncx";
    public static final String PREFIX_DTB = "dtb";
    private static final Logger log = LoggerFactory.getLogger(NCXDocument.class);

    /* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/epub/NCXDocument$NCXAttributeValues.class */
    private interface NCXAttributeValues {
        public static final String chapter = "chapter";
        public static final String version = "2005-1";
    }

    /* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/epub/NCXDocument$NCXAttributes.class */
    private interface NCXAttributes {
        public static final String src = "src";
        public static final String name = "name";
        public static final String content = "content";
        public static final String id = "id";
        public static final String playOrder = "playOrder";
        public static final String clazz = "class";
        public static final String version = "version";
    }

    /* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/epub/NCXDocument$NCXTags.class */
    private interface NCXTags {
        public static final String ncx = "ncx";
        public static final String meta = "meta";
        public static final String navPoint = "navPoint";
        public static final String navMap = "navMap";
        public static final String navLabel = "navLabel";
        public static final String content = "content";
        public static final String text = "text";
        public static final String docTitle = "docTitle";
        public static final String docAuthor = "docAuthor";
        public static final String head = "head";
    }

    public static Resource read(Book book, EpubReader epubReader) {
        Resource ncxResource = null;
        if (book.getSpine().getTocResource() == null) {
            log.error("Book does not contain a table of contents file");
            return null;
        }
        try {
            ncxResource = book.getSpine().getTocResource();
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        if (ncxResource == null) {
            return ncxResource;
        }
        Document ncxDocument = ResourceUtil.getAsDocument(ncxResource);
        Element navMapElement = DOMUtil.getFirstElementByTagNameNS(ncxDocument.getDocumentElement(), NAMESPACE_NCX, NCXTags.navMap);
        TableOfContents tableOfContents = new TableOfContents(readTOCReferences(navMapElement.getChildNodes(), book));
        book.setTableOfContents(tableOfContents);
        return ncxResource;
    }

    private static List<TOCReference> readTOCReferences(NodeList navpoints, Book book) {
        if (navpoints == null) {
            return new ArrayList();
        }
        List<TOCReference> result = new ArrayList<>(navpoints.getLength());
        for (int i = 0; i < navpoints.getLength(); i++) {
            Node node = navpoints.item(i);
            if (node.getNodeType() == 1 && node.getLocalName().equals(NCXTags.navPoint)) {
                TOCReference tocReference = readTOCReference((Element) node, book);
                result.add(tocReference);
            }
        }
        return result;
    }

    private static TOCReference readTOCReference(Element navpointElement, Book book) {
        String label = readNavLabel(navpointElement);
        String reference = readNavReference(navpointElement);
        String href = StringUtil.substringBefore(reference, '#');
        String fragmentId = StringUtil.substringAfter(reference, '#');
        Resource resource = book.getResources().getByHref(href);
        if (resource == null) {
            log.error("Resource with href " + href + " in NCX document not found");
        }
        TOCReference result = new TOCReference(label, resource, fragmentId);
        readTOCReferences(navpointElement.getChildNodes(), book);
        result.setChildren(readTOCReferences(navpointElement.getChildNodes(), book));
        return result;
    }

    private static String readNavReference(Element navpointElement) {
        Element contentElement = DOMUtil.getFirstElementByTagNameNS(navpointElement, NAMESPACE_NCX, "content");
        String result = DOMUtil.getAttribute(contentElement, NAMESPACE_NCX, NCXAttributes.src);
        try {
            result = URLDecoder.decode(result, Constants.CHARACTER_ENCODING);
        } catch (UnsupportedEncodingException e) {
            log.error(e.getMessage());
        }
        return result;
    }

    private static String readNavLabel(Element navpointElement) {
        Element navLabel = DOMUtil.getFirstElementByTagNameNS(navpointElement, NAMESPACE_NCX, NCXTags.navLabel);
        return DOMUtil.getTextChildrenContent(DOMUtil.getFirstElementByTagNameNS(navLabel, NAMESPACE_NCX, NCXTags.text));
    }

    public static void write(EpubWriter epubWriter, Book book, ZipOutputStream resultStream) throws IOException {
        resultStream.putNextEntry(new ZipEntry(book.getSpine().getTocResource().getHref()));
        XmlSerializer out = EpubProcessorSupport.createXmlSerializer(resultStream);
        write(out, book);
        out.flush();
    }

    public static void write(XmlSerializer xmlSerializer, Book book) throws IllegalArgumentException, IllegalStateException, IOException {
        write(xmlSerializer, book.getMetadata().getIdentifiers(), book.getTitle(), book.getMetadata().getAuthors(), book.getTableOfContents());
    }

    public static Resource createNCXResource(Book book) throws IllegalArgumentException, IllegalStateException, IOException {
        return createNCXResource(book.getMetadata().getIdentifiers(), book.getTitle(), book.getMetadata().getAuthors(), book.getTableOfContents());
    }

    public static Resource createNCXResource(List<Identifier> identifiers, String title, List<Author> authors, TableOfContents tableOfContents) throws IllegalArgumentException, IllegalStateException, IOException {
        ByteArrayOutputStream data = new ByteArrayOutputStream();
        XmlSerializer out = EpubProcessorSupport.createXmlSerializer(data);
        write(out, identifiers, title, authors, tableOfContents);
        Resource resource = new Resource("ncx", data.toByteArray(), DEFAULT_NCX_HREF, MediatypeService.NCX);
        return resource;
    }

    public static void write(XmlSerializer serializer, List<Identifier> identifiers, String title, List<Author> authors, TableOfContents tableOfContents) throws IllegalArgumentException, IllegalStateException, IOException {
        serializer.startDocument(Constants.CHARACTER_ENCODING, false);
        serializer.setPrefix("", NAMESPACE_NCX);
        serializer.startTag(NAMESPACE_NCX, "ncx");
        serializer.attribute("", "version", NCXAttributeValues.version);
        serializer.startTag(NAMESPACE_NCX, NCXTags.head);
        for (Identifier identifier : identifiers) {
            writeMetaElement(identifier.getScheme(), identifier.getValue(), serializer);
        }
        writeMetaElement(PackageDocumentBase.OPFValues.generator, Constants.EPUBLIB_GENERATOR_NAME, serializer);
        writeMetaElement("depth", String.valueOf(tableOfContents.calculateDepth()), serializer);
        writeMetaElement("totalPageCount", "0", serializer);
        writeMetaElement("maxPageNumber", "0", serializer);
        serializer.endTag(NAMESPACE_NCX, NCXTags.head);
        serializer.startTag(NAMESPACE_NCX, NCXTags.docTitle);
        serializer.startTag(NAMESPACE_NCX, NCXTags.text);
        serializer.text(StringUtil.defaultIfNull(title));
        serializer.endTag(NAMESPACE_NCX, NCXTags.text);
        serializer.endTag(NAMESPACE_NCX, NCXTags.docTitle);
        for (Author author : authors) {
            serializer.startTag(NAMESPACE_NCX, NCXTags.docAuthor);
            serializer.startTag(NAMESPACE_NCX, NCXTags.text);
            serializer.text(author.getLastname() + ", " + author.getFirstname());
            serializer.endTag(NAMESPACE_NCX, NCXTags.text);
            serializer.endTag(NAMESPACE_NCX, NCXTags.docAuthor);
        }
        serializer.startTag(NAMESPACE_NCX, NCXTags.navMap);
        writeNavPoints(tableOfContents.getTocReferences(), 1, serializer);
        serializer.endTag(NAMESPACE_NCX, NCXTags.navMap);
        serializer.endTag(NAMESPACE_NCX, "ncx");
        serializer.endDocument();
    }

    private static void writeMetaElement(String dtbName, String content, XmlSerializer serializer) throws IllegalArgumentException, IllegalStateException, IOException {
        serializer.startTag(NAMESPACE_NCX, "meta");
        serializer.attribute("", "name", "dtb:" + dtbName);
        serializer.attribute("", "content", content);
        serializer.endTag(NAMESPACE_NCX, "meta");
    }

    private static int writeNavPoints(List<TOCReference> tocReferences, int playOrder, XmlSerializer serializer) throws IllegalArgumentException, IllegalStateException, IOException {
        for (TOCReference tocReference : tocReferences) {
            if (tocReference.getResource() == null) {
                playOrder = writeNavPoints(tocReference.getChildren(), playOrder, serializer);
            } else {
                writeNavPointStart(tocReference, playOrder, serializer);
                playOrder++;
                if (!tocReference.getChildren().isEmpty()) {
                    playOrder = writeNavPoints(tocReference.getChildren(), playOrder, serializer);
                }
                writeNavPointEnd(tocReference, serializer);
            }
        }
        return playOrder;
    }

    private static void writeNavPointStart(TOCReference tocReference, int playOrder, XmlSerializer serializer) throws IllegalArgumentException, IllegalStateException, IOException {
        serializer.startTag(NAMESPACE_NCX, NCXTags.navPoint);
        serializer.attribute("", "id", "navPoint-" + playOrder);
        serializer.attribute("", NCXAttributes.playOrder, String.valueOf(playOrder));
        serializer.attribute("", NCXAttributes.clazz, NCXAttributeValues.chapter);
        serializer.startTag(NAMESPACE_NCX, NCXTags.navLabel);
        serializer.startTag(NAMESPACE_NCX, NCXTags.text);
        serializer.text(tocReference.getTitle());
        serializer.endTag(NAMESPACE_NCX, NCXTags.text);
        serializer.endTag(NAMESPACE_NCX, NCXTags.navLabel);
        serializer.startTag(NAMESPACE_NCX, "content");
        serializer.attribute("", NCXAttributes.src, tocReference.getCompleteHref());
        serializer.endTag(NAMESPACE_NCX, "content");
    }

    private static void writeNavPointEnd(TOCReference tocReference, XmlSerializer serializer) throws IllegalArgumentException, IllegalStateException, IOException {
        serializer.endTag(NAMESPACE_NCX, NCXTags.navPoint);
    }
}
