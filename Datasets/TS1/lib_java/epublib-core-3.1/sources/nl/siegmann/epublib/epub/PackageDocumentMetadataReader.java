package nl.siegmann.epublib.epub;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.xml.namespace.QName;
import nl.siegmann.epublib.domain.Author;
import nl.siegmann.epublib.domain.Date;
import nl.siegmann.epublib.domain.Identifier;
import nl.siegmann.epublib.domain.Metadata;
import nl.siegmann.epublib.domain.Resources;
import nl.siegmann.epublib.epub.PackageDocumentBase;
import nl.siegmann.epublib.util.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/epub/PackageDocumentMetadataReader.class */
class PackageDocumentMetadataReader extends PackageDocumentBase {
    private static final Logger log = LoggerFactory.getLogger(PackageDocumentMetadataReader.class);

    PackageDocumentMetadataReader() {
    }

    public static Metadata readMetadata(Document packageDocument, Resources resources) {
        Metadata result = new Metadata();
        Element metadataElement = DOMUtil.getFirstElementByTagNameNS(packageDocument.getDocumentElement(), PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.metadata);
        if (metadataElement == null) {
            log.error("Package does not contain element metadata");
            return result;
        }
        result.setTitles(DOMUtil.getElementsTextChild(metadataElement, PackageDocumentBase.NAMESPACE_DUBLIN_CORE, "title"));
        result.setPublishers(DOMUtil.getElementsTextChild(metadataElement, PackageDocumentBase.NAMESPACE_DUBLIN_CORE, PackageDocumentBase.DCTags.publisher));
        result.setDescriptions(DOMUtil.getElementsTextChild(metadataElement, PackageDocumentBase.NAMESPACE_DUBLIN_CORE, PackageDocumentBase.DCTags.description));
        result.setRights(DOMUtil.getElementsTextChild(metadataElement, PackageDocumentBase.NAMESPACE_DUBLIN_CORE, PackageDocumentBase.DCTags.rights));
        result.setTypes(DOMUtil.getElementsTextChild(metadataElement, PackageDocumentBase.NAMESPACE_DUBLIN_CORE, "type"));
        result.setSubjects(DOMUtil.getElementsTextChild(metadataElement, PackageDocumentBase.NAMESPACE_DUBLIN_CORE, PackageDocumentBase.DCTags.subject));
        result.setIdentifiers(readIdentifiers(metadataElement));
        result.setAuthors(readCreators(metadataElement));
        result.setContributors(readContributors(metadataElement));
        result.setDates(readDates(metadataElement));
        result.setOtherProperties(readOtherProperties(metadataElement));
        Element languageTag = DOMUtil.getFirstElementByTagNameNS(metadataElement, PackageDocumentBase.NAMESPACE_DUBLIN_CORE, PackageDocumentBase.DCTags.language);
        if (languageTag != null) {
            result.setLanguage(DOMUtil.getTextChildrenContent(languageTag));
        }
        return result;
    }

    private static Map<QName, String> readOtherProperties(Element metadataElement) {
        Map<QName, String> result = new HashMap<>();
        NodeList metaTags = metadataElement.getElementsByTagNameNS(PackageDocumentBase.NAMESPACE_OPF, "meta");
        for (int i = 0; i < metaTags.getLength(); i++) {
            Node metaNode = metaTags.item(i);
            Node property = metaNode.getAttributes().getNamedItem(PackageDocumentBase.OPFAttributes.property);
            if (property != null) {
                String name = property.getNodeValue();
                String value = metaNode.getTextContent();
                result.put(new QName(name), value);
            }
        }
        return result;
    }

    private static String getBookIdId(Document document) {
        Element packageElement = DOMUtil.getFirstElementByTagNameNS(document.getDocumentElement(), PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.packageTag);
        if (packageElement == null) {
            return null;
        }
        String result = packageElement.getAttributeNS(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFAttributes.uniqueIdentifier);
        return result;
    }

    private static List<Author> readCreators(Element metadataElement) {
        return readAuthors(PackageDocumentBase.DCTags.creator, metadataElement);
    }

    private static List<Author> readContributors(Element metadataElement) {
        return readAuthors(PackageDocumentBase.DCTags.contributor, metadataElement);
    }

    private static List<Author> readAuthors(String authorTag, Element metadataElement) {
        NodeList elements = metadataElement.getElementsByTagNameNS(PackageDocumentBase.NAMESPACE_DUBLIN_CORE, authorTag);
        List<Author> result = new ArrayList<>(elements.getLength());
        for (int i = 0; i < elements.getLength(); i++) {
            Element authorElement = (Element) elements.item(i);
            Author author = createAuthor(authorElement);
            if (author != null) {
                result.add(author);
            }
        }
        return result;
    }

    private static List<Date> readDates(Element metadataElement) {
        NodeList elements = metadataElement.getElementsByTagNameNS(PackageDocumentBase.NAMESPACE_DUBLIN_CORE, PackageDocumentBase.DCTags.date);
        List<Date> result = new ArrayList<>(elements.getLength());
        for (int i = 0; i < elements.getLength(); i++) {
            Element dateElement = (Element) elements.item(i);
            try {
                Date date = new Date(DOMUtil.getTextChildrenContent(dateElement), dateElement.getAttributeNS(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFAttributes.event));
                result.add(date);
            } catch (IllegalArgumentException e) {
                log.error(e.getMessage());
            }
        }
        return result;
    }

    private static Author createAuthor(Element authorElement) {
        Author result;
        String authorString = DOMUtil.getTextChildrenContent(authorElement);
        if (StringUtil.isBlank(authorString)) {
            return null;
        }
        int spacePos = authorString.lastIndexOf(32);
        if (spacePos < 0) {
            result = new Author(authorString);
        } else {
            result = new Author(authorString.substring(0, spacePos), authorString.substring(spacePos + 1));
        }
        result.setRole(authorElement.getAttributeNS(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFAttributes.role));
        return result;
    }

    private static List<Identifier> readIdentifiers(Element metadataElement) {
        NodeList identifierElements = metadataElement.getElementsByTagNameNS(PackageDocumentBase.NAMESPACE_DUBLIN_CORE, PackageDocumentBase.DCTags.identifier);
        if (identifierElements.getLength() == 0) {
            log.error("Package does not contain element identifier");
            return new ArrayList();
        }
        String bookIdId = getBookIdId(metadataElement.getOwnerDocument());
        List<Identifier> result = new ArrayList<>(identifierElements.getLength());
        for (int i = 0; i < identifierElements.getLength(); i++) {
            Element identifierElement = (Element) identifierElements.item(i);
            String schemeName = identifierElement.getAttributeNS(PackageDocumentBase.NAMESPACE_OPF, "scheme");
            String identifierValue = DOMUtil.getTextChildrenContent(identifierElement);
            if (!StringUtil.isBlank(identifierValue)) {
                Identifier identifier = new Identifier(schemeName, identifierValue);
                if (identifierElement.getAttribute("id").equals(bookIdId)) {
                    identifier.setBookId(true);
                }
                result.add(identifier);
            }
        }
        return result;
    }
}
