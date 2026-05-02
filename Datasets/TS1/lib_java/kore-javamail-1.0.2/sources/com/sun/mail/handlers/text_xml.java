package com.sun.mail.handlers;

import java.io.IOException;
import java.io.OutputStream;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import kore.awt.datatransfer.DataFlavor;
import korex.activation.ActivationDataFlavor;
import korex.activation.DataSource;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/handlers/text_xml.class */
public class text_xml extends text_plain {
    private final DataFlavor[] flavors = {new ActivationDataFlavor(String.class, "text/xml", "XML String"), new ActivationDataFlavor(String.class, "application/xml", "XML String"), new ActivationDataFlavor(StreamSource.class, "text/xml", "XML"), new ActivationDataFlavor(StreamSource.class, "application/xml", "XML")};

    @Override // com.sun.mail.handlers.text_plain, korex.activation.DataContentHandler
    public DataFlavor[] getTransferDataFlavors() {
        return (DataFlavor[]) this.flavors.clone();
    }

    @Override // com.sun.mail.handlers.text_plain, korex.activation.DataContentHandler
    public Object getTransferData(DataFlavor df, DataSource ds) throws IOException {
        for (int i = 0; i < this.flavors.length; i++) {
            DataFlavor aFlavor = this.flavors[i];
            if (aFlavor.equals(df)) {
                if (aFlavor.getRepresentationClass() == String.class) {
                    return super.getContent(ds);
                }
                if (aFlavor.getRepresentationClass() == StreamSource.class) {
                    return new StreamSource(ds.getInputStream());
                }
                return null;
            }
        }
        return null;
    }

    @Override // com.sun.mail.handlers.text_plain, korex.activation.DataContentHandler
    public void writeTo(Object obj, String mimeType, OutputStream os) throws IOException {
        if (!isXmlType(mimeType)) {
            throw new IOException("Invalid content type \"" + mimeType + "\" for text/xml DCH");
        }
        if (obj instanceof String) {
            super.writeTo(obj, mimeType, os);
            return;
        }
        if (!(obj instanceof DataSource) && !(obj instanceof Source)) {
            throw new IOException("Invalid Object type = " + obj.getClass() + ". XmlDCH can only convert DataSource or Source to XML.");
        }
        try {
            Transformer transformer = TransformerFactory.newInstance().newTransformer();
            StreamResult result = new StreamResult(os);
            if (obj instanceof DataSource) {
                transformer.transform(new StreamSource(((DataSource) obj).getInputStream()), result);
            } else {
                transformer.transform((Source) obj, result);
            }
        } catch (RuntimeException ex) {
            IOException ioex = new IOException("Unable to run the JAXP transformer on a stream " + ex.getMessage());
            ioex.initCause(ex);
            throw ioex;
        } catch (TransformerException ex2) {
            IOException ioex2 = new IOException("Unable to run the JAXP transformer on a stream " + ex2.getMessage());
            ioex2.initCause(ex2);
            throw ioex2;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:7:0x002a, code lost:
    
        if (r0.getPrimaryType().equals("application") != false) goto L8;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private boolean isXmlType(java.lang.String r5) {
        /*
            r4 = this;
            korex.mail.internet.ContentType r0 = new korex.mail.internet.ContentType     // Catch: korex.mail.internet.ParseException -> L33 java.lang.RuntimeException -> L36
            r1 = r0
            r2 = r5
            r1.<init>(r2)     // Catch: korex.mail.internet.ParseException -> L33 java.lang.RuntimeException -> L36
            r6 = r0
            r0 = r6
            java.lang.String r0 = r0.getSubType()     // Catch: korex.mail.internet.ParseException -> L33 java.lang.RuntimeException -> L36
            java.lang.String r1 = "xml"
            boolean r0 = r0.equals(r1)     // Catch: korex.mail.internet.ParseException -> L33 java.lang.RuntimeException -> L36
            if (r0 == 0) goto L31
            r0 = r6
            java.lang.String r0 = r0.getPrimaryType()     // Catch: korex.mail.internet.ParseException -> L33 java.lang.RuntimeException -> L36
            java.lang.String r1 = "text"
            boolean r0 = r0.equals(r1)     // Catch: korex.mail.internet.ParseException -> L33 java.lang.RuntimeException -> L36
            if (r0 != 0) goto L2d
            r0 = r6
            java.lang.String r0 = r0.getPrimaryType()     // Catch: korex.mail.internet.ParseException -> L33 java.lang.RuntimeException -> L36
            java.lang.String r1 = "application"
            boolean r0 = r0.equals(r1)     // Catch: korex.mail.internet.ParseException -> L33 java.lang.RuntimeException -> L36
            if (r0 == 0) goto L31
        L2d:
            r0 = 1
            goto L32
        L31:
            r0 = 0
        L32:
            return r0
        L33:
            r6 = move-exception
            r0 = 0
            return r0
        L36:
            r6 = move-exception
            r0 = 0
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.sun.mail.handlers.text_xml.isXmlType(java.lang.String):boolean");
    }
}
