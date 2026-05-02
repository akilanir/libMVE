package org.kore.kolab.notes;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collection;
import java.util.Map;
import org.kore.kolab.notes.event.EventListener;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/NotesRepository.class */
public interface NotesRepository {
    Note getNote(String str);

    Collection<Note> getNotes();

    Collection<Notebook> getNotebooks();

    Notebook getNotebook(String str);

    Notebook getNotebookBySummary(String str);

    boolean deleteNotebook(String str);

    Notebook createNotebook(String str, String str2);

    String getRootFolder();

    KolabParser getNotesParser();

    void trackExisitingNotebooks(Collection<Notebook> collection);

    Map<String, EventListener.Type> getTrackedChanges();

    void exportNotebook(Notebook notebook, KolabParser kolabParser, OutputStream outputStream) throws IOException;

    File exportNotebook(Notebook notebook, File file) throws IOException;

    Notebook importNotebook(File file) throws IOException;

    File exportNotebook(Notebook notebook, KolabParser kolabParser, File file) throws IOException;

    Notebook importNotebook(File file, KolabParser kolabParser) throws IOException;

    Notebook importNotebook(String str, KolabParser kolabParser, InputStream inputStream) throws IOException;
}
