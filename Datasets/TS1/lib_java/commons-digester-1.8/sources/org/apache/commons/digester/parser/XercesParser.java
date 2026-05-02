package org.apache.commons.digester.parser;

import java.lang.reflect.Method;
import java.util.Properties;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.xml.sax.SAXException;
import org.xml.sax.SAXNotRecognizedException;
import org.xml.sax.SAXNotSupportedException;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/parser/XercesParser.class */
public class XercesParser {
    private static final String JAXP_SCHEMA_SOURCE = "http://java.sun.com/xml/jaxp/properties/schemaSource";
    protected static float version;
    protected static Log log = LogFactory.getLog("org.apache.commons.digester.Digester.sax");
    protected static String JAXP_SCHEMA_LANGUAGE = "http://java.sun.com/xml/jaxp/properties/schemaLanguage";
    protected static String XERCES_DYNAMIC = "http://apache.org/xml/features/validation/dynamic";
    protected static String XERCES_SCHEMA = "http://apache.org/xml/features/validation/schema";
    protected static String versionNumber = null;

    private static String getXercesVersion() {
        String versionNumber2 = "1.0";
        try {
            Class versionClass = Class.forName("org.apache.xerces.impl.Version");
            Method method = versionClass.getMethod("getVersion", (Class[]) null);
            String version2 = (String) method.invoke(null, (Object[]) null);
            versionNumber2 = version2.substring("Xerces-J".length(), version2.lastIndexOf("."));
        } catch (Exception e) {
        }
        return versionNumber2;
    }

    public static SAXParser newSAXParser(Properties properties) throws ParserConfigurationException, SAXException, SAXNotSupportedException {
        SAXParserFactory factory = (SAXParserFactory) properties.get("SAXParserFactory");
        if (versionNumber == null) {
            versionNumber = getXercesVersion();
            version = new Float(versionNumber).floatValue();
        }
        if (version > 2.1d) {
            configureXerces(factory);
            return factory.newSAXParser();
        }
        SAXParser parser = factory.newSAXParser();
        configureOldXerces(parser, properties);
        return parser;
    }

    private static void configureOldXerces(SAXParser parser, Properties properties) throws ParserConfigurationException, SAXNotSupportedException {
        String schemaLocation = (String) properties.get("schemaLocation");
        String schemaLanguage = (String) properties.get("schemaLanguage");
        if (schemaLocation != null) {
            try {
                parser.setProperty(JAXP_SCHEMA_LANGUAGE, schemaLanguage);
                parser.setProperty(JAXP_SCHEMA_SOURCE, schemaLocation);
            } catch (SAXNotRecognizedException e) {
                log.info(new StringBuffer().append(parser.getClass().getName()).append(": ").append(e.getMessage()).append(" not supported.").toString());
            }
        }
    }

    private static void configureXerces(SAXParserFactory factory) throws ParserConfigurationException, SAXNotRecognizedException, SAXNotSupportedException {
        factory.setFeature(XERCES_DYNAMIC, true);
        factory.setFeature(XERCES_SCHEMA, true);
    }
}
