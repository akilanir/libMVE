package org.kore.kolab.notes;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.kore.kolab.notes.Note;
import org.kore.kolab.notes.event.EventListener;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/Notebook.class */
public class Notebook extends Note {
    private final Map<String, Note> notes;

    public Notebook(Identification identification, AuditInformation auditInformation, Note.Classification classification, String summary) {
        super(identification, auditInformation, classification, summary);
        this.notes = new LinkedHashMap();
    }

    public Collection<Note> getNotes() {
        return Collections.unmodifiableCollection(this.notes.values());
    }

    public Note getNote(String uid) {
        return this.notes.get(uid);
    }

    public Note createNote(String uid, String summary) {
        Identification identification = new Identification(uid, "kolabnotes-java");
        Timestamp now = new Timestamp(System.currentTimeMillis());
        AuditInformation audit = new AuditInformation(now, now);
        Note note = new Note(identification, audit, Note.Classification.PUBLIC, summary);
        List<EventListener> eventListener = getEventListener();
        note.addListener((EventListener[]) eventListener.toArray(new EventListener[eventListener.size()]));
        addNote(note);
        return note;
    }

    public void addNote(Note note) {
        firePropertyChange(note.getIdentification().getUid(), EventListener.Type.NEW, "note", null, note);
        this.notes.put(note.getIdentification().getUid(), note);
    }

    public void deleteNote(String uid) {
        firePropertyChange(uid, EventListener.Type.DELETE, "note", getIdentification().getUid(), null);
        this.notes.remove(uid);
    }

    @Override // org.kore.kolab.notes.Note
    public String toString() {
        return "Notebook{" + super.toString() + "notes=" + this.notes + '}';
    }

    public boolean isShared() {
        return false;
    }
}
