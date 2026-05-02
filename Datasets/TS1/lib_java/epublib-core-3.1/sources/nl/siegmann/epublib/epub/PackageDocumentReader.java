package nl.siegmann.epublib.epub;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.xml.parsers.ParserConfigurationException;
import nl.siegmann.epublib.Constants;
import nl.siegmann.epublib.domain.Book;
import nl.siegmann.epublib.domain.Guide;
import nl.siegmann.epublib.domain.GuideReference;
import nl.siegmann.epublib.domain.MediaType;
import nl.siegmann.epublib.domain.Resource;
import nl.siegmann.epublib.domain.Resources;
import nl.siegmann.epublib.domain.Spine;
import nl.siegmann.epublib.domain.SpineReference;
import nl.siegmann.epublib.epub.PackageDocumentBase;
import nl.siegmann.epublib.service.MediatypeService;
import nl.siegmann.epublib.util.ResourceUtil;
import nl.siegmann.epublib.util.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/epub/PackageDocumentReader.class */
public class PackageDocumentReader extends PackageDocumentBase {
    private static final Logger log = LoggerFactory.getLogger(PackageDocumentReader.class);
    private static final String[] POSSIBLE_NCX_ITEM_IDS = {"toc", "ncx"};

    public static void read(Resource packageResource, EpubReader epubReader, Book book, Resources resources) throws UnsupportedEncodingException, SAXException, IOException, ParserConfigurationException {
        Document packageDocument = ResourceUtil.getAsDocument(packageResource);
        String packageHref = packageResource.getHref();
        Resources resources2 = fixHrefs(packageHref, resources);
        readGuide(packageDocument, epubReader, book, resources2);
        Map<String, String> idMapping = new HashMap<>();
        book.setResources(readManifest(packageDocument, packageHref, epubReader, resources2, idMapping));
        readCover(packageDocument, book);
        book.setMetadata(PackageDocumentMetadataReader.readMetadata(packageDocument, book.getResources()));
        book.setSpine(readSpine(packageDocument, epubReader, book.getResources(), idMapping));
        if (book.getCoverPage() == null && book.getSpine().size() > 0) {
            book.setCoverPage(book.getSpine().getResource(0));
        }
    }

    private static Resources readManifest(Document packageDocument, String packageHref, EpubReader epubReader, Resources resources, Map<String, String> idMapping) {
        Element manifestElement = DOMUtil.getFirstElementByTagNameNS(packageDocument.getDocumentElement(), PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.manifest);
        Resources result = new Resources();
        if (manifestElement == null) {
            log.error("Package document does not contain element manifest");
            return result;
        }
        NodeList itemElements = manifestElement.getElementsByTagNameNS(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.item);
        for (int i = 0; i < itemElements.getLength(); i++) {
            Element itemElement = (Element) itemElements.item(i);
            String id = DOMUtil.getAttribute(itemElement, PackageDocumentBase.NAMESPACE_OPF, "id");
            String href = DOMUtil.getAttribute(itemElement, PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFAttributes.href);
            try {
                href = URLDecoder.decode(href, Constants.CHARACTER_ENCODING);
            } catch (UnsupportedEncodingException e) {
                log.error(e.getMessage());
            }
            String mediaTypeName = DOMUtil.getAttribute(itemElement, PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFAttributes.media_type);
            Resource resource = resources.remove(href);
            if (resource == null) {
                log.error("resource with href '" + href + "' not found");
            } else {
                resource.setId(id);
                MediaType mediaType = MediatypeService.getMediaTypeByName(mediaTypeName);
                if (mediaType != null) {
                    resource.setMediaType(mediaType);
                }
                result.add(resource);
                idMapping.put(id, resource.getId());
            }
        }
        return result;
    }

    private static void readGuide(Document packageDocument, EpubReader epubReader, Book book, Resources resources) {
        Element guideElement = DOMUtil.getFirstElementByTagNameNS(packageDocument.getDocumentElement(), PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.guide);
        if (guideElement == null) {
            return;
        }
        Guide guide = book.getGuide();
        NodeList guideReferences = guideElement.getElementsByTagNameNS(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.reference);
        for (int i = 0; i < guideReferences.getLength(); i++) {
            Element referenceElement = (Element) guideReferences.item(i);
            String resourceHref = DOMUtil.getAttribute(referenceElement, PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFAttributes.href);
            if (!StringUtil.isBlank(resourceHref)) {
                Resource resource = resources.getByHref(StringUtil.substringBefore(resourceHref, '#'));
                if (resource == null) {
                    log.error("Guide is referencing resource with href " + resourceHref + " which could not be found");
                } else {
                    String type = DOMUtil.getAttribute(referenceElement, PackageDocumentBase.NAMESPACE_OPF, "type");
                    if (StringUtil.isBlank(type)) {
                        log.error("Guide is referencing resource with href " + resourceHref + " which is missing the 'type' attribute");
                    } else {
                        String title = DOMUtil.getAttribute(referenceElement, PackageDocumentBase.NAMESPACE_OPF, "title");
                        if (!GuideReference.COVER.equalsIgnoreCase(type)) {
                            GuideReference reference = new GuideReference(resource, type, title, StringUtil.substringAfter(resourceHref, '#'));
                            guide.addReference(reference);
                        }
                    }
                }
            }
        }
    }

