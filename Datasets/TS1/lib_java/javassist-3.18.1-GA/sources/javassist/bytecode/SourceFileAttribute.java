package javassist.bytecode;

import java.io.DataInputStream;
import java.io.IOException;
import java.util.Map;

/* loaded from: javassist-3.18.1-GA.jar:javassist/bytecode/SourceFileAttribute.class */
public class SourceFileAttribute extends AttributeInfo {
    public static final String tag = "SourceFile";

    SourceFileAttribute(ConstPool cp, int n, DataInputStream in) throws IOException {
        super(cp, n, in);
    }

    public SourceFileAttribute(ConstPool cp, String filename) {
        super(cp, tag);
        int index = cp.addUtf8Info(filename);
        byte[] bvalue = {(byte) (index >>> 8), (byte) index};
        set(bvalue);
    }

    public String getFileName() {
        return getConstPool().getUtf8Info(ByteArray.readU16bit(get(), 0));
    }

    @Override // javassist.bytecode.AttributeInfo
    public AttributeInfo copy(ConstPool newCp, Map classnames) {
        return new SourceFileAttribute(newCp, getFileName());
    }
}
