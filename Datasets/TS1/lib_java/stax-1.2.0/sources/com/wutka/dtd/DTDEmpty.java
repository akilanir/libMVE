package com.wutka.dtd;

import java.io.IOException;
import java.io.PrintWriter;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/DTDEmpty.class */
public class DTDEmpty extends DTDItem {
    @Override // com.wutka.dtd.DTDItem, com.wutka.dtd.DTDOutput
    public void write(PrintWriter out) throws IOException {
        out.print("EMPTY");
        this.cardinal.write(out);
    }

    @Override // com.wutka.dtd.DTDItem
    public boolean equals(Object ob) {
        if (ob == this) {
            return true;
        }
        if (ob instanceof DTDEmpty) {
            return super.equals(ob);
        }
        return false;
    }
}
