package org.apache.commons.digester.substitution;

import java.util.ArrayList;
import org.xml.sax.Attributes;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/substitution/VariableAttributes.class */
public class VariableAttributes implements Attributes {
    private ArrayList values = new ArrayList(10);
    private Attributes attrs;
    private VariableExpander expander;

    public void init(Attributes attrs, VariableExpander expander) {
        this.attrs = attrs;
        this.expander = expander;
        this.values.clear();
    }

    @Override // org.xml.sax.Attributes
    public String getValue(int index) {
        if (index >= this.values.size()) {
            this.values.ensureCapacity(index + 1);
            for (int i = this.values.size(); i <= index; i++) {
                this.values.add(null);
            }
        }
        String s = (String) this.values.get(index);
        if (s == null) {
            s = this.attrs.getValue(index);
            if (s != null) {
                s = this.expander.expand(s);
                this.values.set(index, s);
            }
        }
        return s;
    }

    @Override // org.xml.sax.Attributes
    public String getValue(String qname) {
        int index = this.attrs.getIndex(qname);
        if (index == -1) {
            return null;
        }
        return getValue(index);
    }

    @Override // org.xml.sax.Attributes
    public String getValue(String uri, String localname) {
        int index = this.attrs.getIndex(uri, localname);
        if (index == -1) {
            return null;
        }
        return getValue(index);
    }

    @Override // org.xml.sax.Attributes
    public int getIndex(String qname) {
        return this.attrs.getIndex(qname);
    }

    @Override // org.xml.sax.Attributes
    public int getIndex(String uri, String localpart) {
        return this.attrs.getIndex(uri, localpart);
    }

    @Override // org.xml.sax.Attributes
    public int getLength() {
        return this.attrs.getLength();
    }

    @Override // org.xml.sax.Attributes
    public String getLocalName(int index) {
        return this.attrs.getLocalName(index);
    }

    @Override // org.xml.sax.Attributes
    public String getQName(int index) {
        return this.attrs.getQName(index);
    }

    @Override // org.xml.sax.Attributes
    public String getType(int index) {
        return this.attrs.getType(index);
    }

    @Override // org.xml.sax.Attributes
    public String getType(String qname) {
        return this.attrs.getType(qname);
    }

    @Override // org.xml.sax.Attributes
    public String getType(String uri, String localname) {
        return this.attrs.getType(uri, localname);
    }

    @Override // org.xml.sax.Attributes
    public String getURI(int index) {
        return this.attrs.getURI(index);
    }
}
