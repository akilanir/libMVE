package org.kore.kolab.notes.local;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Collections;
import java.util.Enumeration;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;
import org.kore.kolab.notes.AuditInformation;
import org.kore.kolab.notes.Identification;
import org.kore.kolab.notes.KolabParser;
import org.kore.kolab.notes.Note;
import org.kore.kolab.notes.Notebook;
import org.kore.kolab.notes.NotesRepository;
import org.kore.kolab.notes.event.EventListener;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/local/LocalNotesRepository.class */
public class LocalNotesRepository implements Serializable, NotesRepository, EventListener {
    protected final KolabParser parser;
    protected final String rootfolder;
    private boolean disableChangeListening = false;
    protected final Map<String, Notebook> notebookCache = new ConcurrentHashMap();
    protected final Map<String, Note> notesCache = new ConcurrentHashMap();
    protected final Map<String, Notebook> deletedNotebookCache = new ConcurrentHashMap();
    protected final Map<String, Map<String, Note>> deletedNotesCache = new ConcurrentHashMap();
    protected final Map<String, EventListener.Type> eventCache = new ConcurrentHashMap();

    public LocalNotesRepository(KolabParser parser, String rootFolder) {
        this.parser = parser;
        this.rootfolder = rootFolder;
    }

    protected void disableChangeListening() {
        this.disableChangeListening = true;
    }

    protected void enableChangeListening() {
        this.disableChangeListening = false;
    }

    protected boolean isChangeListeningDisabled() {
        return this.disableChangeListening;
    }

    @Override // org.kore.kolab.notes.NotesRepository
    public Map<String, EventListener.Type> getTrackedChanges() {
        return Collections.unmodifiableMap(this.eventCache);
    }

    @Override // org.kore.kolab.notes.NotesRepository
    public void trackExisitingNotebooks(Collection<Notebook> existing) {
        for (Notebook nb : existing) {
            nb.addListener(this);
            putInNotebookCache(nb.getIdentification().getUid(), nb);
            for (Note note : nb.getNotes()) {
                note.addListener(this);
                putInNotesCache(note.getIdentification().getUid(), note);
            }
        }
    }

    /* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy.class */
    enum PropertyChangeStrategy {
        NOTHING { // from class: org.kore.kolab.notes.local.LocalNotesRepository.PropertyChangeStrategy.1
            @Override // org.kore.kolab.notes.local.LocalNotesRepository.PropertyChangeStrategy
            public void performChange(LocalNotesRepository repo, String uid, EventListener.Type type, String propertyName, Object oldValue, Object newValue) {
            }
        },
        DELETE_NEW { // from class: org.kore.kolab.notes.local.LocalNotesRepository.PropertyChangeStrategy.2
            @Override // org.kore.kolab.notes.local.LocalNotesRepository.PropertyChangeStrategy
            public void performChange(LocalNotesRepository repo, String uid, EventListener.Type type, String propertyName, Object oldValue, Object newValue) {
                repo.removeEvent(uid);
            }
        },
        DELETE { // from class: org.kore.kolab.notes.local.LocalNotesRepository.PropertyChangeStrategy.3
            @Override // org.kore.kolab.notes.local.LocalNotesRepository.PropertyChangeStrategy
            public void performChange(LocalNotesRepository repo, String uid, EventListener.Type type, String propertyName, Object oldValue, Object newValue) {
                EventListener.Type correctType = type;
                if ("notebook".equalsIgnoreCase(propertyName)) {
                    Notebook removed = repo.removeFromNotebookCache(uid);
                    for (Note note : removed.getNotes()) {
                        repo.removeFromNotesCache(uid, note.getIdentification().getUid());
                    }
                } else if ("note".equalsIgnoreCase(propertyName)) {
                    repo.removeFromNotesCache(oldValue.toString(), uid);
                } else if ("categories".equalsIgnoreCase(propertyName) || "attachments".equalsIgnoreCase(propertyName)) {
                    correctType = EventListener.Type.UPDATE;
                }
                putEvent(repo, uid, correctType);
            }
        },
        NEW { // from class: org.kore.kolab.notes.local.LocalNotesRepository.PropertyChangeStrategy.4
            @Override // org.kore.kolab.notes.local.LocalNotesRepository.PropertyChangeStrategy
            public void performChange(LocalNotesRepository repo, String uid, EventListener.Type type, String propertyName, Object oldValue, Object newValue) {
                EventListener.Type correctType = type;
                if ("notebook".equalsIgnoreCase(propertyName)) {
                    repo.putInNotebookCache(uid, (Notebook) newValue);
                } else if ("note".equalsIgnoreCase(propertyName)) {
                    repo.putInNotesCache(uid, (Note) newValue);
                } else if ("categories".equalsIgnoreCase(propertyName) || "attachments".equalsIgnoreCase(propertyName)) {
                    correctType = EventListener.Type.UPDATE;
                }
                putEvent(repo, uid, correctType);
            }
        },
        UPDATE { // from class: org.kore.kolab.notes.local.LocalNotesRepository.PropertyChangeStrategy.5
            @Override // org.kore.kolab.notes.local.LocalNotesRepository.PropertyChangeStrategy
            public void performChange(LocalNotesRepository repo, String uid, EventListener.Type type, String propertyName, Object oldValue, Object newValue) {
                if (valueChanged(oldValue, newValue)) {
                    putEvent(repo, uid, type);
                    Note note = repo.getNote(uid);
                    if (note == null) {
                        note = repo.getNotebook(uid);
                    }
                    note.getAuditInformation().setLastModificationDate(System.currentTimeMillis());
                }
            }
        };

