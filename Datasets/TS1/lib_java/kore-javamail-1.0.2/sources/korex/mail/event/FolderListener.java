package korex.mail.event;

import java.util.EventListener;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/event/FolderListener.class */
public interface FolderListener extends EventListener {
    void folderCreated(FolderEvent folderEvent);

    void folderDeleted(FolderEvent folderEvent);

    void folderRenamed(FolderEvent folderEvent);
}
