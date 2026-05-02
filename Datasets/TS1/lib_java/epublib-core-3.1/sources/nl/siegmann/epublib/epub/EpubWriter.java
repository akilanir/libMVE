package nl.siegmann.epublib.epub;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.zip.CRC32;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import nl.siegmann.epublib.domain.Book;
import nl.siegmann.epublib.domain.Resource;
import nl.siegmann.epublib.service.MediatypeService;
import nl.siegmann.epublib.util.IOUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.xmlpull.v1.XmlSerializer;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/epub/EpubWriter.class */
public class EpubWriter {
    private static final Logger log = LoggerFactory.getLogger(EpubWriter.class);
    static final String EMPTY_NAMESPACE_PREFIX = "";
    private BookProcessor bookProcessor;

    public EpubWriter() {
        this(BookProcessor.IDENTITY_BOOKPROCESSOR);
    }

    public EpubWriter(BookProcessor bookProcessor) {
        this.bookProcessor = BookProcessor.IDENTITY_BOOKPROCESSOR;
        this.bookProcessor = bookProcessor;
    }

    public void write(Book book, OutputStream out) throws IOException {
        Book book2 = processBook(book);
        ZipOutputStream resultStream = new ZipOutputStream(out);
        writeMimeType(resultStream);
        writeContainer(resultStream);
        initTOCResource(book2);
        writeResources(book2, resultStream);
        writePackageDocument(book2, resultStream);
        resultStream.close();
    }

    private Book processBook(Book book) {
        if (this.bookProcessor != null) {
            book = this.bookProcessor.processBook(book);
        }
        return book;
    }

    private void initTOCResource(Book book) {
        try {
            Resource tocResource = NCXDocument.createNCXResource(book);
            Resource currentTocResource = book.getSpine().getTocResource();
            if (currentTocResource != null) {
                book.getResources().remove(currentTocResource.getHref());
            }
            book.getSpine().setTocResource(tocResource);
            book.getResources().add(tocResource);
        } catch (Exception e) {
            log.error("Error writing table of contents: " + e.getClass().getName() + ": " + e.getMessage());
        }
    }

    private void writeResources(Book book, ZipOutputStream resultStream) throws IOException {
        for (Resource resource : book.getResources().getAll()) {
            writeResource(resource, resultStream);
        }
    }

    private void writeResource(Resource resource, ZipOutputStream resultStream) throws IOException {
        if (resource == null) {
            return;
        }
        try {
            resultStream.putNextEntry(new ZipEntry("OEBPS/" + resource.getHref()));
            InputStream inputStream = resource.getInputStream();
            IOUtil.copy(inputStream, resultStream);
            inputStream.close();
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
    }

    private void writePackageDocument(Book book, ZipOutputStream resultStream) throws IOException {
        resultStream.putNextEntry(new ZipEntry("OEBPS/content.opf"));
        XmlSerializer xmlSerializer = EpubProcessorSupport.createXmlSerializer(resultStream);
        PackageDocumentWriter.write(this, xmlSerializer, book);
        xmlSerializer.flush();
    }

    private void writeContainer(ZipOutputStream resultStream) throws IOException {
        resultStream.putNextEntry(new ZipEntry("META-INF/container.xml"));
        Writer out = new OutputStreamWriter(resultStream);
        out.write("<?xml version=\"1.0\"?>\n");
        out.write("<container version=\"1.0\" xmlns=\"urn:oasis:names:tc:opendocument:xmlns:container\">\n");
        out.write("\t<rootfiles>\n");
        out.write("\t\t<rootfile full-path=\"OEBPS/content.opf\" media-type=\"application/oebps-package+xml\"/>\n");
        out.write("\t</rootfiles>\n");
        out.write("</container>");
        out.flush();
    }

    private void writeMimeType(ZipOutputStream resultStream) throws IOException {
        ZipEntry mimetypeZipEntry = new ZipEntry("mimetype");
        mimetypeZipEntry.setMethod(0);
        byte[] mimetypeBytes = MediatypeService.EPUB.getName().getBytes();
        mimetypeZipEntry.setSize(mimetypeBytes.length);
        mimetypeZipEntry.setCrc(calculateCrc(mimetypeBytes));
        resultStream.putNextEntry(mimetypeZipEntry);
        resultStream.write(mimetypeBytes);
    }

    private long calculateCrc(byte[] data) {
        CRC32 crc = new CRC32();
        crc.update(data);
        return crc.getValue();
    }

    String getNcxId() {
        return "ncx";
    }

    String getNcxHref() {
        return NCXDocument.DEFAULT_NCX_HREF;
    }

    String getNcxMediaType() {
        return "application/x-dtbncx+xml";
    }

    public BookProcessor getBookProcessor() {
        return this.bookProcessor;
    }

    public void setBookProcessor(BookProcessor bookProcessor) {
        this.bookProcessor = bookProcessor;
    }
}
