package org.kore.kolab.notes;

import java.io.Serializable;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/Identification.class */
public class Identification implements Serializable {
    private static final long serialVersionUID = 1;
    private final String uid;
    private final String productId;

    public Identification(String uid, String productId) {
        if (uid == null || productId == null) {
            throw new IllegalArgumentException("given parameters must not be null");
        }
        this.uid = uid;
        this.productId = productId;
    }

    public String getUid() {
        return this.uid;
    }

    public String getProductId() {
        return this.productId;
    }

    public String toString() {
        return "Identification [uid=" + this.uid + ", productId=" + this.productId + "]";
    }

    public int hashCode() {
        int result = (31 * 1) + (this.productId == null ? 0 : this.productId.hashCode());
        return (31 * result) + (this.uid == null ? 0 : this.uid.hashCode());
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Identification other = (Identification) obj;
        if (this.productId == null) {
            if (other.productId != null) {
                return false;
            }
        } else if (!this.productId.equals(other.productId)) {
            return false;
        }
        if (this.uid == null) {
            if (other.uid != null) {
                return false;
            }
            return true;
        }
        if (!this.uid.equals(other.uid)) {
            return false;
        }
        return true;
    }
}