    private static Resources fixHrefs(String packageHref, Resources resourcesByHref) {
        int lastSlashPos = packageHref.lastIndexOf(47);
        if (lastSlashPos < 0) {
            return resourcesByHref;
        }
        Resources result = new Resources();
        for (Resource resource : resourcesByHref.getAll()) {
            if (StringUtil.isNotBlank(resource.getHref()) || resource.getHref().length() > lastSlashPos) {
                resource.setHref(resource.getHref().substring(lastSlashPos + 1));
            }
            result.add(resource);
        }
        return result;
    }

    private static Spine readSpine(Document packageDocument, EpubReader epubReader, Resources resources, Map<String, String> idMapping) {
        Element spineElement = DOMUtil.getFirstElementByTagNameNS(packageDocument.getDocumentElement(), PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.spine);
        if (spineElement == null) {
            log.error("Element spine not found in package document, generating one automatically");
            return generateSpineFromResources(resources);
        }
        Spine result = new Spine();
        result.setTocResource(findTableOfContentsResource(spineElement, resources));
        NodeList spineNodes = packageDocument.getElementsByTagNameNS(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.itemref);
        List<SpineReference> spineReferences = new ArrayList<>(spineNodes.getLength());
        for (int i = 0; i < spineNodes.getLength(); i++) {
            Element spineItem = (Element) spineNodes.item(i);
            String itemref = DOMUtil.getAttribute(spineItem, PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFAttributes.idref);
            if (StringUtil.isBlank(itemref)) {
                log.error("itemref with missing or empty idref");
            } else {
                String id = idMapping.get(itemref);
                if (id == null) {
                    id = itemref;
                }
                Resource resource = resources.getByIdOrHref(id);
                if (resource == null) {
                    log.error("resource with id '" + id + "' not found");
                } else {
                    SpineReference spineReference = new SpineReference(resource);
                    if (PackageDocumentBase.OPFValues.no.equalsIgnoreCase(DOMUtil.getAttribute(spineItem, PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFAttributes.linear))) {
                        spineReference.setLinear(false);
                    }
                    spineReferences.add(spineReference);
                }
            }
        }
        result.setSpineReferences(spineReferences);
        return result;
    }

    private static Spine generateSpineFromResources(Resources resources) {
        Spine result = new Spine();
        List<String> resourceHrefs = new ArrayList<>();
        resourceHrefs.addAll(resources.getAllHrefs());
        Collections.sort(resourceHrefs, String.CASE_INSENSITIVE_ORDER);
        for (String resourceHref : resourceHrefs) {
            Resource resource = resources.getByHref(resourceHref);
            if (resource.getMediaType() == MediatypeService.NCX) {
                result.setTocResource(resource);
            } else if (resource.getMediaType() == MediatypeService.XHTML) {
                result.addSpineReference(new SpineReference(resource));
            }
        }
        return result;
    }

    private static Resource findTableOfContentsResource(Element spineElement, Resources resources) {
        String tocResourceId = DOMUtil.getAttribute(spineElement, PackageDocumentBase.NAMESPACE_OPF, "toc");
        Resource tocResource = null;
        if (StringUtil.isNotBlank(tocResourceId)) {
            tocResource = resources.getByIdOrHref(tocResourceId);
        }
        if (tocResource != null) {
            return tocResource;
        }
        for (int i = 0; i < POSSIBLE_NCX_ITEM_IDS.length; i++) {
            Resource tocResource2 = resources.getByIdOrHref(POSSIBLE_NCX_ITEM_IDS[i]);
            if (tocResource2 != null) {
                return tocResource2;
            }
            Resource tocResource3 = resources.getByIdOrHref(POSSIBLE_NCX_ITEM_IDS[i].toUpperCase());
            if (tocResource3 != null) {
                return tocResource3;
            }
        }
        Resource tocResource4 = resources.findFirstResourceByMediaType(MediatypeService.NCX);
        if (tocResource4 == null) {
            log.error("Could not find table of contents resource. Tried resource with id '" + tocResourceId + "', toc, " + "toc".toUpperCase() + " and any NCX resource.");
        }
        return tocResource4;
    }

    static Set<String> findCoverHrefs(Document packageDocument) {
        Set<String> result = new HashSet<>();
        String coverResourceId = DOMUtil.getFindAttributeValue(packageDocument, PackageDocumentBase.NAMESPACE_OPF, "meta", "name", "cover", "content");
        if (StringUtil.isNotBlank(coverResourceId)) {
            String coverHref = DOMUtil.getFindAttributeValue(packageDocument, PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.item, "id", coverResourceId, PackageDocumentBase.OPFAttributes.href);
            if (StringUtil.isNotBlank(coverHref)) {
                result.add(coverHref);
            } else {
                result.add(coverResourceId);
            }
        }
        String coverHref2 = DOMUtil.getFindAttributeValue(packageDocument, PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.reference, "type", "cover", PackageDocumentBase.OPFAttributes.href);
        if (StringUtil.isNotBlank(coverHref2)) {
            result.add(coverHref2);
        }
        return result;
    }

    private static void readCover(Document packageDocument, Book book) {
        Collection<String> coverHrefs = findCoverHrefs(packageDocument);
        for (String coverHref : coverHrefs) {
            Resource resource = book.getResources().getByHref(coverHref);
            if (resource == null) {
                log.error("Cover resource " + coverHref + " not found");
            } else if (resource.getMediaType() == MediatypeService.XHTML) {
                book.setCoverPage(resource);
            } else if (MediatypeService.isBitmapImage(resource.getMediaType())) {
                book.setCoverImage(resource);
            }
        }
    }
}
