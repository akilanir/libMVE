package freemarker.ext.jsp;

import freemarker.core.Environment;
import freemarker.ext.servlet.FreemarkerServlet;
import freemarker.ext.servlet.HttpRequestHashModel;
import freemarker.log.Logger;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.utility.ClassUtil;
import freemarker.template.utility.StringUtil;
import java.beans.IntrospectionException;
import java.io.ByteArrayInputStream;
import java.io.FilterInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.Attributes;
import org.xml.sax.EntityResolver;
import org.xml.sax.InputSource;
import org.xml.sax.Locator;
import org.xml.sax.SAXParseException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.DefaultHandler;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/jsp/TaglibFactory.class */
public class TaglibFactory implements TemplateHashModel {
    private static final String DEFAULT_JAR_TLD = "META-INF/taglib.tld";
    private static final int LOOKUP_NONE = 0;
    private static final int LOOKUP_WEB_XML = 1;
    private static final int LOOKUP_WEB_APP = 2;
    private static final int ABS_URI = 0;
    private static final int ROOT_REL_URI = 1;
    private static final int NOROOT_REL_URI = 2;
    private final ServletContext ctx;
    private final Map taglibs = new HashMap();
    private final Map locations = new HashMap();
    private int lookupPhase = 0;
    static Class class$freemarker$ext$jsp$EventForwarding;
    static Class class$javax$servlet$jsp$tagext$Tag;
    private static final Logger logger = Logger.getLogger("freemarker.jsp");
    private static final Map dtds = new HashMap();

    static {
        dtds.put("http://java.sun.com/xml/ns/jee/web-jsptaglibrary_2_1.xsd", "web-jsptaglibrary_2_1.xsd");
        dtds.put("http://java.sun.com/xml/ns/j2ee/web-jsptaglibrary_2_0.xsd", "web-jsptaglibrary_2_0.xsd");
        dtds.put("-//Sun Microsystems, Inc.//DTD JSP Tag Library 1.2//EN", "web-jsptaglibrary_1_2.dtd");
        dtds.put("http://java.sun.com/dtd/web-jsptaglibrary_1_2.dtd", "web-jsptaglibrary_1_2.dtd");
        dtds.put("-//Sun Microsystems, Inc.//DTD JSP Tag Library 1.1//EN", "web-jsptaglibrary_1_1.dtd");
        dtds.put("http://java.sun.com/j2ee/dtds/web-jsptaglibrary_1_1.dtd", "web-jsptaglibrary_1_1.dtd");
        dtds.put("http://java.sun.com/xml/ns/jee/web-app_2_5.xsd", "web-app_2_5.xsd");
        dtds.put("http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd", "web-app_2_4.xsd");
        dtds.put("-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN", "web-app_2_3.dtd");
        dtds.put("http://java.sun.com/dtd/web-app_2_3.dtd", "web-app_2_3.dtd");
        dtds.put("-//Sun Microsystems, Inc.//DTD Web Application 2.2//EN", "web-app_2_2.dtd");
        dtds.put("http://java.sun.com/j2ee/dtds/web-app_2_2.dtd", "web-app_2_2.dtd");
    }

    public TaglibFactory(ServletContext ctx) {
        this.ctx = ctx;
    }

