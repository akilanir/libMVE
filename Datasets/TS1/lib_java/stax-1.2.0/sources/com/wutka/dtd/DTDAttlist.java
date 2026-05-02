package com.wutka.dtd;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Vector;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/DTDAttlist.class */
public class DTDAttlist implements DTDOutput {
    public String name;
    public Vector attributes = new Vector();

    public DTDAttlist() {
    }

    public DTDAttlist(String aName) {
        this.name = aName;
    }

    @Override // com.wutka.dtd.DTDOutput
    public void write(PrintWriter out) throws IOException {
        out.print("<!ATTLIST ");
        out.println(this.name);
        Iterator itr = this.attributes.iterator();
        while (itr.hasNext()) {
            out.print("           ");
            DTDAttribute attr = (DTDAttribute) itr.next();
            attr.write(out);
            if (itr.hasNext()) {
                out.println();
            } else {
                out.println(">");
            }
        }
    }

    public boolean equals(Object ob) {
        if (ob == this) {
            return true;
        }
        if (!(ob instanceof DTDAttlist)) {
            return false;
        }
        DTDAttlist other = (DTDAttlist) ob;
        if (this.name == null && other.name != null) {
            return false;
        }
        if (this.name == null || this.name.equals(other.name)) {
            return this.attributes.equals(other.attributes);
        }
        return false;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String aName) {
        this.name = aName;
    }

    public DTDAttribute[] getAttribute() {
        DTDAttribute[] attrs = new DTDAttribute[this.attributes.size()];
        this.attributes.copyInto(attrs);
        return attrs;
    }

    public void setAttribute(DTDAttribute[] attrs) {
        this.attributes = new Vector(attrs.length);
        for (DTDAttribute dTDAttribute : attrs) {
            this.attributes.addElement(dTDAttribute);
        }
    }

    public DTDAttribute getAttribute(int i) {
        return (DTDAttribute) this.attributes.elementAt(i);
    }

    public void setAttribute(DTDAttribute attr, int i) {
        this.attributes.setElementAt(attr, i);
    }
}
