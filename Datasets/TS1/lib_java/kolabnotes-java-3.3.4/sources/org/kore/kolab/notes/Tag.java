package org.kore.kolab.notes;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.UUID;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/Tag.class */
public class Tag implements Serializable, Comparable<Tag> {
    private final Identification identification;
    private final AuditInformation auditInformation;
    private String name;
    private int priority;
    private Color color;

    public Tag(Identification identification, AuditInformation auditInformation) {
        this.identification = identification;
        this.auditInformation = auditInformation;
    }

    public static Tag createNewTag(String name) {
        Identification identification = new Identification(UUID.randomUUID().toString(), "kolabnotes-java");
        Timestamp now = new Timestamp(System.currentTimeMillis());
        AuditInformation audit = new AuditInformation(now, now);
        Tag tag = new Tag(identification, audit);
        tag.setName(name);
        return tag;
    }

    public Identification getIdentification() {
        return this.identification;
    }

    public AuditInformation getAuditInformation() {
        return this.auditInformation;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public int getPriority() {
        return this.priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

    public Color getColor() {
        return this.color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    @Override // java.lang.Comparable
    public int compareTo(Tag o) {
        int compare = this.priority - o.getPriority();
        if (compare == 0) {
            compare = this.name.compareTo(o.getName());
        }
        return compare;
    }

    public String toString() {
        return "Tag{identification=" + this.identification + ", auditInformation=" + this.auditInformation + ", name=" + this.name + ", priority=" + this.priority + ", color=" + this.color + '}';
    }

    public int hashCode() {
        int hash = (23 * 5) + (this.name != null ? this.name.hashCode() : 0);
        return hash;
    }

    public boolean equals(Object obj) {
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Tag other = (Tag) obj;
        if (this.name == null) {
            if (other.name != null) {
                return false;
            }
            return true;
        }
        if (!this.name.equals(other.name)) {
            return false;
        }
        return true;
    }
}
