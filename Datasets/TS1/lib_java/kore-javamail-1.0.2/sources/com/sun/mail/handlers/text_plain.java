package com.sun.mail.handlers;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import kore.awt.datatransfer.DataFlavor;
import korex.activation.ActivationDataFlavor;
import korex.activation.DataContentHandler;
import korex.activation.DataSource;
import korex.mail.internet.ContentType;
import korex.mail.internet.MimeUtility;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/handlers/text_plain.class */
public class text_plain implements DataContentHandler {
    private static ActivationDataFlavor myDF = new ActivationDataFlavor(String.class, "text/plain", "Text String");

    /* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/handlers/text_plain$NoCloseOutputStream.class */
    private static class NoCloseOutputStream extends FilterOutputStream {
        public NoCloseOutputStream(OutputStream os) {
            super(os);
        }

        @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
        public void close() {
        }
    }

    protected ActivationDataFlavor getDF() {
        return myDF;
    }

    @Override // korex.activation.DataContentHandler
    public DataFlavor[] getTransferDataFlavors() {
        return new DataFlavor[]{getDF()};
    }

    @Override // korex.activation.DataContentHandler
    public Object getTransferData(DataFlavor df, DataSource ds) throws IOException {
        if (getDF().equals(df)) {
            return getContent(ds);
        }
        return null;
    }

    @Override // korex.activation.DataContentHandler
    public Object getContent(DataSource ds) throws IOException {
        String enc = null;
        try {
            enc = getCharset(ds.getContentType());
            InputStreamReader is = new InputStreamReader(ds.getInputStream(), enc);
            try {
                int pos = 0;
                char[] buf = new char[1024];
                while (true) {
                    int count = is.read(buf, pos, buf.length - pos);
                    if (count == -1) {
                        break;
                    }
                    pos += count;
                    if (pos >= buf.length) {
                        int size = buf.length;
                        char[] tbuf = new char[size < 262144 ? size + size : size + 262144];
                        System.arraycopy(buf, 0, tbuf, 0, pos);
                        buf = tbuf;
                    }
                }
                return new String(buf, 0, pos);
            } finally {
                try {
                    is.close();
                } catch (IOException e) {
                }
            }
        } catch (IllegalArgumentException e2) {
            throw new UnsupportedEncodingException(enc);
        }
    }

    @Override // korex.activation.DataContentHandler
    public void writeTo(Object obj, String type, OutputStream os) throws IOException {
        if (!(obj instanceof String)) {
            throw new IOException("\"" + getDF().getMimeType() + "\" DataContentHandler requires String object, was given object of type " + obj.getClass().toString());
        }
        String enc = null;
        try {
            enc = getCharset(type);
            OutputStreamWriter osw = new OutputStreamWriter(new NoCloseOutputStream(os), enc);
            String s = (String) obj;
            osw.write(s, 0, s.length());
            osw.close();
        } catch (IllegalArgumentException e) {
            throw new UnsupportedEncodingException(enc);
        }
    }

    private String getCharset(String type) {
        try {
            ContentType ct = new ContentType(type);
            String charset = ct.getParameter("charset");
            if (charset == null) {
                charset = "us-ascii";
            }
            return MimeUtility.javaCharset(charset);
        } catch (Exception e) {
            return null;
        }
    }
}
