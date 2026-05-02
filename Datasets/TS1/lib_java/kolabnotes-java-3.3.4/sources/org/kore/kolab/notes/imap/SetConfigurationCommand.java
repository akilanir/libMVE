package org.kore.kolab.notes.imap;

import com.sun.mail.iap.Argument;
import com.sun.mail.iap.ProtocolException;
import com.sun.mail.iap.Response;
import com.sun.mail.imap.IMAPFolder;
import com.sun.mail.imap.protocol.IMAPProtocol;
import java.util.Arrays;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/imap/SetConfigurationCommand.class */
public class SetConfigurationCommand implements IMAPFolder.ProtocolCommand {
    private final String folderName;

    public SetConfigurationCommand(String folderName) {
        this.folderName = folderName;
    }

    public Object doCommand(IMAPProtocol imapp) throws ProtocolException {
        Argument command = new Argument();
        Argument listArguments = new Argument();
        command.writeString(this.folderName);
        command.writeNString("/vendor/kolab/folder-type");
        listArguments.writeNString("value.shared");
        listArguments.writeNString("configuration");
        listArguments.writeNString("value.priv");
        listArguments.writeNString("configuration.default");
        command.writeArgument(listArguments);
        Response[] response = imapp.command("SETANNOTATION", command);
        if (response.length == 1 && response[0].isOK()) {
            return null;
        }
        throw new ProtocolException("Unable to set folder-type." + Arrays.toString(response));
    }
}
