package org.kore.kolab.notes.imap;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import kore.awt.datatransfer.DataFlavor;
import kore.awt.datatransfer.UnsupportedFlavorException;
import korex.activation.ActivationDataFlavor;
import korex.activation.DataHandler;
import org.kore.kolab.notes.KolabParser;
import org.kore.kolab.notes.Note;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/imap/IMAPKolabDataHandler.class */
public class IMAPKolabDataHandler extends DataHandler {
    private static final ActivationDataFlavor myDF = new ActivationDataFlavor(Note.class, "APPLICATION/VND.KOLAB+XML", "Kolab Object");
    private final KolabParser parser;

    /* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/imap/IMAPKolabDataHandler$NoCloseOutputStream.class */
    private static class NoCloseOutputStream extends FilterOutputStream {
        public NoCloseOutputStream(OutputStream os) {
            super(os);
        }

        @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
        public void close() {
        }
    }

    public IMAPKolabDataHandler(Object obj, String mimeType, KolabParser parser) {
        super(obj, mimeType);
        this.parser = parser;
    }

    public DataFlavor[] getTransferDataFlavors() {
        return new DataFlavor[]{myDF};
    }

    public Object getTransferData(DataFlavor flavor) throws UnsupportedFlavorException, IOException {
        if (isDataFlavorSupported(flavor)) {
            return getContent();
        }
        return null;
    }

    public boolean isDataFlavorSupported(DataFlavor flavor) {
        return myDF.equals(flavor);
    }

    public void writeTo(OutputStream os) throws IOException {
        this.parser.write(getContent(), os);
    }

    public String getContentType() {
        return "APPLICATION/VND.KOLAB+XML";
    }
}
