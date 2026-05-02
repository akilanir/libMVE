package com.bea.xml.stream;

import com.bea.xml.stream.util.ElementTypeNames;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.xml.namespace.QName;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/EventState.class */
public class EventState {
    private int type;
    private QName qname;
    private List attributes;
    private List namespaces;
    private String data;
    private String extraData;

    public EventState() {
    }

    public EventState(int type) {
        this.type = type;
        this.attributes = new ArrayList();
        this.namespaces = new ArrayList();
    }

    public void clear() {
        this.qname = null;
        this.attributes = new ArrayList();
        this.namespaces = new ArrayList();
        this.data = null;
        this.extraData = null;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getType() {
        return this.type;
    }

    public QName getName() {
        return this.qname;
    }

    public String getLocalName() {
        return this.qname.getLocalPart();
    }

    public String getPrefix() {
        return this.qname.getPrefix();
    }

    public String getNamespaceURI() {
        return this.qname.getNamespaceURI();
    }

    public void setName(QName n) {
        this.qname = n;
    }

    public void setAttributes(List atts) {
        this.attributes = atts;
    }

    public void addAttribute(Object obj) {
        this.attributes.add(obj);
    }

    public void addNamespace(Object obj) {
        this.namespaces.add(obj);
    }

    public List getAttributes() {
        return this.attributes;
    }

    public void setNamespaces(List ns) {
        this.namespaces = ns;
    }

    public List getNamespaces() {
        return this.namespaces;
    }

    public String getData() {
        return this.data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getExtraData() {
        return this.extraData;
    }

    public void setExtraData(String d) {
        this.extraData = d;
    }

    public String toString() {
        StringBuffer b = new StringBuffer();
        b.append(new StringBuffer().append("[").append(ElementTypeNames.getEventTypeString(this.type)).append("]").toString());
        if (this.qname != null) {
            b.append(new StringBuffer().append("[name='").append(this.qname).append("']").toString());
        }
        Iterator i = this.namespaces.iterator();
        while (i.hasNext()) {
            b.append(new StringBuffer().append(i.next()).append(" ").toString());
        }
        Iterator i2 = this.attributes.iterator();
        while (i2.hasNext()) {
            b.append(new StringBuffer().append(i2.next()).append(" ").toString());
        }
        if (this.data != null) {
            b.append(new StringBuffer().append(",data=[").append(this.data).append("]").toString());
        }
        if (this.extraData != null) {
            b.append(new StringBuffer().append(",extradata=[").append(this.extraData).append("]").toString());
        }
        return b.toString();
    }
}
