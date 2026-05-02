package korex.activation;

import kore.awt.datatransfer.DataFlavor;

/* loaded from: kore-javamail-1.0.2.jar:korex/activation/ActivationDataFlavor.class */
public class ActivationDataFlavor extends DataFlavor {
    private String mimeType;
    private MimeType mimeObject;
    private String humanPresentableName;
    private Class representationClass;

    public ActivationDataFlavor(Class representationClass, String mimeType, String humanPresentableName) {
        super(mimeType, humanPresentableName);
        this.mimeType = null;
        this.mimeObject = null;
        this.humanPresentableName = null;
        this.representationClass = null;
        this.mimeType = mimeType;
        this.humanPresentableName = humanPresentableName;
        this.representationClass = representationClass;
    }

    public ActivationDataFlavor(Class representationClass, String humanPresentableName) {
        super((Class<?>) representationClass, humanPresentableName);
        this.mimeType = null;
        this.mimeObject = null;
        this.humanPresentableName = null;
        this.representationClass = null;
        this.mimeType = super.getMimeType();
        this.representationClass = representationClass;
        this.humanPresentableName = humanPresentableName;
    }

    public ActivationDataFlavor(String mimeType, String humanPresentableName) {
        super(mimeType, humanPresentableName);
        this.mimeType = null;
        this.mimeObject = null;
        this.humanPresentableName = null;
        this.representationClass = null;
        this.mimeType = mimeType;
        try {
            this.representationClass = Class.forName("java.io.InputStream");
        } catch (ClassNotFoundException e) {
        }
        this.humanPresentableName = humanPresentableName;
    }

    @Override // kore.awt.datatransfer.DataFlavor
    public String getMimeType() {
        return this.mimeType;
    }

    @Override // kore.awt.datatransfer.DataFlavor
    public Class getRepresentationClass() {
        return this.representationClass;
    }

    @Override // kore.awt.datatransfer.DataFlavor
    public String getHumanPresentableName() {
        return this.humanPresentableName;
    }

    @Override // kore.awt.datatransfer.DataFlavor
    public void setHumanPresentableName(String humanPresentableName) {
        this.humanPresentableName = humanPresentableName;
    }

    @Override // kore.awt.datatransfer.DataFlavor
    public boolean equals(DataFlavor dataFlavor) {
        return isMimeTypeEqual(dataFlavor) && dataFlavor.getRepresentationClass() == this.representationClass;
    }

    @Override // kore.awt.datatransfer.DataFlavor
    public boolean isMimeTypeEqual(String mimeType) {
        MimeType mt = null;
        try {
            if (this.mimeObject == null) {
                this.mimeObject = new MimeType(this.mimeType);
            }
            mt = new MimeType(mimeType);
        } catch (MimeTypeParseException e) {
        }
        return this.mimeObject.match(mt);
    }

    @Override // kore.awt.datatransfer.DataFlavor
    protected String normalizeMimeTypeParameter(String parameterName, String parameterValue) {
        return parameterValue;
    }

    @Override // kore.awt.datatransfer.DataFlavor
    protected String normalizeMimeType(String mimeType) {
        return mimeType;
    }
}
