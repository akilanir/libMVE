package org.apache.commons.digester.parser;

import java.util.Properties;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.xml.sax.SAXException;
import org.xml.sax.SAXNotRecognizedException;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/parser/GenericParser.class */
public class GenericParser {
    private static final String JAXP_SCHEMA_SOURCE = "http://java.sun.com/xml/jaxp/properties/schemaSource";
    protected static Log log = LogFactory.getLog("org.apache.commons.digester.Digester.sax");
    protected static String JAXP_SCHEMA_LANGUAGE = "http://java.sun.com/xml/jaxp/properties/schemaLanguage";

    public static SAXParser newSAXParser(Properties properties) throws ParserConfigurationException, SAXException, SAXNotRecognizedException {
        SAXParserFactory factory = (SAXParserFactory) properties.get("SAXParserFactory");
        SAXParser parser = factory.newSAXParser();
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
        return parser;
    }
}
