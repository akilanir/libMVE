package org.kore.kolab.notes;

import org.kore.kolab.notes.Note;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/SharedNotebook.class */
public class SharedNotebook extends Notebook {
    private String shortName;
    private boolean noteCreationAllowed;
    private boolean noteModificationAllowed;

    public SharedNotebook(Identification identification, AuditInformation auditInformation, Note.Classification classification, String summary) {
        super(identification, auditInformation, classification, summary);
    }

    public String getShortName() {
        return this.shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public boolean isNoteCreationAllowed() {
        return this.noteCreationAllowed;
    }

    public void setNoteCreationAllowed(boolean noteCreationAllowed) {
        this.noteCreationAllowed = noteCreationAllowed;
    }

    public boolean isNoteModificationAllowed() {
        return this.noteModificationAllowed;
    }

    public void setNoteModificationAllowed(boolean noteModificationAllowed) {
        this.noteModificationAllowed = noteModificationAllowed;
    }

    @Override // org.kore.kolab.notes.Notebook, org.kore.kolab.notes.Note
    public String toString() {
        return "SharedNotebook{shortName=" + this.shortName + ", noteCreationAllowed=" + this.noteCreationAllowed + ", noteModificationAllowed=" + this.noteModificationAllowed + '}';
    }

    @Override // org.kore.kolab.notes.Notebook
    public boolean isShared() {
        return true;
    }

    public String getUsername() {
        if (isGlobalShared()) {
            return null;
        }
        String summary = getSummary();
        int indexOfFirstSlash = summary.indexOf("/");
        int indexOfSecondSlash = summary.indexOf("/", indexOfFirstSlash + 1);
        return summary.substring(indexOfFirstSlash + 1, indexOfSecondSlash);
    }

    public boolean isGlobalShared() {
        return getSummary().startsWith("Shared Folders");
    }
}
