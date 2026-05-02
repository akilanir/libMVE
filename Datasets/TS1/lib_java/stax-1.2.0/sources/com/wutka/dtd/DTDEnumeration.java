package com.wutka.dtd;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Vector;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/DTDEnumeration.class */
public class DTDEnumeration implements DTDOutput {
    protected Vector items = new Vector();

    public void add(String item) {
        this.items.addElement(item);
    }

    public void remove(String item) {
        this.items.removeElement(item);
    }

    public String[] getItems() {
        String[] retval = new String[this.items.size()];
        this.items.copyInto(retval);
        return retval;
    }

    public Vector getItemsVec() {
        return this.items;
    }

    @Override // com.wutka.dtd.DTDOutput
    public void write(PrintWriter out) throws IOException {
        out.print("( ");
        Enumeration e = getItemsVec().elements();
        boolean isFirst = true;
        while (e.hasMoreElements()) {
            if (!isFirst) {
                out.print(" | ");
            }
            isFirst = false;
            out.print(e.nextElement());
        }
        out.print(")");
    }

    public boolean equals(Object ob) {
        if (ob == this) {
            return true;
        }
        if (!(ob instanceof DTDEnumeration)) {
            return false;
        }
        DTDEnumeration other = (DTDEnumeration) ob;
        return this.items.equals(other.items);
    }

    public String[] getItem() {
        return getItems();
    }

    public void setItem(String[] newItems) {
        this.items = new Vector(newItems.length);
        for (String str : newItems) {
            this.items.addElement(str);
        }
    }

    public void setItem(String item, int i) {
        this.items.setElementAt(item, i);
    }

    public String getItem(int i) {
        return (String) this.items.elementAt(i);
    }
}
