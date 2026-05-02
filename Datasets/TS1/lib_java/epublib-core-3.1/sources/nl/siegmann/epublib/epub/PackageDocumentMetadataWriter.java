package nl.siegmann.epublib.epub;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.xml.namespace.QName;
import nl.siegmann.epublib.Constants;
import nl.siegmann.epublib.domain.Author;
import nl.siegmann.epublib.domain.Book;
import nl.siegmann.epublib.domain.Date;
import nl.siegmann.epublib.domain.Identifier;
import nl.siegmann.epublib.epub.PackageDocumentBase;
import nl.siegmann.epublib.util.StringUtil;
import org.xmlpull.v1.XmlSerializer;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/epub/PackageDocumentMetadataWriter.class */
public class PackageDocumentMetadataWriter extends PackageDocumentBase {
    public static void writeMetaData(Book book, XmlSerializer serializer) throws IllegalArgumentException, IllegalStateException, IOException {
        serializer.startTag(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.metadata);
        serializer.setPrefix(PackageDocumentBase.PREFIX_DUBLIN_CORE, PackageDocumentBase.NAMESPACE_DUBLIN_CORE);
        serializer.setPrefix(PackageDocumentBase.PREFIX_OPF, PackageDocumentBase.NAMESPACE_OPF);
        writeIdentifiers(book.getMetadata().getIdentifiers(), serializer);
        writeSimpleMetdataElements("title", book.getMetadata().getTitles(), serializer);
        writeSimpleMetdataElements(PackageDocumentBase.DCTags.subject, book.getMetadata().getSubjects(), serializer);
        writeSimpleMetdataElements(PackageDocumentBase.DCTags.description, book.getMetadata().getDescriptions(), serializer);
        writeSimpleMetdataElements(PackageDocumentBase.DCTags.publisher, book.getMetadata().getPublishers(), serializer);
        writeSimpleMetdataElements("type", book.getMetadata().getTypes(), serializer);
        writeSimpleMetdataElements(PackageDocumentBase.DCTags.rights, book.getMetadata().getRights(), serializer);
        for (Author author : book.getMetadata().getAuthors()) {
            serializer.startTag(PackageDocumentBase.NAMESPACE_DUBLIN_CORE, PackageDocumentBase.DCTags.creator);
            serializer.attribute(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFAttributes.role, author.getRelator().getCode());
            serializer.attribute(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFAttributes.file_as, author.getLastname() + ", " + author.getFirstname());
            serializer.text(author.getFirstname() + " " + author.getLastname());
            serializer.endTag(PackageDocumentBase.NAMESPACE_DUBLIN_CORE, PackageDocumentBase.DCTags.creator);
        }
        for (Author author2 : book.getMetadata().getContributors()) {
            serializer.startTag(PackageDocumentBase.NAMESPACE_DUBLIN_CORE, PackageDocumentBase.DCTags.contributor);
            serializer.attribute(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFAttributes.role, author2.getRelator().getCode());
            serializer.attribute(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFAttributes.file_as, author2.getLastname() + ", " + author2.getFirstname());
            serializer.text(author2.getFirstname() + " " + author2.getLastname());
            serializer.endTag(PackageDocumentBase.NAMESPACE_DUBLIN_CORE, PackageDocumentBase.DCTags.contributor);
        }
        for (Date date : book.getMetadata().getDates()) {
            serializer.startTag(PackageDocumentBase.NAMESPACE_DUBLIN_CORE, PackageDocumentBase.DCTags.date);
            if (date.getEvent() != null) {
                serializer.attribute(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFAttributes.event, date.getEvent().toString());
            }
            serializer.text(date.getValue());
            serializer.endTag(PackageDocumentBase.NAMESPACE_DUBLIN_CORE, PackageDocumentBase.DCTags.date);
        }
        if (StringUtil.isNotBlank(book.getMetadata().getLanguage())) {
            serializer.startTag(PackageDocumentBase.NAMESPACE_DUBLIN_CORE, PackageDocumentBase.DCTags.language);
            serializer.text(book.getMetadata().getLanguage());
            serializer.endTag(PackageDocumentBase.NAMESPACE_DUBLIN_CORE, PackageDocumentBase.DCTags.language);
        }
        if (book.getMetadata().getOtherProperties() != null) {
            for (Map.Entry<QName, String> mapEntry : book.getMetadata().getOtherProperties().entrySet()) {
                serializer.startTag(mapEntry.getKey().getNamespaceURI(), mapEntry.getKey().getLocalPart());
                serializer.text(mapEntry.getValue());
                serializer.endTag(mapEntry.getKey().getNamespaceURI(), mapEntry.getKey().getLocalPart());
            }
        }
        if (book.getCoverImage() != null) {
            serializer.startTag(PackageDocumentBase.NAMESPACE_OPF, "meta");
            serializer.attribute("", "name", "cover");
            serializer.attribute("", "content", book.getCoverImage().getId());
            serializer.endTag(PackageDocumentBase.NAMESPACE_OPF, "meta");
        }
        serializer.startTag(PackageDocumentBase.NAMESPACE_OPF, "meta");
        serializer.attribute("", "name", PackageDocumentBase.OPFValues.generator);
        serializer.attribute("", "content", Constants.EPUBLIB_GENERATOR_NAME);
        serializer.endTag(PackageDocumentBase.NAMESPACE_OPF, "meta");
        serializer.endTag(PackageDocumentBase.NAMESPACE_OPF, PackageDocumentBase.OPFTags.metadata);
    }

    private static void writeSimpleMetdataElements(String tagName, List<String> values, XmlSerializer serializer) throws IllegalArgumentException, IllegalStateException, IOException {
        for (String value : values) {
            if (!StringUtil.isBlank(value)) {
                serializer.startTag(PackageDocumentBase.NAMESPACE_DUBLIN_CORE, tagName);
                serializer.text(value);
                serializer.endTag(PackageDocumentBase.NAMESPACE_DUBLIN_CORE, tagName);
            }
        }
    }

    private static void writeIdentifiers(List<Identifier> identifiers, XmlSerializer serializer) throws IllegalArgumentException, IllegalStateException, IOException {
        Identifier bookIdIdentifier = Identifier.getBookIdIdentifier(identifiers);
        if (bookIdIdentifier == null) {
            return;
        }
        serializer.startTag(PackageDocumentBase.NAMESPACE_DUBLIN_CORE, PackageDocumentBase.DCTags.identifier);
        serializer.attribute("", "id", PackageDocumentBase.BOOK_ID_ID);
        serializer.attribute(PackageDocumentBase.NAMESPACE_OPF, "scheme", bookIdIdentifier.getScheme());
        serializer.text(bookIdIdentifier.getValue());
        serializer.endTag(PackageDocumentBase.NAMESPACE_DUBLIN_CORE, PackageDocumentBase.DCTags.identifier);
        for (Identifier identifier : identifiers.subList(1, identifiers.size())) {
            if (identifier != bookIdIdentifier) {
                serializer.startTag(PackageDocumentBase.NAMESPACE_DUBLIN_CORE, PackageDocumentBase.DCTags.identifier);
                serializer.attribute(PackageDocumentBase.NAMESPACE_OPF, "scheme", identifier.getScheme());
                serializer.text(identifier.getValue());
                serializer.endTag(PackageDocumentBase.NAMESPACE_DUBLIN_CORE, PackageDocumentBase.DCTags.identifier);
            }
        }
    }
}
