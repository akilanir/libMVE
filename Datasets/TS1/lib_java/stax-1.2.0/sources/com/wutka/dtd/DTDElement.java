package com.wutka.dtd;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/DTDElement.class */
public class DTDElement implements DTDOutput {
    public String name;
    public Hashtable attributes = new Hashtable();
    public DTDItem content;

    public DTDElement() {
    }

    public DTDElement(String aName) {
        this.name = aName;
    }

    @Override // com.wutka.dtd.DTDOutput
    public void write(PrintWriter out) throws IOException {
        out.print("<!ELEMENT ");
        out.print(this.name);
        out.print(" ");
        if (this.content != null) {
            this.content.write(out);
        } else {
            out.print("ANY");
        }
        out.println(">");
        out.println();
    }

    public boolean equals(Object ob) {
        if (ob == this) {
            return true;
        }
        if (!(ob instanceof DTDElement)) {
            return false;
        }
        DTDElement other = (DTDElement) ob;
        if (this.name == null) {
            if (other.name != null) {
                return false;
            }
        } else if (!this.name.equals(other.name)) {
            return false;
        }
        if (this.attributes == null) {
            if (other.attributes != null) {
                return false;
            }
        } else if (!this.attributes.equals(other.attributes)) {
            return false;
        }
        return this.content == null ? other.content == null : this.content.equals(other.content);
    }

    public void setName(String aName) {
        this.name = aName;
    }

    public String getName() {
        return this.name;
    }

    public void setAttribute(String attrName, DTDAttribute attr) {
        this.attributes.put(attrName, attr);
    }

    public DTDAttribute getAttribute(String attrName) {
        return (DTDAttribute) this.attributes.get(attrName);
    }

    public void setContent(DTDItem theContent) {
        this.content = theContent;
    }

    public DTDItem getContent() {
        return this.content;
    }
}
