package com.wutka.dtd;

import java.io.IOException;
import java.io.PrintWriter;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/DTDDecl.class */
public class DTDDecl implements DTDOutput {
    public static final DTDDecl FIXED = new DTDDecl(0, "FIXED");
    public static final DTDDecl REQUIRED = new DTDDecl(1, "REQUIRED");
    public static final DTDDecl IMPLIED = new DTDDecl(2, "IMPLIED");
    public static final DTDDecl VALUE = new DTDDecl(3, "VALUE");
    public int type;
    public String name;

    public DTDDecl(int aType, String aName) {
        this.type = aType;
        this.name = aName;
    }

    public boolean equals(Object ob) {
        if (ob == this) {
            return true;
        }
        if (!(ob instanceof DTDDecl)) {
            return false;
        }
        DTDDecl other = (DTDDecl) ob;
        return other.type == this.type;
    }

    @Override // com.wutka.dtd.DTDOutput
    public void write(PrintWriter out) throws IOException {
        if (this == FIXED) {
            out.print(" #FIXED");
        } else if (this == REQUIRED) {
            out.print(" #REQUIRED");
        } else if (this == IMPLIED) {
            out.print(" #IMPLIED");
        }
    }
}
