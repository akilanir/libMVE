package com.wutka.dtd;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Vector;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/DTD.class */
public class DTD implements DTDOutput {
    public Hashtable elements = new Hashtable();
    public Hashtable entities = new Hashtable();
    public Hashtable notations = new Hashtable();
    public Hashtable externalDTDs = new Hashtable();
    public Vector items = new Vector();
    public DTDElement rootElement;

    @Override // com.wutka.dtd.DTDOutput
    public void write(PrintWriter outWriter) throws IOException {
        Enumeration e = this.items.elements();
        while (e.hasMoreElements()) {
            DTDOutput item = (DTDOutput) e.nextElement();
            item.write(outWriter);
        }
    }

    public boolean equals(Object ob) {
        if (this == ob) {
            return true;
        }
        if (!(ob instanceof DTD)) {
            return false;
        }
        DTD otherDTD = (DTD) ob;
        return this.items.equals(otherDTD.items);
    }

    public void setItems(Object[] newItems) {
        this.items = new Vector(newItems.length);
        for (Object obj : newItems) {
            this.items.addElement(obj);
        }
    }

    public Object[] getItems() {
        return this.items.toArray();
    }

    public void setItem(Object item, int i) {
        this.items.setElementAt(item, i);
    }

    public Object getItem(int i) {
        return this.items.elementAt(i);
    }

    public Vector getItemsByType(Class itemType) {
        Vector results = new Vector();
        Enumeration e = this.items.elements();
        while (e.hasMoreElements()) {
            Object ob = e.nextElement();
            if (itemType.isAssignableFrom(ob.getClass())) {
                results.addElement(ob);
            }
        }
        return results;
    }
}
