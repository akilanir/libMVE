package com.wutka.dtd;

import java.io.IOException;
import java.io.PrintWriter;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/DTDNotation.class */
public class DTDNotation implements DTDOutput {
    public String name;
    public DTDExternalID externalID;

    public DTDNotation() {
    }

    public DTDNotation(String aName) {
        this.name = aName;
    }

    @Override // com.wutka.dtd.DTDOutput
    public void write(PrintWriter out) throws IOException {
        out.print("<!NOTATION ");
        out.print(this.name);
        out.print(" ");
        this.externalID.write(out);
        out.println(">");
    }

    public boolean equals(Object ob) {
        if (ob == this) {
            return true;
        }
        if (!(ob instanceof DTDNotation)) {
            return false;
        }
        DTDNotation other = (DTDNotation) ob;
        if (this.name == null) {
            if (other.name != null) {
                return false;
            }
        } else if (!this.name.equals(other.name)) {
            return false;
        }
        return this.externalID == null ? other.externalID == null : this.externalID.equals(other.externalID);
    }

    public void setName(String aName) {
        this.name = aName;
    }

    public String getName() {
        return this.name;
    }

    public void setExternalID(DTDExternalID theExternalID) {
        this.externalID = theExternalID;
    }

    public DTDExternalID getExternalID() {
        return this.externalID;
    }
}
