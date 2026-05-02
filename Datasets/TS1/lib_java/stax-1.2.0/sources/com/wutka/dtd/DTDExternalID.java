package com.wutka.dtd;

import java.io.IOException;
import java.io.PrintWriter;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/DTDExternalID.class */
public abstract class DTDExternalID implements DTDOutput {
    public String system;

    @Override // com.wutka.dtd.DTDOutput
    public abstract void write(PrintWriter printWriter) throws IOException;

    public boolean equals(Object ob) {
        if (ob == this) {
            return true;
        }
        if (!(ob instanceof DTDExternalID)) {
            return false;
        }
        DTDExternalID other = (DTDExternalID) ob;
        return this.system == null ? other.system == null : this.system.equals(other.system);
    }

    public void setSystem(String aSystem) {
        this.system = aSystem;
    }

    public String getSystem() {
        return this.system;
    }
}
