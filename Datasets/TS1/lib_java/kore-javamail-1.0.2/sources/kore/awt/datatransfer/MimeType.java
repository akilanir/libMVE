package kore.awt.datatransfer;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.util.HashMap;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.StringTokenizer;

/* loaded from: kore-javamail-1.0.2.jar:kore/awt/datatransfer/MimeType.class */
class MimeType implements Externalizable {
    private String primaryType;
    private String subType;
    private HashMap parameters;

    public MimeType() {
        this.parameters = new HashMap();
    }

    MimeType(String mime) throws MimeTypeParseException {
        this();
        parse(mime);
    }

    void addParameter(String param, String value) {
        this.parameters.put(param, value);
    }

    void removeParameter(String param) {
        this.parameters.remove(param);
    }

    String getParameter(String key) {
        return (String) this.parameters.get(key);
    }

    String getPrimaryType() {
        return this.primaryType;
    }

    String getSubType() {
        return this.subType;
    }

    String getBaseType() {
        return this.primaryType + '/' + this.subType;
    }

    boolean matches(MimeType other) {
        boolean match = false;
        if (other != null) {
            match = this.primaryType.equals(other.primaryType) && (this.subType.equals("*") || other.subType.equals("*") || this.subType.equals(other.subType));
        }
        return match;
    }

    @Override // java.io.Externalizable
    public void readExternal(ObjectInput in) throws ClassNotFoundException, IOException {
        String mime = in.readUTF();
        this.parameters.clear();
        try {
            parse(mime);
        } catch (MimeTypeParseException ex) {
            IOException ioEx = new IOException();
            ioEx.initCause(ex);
            throw ioEx;
        }
    }

    @Override // java.io.Externalizable
    public void writeExternal(ObjectOutput out) throws IOException {
        out.writeUTF(toString());
    }

    public String toString() {
        StringBuilder s = new StringBuilder();
        s.append(this.primaryType);
        s.append('/');
        s.append(this.subType);
        if (this.parameters.size() > 0) {
            Set<Map.Entry> entries = this.parameters.entrySet();
            for (Map.Entry entry : entries) {
                s.append("; ");
                s.append(entry.getKey());
                s.append('=');
                s.append(entry.getValue());
            }
        }
        return s.toString();
    }

    private void parse(String mime) throws MimeTypeParseException {
        StringTokenizer tokenizer = new StringTokenizer(mime);
        try {
            this.primaryType = tokenizer.nextToken("/");
            this.subType = tokenizer.nextToken("/;");
            while (tokenizer.hasMoreTokens()) {
                String keyValuePair = tokenizer.nextToken(";");
                int i = keyValuePair.indexOf(61);
                if (i == -1) {
                    throw new MimeTypeParseException("Expected = as parameter separator");
                }
                String key = keyValuePair.substring(0, i).trim();
                String value = keyValuePair.substring(i + 1).trim();
                this.parameters.put(key, value);
            }
        } catch (NoSuchElementException e) {
            throw new MimeTypeParseException("Expected / separator");
        }
    }
}
