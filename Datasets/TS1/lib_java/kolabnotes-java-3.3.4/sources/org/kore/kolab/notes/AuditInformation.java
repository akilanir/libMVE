package org.kore.kolab.notes;

import java.io.Serializable;
import java.sql.Timestamp;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/AuditInformation.class */
public class AuditInformation implements Serializable, Comparable<AuditInformation> {
    private static final long serialVersionUID = 1;
    private Timestamp creationDate;
    private Timestamp lastModificationDate;

    public AuditInformation(Timestamp creationDate, Timestamp lastModificationDate) {
        if (creationDate == null || lastModificationDate == null) {
            throw new IllegalArgumentException("given parameters must not be null");
        }
        this.creationDate = new Timestamp(creationDate.getTime());
        this.lastModificationDate = new Timestamp(lastModificationDate.getTime());
    }

    public Timestamp getCreationDate() {
        return new Timestamp(this.creationDate.getTime());
    }

    public Timestamp getLastModificationDate() {
        return new Timestamp(this.lastModificationDate.getTime());
    }

    public void setLastModificationDate(long millis) {
        this.lastModificationDate = new Timestamp(millis);
    }

    public void setCreationDate(long millis) {
        this.creationDate = new Timestamp(millis);
    }

    public int hashCode() {
        int result = (31 * 1) + (this.creationDate == null ? 0 : this.creationDate.hashCode());
        return (31 * result) + (this.lastModificationDate == null ? 0 : this.lastModificationDate.hashCode());
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        AuditInformation other = (AuditInformation) obj;
        if (this.creationDate == null) {
            if (other.creationDate != null) {
                return false;
            }
        } else if (!this.creationDate.equals(other.creationDate)) {
            return false;
        }
        if (this.lastModificationDate == null) {
            if (other.lastModificationDate != null) {
                return false;
            }
            return true;
        }
        if (!this.lastModificationDate.equals(other.lastModificationDate)) {
            return false;
        }
        return true;
    }

    public String toString() {
        return "Audit [creationDate=" + this.creationDate + ", lastModificationDate=" + this.lastModificationDate + "]";
    }

    @Override // java.lang.Comparable
    public int compareTo(AuditInformation o) {
        int first = getLastModificationDate().compareTo(o.getLastModificationDate());
        return first == 0 ? getCreationDate().compareTo(o.getCreationDate()) : first;
    }
}
