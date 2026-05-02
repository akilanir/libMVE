package nl.siegmann.epublib.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.ParserConfigurationException;
import nl.siegmann.epublib.Constants;
import nl.siegmann.epublib.domain.MediaType;
import nl.siegmann.epublib.domain.Resource;
import nl.siegmann.epublib.epub.EpubProcessorSupport;
import nl.siegmann.epublib.service.MediatypeService;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/util/ResourceUtil.class */
public class ResourceUtil {
    public static Resource createResource(File file) throws IOException {
        if (file == null) {
            return null;
        }
        MediaType mediaType = MediatypeService.determineMediaType(file.getName());
        byte[] data = IOUtil.toByteArray(new FileInputStream(file));
        Resource result = new Resource(data, mediaType);
        return result;
    }

    public static Resource createResource(String title, String href) {
        String content = "<html><head><title>" + title + "</title></head><body><h1>" + title + "</h1></body></html>";
        return new Resource(null, content.getBytes(), href, MediatypeService.XHTML, Constants.CHARACTER_ENCODING);
    }

    public static Resource createResource(ZipEntry zipEntry, ZipInputStream zipInputStream) throws IOException {
        return new Resource(zipInputStream, zipEntry.getName());
    }

    public static byte[] recode(String inputEncoding, String outputEncoding, byte[] input) throws UnsupportedEncodingException {
        return new String(input, inputEncoding).getBytes(outputEncoding);
    }

    public static InputSource getInputSource(Resource resource) throws IOException {
        Reader reader;
        if (resource == null || (reader = resource.getReader()) == null) {
            return null;
        }
        InputSource inputSource = new InputSource(reader);
        return inputSource;
    }

    public static Document getAsDocument(Resource resource) throws UnsupportedEncodingException, SAXException, IOException, ParserConfigurationException {
        return getAsDocument(resource, EpubProcessorSupport.createDocumentBuilder());
    }

    public static Document getAsDocument(Resource resource, DocumentBuilder documentBuilder) throws UnsupportedEncodingException, SAXException, IOException, ParserConfigurationException {
        InputSource inputSource = getInputSource(resource);
        if (inputSource == null) {
            return null;
        }
        Document result = documentBuilder.parse(inputSource);
        return result;
    }
}
