package org.kore.kolab.notes;

import java.util.Date;
import java.util.Map;
import org.kore.kolab.notes.event.EventListener;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/RemoteNotesRepository.class */
public interface RemoteNotesRepository extends NotesRepository {

    /* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/RemoteNotesRepository$Base64Coder.class */
    public interface Base64Coder {
        String encode(byte[] bArr);

        byte[] decode(String str);
    }

    /* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/RemoteNotesRepository$Listener.class */
    public interface Listener {
        void onSyncUpdate(String str);

        void onFolderSyncException(String str, Exception exc);
    }

    void refresh(Listener... listenerArr);

    void refresh(Date date, Listener... listenerArr);

    void merge(Listener... listenerArr);

    void merge(Map<String, EventListener.Type> map, Listener... listenerArr);

    void fillUnloadedNote(Note note);

    boolean noteCompletelyLoaded(Note note);

    void setBase64Coder(Base64Coder base64Coder);
}
