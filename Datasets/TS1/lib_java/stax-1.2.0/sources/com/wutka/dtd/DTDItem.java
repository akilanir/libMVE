package com.wutka.dtd;

import java.io.IOException;
import java.io.PrintWriter;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/DTDItem.class */
public abstract class DTDItem implements DTDOutput {
    public DTDCardinal cardinal;

    @Override // com.wutka.dtd.DTDOutput
    public abstract void write(PrintWriter printWriter) throws IOException;

    public DTDItem() {
        this.cardinal = DTDCardinal.NONE;
    }

    public DTDItem(DTDCardinal aCardinal) {
        this.cardinal = aCardinal;
    }

    public boolean equals(Object ob) {
        if (ob == this) {
            return true;
        }
        if (!(ob instanceof DTDItem)) {
            return false;
        }
        DTDItem other = (DTDItem) ob;
        return this.cardinal == null ? other.cardinal == null : this.cardinal.equals(other.cardinal);
    }

    public void setCardinal(DTDCardinal aCardinal) {
        this.cardinal = aCardinal;
    }

    public DTDCardinal getCardinal() {
        return this.cardinal;
    }
}
