package com.wutka.dtd;

import java.io.IOException;
import java.io.PrintWriter;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/DTDAttribute.class */
public class DTDAttribute implements DTDOutput {
    public String name;
    public Object type;
    public DTDDecl decl;
    public String defaultValue;

    public DTDAttribute() {
    }

    public DTDAttribute(String aName) {
        this.name = aName;
    }

    @Override // com.wutka.dtd.DTDOutput
    public void write(PrintWriter out) throws IOException {
        out.print(new StringBuffer().append(this.name).append(" ").toString());
        if (this.type instanceof String) {
            out.print(this.type);
        } else if (this.type instanceof DTDEnumeration) {
            DTDEnumeration dtdEnum = (DTDEnumeration) this.type;
            dtdEnum.write(out);
        } else if (this.type instanceof DTDNotationList) {
            DTDNotationList dtdnl = (DTDNotationList) this.type;
            dtdnl.write(out);
        }
        if (this.decl != null) {
            this.decl.write(out);
        }
        if (this.defaultValue != null) {
            out.print(" \"");
            out.print(this.defaultValue);
            out.print("\"");
        }
    }

    public boolean equals(Object ob) {
        if (ob == this) {
            return true;
        }
        if (!(ob instanceof DTDAttribute)) {
            return false;
        }
        DTDAttribute other = (DTDAttribute) ob;
        if (this.name == null) {
            if (other.name != null) {
                return false;
            }
        } else if (!this.name.equals(other.name)) {
            return false;
        }
        if (this.type == null) {
            if (other.type != null) {
                return false;
            }
        } else if (!this.type.equals(other.type)) {
            return false;
        }
        if (this.decl == null) {
            if (other.decl != null) {
                return false;
            }
        } else if (!this.decl.equals(other.decl)) {
            return false;
        }
        return this.defaultValue == null ? other.defaultValue == null : this.defaultValue.equals(other.defaultValue);
    }

    public void setName(String aName) {
        this.name = aName;
    }

    public String getName() {
        return this.name;
    }

    public void setType(Object aType) {
        if (!(aType instanceof String) && !(aType instanceof DTDEnumeration) && !(aType instanceof DTDNotationList)) {
            throw new IllegalArgumentException("Must be String, DTDEnumeration or DTDNotationList");
        }
        this.type = aType;
    }

    public Object getType() {
        return this.type;
    }

    public void setDecl(DTDDecl aDecl) {
        this.decl = aDecl;
    }

    public DTDDecl getDecl() {
        return this.decl;
    }

    public void setDefaultValue(String aDefaultValue) {
        this.defaultValue = aDefaultValue;
    }

    public String getDefaultValue() {
        return this.defaultValue;
    }
}
