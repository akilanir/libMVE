package com.wutka.dtd;

import java.io.PrintWriter;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/DTDSystem.class */
public class DTDSystem extends DTDExternalID {
    @Override // com.wutka.dtd.DTDExternalID, com.wutka.dtd.DTDOutput
    public void write(PrintWriter out) {
        if (this.system != null) {
            out.print("SYSTEM \"");
            out.print(this.system);
            out.print("\"");
        }
    }

    @Override // com.wutka.dtd.DTDExternalID
    public boolean equals(Object ob) {
        if (ob == this) {
            return true;
        }
        if (ob instanceof DTDSystem) {
            return super.equals(ob);
        }
        return false;
    }
}
