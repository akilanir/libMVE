package org.kore.kolab.notes.imap;

import com.sun.mail.iap.Argument;
import com.sun.mail.iap.ProtocolException;
import com.sun.mail.iap.Response;
import com.sun.mail.imap.IMAPFolder;
import com.sun.mail.imap.protocol.IMAPProtocol;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/imap/GetConfigurationCommand.class */
public class GetConfigurationCommand implements IMAPFolder.ProtocolCommand {
    private final String folderName;
    private boolean isConfigurationFolder;

    public GetConfigurationCommand(String folderName) {
        this.folderName = folderName;
    }

    public Object doCommand(IMAPProtocol imapp) throws ProtocolException {
        Argument command = new Argument();
        command.writeString(this.folderName);
        command.writeNString("/vendor/kolab/folder-type");
        command.writeString("*");
        Response[] response = imapp.command("GETANNOTATION", command);
        for (Response response2 : response) {
            String rest = response2.getRest();
            if (rest.contains("configuration")) {
                this.isConfigurationFolder = true;
                return null;
            }
        }
        return null;
    }

    public boolean isConfigurationFolder() {
        return this.isConfigurationFolder;
    }
}
