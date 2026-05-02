package org.kore.kolab.notes.imap;

import com.sun.mail.iap.Argument;
import com.sun.mail.iap.ProtocolException;
import com.sun.mail.iap.Response;
import com.sun.mail.imap.IMAPFolder;
import com.sun.mail.imap.protocol.IMAPProtocol;
import java.io.UnsupportedEncodingException;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/imap/GetFolderPermissionsCommand.class */
public class GetFolderPermissionsCommand implements IMAPFolder.ProtocolCommand {
    private static final String[] MODIFICATION_RIGHTS = {"e", "t"};
    private static final String[] CREATION_RIGHTS = {"i", "s", "w"};
    private final String folderName;
    private boolean isNoteCreationAllowed;
    private boolean isNoteModificationAllowed;

    public GetFolderPermissionsCommand(String folderName) {
        this.folderName = folderName;
    }

    public Object doCommand(IMAPProtocol imapp) throws ProtocolException {
        Argument command = new Argument();
        setFolderName(command);
        Response[] response = imapp.command("MYRIGHTS", command);
        for (Response response2 : response) {
            String rest = response2.getRest();
            String[] splitted = rest.split(" ");
            if (splitted.length > 1) {
                String imapPermissions = splitted[splitted.length - 1];
                boolean creationPossible = true;
                for (String creationRight : CREATION_RIGHTS) {
                    if (!imapPermissions.contains(creationRight)) {
                        creationPossible = false;
                    }
                }
                if (creationPossible) {
                    this.isNoteCreationAllowed = true;
                    boolean modificationPossible = true;
                    for (String modificationRight : MODIFICATION_RIGHTS) {
                        if (!imapPermissions.contains(modificationRight)) {
                            modificationPossible = false;
                        }
                    }
                    this.isNoteModificationAllowed = modificationPossible;
                    return null;
                }
                return null;
            }
        }
        return null;
    }

    void setFolderName(Argument command) {
        try {
            command.writeString(this.folderName, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            command.writeString(this.folderName);
        }
    }

    public boolean isIsNoteCreationAllowed() {
        return this.isNoteCreationAllowed;
    }

    public boolean isIsNoteModificationAllowed() {
        return this.isNoteModificationAllowed;
    }
}
