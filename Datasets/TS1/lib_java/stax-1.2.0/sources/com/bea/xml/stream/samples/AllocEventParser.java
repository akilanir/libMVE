package com.bea.xml.stream.samples;

import java.io.FileReader;
import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.events.XMLEvent;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/samples/AllocEventParser.class */
public class AllocEventParser {
    private static String filename = null;

    private static void printUsage() {
        System.out.println("usage: java com.bea.xml.stream.samples.AllocEventParse <xmlfile>");
    }

    public static void main(String[] args) throws Exception {
        try {
            filename = args[0];
        } catch (ArrayIndexOutOfBoundsException e) {
            printUsage();
            System.exit(0);
        }
        System.setProperty("javax.xml.stream.XMLInputFactory", "com.bea.xml.stream.MXParserFactory");
        System.setProperty("javax.xml.stream.XMLOutputFactory", "com.bea.xml.stream.XMLOutputFactoryBase");
        System.setProperty("javax.xml.stream.XMLEventFactory", "com.bea.xml.stream.EventFactory");
        XMLInputFactory factory = XMLInputFactory.newInstance();
        factory.setProperty("javax.xml.stream.isReplacingEntityReferences", Boolean.FALSE);
        XMLEventReader r = factory.createXMLEventReader(new FileReader(filename));
        while (r.hasNext()) {
            XMLEvent e2 = r.nextEvent();
            System.out.println(new StringBuffer().append("ID:").append(e2.hashCode()).append("[").append(e2).append("]").toString());
        }
    }
}
