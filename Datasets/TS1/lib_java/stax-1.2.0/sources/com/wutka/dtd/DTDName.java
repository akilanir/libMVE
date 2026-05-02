package com.wutka.dtd;

import java.io.IOException;
import java.io.PrintWriter;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/DTDName.class */
public class DTDName extends DTDItem {
    public String value;

    public DTDName() {
    }

    public DTDName(String aValue) {
        this.value = aValue;
    }

    @Override // com.wutka.dtd.DTDItem, com.wutka.dtd.DTDOutput
    public void write(PrintWriter out) throws IOException {
        out.print(this.value);
        this.cardinal.write(out);
    }

    @Override // com.wutka.dtd.DTDItem
    public boolean equals(Object ob) {
        if (ob == this) {
            return true;
        }
        if (!(ob instanceof DTDName) || !super.equals(ob)) {
            return false;
        }
        DTDName other = (DTDName) ob;
        return this.value == null ? other.value == null : this.value.equals(other.value);
    }

    public void setValue(String aValue) {
        this.value = aValue;
    }

    public String getValue() {
        return this.value;
    }
}