        abstract void performChange(LocalNotesRepository localNotesRepository, String str, EventListener.Type type, String str2, Object obj, Object obj2);

        static boolean valueChanged(Object oldValue, Object newValue) {
            if (oldValue != null || newValue == null) {
                return (oldValue == null || oldValue.equals(newValue)) ? false : true;
            }
            return true;
        }

        static void putEvent(LocalNotesRepository repo, String uid, EventListener.Type type) {
            if (repo.getEvent(uid) == null) {
                repo.putEvent(uid, type);
            }
        }

        static PropertyChangeStrategy valueOf(EventListener.Type existingtype, EventListener.Type newChangeType) {
            if (existingtype == EventListener.Type.NEW && newChangeType == EventListener.Type.DELETE) {
                return DELETE_NEW;
            }
            if (newChangeType == EventListener.Type.DELETE) {
                return DELETE;
            }
            if (newChangeType == EventListener.Type.NEW) {
                return NEW;
            }
            if (existingtype == null) {
                return UPDATE;
            }
            return NOTHING;
        }
    }

    @Override // org.kore.kolab.notes.event.EventListener
    public void propertyChanged(String uid, EventListener.Type type, String propertyName, Object oldValue, Object newValue) {
        if (this.disableChangeListening) {
            return;
        }
        EventListener.Type eventType = this.eventCache.get(uid);
        PropertyChangeStrategy.valueOf(eventType, type).performChange(this, uid, type, propertyName, oldValue, newValue);
    }

    public EventListener.Type getEvent(String uid) {
        return this.eventCache.get(uid);
    }

    protected void initCache() {
    }

    @Override // org.kore.kolab.notes.NotesRepository
    public Note getNote(String id) {
        initCache();
        return this.notesCache.get(id);
    }

    @Override // org.kore.kolab.notes.NotesRepository
    public Collection<Note> getNotes() {
        initCache();
        return Collections.unmodifiableCollection(this.notesCache.values());
    }

    @Override // org.kore.kolab.notes.NotesRepository
    public Collection<Notebook> getNotebooks() {
        initCache();
        return Collections.unmodifiableCollection(this.notebookCache.values());
    }

    @Override // org.kore.kolab.notes.NotesRepository
    public Notebook getNotebook(String uid) {
        initCache();
        return this.notebookCache.get(uid);
    }

