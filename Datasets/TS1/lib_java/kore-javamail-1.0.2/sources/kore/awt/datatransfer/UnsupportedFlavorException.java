package kore.awt.datatransfer;

/* loaded from: kore-javamail-1.0.2.jar:kore/awt/datatransfer/UnsupportedFlavorException.class */
public class UnsupportedFlavorException extends Exception {
    private static final long serialVersionUID = 5383814944251665601L;

    public UnsupportedFlavorException(DataFlavor flavor) {
        super(flavor != null ? flavor.getHumanPresentableName() : null);
    }
}
