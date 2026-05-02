package korex.activation;

import java.io.IOException;
import java.io.OutputStream;
import kore.awt.datatransfer.DataFlavor;
import kore.awt.datatransfer.UnsupportedFlavorException;

/* compiled from: DataHandler.java */
/* loaded from: kore-javamail-1.0.2.jar:korex/activation/ObjectDataContentHandler.class */
class ObjectDataContentHandler implements DataContentHandler {
    private DataFlavor[] transferFlavors = null;
    private Object obj;
    private String mimeType;
    private DataContentHandler dch;

    public ObjectDataContentHandler(DataContentHandler dch, Object obj, String mimeType) {
        this.dch = null;
        this.obj = obj;
        this.mimeType = mimeType;
        this.dch = dch;
    }

    public DataContentHandler getDCH() {
        return this.dch;
    }

    @Override // korex.activation.DataContentHandler
    public DataFlavor[] getTransferDataFlavors() {
        if (this.transferFlavors == null) {
            if (this.dch != null) {
                this.transferFlavors = this.dch.getTransferDataFlavors();
            } else {
                this.transferFlavors = new DataFlavor[1];
                this.transferFlavors[0] = new ActivationDataFlavor(this.obj.getClass(), this.mimeType, this.mimeType);
            }
        }
        return this.transferFlavors;
    }

    @Override // korex.activation.DataContentHandler
    public Object getTransferData(DataFlavor df, DataSource ds) throws UnsupportedFlavorException, IOException {
        if (this.dch != null) {
            return this.dch.getTransferData(df, ds);
        }
        if (df.equals(this.transferFlavors[0])) {
            return this.obj;
        }
        throw new UnsupportedFlavorException(df);
    }

    @Override // korex.activation.DataContentHandler
    public Object getContent(DataSource ds) {
        return this.obj;
    }

    @Override // korex.activation.DataContentHandler
    public void writeTo(Object obj, String mimeType, OutputStream os) throws IOException {
        if (this.dch != null) {
            this.dch.writeTo(obj, mimeType, os);
            return;
        }
        throw new UnsupportedDataTypeException("no object DCH for MIME type " + this.mimeType);
    }
}