    @Override // org.kore.kolab.notes.NotesRepository
    public Notebook getNotebookBySummary(String summary) {
        initCache();
        for (Notebook nb : this.notebookCache.values()) {
            if (summary.equals(nb.getSummary())) {
                return nb;
            }
        }
        return null;
    }

    @Override // org.kore.kolab.notes.NotesRepository
    public boolean deleteNotebook(String id) {
        propertyChanged(id, EventListener.Type.DELETE, "notebook", id, null);
        return this.notebookCache.get(id) == null;
    }

    @Override // org.kore.kolab.notes.NotesRepository
    public Notebook createNotebook(String uid, String summary) {
        Identification identification = new Identification(uid, "kolabnotes-java");
        Timestamp now = new Timestamp(System.currentTimeMillis());
        AuditInformation audit = new AuditInformation(now, now);
        Notebook notebook = new Notebook(identification, audit, Note.Classification.PUBLIC, summary);
        propertyChanged(uid, EventListener.Type.NEW, "notebook", null, notebook);
        notebook.addListener(this);
        return notebook;
    }

    protected void addNotebook(String uid, Notebook notebook) {
        this.notebookCache.put(uid, notebook);
        notebook.addListener(this);
    }

    protected void addNote(String uid, Note note) {
        this.notesCache.put(uid, note);
        note.addListener(this);
    }

    protected Notebook removeFromNotebookCache(String uid) {
        Notebook remove = this.notebookCache.remove(uid);
        if (remove != null) {
            this.deletedNotebookCache.put(uid, remove);
        }
        return remove;
    }

    protected void removeFromNotesCache(String uidNotebook, String uidNote) {
        Note remove = this.notesCache.remove(uidNote);
        if (remove != null) {
            Map<String, Note> book = this.deletedNotesCache.get(uidNotebook);
            if (book == null) {
                book = new ConcurrentHashMap();
                this.deletedNotesCache.put(uidNotebook, book);
            }
            book.put(uidNote, remove);
        }
    }

    protected void putInNotebookCache(String uid, Notebook value) {
        this.notebookCache.put(uid, value);
    }

    protected void putInNotesCache(String uid, Note value) {
        this.notesCache.put(uid, value);
    }

    protected void removeEvent(String uid) {
        this.eventCache.remove(uid);
    }

    protected void putEvent(String uid, EventListener.Type type) {
        this.eventCache.put(uid, type);
    }

    @Override // org.kore.kolab.notes.NotesRepository
    public KolabParser getNotesParser() {
        return this.parser;
    }

    @Override // org.kore.kolab.notes.NotesRepository
    public String getRootFolder() {
        return this.rootfolder;
    }

    @Override // org.kore.kolab.notes.NotesRepository
    public File exportNotebook(Notebook nb, File destination) throws IOException {
        return exportNotebook(nb, this.parser, destination);
    }

    private String replacePossibleIllegalFileCharacters(String filename) {
        return filename.replaceAll("[^a-zA-Z0-9.-]", "_");
    }

    @Override // org.kore.kolab.notes.NotesRepository
    public File exportNotebook(Notebook notebook, KolabParser parser, File destination) throws IOException {
        File zipFile = new File(destination, replacePossibleIllegalFileCharacters(notebook.getSummary()) + ".zip");
        zipFile.createNewFile();
        createZIP(new FileOutputStream(zipFile), notebook, parser);
        return zipFile;
    }

    @Override // org.kore.kolab.notes.NotesRepository
    public void exportNotebook(Notebook notebook, KolabParser parser, OutputStream destination) throws IOException {
        createZIP(destination, notebook, parser);
    }