    @Override // freemarker.template.TemplateHashModel
    public TemplateModel get(String uri) throws TemplateModelException {
        synchronized (this.taglibs) {
            Taglib taglib = (Taglib) this.taglibs.get(uri);
            if (taglib != null) {
                return taglib;
            }
            try {
                if (this.lookupPhase == 0) {
                    addLocationsFromWebXml();
                    this.lookupPhase = 1;
                }
                TldPath path = (TldPath) this.locations.get(uri);
                if (path != null) {
                    return loadTaglib(path, uri);
                }
                if (this.lookupPhase == 1) {
                    addLocationsFromWebApp();
                    this.lookupPhase = 2;
                    TldPath path2 = (TldPath) this.locations.get(uri);
                    if (path2 != null) {
                        return loadTaglib(path2, uri);
                    }
                }
                switch (getUriType(uri)) {
                    case 0:
                        throw new TemplateModelException(new StringBuffer().append("No mapping defined for ").append(uri).toString());
                    case 1:
                        break;
                    case 2:
                        uri = resolveRelativeUri(uri);
                        break;
                    default:
                        throw new RuntimeException("Cannot happen");
                }
                if (uri.endsWith(".jar") || uri.endsWith(".zip")) {
                    return loadTaglib(new TldPath(uri, DEFAULT_JAR_TLD), uri);
                }
                return loadTaglib(new TldPath(uri), uri);
            } catch (TemplateModelException e) {
                throw e;
            } catch (RuntimeException e2) {
                throw e2;
            } catch (Exception e3) {
                throw new TemplateModelException(new StringBuffer().append("Could not load taglib information for ").append(uri).toString(), e3);
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jsp/TaglibFactory$TldPath.class */
    private static class TldPath {
        final String filePath;
        final String jarItemPath;

        TldPath(String filePath) {
            this(filePath, null);
        }

        TldPath(String filePath, String jarItemPath) {
            this.filePath = filePath;
            this.jarItemPath = jarItemPath;
        }

        public String toString() {
            if (this.jarItemPath == null) {
                return this.filePath;
            }
            return new StringBuffer().append(this.filePath).append("!").append(this.jarItemPath).toString();
        }
    }

    private TemplateModel loadTaglib(TldPath tldPath, String uri) throws Exception {
        if (logger.isDebugEnabled()) {
            logger.debug(new StringBuffer().append("Loading taglib ").append(StringUtil.jQuoteNoXSS(uri)).append(" from location ").append(StringUtil.jQuoteNoXSS(tldPath)).toString());
        }
        Taglib taglib = new Taglib(this.ctx, tldPath, uri);
        this.taglibs.put(uri, taglib);
        this.locations.remove(uri);
        return taglib;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int getUriType(String uri) throws TemplateModelException {
        int colon;
        if (uri == null) {
            throw new TemplateModelException("null is not a valid URI");
        }
        if (uri.length() == 0) {
            throw new TemplateModelException("empty string is not a valid URI");
        }
        char c0 = uri.charAt(0);
        if (c0 == '/') {
            return 1;
        }
        if (c0 < 'a' || c0 > 'z' || (colon = uri.indexOf(58)) == -1) {
            return 2;
        }
        for (int i = 1; i < colon; i++) {
            char c = uri.charAt(i);
            if ((c < 'a' || c > 'z') && ((c < '0' || c > '9') && c != '+' && c != '-' && c != '.')) {
                return 2;
            }
        }
        return 0;
    }

    @Override // freemarker.template.TemplateHashModel
    public boolean isEmpty() {
        return false;
    }

    private void addLocationsFromWebXml() throws Exception {
        WebXmlParser webXmlParser = new WebXmlParser(this, null);
        InputStream in = this.ctx.getResourceAsStream("/WEB-INF/web.xml");
        if (in == null) {
            return;
        }
        try {
            parseXml(in, this.ctx.getResource("/WEB-INF/web.xml").toExternalForm(), webXmlParser);
            in.close();
        } catch (Throwable th) {
            in.close();
            throw th;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jsp/TaglibFactory$WebXmlParser.class */
    private class WebXmlParser extends DefaultHandler {
        private StringBuffer buf;
        private String uri;
        private String location;
        private Locator locator;
        private final TaglibFactory this$0;

        private WebXmlParser(TaglibFactory taglibFactory) {
            this.this$0 = taglibFactory;
        }

        WebXmlParser(TaglibFactory x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void setDocumentLocator(Locator locator) {
            this.locator = locator;
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void startElement(String nsuri, String localName, String qName, Attributes atts) {
            if ("taglib-uri".equals(qName) || "taglib-location".equals(qName)) {
                this.buf = new StringBuffer();
            }
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void characters(char[] chars, int off, int len) {
            if (this.buf != null) {
                this.buf.append(chars, off, len);
            }
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void endElement(String nsuri, String localName, String qName) throws SAXParseException {
            String zname;
            if ("taglib-uri".equals(qName)) {
                this.uri = this.buf.toString().trim();
                this.buf = null;
                return;
            }
            if ("taglib-location".equals(qName)) {
                this.location = this.buf.toString().trim();
                try {
                    if (TaglibFactory.getUriType(this.location) == 2) {
                        this.location = new StringBuffer().append("/WEB-INF/").append(this.location).toString();
                    }
                    this.buf = null;
                    return;
                } catch (TemplateModelException e) {
                    throw new SAXParseException(e.getMessage(), this.locator, e);
                }
            }
            if ("taglib".equals(qName)) {
                if (this.location.endsWith(".jar") || this.location.endsWith(".zip")) {
                    zname = TaglibFactory.DEFAULT_JAR_TLD;
                } else {
                    zname = null;
                }
                this.this$0.addLocation("web.xml", this.location, zname, this.uri);
            }
        }
    }

    private void addLocationsFromWebApp() throws Exception {
        Set<String> libs = this.ctx.getResourcePaths("/WEB-INF/lib");
        if (libs != null) {
            for (String path : libs) {
                if (path.endsWith(".jar") || path.endsWith(".zip")) {
                    addLocationsFromJarFile(path);
                } else if (path.endsWith(".tld")) {
                    addLocationFromTldFile(path);
                }
            }
        }
        Set<String> libs2 = this.ctx.getResourcePaths("/WEB-INF");
        if (libs2 != null) {
            for (String path2 : libs2) {
                if (path2.endsWith(".tld")) {
                    addLocationFromTldFile(path2);
                }
            }
        }
    }

    private void addLocationsFromJarFile(String path) throws Exception {
        ZipInputStream zin = new ZipInputStream(this.ctx.getResourceAsStream(path));
        InputStream uin = new FilterInputStream(this, zin) { // from class: freemarker.ext.jsp.TaglibFactory.1
            private final TaglibFactory this$0;

            {
                this.this$0 = this;
            }

            @Override // java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
            public void close() {
            }
        };
        while (true) {
            try {
                ZipEntry ze = zin.getNextEntry();
                if (ze != null) {
                    String zname = ze.getName();
                    if (zname.startsWith("META-INF/") && zname.endsWith(".tld")) {
                        String url = new StringBuffer().append("jar:").append(this.ctx.getResource(path).toExternalForm()).append("!").append(zname).toString();
                        addLocationFromTldResource(uin, path, zname, url);
                    }
                } else {
                    return;
                }
            } finally {
                zin.close();
            }
        }
    }

    private void addLocationFromTldFile(String path) throws Exception {
        InputStream in = this.ctx.getResourceAsStream(path);
        try {
            addLocationFromTldResource(in, path, null, this.ctx.getResource(path).toExternalForm());
            in.close();
        } catch (Throwable th) {
            in.close();
            throw th;
        }
    }

    private void addLocationFromTldResource(InputStream uin, String path, String zname, String url) throws Exception {
        String uri = getTldUri(uin, url);
        if (uri != null) {
            addLocation(zname == null ? "tld file" : "jar file", path, zname, uri);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void addLocation(String source, String filePath, String jarItemPath, String uri) {
        TldPath tldPath = new TldPath(filePath, jarItemPath);
        if (this.locations.containsKey(uri)) {
            logger.debug(new StringBuffer().append("Ignored duplicate URI ").append(StringUtil.jQuoteNoXSS(uri)).append(" in ").append(source).append(" ").append(StringUtil.jQuoteNoXSS(tldPath)).toString());
            return;
        }
        this.locations.put(uri, tldPath);
        if (logger.isDebugEnabled()) {
            logger.debug(new StringBuffer().append(source).append(" assigned URI ").append(StringUtil.jQuoteNoXSS(uri)).append(" to location ").append(StringUtil.jQuoteNoXSS(tldPath)).toString());
        }
    }

    private String getTldUri(InputStream in, String url) throws Exception {
        TldUriReader tur = new TldUriReader();
        parseXml(in, url, tur);
        return tur.getUri();
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jsp/TaglibFactory$TldUriReader.class */
    private static class TldUriReader extends DefaultHandler {
        private StringBuffer buf;
        private String uri;

        TldUriReader() {
        }

        String getUri() {
            return this.uri;
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void startElement(String nsuri, String localName, String qName, Attributes atts) {
            if ("uri".equals(qName)) {
                this.buf = new StringBuffer();
            }
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void characters(char[] chars, int off, int len) {
            if (this.buf != null) {
                this.buf.append(chars, off, len);
            }
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void endElement(String nsuri, String localName, String qName) {
            if ("uri".equals(qName)) {
                this.uri = this.buf.toString().trim();
                this.buf = null;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void parseXml(InputStream in, String url, DefaultHandler handler) throws Exception {
        InputSource is = new InputSource();
        is.setByteStream(in);
        is.setSystemId(url);
        SAXParserFactory factory = SAXParserFactory.newInstance();
        factory.setNamespaceAware(false);
        factory.setValidating(false);
        XMLReader reader = factory.newSAXParser().getXMLReader();
        reader.setEntityResolver(new LocalTaglibDtds(null));
        reader.setContentHandler(handler);
        reader.setErrorHandler(handler);
        reader.parse(is);
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jsp/TaglibFactory$Taglib.class */
    private static final class Taglib implements TemplateHashModel {
        private final Map tags;

        Taglib(ServletContext ctx, TldPath tldPath, String uri) throws Exception {
            this.tags = loadTaglib(ctx, tldPath, uri);
        }

        @Override // freemarker.template.TemplateHashModel
        public TemplateModel get(String key) {
            return (TemplateModel) this.tags.get(key);
        }

        @Override // freemarker.template.TemplateHashModel
        public boolean isEmpty() {
            return this.tags.isEmpty();
        }

        private static final Map loadTaglib(ServletContext ctx, TldPath tldPath, String uri) throws Exception {
            Class cls;
            Class cls2;
            String zname;
            TldParser tldParser = new TldParser(null);
            String filePath = tldPath.filePath;
            InputStream in = ctx.getResourceAsStream(filePath);
            if (in == null) {
                throw new TemplateModelException(new StringBuffer().append("Could not find webapp resource ").append(filePath).append(" for URI ").append(uri).toString());
            }
            String fileUrl = ctx.getResource(filePath).toExternalForm();
            try {
                String jarItemPath = tldPath.jarItemPath;
                if (jarItemPath == null) {
                    TaglibFactory.parseXml(in, fileUrl, tldParser);
                } else {
                    ZipInputStream zin = new ZipInputStream(in);
                    do {
                        ZipEntry ze = zin.getNextEntry();
                        if (ze == null) {
                            throw new TemplateModelException(new StringBuffer().append("Could not find JAR entry ").append(jarItemPath).append(" inside webapp resource ").append(filePath).append(" for URI ").append(uri).toString());
                        }
                        zname = ze.getName();
                    } while (!zname.equals(jarItemPath));
                    TaglibFactory.parseXml(zin, new StringBuffer().append("jar:").append(fileUrl).append("!").append(zname).toString(), tldParser);
                }
                EventForwarding eventForwarding = EventForwarding.getInstance(ctx);
                if (eventForwarding != null) {
                    eventForwarding.addListeners(tldParser.getListeners());
                } else if (tldParser.getListeners().size() > 0) {
                    StringBuffer append = new StringBuffer().append("Event listeners specified in the TLD could not be  registered since the web application doesn't have a listener of class ");
                    if (TaglibFactory.class$freemarker$ext$jsp$EventForwarding == null) {
                        cls = TaglibFactory.class$("freemarker.ext.jsp.EventForwarding");
                        TaglibFactory.class$freemarker$ext$jsp$EventForwarding = cls;
                    } else {
                        cls = TaglibFactory.class$freemarker$ext$jsp$EventForwarding;
                    }
                    StringBuffer append2 = append.append(cls.getName()).append(". To remedy this, add this element to web.xml:\n").append("| <listener>\n").append("|   <listener-class>");
                    if (TaglibFactory.class$freemarker$ext$jsp$EventForwarding == null) {
                        cls2 = TaglibFactory.class$("freemarker.ext.jsp.EventForwarding");
                        TaglibFactory.class$freemarker$ext$jsp$EventForwarding = cls2;
                    } else {
                        cls2 = TaglibFactory.class$freemarker$ext$jsp$EventForwarding;
                    }
                    throw new TemplateModelException(append2.append(cls2.getName()).append("</listener-class>\n").append("| </listener>").toString());
                }
                return tldParser.getTags();
            } finally {
                in.close();
            }
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    private static String resolveRelativeUri(String uri) throws TemplateModelException {
        TemplateModel reqHash = Environment.getCurrentEnvironment().getVariable(FreemarkerServlet.KEY_REQUEST_PRIVATE);
        if (reqHash instanceof HttpRequestHashModel) {
            HttpServletRequest req = ((HttpRequestHashModel) reqHash).getRequest();
            String pi = req.getPathInfo();
            String reqPath = req.getServletPath();
            if (reqPath == null) {
                reqPath = "";
            }
            String reqPath2 = new StringBuffer().append(reqPath).append(pi == null ? "" : pi).toString();
            int lastSlash = reqPath2.lastIndexOf(47);
            if (lastSlash != -1) {
                return new StringBuffer().append(reqPath2.substring(0, lastSlash + 1)).append(uri).toString();
            }
            return new StringBuffer().append('/').append(uri).toString();
        }
        throw new TemplateModelException(new StringBuffer().append("Can't resolve relative URI ").append(uri).append(" as request URL information is unavailable.").toString());
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jsp/TaglibFactory$TldParser.class */
    private static final class TldParser extends DefaultHandler {
        private final Map tags;
        private final List listeners;
        private Locator locator;
        private StringBuffer buf;
        private String tagName;
        private String tagClassName;

        private TldParser() {
            this.tags = new HashMap();
            this.listeners = new ArrayList();
        }

        TldParser(AnonymousClass1 x0) {
            this();
        }

        Map getTags() {
            return this.tags;
        }

        List getListeners() {
            return this.listeners;
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void setDocumentLocator(Locator locator) {
            this.locator = locator;
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void startElement(String nsuri, String localName, String qName, Attributes atts) {
            if ("name".equals(qName) || "tagclass".equals(qName) || "tag-class".equals(qName) || "listener-class".equals(qName)) {
                this.buf = new StringBuffer();
            }
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void characters(char[] chars, int off, int len) {
            if (this.buf != null) {
                this.buf.append(chars, off, len);
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v25, types: [freemarker.ext.jsp.TagTransformModel] */
        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void endElement(String nsuri, String localName, String qName) throws SAXParseException {
            Class cls;
            SimpleTagDirectiveModel simpleTagDirectiveModel;
            if ("name".equals(qName)) {
                if (this.tagName == null) {
                    this.tagName = this.buf.toString().trim();
                }
                this.buf = null;
                return;
            }
            if ("tagclass".equals(qName) || "tag-class".equals(qName)) {
                this.tagClassName = this.buf.toString().trim();
                this.buf = null;
                return;
            }
            if ("tag".equals(qName)) {
                try {
                    Class tagClass = ClassUtil.forName(this.tagClassName);
                    if (TaglibFactory.class$javax$servlet$jsp$tagext$Tag == null) {
                        cls = TaglibFactory.class$("javax.servlet.jsp.tagext.Tag");
                        TaglibFactory.class$javax$servlet$jsp$tagext$Tag = cls;
                    } else {
                        cls = TaglibFactory.class$javax$servlet$jsp$tagext$Tag;
                    }
                    if (cls.isAssignableFrom(tagClass)) {
                        simpleTagDirectiveModel = new TagTransformModel(tagClass);
                    } else {
                        simpleTagDirectiveModel = new SimpleTagDirectiveModel(tagClass);
                    }
                    this.tags.put(this.tagName, simpleTagDirectiveModel);
                    this.tagName = null;
                    this.tagClassName = null;
                    return;
                } catch (ClassNotFoundException e) {
                    throw new SAXParseException(new StringBuffer().append("Can't find tag class ").append(this.tagClassName).toString(), this.locator, e);
                } catch (IntrospectionException e2) {
                    throw new SAXParseException(new StringBuffer().append("Can't introspect tag class ").append(this.tagClassName).toString(), this.locator, e2);
                }
            }
            if ("listener-class".equals(qName)) {
                String listenerClass = this.buf.toString().trim();
                this.buf = null;
                try {
                    this.listeners.add(ClassUtil.forName(listenerClass).newInstance());
                } catch (Exception e3) {
                    throw new SAXParseException(new StringBuffer().append("Can't instantiate listener class ").append(listenerClass).toString(), this.locator, e3);
                }
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jsp/TaglibFactory$LocalTaglibDtds.class */
    private static final class LocalTaglibDtds implements EntityResolver {
        private LocalTaglibDtds() {
        }

        LocalTaglibDtds(AnonymousClass1 x0) {
            this();
        }

        @Override // org.xml.sax.EntityResolver
        public InputSource resolveEntity(String publicId, String systemId) {
            InputStream resourceStream;
            String resourceName = (String) TaglibFactory.dtds.get(publicId);
            if (resourceName == null) {
                resourceName = (String) TaglibFactory.dtds.get(systemId);
            }
            if (resourceName != null) {
                resourceStream = getClass().getResourceAsStream(resourceName);
            } else {
                resourceStream = new ByteArrayInputStream(new byte[0]);
            }
            InputSource is = new InputSource();
            is.setPublicId(publicId);
            is.setSystemId(systemId);
            is.setByteStream(resourceStream);
            return is;
        }
    }
}
