package nl.siegmann.epublib.epub;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.net.URL;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import nl.siegmann.epublib.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.xml.sax.EntityResolver;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xmlpull.v1.XmlPullParserFactory;
import org.xmlpull.v1.XmlSerializer;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/epub/EpubProcessorSupport.class */
public class EpubProcessorSupport {
    private static final Logger log = LoggerFactory.getLogger(EpubProcessorSupport.class);
    protected static DocumentBuilderFactory documentBuilderFactory;

    static {
        init();
    }

    /* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/epub/EpubProcessorSupport$EntityResolverImpl.class */
    static class EntityResolverImpl implements EntityResolver {
        private String previousLocation;

        EntityResolverImpl() {
        }

        @Override // org.xml.sax.EntityResolver
        public InputSource resolveEntity(String publicId, String systemId) throws SAXException, IOException {
            String resourcePath;
            if (systemId.startsWith("http:")) {
                URL url = new URL(systemId);
                resourcePath = "dtd/" + url.getHost() + url.getPath();
                this.previousLocation = resourcePath.substring(0, resourcePath.lastIndexOf(47));
            } else {
                resourcePath = this.previousLocation + systemId.substring(systemId.lastIndexOf(47));
            }
            if (getClass().getClassLoader().getResource(resourcePath) == null) {
                throw new RuntimeException("remote resource is not cached : [" + systemId + "] cannot continue");
            }
            InputStream in = EpubProcessorSupport.class.getClassLoader().getResourceAsStream(resourcePath);
            return new InputSource(in);
        }
    }

    private static void init() {
        documentBuilderFactory = DocumentBuilderFactory.newInstance();
        documentBuilderFactory.setNamespaceAware(true);
        documentBuilderFactory.setValidating(false);
    }

    public static XmlSerializer createXmlSerializer(OutputStream out) throws UnsupportedEncodingException {
        return createXmlSerializer(new OutputStreamWriter(out, Constants.CHARACTER_ENCODING));
    }

    public static XmlSerializer createXmlSerializer(Writer out) {
        XmlSerializer result = null;
        try {
            XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
            factory.setValidating(true);
            result = factory.newSerializer();
            result.setFeature("http://xmlpull.org/v1/doc/features.html#indent-output", true);
            result.setOutput(out);
        } catch (Exception e) {
            log.error("When creating XmlSerializer: " + e.getClass().getName() + ": " + e.getMessage());
        }
        return result;
    }

    public static EntityResolver getEntityResolver() {
        return new EntityResolverImpl();
    }

    public DocumentBuilderFactory getDocumentBuilderFactory() {
        return documentBuilderFactory;
    }

    public static DocumentBuilder createDocumentBuilder() {
        DocumentBuilder result = null;
        try {
            result = documentBuilderFactory.newDocumentBuilder();
            result.setEntityResolver(getEntityResolver());
        } catch (ParserConfigurationException e) {
            log.error(e.getMessage());
        }
        return result;
    }
}