    private void createZIP(OutputStream destination, Notebook notebook, KolabParser parser1) throws IOException {
        ZipOutputStream outStream = new ZipOutputStream(destination);
        for (Note note : notebook.getNotes()) {
            ZipEntry entry = new ZipEntry(note.getSummary() + ".xml");
            outStream.putNextEntry(entry);
            ByteArrayOutputStream noteStream = new ByteArrayOutputStream();
            parser1.write(note, noteStream);
            byte[] noteBytes = noteStream.toByteArray();
            noteStream.close();
            outStream.write(noteBytes, 0, noteBytes.length);
            outStream.closeEntry();
        }
        outStream.close();
    }

    @Override // org.kore.kolab.notes.NotesRepository
    public Notebook importNotebook(String fileName, KolabParser parser, InputStream zipFile) throws IOException {
        Notebook book;
        String notebookName = fileName;
        if (notebookName.toUpperCase().endsWith(".ZIP")) {
            notebookName = notebookName.substring(0, notebookName.length() - ".ZIP".length());
        }
        Notebook existingBook = getNotebookBySummary(notebookName);
        if (existingBook == null) {
            book = createNotebook(UUID.randomUUID().toString(), notebookName);
        } else {
            book = existingBook;
        }
        ZipInputStream zipStream = new ZipInputStream(zipFile);
        while (zipStream.getNextEntry() != null) {
            byte[] entryAsByteArray = getEntryAsByteArray(zipStream);
            Note parse = (Note) parser.parse(new ByteArrayInputStream(entryAsByteArray));
            if (book.getNote(parse.getIdentification().getUid()) == null) {
                book.addNote(parse);
            }
            zipStream.closeEntry();
        }
        zipStream.close();
        return book;
    }

    byte[] getEntryAsByteArray(ZipInputStream zis) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        while (true) {
            int count = zis.read(buffer);
            if (count != -1) {
                baos.write(buffer, 0, count);
            } else {
                return baos.toByteArray();
            }
        }
    }

    @Override // org.kore.kolab.notes.NotesRepository
    public Notebook importNotebook(File zipFile, KolabParser parser) throws IOException {
        Notebook book;
        String notebookName = zipFile.getName();
        if (notebookName.toUpperCase().endsWith(".ZIP")) {
            notebookName = notebookName.substring(0, notebookName.length() - ".ZIP".length());
        }
        Notebook existingBook = getNotebookBySummary(notebookName);
        if (existingBook == null) {
            book = createNotebook(UUID.randomUUID().toString(), notebookName);
        } else {
            book = existingBook;
        }
        ZipFile zip = new ZipFile(zipFile);
        Enumeration<? extends ZipEntry> entries = zip.entries();
        while (entries.hasMoreElements()) {
            ZipEntry nextElement = entries.nextElement();
            InputStream inputStream = zip.getInputStream(nextElement);
            Note parse = (Note) parser.parse(inputStream);
            if (book.getNote(parse.getIdentification().getUid()) == null) {
                book.addNote(parse);
            }
            inputStream.close();
        }
        return book;
    }

    @Override // org.kore.kolab.notes.NotesRepository
    public Notebook importNotebook(File zipFile) throws IOException {
        return importNotebook(zipFile, this.parser);
    }

    public int hashCode() {
        int hash = (79 * 7) + (this.rootfolder != null ? this.rootfolder.hashCode() : 0);
        return hash;
    }

    public boolean equals(Object obj) {
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        LocalNotesRepository other = (LocalNotesRepository) obj;
        if (this.rootfolder == null) {
            if (other.rootfolder != null) {
                return false;
            }
            return true;
        }
        if (!this.rootfolder.equals(other.rootfolder)) {
            return false;
        }
        return true;
    }

    public String toString() {
        return "LocalNotesRepository{eventCache=" + this.eventCache + ", notebookCache=" + this.notebookCache + ", notesCache=" + this.notesCache + ", deletedNotebookCache=" + this.deletedNotebookCache + ", deletedNotesCache=" + this.deletedNotesCache + ", parser=" + this.parser + ", rootfolder=" + this.rootfolder + ", disableChangeListening=" + this.disableChangeListening + '}';
    }
}
