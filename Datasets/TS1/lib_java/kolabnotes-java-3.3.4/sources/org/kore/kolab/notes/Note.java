package org.kore.kolab.notes;

import java.io.Serializable;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import org.kore.kolab.notes.event.AbstractEventSupport;
import org.kore.kolab.notes.event.EventListener;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/Note.class */
public class Note extends AbstractEventSupport implements Serializable, Comparable<Note> {
    private static final long serialVersionUID = 1;
    private final Identification identification;
    private final AuditInformation auditInformation;
    private Classification classification;
    private String summary;
    private String description;
    private Color color;
    private final Set<Tag> categories = new LinkedHashSet();
    private final Map<String, Attachment> attachments = new LinkedHashMap();

    /* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/Note$Classification.class */
    public enum Classification {
        PUBLIC,
        CONFIDENTIAL,
        PRIVATE
    }

    public Note(Identification identification, AuditInformation auditInformation, Classification classification, String summary) {
        this.identification = identification;
        this.auditInformation = auditInformation;
        this.classification = classification;
        this.summary = summary;
    }

    @Override // java.lang.Comparable
    public int compareTo(Note o) {
        if (equals(o)) {
            return 0;
        }
        int ergebnis = o.getAuditInformation().getLastModificationDate().compareTo(getAuditInformation().getLastModificationDate());
        if (ergebnis == 0) {
            ergebnis = getSummary().compareTo(o.getSummary());
        }
        return ergebnis;
    }

    public void addCategories(Tag... cats) {
        for (Tag cat : cats) {
            firePropertyChange(getIdentification().getUid(), EventListener.Type.NEW, "categories", null, cat);
            this.categories.add(cat);
        }
    }

    public void removeCategories(Tag... cats) {
        for (Tag cat : cats) {
            firePropertyChange(getIdentification().getUid(), EventListener.Type.DELETE, "categories", cat, null);
            this.categories.remove(cat);
        }
    }

    public void addAttachments(Attachment... atts) {
        for (Attachment att : atts) {
            firePropertyChange(getIdentification().getUid(), EventListener.Type.NEW, "attachments", null, att);
            this.attachments.put(att.getId(), att);
        }
    }

    public void removeAttachments(String... attId) {
        for (String att : attId) {
            firePropertyChange(getIdentification().getUid(), EventListener.Type.DELETE, "attachments", att, null);
            this.attachments.remove(att);
        }
    }

    public void removeAttachments(Attachment... atts) {
        for (Attachment att : atts) {
            firePropertyChange(getIdentification().getUid(), EventListener.Type.DELETE, "attachments", att.getId(), null);
            this.attachments.remove(att.getId());
        }
    }

    public Attachment getAttachment(String id) {
        return this.attachments.get(id);
    }

    public Collection<Attachment> getAttachments() {
        return Collections.unmodifiableCollection(this.attachments.values());
    }

    public Classification getClassification() {
        return this.classification;
    }

    public void setClassification(Classification classification) {
        firePropertyChange(getIdentification().getUid(), EventListener.Type.UPDATE, "classification", this.classification, classification);
        this.classification = classification;
    }

    public String getSummary() {
        return this.summary;
    }

    public void setSummary(String summary) {
        firePropertyChange(getIdentification().getUid(), EventListener.Type.UPDATE, "summary", this.summary, summary);
        this.summary = summary;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        firePropertyChange(getIdentification().getUid(), EventListener.Type.UPDATE, "description", this.description, description);
        this.description = description;
    }

    public Color getColor() {
        return this.color;
    }

    public void setColor(Color color) {
        firePropertyChange(getIdentification().getUid(), EventListener.Type.UPDATE, "color", this.color, color);
        this.color = color;
    }

    public Identification getIdentification() {
        return this.identification;
    }

    public AuditInformation getAuditInformation() {
        return this.auditInformation;
    }

    public Set<Tag> getCategories() {
        return Collections.unmodifiableSet(this.categories);
    }

    public int hashCode() {
        int result = (31 * 1) + (this.identification == null ? 0 : this.identification.hashCode());
        return result;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Note other = (Note) obj;
        if (this.identification == null) {
            if (other.identification != null) {
                return false;
            }
            return true;
        }
        if (!this.identification.equals(other.identification)) {
            return false;
        }
        return true;
    }

    public String toString() {
        return "Note{identification=" + this.identification + ", auditInformation=" + this.auditInformation + ", categories=" + this.categories + ", classification=" + this.classification + ", summary=" + this.summary + ", description=" + this.description + ", color=" + this.color + ", attachments=" + this.attachments + '}';
    }
}
