package com.wutka.dtd;

import java.io.IOException;
import java.io.PrintWriter;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/DTDPublic.class */
public class DTDPublic extends DTDExternalID {
    public String pub;

    @Override // com.wutka.dtd.DTDExternalID, com.wutka.dtd.DTDOutput
    public void write(PrintWriter out) throws IOException {
        out.print("PUBLIC \"");
        out.print(this.pub);
        out.print("\"");
        if (this.system != null) {
            out.print(" \"");
            out.print(this.system);
            out.print("\"");
        }
    }

    @Override // com.wutka.dtd.DTDExternalID
    public boolean equals(Object ob) {
        if (ob == this) {
            return true;
        }
        if (!(ob instanceof DTDPublic) || !super.equals(ob)) {
            return false;
        }
        DTDPublic other = (DTDPublic) ob;
        return this.pub == null ? other.pub == null : this.pub.equals(other.pub);
    }

    public void setPub(String aPub) {
        this.pub = aPub;
    }

    public String getPub() {
        return this.pub;
    }
}
