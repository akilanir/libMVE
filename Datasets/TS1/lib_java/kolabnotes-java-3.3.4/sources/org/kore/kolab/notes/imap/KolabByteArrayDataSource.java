package org.kore.kolab.notes.imap;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import korex.mail.util.ByteArrayDataSource;
import org.kore.kolab.notes.Attachment;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/imap/KolabByteArrayDataSource.class */
public class KolabByteArrayDataSource extends ByteArrayDataSource {
    private Attachment attachment;

    public KolabByteArrayDataSource(Attachment att) {
        super(att.getData(), att.getMimeType());
        this.attachment = att;
    }

    public KolabByteArrayDataSource(InputStream is, String type) throws IOException {
        super(is, type);
    }

    public KolabByteArrayDataSource(byte[] data, String type) {
        super(data, type);
    }

    public KolabByteArrayDataSource(String data, String type) throws IOException {
        super(data, type);
    }

    public OutputStream getOutputStream() throws IOException {
        return new ByteArrayOutputStream();
    }
}
