package ch.qos.logback.core.joran.event;

import org.xml.sax.Locator;
import org.xml.sax.helpers.LocatorImpl;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/event/SaxEvent.class */
public class SaxEvent {
    public final String namespaceURI;
    public final String localName;
    public final String qName;
    public final Locator locator;

    SaxEvent(String str, String str2, String str3, Locator locator) {
        this.namespaceURI = str;
        this.localName = str2;
        this.qName = str3;
        this.locator = new LocatorImpl(locator);
    }

    public String getLocalName() {
        return this.localName;
    }

    public Locator getLocator() {
        return this.locator;
    }

    public String getNamespaceURI() {
        return this.namespaceURI;
    }

    public String getQName() {
        return this.qName;
    }
}
