package kore.awt.datatransfer;

import java.io.IOException;

/* loaded from: kore-javamail-1.0.2.jar:kore/awt/datatransfer/Transferable.class */
public interface Transferable {
    DataFlavor[] getTransferDataFlavors();

    boolean isDataFlavorSupported(DataFlavor dataFlavor);

    Object getTransferData(DataFlavor dataFlavor) throws UnsupportedFlavorException, IOException;
}
