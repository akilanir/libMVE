package org.kore.kolab.notes;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/Attachment.class */
public class Attachment {
    private final String id;
    private final String mimeType;
    private final String fileName;
    private byte[] data;

    public Attachment(String id, String fileName, String mimeType) {
        this.id = id;
        this.data = new byte[0];
        this.fileName = fileName;
        this.mimeType = mimeType;
    }

    public Attachment(String fileName, String mimeType) {
        this(fileName, fileName, mimeType);
    }

    public String getFileName() {
        return this.fileName;
    }

    public byte[] getData() {
        return this.data;
    }

    public void setData(byte[] bytes) {
        this.data = bytes;
    }

    public String getId() {
        return this.id;
    }

    public String getMimeType() {
        return this.mimeType;
    }

    public int hashCode() {
        int hash = (41 * 7) + (this.id != null ? this.id.hashCode() : 0);
        return hash;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Attachment other = (Attachment) obj;
        if (this.id == null) {
            if (other.id != null) {
                return false;
            }
            return true;
        }
        if (!this.id.equals(other.id)) {
            return false;
        }
        return true;
    }

    public String toString() {
        return "Attachment{id=" + this.id + ", mimeType=" + this.mimeType + ", fileName=" + this.fileName + '}';
    }
}
