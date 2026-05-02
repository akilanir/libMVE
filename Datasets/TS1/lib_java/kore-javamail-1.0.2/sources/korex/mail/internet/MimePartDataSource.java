package korex.mail.internet;

import com.sun.mail.util.FolderClosedIOException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.UnknownServiceException;
import korex.activation.DataSource;
import korex.mail.FolderClosedException;
import korex.mail.MessageAware;
import korex.mail.MessageContext;
import korex.mail.MessagingException;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/internet/MimePartDataSource.class */
public class MimePartDataSource implements DataSource, MessageAware {
    protected MimePart part;
    private MessageContext context;

    public MimePartDataSource(MimePart part) {
        this.part = part;
    }

    @Override // korex.activation.DataSource
    public InputStream getInputStream() throws IOException {
        InputStream is;
        try {
            if (this.part instanceof MimeBodyPart) {
                is = ((MimeBodyPart) this.part).getContentStream();
            } else if (this.part instanceof MimeMessage) {
                is = ((MimeMessage) this.part).getContentStream();
            } else {
                throw new MessagingException("Unknown part");
            }
            String encoding = MimeBodyPart.restrictEncoding(this.part, this.part.getEncoding());
            if (encoding != null) {
                return MimeUtility.decode(is, encoding);
            }
            return is;
        } catch (FolderClosedException fex) {
            throw new FolderClosedIOException(fex.getFolder(), fex.getMessage());
        } catch (MessagingException mex) {
            throw new IOException(mex.getMessage());
        }
    }

    @Override // korex.activation.DataSource
    public OutputStream getOutputStream() throws IOException {
        throw new UnknownServiceException("Writing not supported");
    }

    @Override // korex.activation.DataSource
    public String getContentType() {
        try {
            return this.part.getContentType();
        } catch (MessagingException e) {
            return "application/octet-stream";
        }
    }

    @Override // korex.activation.DataSource
    public String getName() {
        try {
            if (this.part instanceof MimeBodyPart) {
                return ((MimeBodyPart) this.part).getFileName();
            }
            return "";
        } catch (MessagingException e) {
            return "";
        }
    }

    @Override // korex.mail.MessageAware
    public synchronized MessageContext getMessageContext() {
        if (this.context == null) {
            this.context = new MessageContext(this.part);
        }
        return this.context;
    }
}
