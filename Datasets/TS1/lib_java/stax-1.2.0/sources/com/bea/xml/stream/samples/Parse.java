package com.bea.xml.stream.samples;

import com.bea.xml.stream.XMLEventAllocatorBase;
import com.bea.xml.stream.util.ElementTypeNames;
import java.io.FileReader;
import java.util.Iterator;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamReader;
import javax.xml.stream.events.Attribute;
import javax.xml.stream.events.Namespace;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/samples/Parse.class */
public class Parse {
    private static String filename = null;

    private static void printUsage() {
        System.out.println("usage: java com.bea.xml.stream.samples.Parse <xmlfile>");
    }

    public static void main(String[] args) throws Exception {
        try {
            filename = args[0];
        } catch (ArrayIndexOutOfBoundsException e) {
            printUsage();
            System.exit(0);
        }
        System.setProperty("javax.xml.stream.XMLInputFactory", "com.bea.xml.stream.MXParserFactory");
        XMLInputFactory xmlif = XMLInputFactory.newInstance();
        System.out.println(new StringBuffer().append("FACTORY: ").append(xmlif).toString());
        XMLStreamReader xmlr = xmlif.createXMLStreamReader(new FileReader(filename));
        System.out.println(new StringBuffer().append("READER:  ").append(xmlr).append("\n").toString());
        int eventType = xmlr.getEventType();
        System.out.println("PARSER STATE BEFORE FIRST next(): ");
        printEventType(eventType);
        printName(xmlr);
        printValue(xmlr);
        System.out.println("-----------------------------");
        while (xmlr.hasNext()) {
            int eventType2 = xmlr.next();
            printEventType(eventType2);
            printName(xmlr);
            printValue(xmlr);
            if (xmlr.isStartElement()) {
                printAttributes(xmlr);
                printNamespaces(xmlr);
            }
            System.out.println("-----------------------------");
        }
    }

    public static final String getEventTypeString(int eventType) {
        return ElementTypeNames.getEventTypeString(eventType);
    }

    private static void printEventType(int eventType) {
        System.out.print(new StringBuffer().append("EVENT TYPE(").append(eventType).append("):").toString());
        System.out.println(getEventTypeString(eventType));
    }

    private static void printName(XMLStreamReader xmlr) {
        if (xmlr.hasName()) {
            System.out.println(new StringBuffer().append("HAS NAME: ").append(xmlr.getLocalName()).toString());
        } else {
            System.out.println("HAS NO NAME");
        }
    }

    private static void printValue(XMLStreamReader xmlr) {
        if (xmlr.hasText()) {
            System.out.println(new StringBuffer().append("HAS VALUE: ").append(xmlr.getText()).toString());
        } else {
            System.out.println("HAS NO VALUE");
        }
    }

    private static void printAttributes(XMLStreamReader xmlr) {
        if (xmlr.getAttributeCount() > 0) {
            System.out.println("\nHAS ATTRIBUTES: ");
            Iterator ai = XMLEventAllocatorBase.getAttributes(xmlr);
            while (ai.hasNext()) {
                Attribute a = (Attribute) ai.next();
                System.out.println("");
                printAttribute(a);
            }
            return;
        }
        System.out.println("HAS NO ATTRIBUTES");
    }

    private static void printAttribute(Attribute a) {
        System.out.println(new StringBuffer().append("PREFIX: ").append(a.getName().getPrefix()).toString());
        System.out.println(new StringBuffer().append("NAMESP: ").append(a.getName().getNamespaceURI()).toString());
        System.out.println(new StringBuffer().append("NAME:   ").append(a.getName().getLocalPart()).toString());
        System.out.println(new StringBuffer().append("VALUE:  ").append(a.getValue()).toString());
        System.out.println(new StringBuffer().append("TYPE:   ").append(a.getDTDType()).toString());
    }

    private static void printNamespaces(XMLStreamReader xmlr) {
        if (xmlr.getNamespaceCount() > 0) {
            System.out.println("\nHAS NAMESPACES: ");
            Iterator ni = XMLEventAllocatorBase.getNamespaces(xmlr);
            while (ni.hasNext()) {
                Namespace n = (Namespace) ni.next();
                System.out.println("");
                printNamespace(n);
            }
            return;
        }
        System.out.println("HAS NO NAMESPACES");
    }

    private static void printNamespace(Namespace a) {
        System.out.println(new StringBuffer().append("PREFIX: ").append(a.getName().getPrefix()).toString());
        System.out.println(new StringBuffer().append("NAMESP: ").append(a.getName().getNamespaceURI()).toString());
        System.out.println(new StringBuffer().append("NAME:   ").append(a.getName().getLocalPart()).toString());
        System.out.println(new StringBuffer().append("VALUE:  ").append(a.getValue()).toString());
        System.out.println(new StringBuffer().append("TYPE:   ").append(a.getDTDType()).toString());
    }
}
