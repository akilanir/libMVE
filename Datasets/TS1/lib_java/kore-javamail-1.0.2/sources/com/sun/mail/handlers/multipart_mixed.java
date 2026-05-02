package com.sun.mail.handlers;

import java.io.IOException;
import java.io.OutputStream;
import kore.awt.datatransfer.DataFlavor;
import korex.activation.ActivationDataFlavor;
import korex.activation.DataContentHandler;
import korex.activation.DataSource;
import korex.mail.MessagingException;
import korex.mail.internet.MimeMultipart;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/handlers/multipart_mixed.class */
public class multipart_mixed implements DataContentHandler {
    private ActivationDataFlavor myDF = new ActivationDataFlavor(MimeMultipart.class, "multipart/mixed", "Multipart");

    @Override // korex.activation.DataContentHandler
    public DataFlavor[] getTransferDataFlavors() {
        return new DataFlavor[]{this.myDF};
    }

    @Override // korex.activation.DataContentHandler
    public Object getTransferData(DataFlavor df, DataSource ds) throws IOException {
        if (this.myDF.equals(df)) {
            return getContent(ds);
        }
        return null;
    }

    @Override // korex.activation.DataContentHandler
    public Object getContent(DataSource ds) throws IOException {
        try {
            return new MimeMultipart(ds);
        } catch (MessagingException e) {
            IOException ioex = new IOException("Exception while constructing MimeMultipart");
            ioex.initCause(e);
            throw ioex;
        }
    }

    @Override // korex.activation.DataContentHandler
    public void writeTo(Object obj, String mimeType, OutputStream os) throws IOException {
        if (obj instanceof MimeMultipart) {
            try {
                ((MimeMultipart) obj).writeTo(os);
            } catch (MessagingException e) {
                throw new IOException(e.toString());
            }
        }
    }
}
