package com.wutka.dtd;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/DTDContainer.class */
public abstract class DTDContainer extends DTDItem {
    protected Vector items = new Vector();

    @Override // com.wutka.dtd.DTDItem, com.wutka.dtd.DTDOutput
    public abstract void write(PrintWriter printWriter) throws IOException;

    public void add(DTDItem item) {
        this.items.addElement(item);
    }

    public void remove(DTDItem item) {
        this.items.removeElement(item);
    }

    public Vector getItemsVec() {
        return this.items;
    }

    public DTDItem[] getItems() {
        DTDItem[] retval = new DTDItem[this.items.size()];
        this.items.copyInto(retval);
        return retval;
    }

    @Override // com.wutka.dtd.DTDItem
    public boolean equals(Object ob) {
        if (ob == this) {
            return true;
        }
        if (!(ob instanceof DTDContainer) || !super.equals(ob)) {
            return false;
        }
        DTDContainer other = (DTDContainer) ob;
        return this.items.equals(other.items);
    }

    public void setItem(DTDItem[] newItems) {
        this.items = new Vector(newItems.length);
        for (DTDItem dTDItem : newItems) {
            this.items.addElement(dTDItem);
        }
    }

    public DTDItem[] getItem() {
        DTDItem[] retval = new DTDItem[this.items.size()];
        this.items.copyInto(retval);
        return retval;
    }

    public void setItem(DTDItem anItem, int i) {
        this.items.setElementAt(anItem, i);
    }

    public DTDItem getItem(int i) {
        return (DTDItem) this.items.elementAt(i);
    }
}
