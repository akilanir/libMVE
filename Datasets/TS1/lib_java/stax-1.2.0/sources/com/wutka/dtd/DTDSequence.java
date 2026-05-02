package com.wutka.dtd;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/DTDSequence.class */
public class DTDSequence extends DTDContainer {
    @Override // com.wutka.dtd.DTDContainer, com.wutka.dtd.DTDItem, com.wutka.dtd.DTDOutput
    public void write(PrintWriter out) throws IOException {
        out.print("(");
        Enumeration e = getItemsVec().elements();
        boolean isFirst = true;
        while (e.hasMoreElements()) {
            if (!isFirst) {
                out.print(",");
            }
            isFirst = false;
            DTDItem item = (DTDItem) e.nextElement();
            item.write(out);
        }
        out.print(")");
        this.cardinal.write(out);
    }

    @Override // com.wutka.dtd.DTDContainer, com.wutka.dtd.DTDItem
    public boolean equals(Object ob) {
        if (ob == this) {
            return true;
        }
        if (ob instanceof DTDSequence) {
            return super.equals(ob);
        }
        return false;
    }
}
