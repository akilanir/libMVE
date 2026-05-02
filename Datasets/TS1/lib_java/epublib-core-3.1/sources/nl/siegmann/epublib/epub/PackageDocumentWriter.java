package nl.siegmann.epublib.epub;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import nl.siegmann.epublib.Constants;
import nl.siegmann.epublib.domain.Book;
import nl.siegmann.epublib.domain.Guide;
import nl.siegmann.epublib.domain.GuideReference;
import nl.siegmann.epublib.domain.Resource;
import nl.siegmann.epublib.domain.Spine;
import nl.siegmann.epublib.domain.SpineReference;
import nl.siegmann.epublib.epub.PackageDocumentBase;
import nl.siegmann.epublib.service.MediatypeService;
import nl.siegmann.epublib.util.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.xmlpull.v1.XmlSerializer;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/epub/PackageDocumentWriter.class */
public class PackageDocumentWriter extends PackageDocumentBase {
    private static final Logger log = LoggerFactory.getLogger(PackageDocumentWriter.class);

    public static void write(EpubWriter epubWriter, XmlSerializer serializer, Book book) throws IOException {
        try {
            serializer.startDocument(Constants.CHARACTER_ENCODING, false);
            serializer.setPrefix(PackageDocumentBase.PREFIX_OPF, PackageDocumentBase.NAMESPACE_OPF);
            serializer.setPrefix(PackageDocumentBase.PREFIX_DUBLIN_CORE, PackageDocumentBase.NAMESPACE_DUBLIN_CORE);
            serializer.startTag(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.packageTag);
            serializer.attribute("", "version", "2.0");
            serializer.attribute("", PackageDocumentBase.OPFAttributes.uniqueIdentifier, PackageDocumentBase.BOOK_ID_ID);
            PackageDocumentMetadataWriter.writeMetaData(book, serializer);
            writeManifest(book, epubWriter, serializer);
            writeSpine(book, epubWriter, serializer);
            writeGuide(book, epubWriter, serializer);
            serializer.endTag(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.packageTag);
            serializer.endDocument();
            serializer.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void writeSpine(Book book, EpubWriter epubWriter, XmlSerializer serializer) throws IllegalArgumentException, IllegalStateException, IOException {
        serializer.startTag(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.spine);
        serializer.attribute("", "toc", book.getSpine().getTocResource().getId());
        if (book.getCoverPage() != null && book.getSpine().findFirstResourceById(book.getCoverPage().getId()) < 0) {
            serializer.startTag(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.itemref);
            serializer.attribute("", PackageDocumentBase.OPFAttributes.idref, book.getCoverPage().getId());
            serializer.attribute("", PackageDocumentBase.OPFAttributes.linear, PackageDocumentBase.OPFValues.no);
            serializer.endTag(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.itemref);
        }
        writeSpineItems(book.getSpine(), serializer);
        serializer.endTag(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.spine);
    }

    private static void writeManifest(Book book, EpubWriter epubWriter, XmlSerializer serializer) throws IllegalArgumentException, IllegalStateException, IOException {
        serializer.startTag(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.manifest);
        serializer.startTag(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.item);
        serializer.attribute("", "id", epubWriter.getNcxId());
        serializer.attribute("", PackageDocumentBase.OPFAttributes.href, epubWriter.getNcxHref());
        serializer.attribute("", PackageDocumentBase.OPFAttributes.media_type, epubWriter.getNcxMediaType());
        serializer.endTag(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.item);
        for (Resource resource : getAllResourcesSortById(book)) {
            writeItem(book, resource, serializer);
        }
        serializer.endTag(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.manifest);
    }

    private static List<Resource> getAllResourcesSortById(Book book) {
        List<Resource> allResources = new ArrayList<>(book.getResources().getAll());
        Collections.sort(allResources, new Comparator<Resource>() { // from class: nl.siegmann.epublib.epub.PackageDocumentWriter.1
            @Override // java.util.Comparator
            public int compare(Resource resource1, Resource resource2) {
                return resource1.getId().compareToIgnoreCase(resource2.getId());
            }
        });
        return allResources;
    }

    private static void writeItem(Book book, Resource resource, XmlSerializer serializer) throws IllegalArgumentException, IllegalStateException, IOException {
        if (resource != null) {
            if (resource.getMediaType() == MediatypeService.NCX && book.getSpine().getTocResource() != null) {
                return;
            }
            if (StringUtil.isBlank(resource.getId())) {
                log.error("resource id must not be empty (href: " + resource.getHref() + ", mediatype:" + resource.getMediaType() + ")");
                return;
            }
            if (StringUtil.isBlank(resource.getHref())) {
                log.error("resource href must not be empty (id: " + resource.getId() + ", mediatype:" + resource.getMediaType() + ")");
                return;
            }
            if (resource.getMediaType() == null) {
                log.error("resource mediatype must not be empty (id: " + resource.getId() + ", href:" + resource.getHref() + ")");
                return;
            }
            serializer.startTag(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.item);
            serializer.attribute("", "id", resource.getId());
            serializer.attribute("", PackageDocumentBase.OPFAttributes.href, resource.getHref());
            serializer.attribute("", PackageDocumentBase.OPFAttributes.media_type, resource.getMediaType().getName());
            serializer.endTag(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.item);
        }
    }

    private static void writeSpineItems(Spine spine, XmlSerializer serializer) throws IllegalArgumentException, IllegalStateException, IOException {
        for (SpineReference spineReference : spine.getSpineReferences()) {
            serializer.startTag(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.itemref);
            serializer.attribute("", PackageDocumentBase.OPFAttributes.idref, spineReference.getResourceId());
            if (!spineReference.isLinear()) {
                serializer.attribute("", PackageDocumentBase.OPFAttributes.linear, PackageDocumentBase.OPFValues.no);
            }
            serializer.endTag(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.itemref);
        }
    }

    private static void writeGuide(Book book, EpubWriter epubWriter, XmlSerializer serializer) throws IllegalArgumentException, IllegalStateException, IOException {
        serializer.startTag(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.guide);
        ensureCoverPageGuideReferenceWritten(book.getGuide(), epubWriter, serializer);
        for (GuideReference reference : book.getGuide().getReferences()) {
            writeGuideReference(reference, serializer);
        }
        serializer.endTag(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.guide);
    }

    private static void ensureCoverPageGuideReferenceWritten(Guide guide, EpubWriter epubWriter, XmlSerializer serializer) throws IllegalArgumentException, IllegalStateException, IOException {
        if (!guide.getGuideReferencesByType(GuideReference.COVER).isEmpty()) {
            return;
        }
        Resource coverPage = guide.getCoverPage();
        if (coverPage != null) {
            writeGuideReference(new GuideReference(guide.getCoverPage(), GuideReference.COVER, GuideReference.COVER), serializer);
        }
    }

    private static void writeGuideReference(GuideReference reference, XmlSerializer serializer) throws IllegalArgumentException, IllegalStateException, IOException {
        if (reference == null) {
            return;
        }
        serializer.startTag(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.reference);
        serializer.attribute("", "type", reference.getType());
        serializer.attribute("", PackageDocumentBase.OPFAttributes.href, reference.getCompleteHref());
        if (StringUtil.isNotBlank(reference.getTitle())) {
            serializer.attribute("", "title", reference.getTitle());
        }
        serializer.endTag(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.reference);
    }
}
