package kore.awt.datatransfer;

import java.io.ByteArrayInputStream;
import java.io.Externalizable;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.io.OptionalDataException;
import java.io.Reader;
import java.io.Serializable;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;

/* loaded from: kore-javamail-1.0.2.jar:kore/awt/datatransfer/DataFlavor.class */
public class DataFlavor implements Externalizable, Cloneable {
    static final long serialVersionUID = 8367026044764648243L;
    public static final DataFlavor plainTextFlavor;
    public static final DataFlavor stringFlavor;
    public static final DataFlavor javaFileListFlavor;
    public static final String javaSerializedObjectMimeType = "application/x-java-serialized-object";
    public static final String javaJVMLocalObjectMimeType = "application/x-java-jvm-local-objectref";
    public static final String javaRemoteObjectMimeType = "application/x-java-remote-object";
    private MimeType mimeType;
    private Class<?> representationClass;
    private String humanPresentableName;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !DataFlavor.class.desiredAssertionStatus();
        plainTextFlavor = new DataFlavor("text/plain; charset=unicode; class=java.io.InputStream", "plain unicode text");
        stringFlavor = new DataFlavor((Class<?>) String.class, "Java Unicode String");
        javaFileListFlavor = new DataFlavor("application/x-java-file-list; class=java.util.List", "Java File List");
    }

    protected static final Class<?> tryToLoadClass(String className, ClassLoader classLoader) throws ClassNotFoundException {
        try {
            return Class.forName(className);
        } catch (ClassNotFoundException e) {
            try {
                ClassLoader loader = ClassLoader.getSystemClassLoader();
                return Class.forName(className, true, loader);
            } catch (ClassNotFoundException e2) {
                try {
                    ClassLoader loader2 = Thread.currentThread().getContextClassLoader();
                    return Class.forName(className, true, loader2);
                } catch (ClassNotFoundException e3) {
                    if (classLoader != null) {
                        return Class.forName(className, true, classLoader);
                    }
                    throw new ClassNotFoundException(className);
                }
            }
        }
    }

    public static final DataFlavor getTextPlainUnicodeFlavor() {
        return plainTextFlavor;
    }

    public static final DataFlavor selectBestTextFlavor(DataFlavor[] availableFlavors) {
        for (int i = 0; i < availableFlavors.length; i++) {
            DataFlavor df = availableFlavors[i];
            Class c = df.representationClass;
            if (Reader.class.isAssignableFrom(c) || String.class.isAssignableFrom(c)) {
                return df;
            }
            if (InputStream.class.isAssignableFrom(c) && "text".equals(df.getPrimaryType())) {
                String encoding = availableFlavors[i].getParameter("charset");
                if (encoding == null) {
                    encoding = "us-ascii";
                }
                Reader r = null;
                try {
                    r = new InputStreamReader(new ByteArrayInputStream(new byte[0]), encoding);
                } catch (UnsupportedEncodingException e) {
                }
                if (r != null) {
                    return df;
                }
            }
        }
        return null;
    }

    public DataFlavor() {
    }

    public DataFlavor(Class<?> representationClass, String humanPresentableName) {
        if (representationClass == null) {
            throw new NullPointerException("representationClass must not be null");
        }
        try {
            this.mimeType = new MimeType(javaSerializedObjectMimeType);
        } catch (MimeTypeParseException e) {
            if (!$assertionsDisabled) {
                throw new AssertionError();
            }
        }
        this.humanPresentableName = humanPresentableName == null ? javaSerializedObjectMimeType : humanPresentableName;
        this.representationClass = representationClass;
    }

    public DataFlavor(String mimeType, String humanPresentableName, ClassLoader classLoader) throws ClassNotFoundException {
        init(mimeType, humanPresentableName, classLoader);
    }

    public DataFlavor(String mimeType, String humanPresentableName) {
        try {
            init(mimeType, humanPresentableName, getClass().getClassLoader());
        } catch (ClassNotFoundException ex) {
            IllegalArgumentException iae = new IllegalArgumentException("Class not found: " + ex.getMessage());
            iae.initCause(ex);
            throw iae;
        }
    }

    public DataFlavor(String mimeType) throws ClassNotFoundException {
        init(mimeType, null, getClass().getClassLoader());
    }

    private void init(String mime, String humanPresentableName, ClassLoader loader) throws ClassNotFoundException {
        if (mime == null) {
            throw new NullPointerException("The mime type must not be null");
        }
        try {
            this.mimeType = new MimeType(mime);
            String className = this.mimeType.getParameter("class");
            if (className == null) {
                if (this.mimeType.getBaseType().equals(javaSerializedObjectMimeType)) {
                    throw new IllegalArgumentException("Serialized object type must have a representation class parameter");
                }
                this.representationClass = InputStream.class;
            } else {
                this.representationClass = tryToLoadClass(className, loader);
            }
            this.mimeType.addParameter("class", this.representationClass.getName());
            if (humanPresentableName == null) {
                humanPresentableName = this.mimeType.getParameter("humanPresentableName");
                if (humanPresentableName == null) {
                    humanPresentableName = this.mimeType.getBaseType();
                }
            }
            this.humanPresentableName = humanPresentableName;
        } catch (MimeTypeParseException ex) {
            IllegalArgumentException iae = new IllegalArgumentException("Invalid mime type");
            iae.initCause(ex);
            throw iae;
        }
    }

    public String getMimeType() {
        return this.mimeType.toString();
    }

    public Class<?> getRepresentationClass() {
        return this.representationClass;
    }

    public String getHumanPresentableName() {
        return this.humanPresentableName;
    }

    public String getPrimaryType() {
        return this.mimeType.getPrimaryType();
    }

    public String getSubType() {
        return this.mimeType.getSubType();
    }

    public String getParameter(String paramName) {
        if ("humanPresentableName".equals(paramName)) {
            return getHumanPresentableName();
        }
        return this.mimeType.getParameter(paramName);
    }

    public void setHumanPresentableName(String humanPresentableName) {
        this.humanPresentableName = humanPresentableName;
    }

    public boolean isMimeTypeEqual(String mimeType) {
        if (mimeType == null) {
            throw new NullPointerException("mimeType must not be null");
        }
        boolean equal = false;
        try {
            if (this.mimeType != null) {
                MimeType other = new MimeType(mimeType);
                equal = this.mimeType.matches(other);
            }
        } catch (MimeTypeParseException e) {
        }
        return equal;
    }

    public final boolean isMimeTypeEqual(DataFlavor flavor) {
        return isMimeTypeEqual(flavor.getMimeType());
    }

    public boolean isMimeTypeSerializedObject() {
        return isMimeTypeEqual(javaSerializedObjectMimeType);
    }

    public boolean isRepresentationClassInputStream() {
        return InputStream.class.isAssignableFrom(this.representationClass);
    }

    public boolean isRepresentationClassSerializable() {
        return Serializable.class.isAssignableFrom(this.representationClass);
    }

    public boolean isRepresentationClassRemote() {
        return false;
    }

    public boolean isFlavorSerializedObjectType() {
        return isRepresentationClassSerializable() && isMimeTypeEqual(javaSerializedObjectMimeType);
    }

    public boolean isFlavorRemoteObjectType() {
        return isRepresentationClassRemote() && isRepresentationClassSerializable() && isMimeTypeEqual(javaRemoteObjectMimeType);
    }

    public boolean isFlavorJavaFileListType() {
        if (getPrimaryType().equals(javaFileListFlavor.getPrimaryType()) && getSubType().equals(javaFileListFlavor.getSubType()) && javaFileListFlavor.representationClass.isAssignableFrom(this.representationClass)) {
            return true;
        }
        return false;
    }

    public Object clone() throws CloneNotSupportedException {
        try {
            return super.clone();
        } catch (Exception e) {
            return null;
        }
    }

    public boolean equals(DataFlavor flavor) {
        if (flavor == null) {
            return false;
        }
        String primary = getPrimaryType();
        if (!primary.equals(flavor.getPrimaryType())) {
            return false;
        }
        String sub = getSubType();
        if (!sub.equals(flavor.getSubType()) || !this.representationClass.equals(flavor.representationClass)) {
            return false;
        }
        if (primary.equals("text") && !isRepresentationClassCharBuffer() && !isRepresentationClassReader() && this.representationClass != String.class) {
            if (!this.representationClass.isArray() || this.representationClass.getComponentType() != Character.TYPE) {
                String charset = getParameter("charset");
                String otherset = flavor.getParameter("charset");
                String defaultset = Charset.defaultCharset().name();
                if (charset == null || charset.equals(defaultset)) {
                    return otherset == null || otherset.equals(defaultset);
                }
                return charset.equals(otherset);
            }
            return true;
        }
        return true;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof DataFlavor)) {
            return false;
        }
        return equals((DataFlavor) obj);
    }

    public boolean equals(String str) {
        return isMimeTypeEqual(str);
    }

    public int hashCode() {
        return this.mimeType.toString().hashCode() ^ this.representationClass.hashCode();
    }

    public boolean match(DataFlavor dataFlavor) {
        return equals(dataFlavor);
    }

    protected String normalizeMimeTypeParameter(String name, String value) {
        return name + "=" + value;
    }

    protected String normalizeMimeType(String type) {
        return type;
    }

    @Override // java.io.Externalizable
    public void writeExternal(ObjectOutput stream) throws IOException {
        if (this.mimeType != null) {
            this.mimeType.addParameter("humanPresentableName", this.humanPresentableName);
            stream.writeObject(this.mimeType);
            this.mimeType.removeParameter("humanPresentableName");
        } else {
            stream.writeObject(null);
        }
        stream.writeObject(this.representationClass);
    }

    @Override // java.io.Externalizable
    public void readExternal(ObjectInput stream) throws IOException, ClassNotFoundException {
        this.mimeType = (MimeType) stream.readObject();
        String className = null;
        if (this.mimeType != null) {
            this.humanPresentableName = this.mimeType.getParameter("humanPresentableName");
            this.mimeType.removeParameter("humanPresentableName");
            className = this.mimeType.getParameter("class");
            if (className == null) {
                throw new IOException("No class in mime type");
            }
        }
        try {
            this.representationClass = (Class) stream.readObject();
        } catch (OptionalDataException ex) {
            if (ex.eof && ex.length == 0) {
                if (className != null) {
                    this.representationClass = tryToLoadClass(className, getClass().getClassLoader());
                    return;
                }
                return;
            }
            throw ex;
        }
    }

    public String toString() {
        return getClass().getName() + "[representationClass=" + getRepresentationClass().getName() + ",mimeType=" + getMimeType() + ",humanPresentableName=" + getHumanPresentableName() + "]";
    }

    public final Class<?> getDefaultRepresentationClass() {
        return InputStream.class;
    }

    public final String getDefaultRepresentationClassAsString() {
        return getDefaultRepresentationClass().getName();
    }

    public Reader getReaderForText(Transferable transferable) throws UnsupportedFlavorException, IOException {
        if (!transferable.isDataFlavorSupported(this)) {
            throw new UnsupportedFlavorException(this);
        }
        if (Reader.class.isAssignableFrom(this.representationClass)) {
            return (Reader) transferable.getTransferData(this);
        }
        if (String.class.isAssignableFrom(this.representationClass)) {
            return new StringReader((String) transferable.getTransferData(this));
        }
        if (InputStream.class.isAssignableFrom(this.representationClass) && "text".equals(getPrimaryType())) {
            InputStream in = (InputStream) transferable.getTransferData(this);
            String encoding = getParameter("charset");
            if (encoding == null) {
                encoding = "us-ascii";
            }
            return new InputStreamReader(in, encoding);
        }
        throw new UnsupportedFlavorException(this);
    }

    public boolean isRepresentationClassByteBuffer() {
        return ByteBuffer.class.isAssignableFrom(this.representationClass);
    }

    public boolean isRepresentationClassCharBuffer() {
        return CharBuffer.class.isAssignableFrom(this.representationClass);
    }

    public boolean isRepresentationClassReader() {
        return Reader.class.isAssignableFrom(this.representationClass);
    }

    public boolean isFlavorTextType() {
        if (equals(stringFlavor) || getPrimaryType().equals("text")) {
            String charset = getParameter("charset");
            Class c = getRepresentationClass();
            if (charset != null) {
                if (Reader.class.isAssignableFrom(c) || CharBuffer.class.isAssignableFrom(c) || String.class.isAssignableFrom(c)) {
                    return true;
                }
                if (InputStream.class.isAssignableFrom(c) || ByteBuffer.class.isAssignableFrom(c)) {
                    return Charset.isSupported(charset);
                }
                return false;
            }
            if (InputStream.class.isAssignableFrom(c) || ByteBuffer.class.isAssignableFrom(c)) {
                return true;
            }
            return false;
        }
        return false;
    }
}
