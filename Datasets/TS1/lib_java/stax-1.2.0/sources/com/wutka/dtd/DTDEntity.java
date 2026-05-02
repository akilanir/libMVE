package com.wutka.dtd;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.net.URL;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/DTDEntity.class */
public class DTDEntity implements DTDOutput {
    public String name;
    public boolean isParsed;
    public String value;
    public DTDExternalID externalID;
    public String ndata;
    public Object defaultLocation;

    public DTDEntity() {
    }

    public DTDEntity(String aName) {
        this.name = aName;
    }

    public DTDEntity(String aName, Object aDefaultLocation) {
        this.name = aName;
        this.defaultLocation = aDefaultLocation;
    }

    @Override // com.wutka.dtd.DTDOutput
    public void write(PrintWriter out) throws IOException {
        out.print("<!ENTITY ");
        if (this.isParsed) {
            out.print(" % ");
        }
        out.print(this.name);
        if (this.value != null) {
            char quoteChar = '\"';
            if (this.value.indexOf(34) >= 0) {
                quoteChar = '\'';
            }
            out.print(quoteChar);
            out.print(this.value);
            out.print(quoteChar);
        } else {
            this.externalID.write(out);
            if (this.ndata != null) {
                out.print(" NDATA ");
                out.print(this.ndata);
            }
        }
        out.println(">");
    }

    public String getExternalId() {
        return this.externalID.system;
    }

    public Reader getReader() throws IOException {
        if (this.externalID == null) {
            return null;
        }
        Reader rd = getReader(this.externalID.system);
        return rd;
    }

    public Reader getReader(String entityName) {
        try {
            if (this.defaultLocation != null) {
                if (this.defaultLocation instanceof File) {
                    File loc = (File) this.defaultLocation;
                    BufferedReader in = new BufferedReader(new FileReader(new File(loc, entityName)));
                    return in;
                }
                if (this.defaultLocation instanceof URL) {
                    URL url = new URL((URL) this.defaultLocation, entityName);
                    BufferedReader in2 = new BufferedReader(new InputStreamReader(url.openStream()));
                    return in2;
                }
            }
            BufferedReader in3 = new BufferedReader(new FileReader(entityName));
            return in3;
        } catch (Exception e) {
            try {
                URL url2 = new URL(entityName);
                InputStream inStream = url2.openStream();
                BufferedReader in4 = new BufferedReader(new InputStreamReader(inStream));
                return in4;
            } catch (Exception e2) {
                return null;
            }
        }
    }

    public boolean equals(Object ob) {
        if (ob == this) {
            return true;
        }
        if (!(ob instanceof DTDEntity)) {
            return false;
        }
        DTDEntity other = (DTDEntity) ob;
        if (this.name == null) {
            if (other.name != null) {
                return false;
            }
        } else if (!this.name.equals(other.name)) {
            return false;
        }
        if (this.isParsed != other.isParsed) {
            return false;
        }
        if (this.value == null) {
            if (other.value != null) {
                return false;
            }
        } else if (!this.value.equals(other.value)) {
            return false;
        }
        if (this.externalID == null) {
            if (other.externalID != null) {
                return false;
            }
        } else if (!this.externalID.equals(other.externalID)) {
            return false;
        }
        return this.ndata == null ? other.ndata == null : this.ndata.equals(other.ndata);
    }

    public void setName(String aName) {
        this.name = aName;
    }

    public String getName() {
        return this.name;
    }

    public void setIsParsed(boolean flag) {
        this.isParsed = flag;
    }

    public boolean isParsed() {
        return this.isParsed;
    }

    public void setValue(String aValue) {
        this.value = aValue;
    }

    public String getValue() {
        return this.value;
    }

    public void setExternalID(DTDExternalID anExternalID) {
        this.externalID = anExternalID;
    }

    public DTDExternalID getExternalID() {
        return this.externalID;
    }

    public void setNdata(String anNdata) {
        this.ndata = anNdata;
    }

    public String getNdata() {
        return this.ndata;
    }
}
