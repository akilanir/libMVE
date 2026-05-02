package korex.activation;

import java.io.IOException;
import java.io.OutputStream;
import kore.awt.datatransfer.DataFlavor;
import kore.awt.datatransfer.UnsupportedFlavorException;

/* loaded from: kore-javamail-1.0.2.jar:korex/activation/DataContentHandler.class */
public interface DataContentHandler {
    DataFlavor[] getTransferDataFlavors();

    Object getTransferData(DataFlavor dataFlavor, DataSource dataSource) throws UnsupportedFlavorException, IOException;

    Object getContent(DataSource dataSource) throws IOException;

    void writeTo(Object obj, String str, OutputStream outputStream) throws IOException;
}
