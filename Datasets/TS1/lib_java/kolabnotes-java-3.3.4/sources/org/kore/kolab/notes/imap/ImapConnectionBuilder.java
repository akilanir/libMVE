package org.kore.kolab.notes.imap;

import org.kore.kolab.notes.NotesRepository;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/imap/ImapConnectionBuilder.class */
public abstract class ImapConnectionBuilder {

    /* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/imap/ImapConnectionBuilder$Connect.class */
    public interface Connect {
        NotesRepository connect();

        Connect disableSSL();
    }

    /* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/imap/ImapConnectionBuilder$Hostname.class */
    public interface Hostname {
        Port hostname(String str);
    }

    /* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/imap/ImapConnectionBuilder$Password.class */
    public interface Password {
        RootFolder password(String str);
    }

    /* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/imap/ImapConnectionBuilder$Port.class */
    public interface Port {
        User port(String str);
    }

    /* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/imap/ImapConnectionBuilder$RootFolder.class */
    public interface RootFolder {
        Connect rootFolder(String str);
    }

    /* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/imap/ImapConnectionBuilder$User.class */
    public interface User {
        Password user(String str);
    }
}
