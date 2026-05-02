package org.kore.kolab.notes.imap;

import com.sun.mail.iap.Argument;
import com.sun.mail.iap.ProtocolException;
import com.sun.mail.iap.Response;
import com.sun.mail.imap.IMAPFolder;
import com.sun.mail.imap.protocol.IMAPProtocol;
import java.io.UnsupportedEncodingException;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/imap/GetMetadataCommand.class */
public class GetMetadataCommand implements IMAPFolder.ProtocolCommand {
    private final String folderName;
    private boolean isNotesFolder;

    public GetMetadataCommand(String folderName) {
        this.folderName = folderName;
    }

    public Object doCommand(IMAPProtocol imapp) throws ProtocolException {
        Argument command = new Argument();
        setFolderName(command);
        command.writeNString("/vendor/kolab/folder-type");
        command.writeString("*");
        Response[] response = imapp.command("GETANNOTATION", command);
        for (Response response2 : response) {
            String rest = response2.getRest();
            if (rest.contains("note")) {
                this.isNotesFolder = true;
                return null;
            }
        }
        return null;
    }

    public boolean isNotesFolder() {
        return this.isNotesFolder;
    }

    void setFolderName(Argument command) {
        try {
            command.writeString(this.folderName, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            command.writeString(this.folderName);
        }
    }
}
