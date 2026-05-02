package nl.siegmann.epublib.epub;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import nl.siegmann.epublib.Constants;
import nl.siegmann.epublib.domain.Book;
import nl.siegmann.epublib.domain.MediaType;
import nl.siegmann.epublib.domain.Resource;
import nl.siegmann.epublib.domain.Resources;
import nl.siegmann.epublib.service.MediatypeService;
import nl.siegmann.epublib.util.ResourceUtil;
import nl.siegmann.epublib.util.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/epub/EpubReader.class */
public class EpubReader {
    private static final Logger log = LoggerFactory.getLogger(EpubReader.class);
    private BookProcessor bookProcessor = BookProcessor.IDENTITY_BOOKPROCESSOR;

    public Book readEpub(InputStream in) throws IOException {
        return readEpub(in, Constants.CHARACTER_ENCODING);
    }

    public Book readEpub(ZipInputStream in) throws IOException {
        return readEpub(in, Constants.CHARACTER_ENCODING);
    }

    public Book readEpub(InputStream in, String encoding) throws IOException {
        return readEpub(new ZipInputStream(in), encoding);
    }

    public Book readEpubLazy(String fileName, String encoding, List<MediaType> lazyLoadedTypes) throws IOException {
        Book result = new Book();
        Resources resources = readLazyResources(fileName, encoding, lazyLoadedTypes);
        handleMimeType(result, resources);
        String packageResourceHref = getPackageResourceHref(resources);
        Resource packageResource = processPackageResource(packageResourceHref, result, resources);
        result.setOpfResource(packageResource);
        Resource ncxResource = processNcxResource(packageResource, result);
        result.setNcxResource(ncxResource);
        return postProcessBook(result);
    }

    public Book readEpubLazy(String fileName, String encoding) throws IOException {
        return readEpubLazy(fileName, encoding, Arrays.asList(MediatypeService.mediatypes));
    }

    public Book readEpub(ZipInputStream in, String encoding) throws IOException {
        Book result = new Book();
        Resources resources = readResources(in, encoding);
        handleMimeType(result, resources);
        String packageResourceHref = getPackageResourceHref(resources);
        Resource packageResource = processPackageResource(packageResourceHref, result, resources);
        result.setOpfResource(packageResource);
        Resource ncxResource = processNcxResource(packageResource, result);
        result.setNcxResource(ncxResource);
        return postProcessBook(result);
    }

    private Book postProcessBook(Book book) {
        if (this.bookProcessor != null) {
            book = this.bookProcessor.processBook(book);
        }
        return book;
    }

    private Resource processNcxResource(Resource packageResource, Book book) {
        return NCXDocument.read(book, this);
    }

    private Resource processPackageResource(String packageResourceHref, Book book, Resources resources) {
        Resource packageResource = resources.remove(packageResourceHref);
        try {
            PackageDocumentReader.read(packageResource, this, book, resources);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return packageResource;
    }

    private String getPackageResourceHref(Resources resources) {
        String result = "OEBPS/content.opf";
        Resource containerResource = resources.remove("META-INF/container.xml");
        if (containerResource == null) {
            return result;
        }
        try {
            Document document = ResourceUtil.getAsDocument(containerResource);
            Element rootFileElement = (Element) ((Element) document.getDocumentElement().getElementsByTagName("rootfiles").item(0)).getElementsByTagName("rootfile").item(0);
            result = rootFileElement.getAttribute("full-path");
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        if (StringUtil.isBlank(result)) {
            result = "OEBPS/content.opf";
        }
        return result;
    }

    private void handleMimeType(Book result, Resources resources) {
        resources.remove("mimetype");
    }

    private Resources readLazyResources(String fileName, String defaultHtmlEncoding, List<MediaType> lazyLoadedTypes) throws IOException {
        Resource resource;
        ZipInputStream in = new ZipInputStream(new FileInputStream(fileName));
        Resources result = new Resources();
        ZipEntry nextEntry = in.getNextEntry();
        while (true) {
            ZipEntry zipEntry = nextEntry;
            if (zipEntry != null) {
                if (!zipEntry.isDirectory()) {
                    String href = zipEntry.getName();
                    MediaType mediaType = MediatypeService.determineMediaType(href);
                    if (lazyLoadedTypes.contains(mediaType)) {
                        resource = new Resource(fileName, zipEntry.getSize(), href);
                    } else {
                        resource = new Resource(in, href);
                    }
                    if (resource.getMediaType() == MediatypeService.XHTML) {
                        resource.setInputEncoding(defaultHtmlEncoding);
                    }
                    result.add(resource);
                }
                nextEntry = in.getNextEntry();
            } else {
                return result;
            }
        }
    }

    private Resources readResources(ZipInputStream in, String defaultHtmlEncoding) throws IOException {
        Resources result = new Resources();
        ZipEntry nextEntry = in.getNextEntry();
        while (true) {
            ZipEntry zipEntry = nextEntry;
            if (zipEntry != null) {
                if (!zipEntry.isDirectory()) {
                    Resource resource = ResourceUtil.createResource(zipEntry, in);
                    if (resource.getMediaType() == MediatypeService.XHTML) {
                        resource.setInputEncoding(defaultHtmlEncoding);
                    }
                    result.add(resource);
                }
                nextEntry = in.getNextEntry();
            } else {
                return result;
            }
        }
    }
}
