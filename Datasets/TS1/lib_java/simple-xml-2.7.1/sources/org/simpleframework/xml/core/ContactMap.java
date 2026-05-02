package org.simpleframework.xml.core;

import java.util.Iterator;
import java.util.LinkedHashMap;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/ContactMap.class */
class ContactMap extends LinkedHashMap<Object, Contact> implements Iterable<Contact> {
    ContactMap() {
    }

    @Override // java.lang.Iterable
    public Iterator<Contact> iterator() {
        return values().iterator();
    }
}
