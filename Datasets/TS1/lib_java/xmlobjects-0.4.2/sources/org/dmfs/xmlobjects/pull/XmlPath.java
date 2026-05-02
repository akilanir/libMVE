package org.dmfs.xmlobjects.pull;

import java.util.LinkedList;
import org.dmfs.xmlobjects.ElementDescriptor;

/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/pull/XmlPath.class */
public class XmlPath implements Cloneable {
    public LinkedList<ElementDescriptor<?>> mPathElements;

    public XmlPath(ElementDescriptor<?>... elementDescriptorArr) {
        LinkedList<ElementDescriptor<?>> linkedList = new LinkedList<>();
        this.mPathElements = linkedList;
        if (elementDescriptorArr != null) {
            for (ElementDescriptor<?> elementDescriptor : elementDescriptorArr) {
                linkedList.addFirst(elementDescriptor);
            }
        }
    }

    private XmlPath(XmlPath xmlPath) {
        this.mPathElements = (LinkedList) xmlPath.mPathElements.clone();
    }

    public boolean matches(XmlPath xmlPath) {
        return this.mPathElements.equals(xmlPath.mPathElements);
    }

    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public XmlPath m8clone() {
        return new XmlPath(this);
    }

    public int length() {
        return this.mPathElements.size();
    }

    void append(ElementDescriptor<?> elementDescriptor) {
        this.mPathElements.addFirst(elementDescriptor);
    }

    ElementDescriptor<?> peek() {
        return this.mPathElements.peek();
    }

    ElementDescriptor<?> peekLast() {
        return this.mPathElements.peekLast();
    }

    ElementDescriptor<?> pop() {
        return this.mPathElements.removeFirst();
    }
}
