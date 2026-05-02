package com.wutka.dtd;

import java.io.IOException;
import java.io.PrintWriter;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/DTDCardinal.class */
public class DTDCardinal implements DTDOutput {
    public static final DTDCardinal NONE = new DTDCardinal(0, "NONE");
    public static final DTDCardinal OPTIONAL = new DTDCardinal(1, "OPTIONAL");
    public static final DTDCardinal ZEROMANY = new DTDCardinal(2, "ZEROMANY");
    public static final DTDCardinal ONEMANY = new DTDCardinal(3, "ONEMANY");
    public int type;
    public String name;

    public DTDCardinal(int aType, String aName) {
        this.type = aType;
        this.name = aName;
    }

    public boolean equals(Object ob) {
        if (ob == this) {
            return true;
        }
        if (!(ob instanceof DTDCardinal)) {
            return false;
        }
        DTDCardinal other = (DTDCardinal) ob;
        return other.type == this.type;
    }

    @Override // com.wutka.dtd.DTDOutput
    public void write(PrintWriter out) throws IOException {
        if (this == NONE) {
            return;
        }
        if (this == OPTIONAL) {
            out.print("?");
        } else if (this == ZEROMANY) {
            out.print("*");
        } else if (this == ONEMANY) {
            out.print("+");
        }
    }
}
