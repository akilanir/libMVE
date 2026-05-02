package ezvcard.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.io.StringReader;
import java.io.StringWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.TransformerFactoryConfigurationError;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/XmlUtils.class */
public class XmlUtils {
    public static Document createDocument() {
        try {
            DocumentBuilderFactory fact = DocumentBuilderFactory.newInstance();
            fact.setNamespaceAware(true);
            DocumentBuilder db = fact.newDocumentBuilder();
            return db.newDocument();
        } catch (ParserConfigurationException e) {
            throw new RuntimeException(e);
        }
    }

    public static Document toDocument(String xml) throws SAXException {
        try {
            return toDocument(new StringReader(xml));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static Document toDocument(InputStream in) throws SAXException, IOException {
        return toDocument(new InputSource(in));
    }

    public static Document toDocument(Reader reader) throws SAXException, IOException {
        return toDocument(new InputSource(reader));
    }

    private static Document toDocument(InputSource in) throws SAXException, IOException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(true);
        factory.setIgnoringComments(true);
        try {
            DocumentBuilder builder = factory.newDocumentBuilder();
            return builder.parse(in);
        } catch (ParserConfigurationException e) {
            throw new RuntimeException(e);
        }
    }

    public static String toString(Node node) {
        return toString(node, new HashMap());
    }

    public static String toString(Node node, Map<String, String> outputProperties) {
        try {
            StringWriter writer = new StringWriter();
            toWriter(node, writer, outputProperties);
            return writer.toString();
        } catch (TransformerException e) {
            throw new RuntimeException(e);
        }
    }

    public static void toWriter(Node node, Writer writer) throws TransformerException {
        toWriter(node, writer, new HashMap());
    }

    public static void toWriter(Node node, Writer writer, Map<String, String> outputProperties) throws TransformerException {
        try {
            Transformer transformer = TransformerFactory.newInstance().newTransformer();
            for (Map.Entry<String, String> property : outputProperties.entrySet()) {
                try {
                    transformer.setOutputProperty(property.getKey(), property.getValue());
                } catch (IllegalArgumentException e) {
                }
            }
            DOMSource source = new DOMSource(node);
            StreamResult result = new StreamResult(writer);
            transformer.transform(source, result);
        } catch (TransformerConfigurationException e2) {
            throw new RuntimeException(e2);
        } catch (TransformerFactoryConfigurationError e3) {
            throw new RuntimeException(e3);
        }
    }

    public static List<Element> toElementList(NodeList nodeList) {
        List<Element> elements = new ArrayList<>();
        for (int i = 0; i < nodeList.getLength(); i++) {
            Node node = nodeList.item(i);
            if (node instanceof Element) {
                elements.add((Element) node);
            }
        }
        return elements;
    }

    public static Element getRootElement(Document parent) {
        return getFirstChildElement(parent);
    }

    public static Element getFirstChildElement(Element parent) {
        return getFirstChildElement((Node) parent);
    }

    private static Element getFirstChildElement(Node parent) {
        NodeList nodeList = parent.getChildNodes();
        for (int i = 0; i < nodeList.getLength(); i++) {
            Node node = nodeList.item(i);
            if (node instanceof Element) {
                return (Element) node;
            }
        }
        return null;
    }

    private XmlUtils() {
    }
}
