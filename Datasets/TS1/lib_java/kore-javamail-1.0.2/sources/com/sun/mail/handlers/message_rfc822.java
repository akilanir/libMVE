package com.sun.mail.handlers;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Properties;
import kore.awt.datatransfer.DataFlavor;
import korex.activation.ActivationDataFlavor;
import korex.activation.DataContentHandler;
import korex.activation.DataSource;
import korex.mail.Message;
import korex.mail.MessageAware;
import korex.mail.MessageContext;
import korex.mail.MessagingException;
import korex.mail.Session;
import korex.mail.internet.MimeMessage;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/handlers/message_rfc822.class */
public class message_rfc822 implements DataContentHandler {
    ActivationDataFlavor ourDataFlavor = new ActivationDataFlavor(Message.class, "message/rfc822", "Message");

    @Override // korex.activation.DataContentHandler
    public DataFlavor[] getTransferDataFlavors() {
        return new DataFlavor[]{this.ourDataFlavor};
    }

    @Override // korex.activation.DataContentHandler
    public Object getTransferData(DataFlavor df, DataSource ds) throws IOException {
        if (this.ourDataFlavor.equals(df)) {
            return getContent(ds);
        }
        return null;
    }

    @Override // korex.activation.DataContentHandler
    public Object getContent(DataSource ds) throws IOException {
        Session session;
        try {
            if (ds instanceof MessageAware) {
                MessageContext mc = ((MessageAware) ds).getMessageContext();
                session = mc.getSession();
            } else {
                session = Session.getDefaultInstance(new Properties(), null);
            }
            return new MimeMessage(session, ds.getInputStream());
        } catch (MessagingException me) {
            throw new IOException("Exception creating MimeMessage in message/rfc822 DataContentHandler: " + me.toString());
        }
    }

    @Override // korex.activation.DataContentHandler
    public void writeTo(Object obj, String mimeType, OutputStream os) throws IOException {
        if (obj instanceof Message) {
            Message m = (Message) obj;
            try {
                m.writeTo(os);
                return;
            } catch (MessagingException me) {
                throw new IOException(me.toString());
            }
        }
        throw new IOException("unsupported object");
    }
}
