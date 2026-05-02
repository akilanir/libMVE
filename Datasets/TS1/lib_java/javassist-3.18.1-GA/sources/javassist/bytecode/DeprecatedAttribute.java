package javassist.bytecode;

import java.io.DataInputStream;
import java.io.IOException;
import java.util.Map;

/* loaded from: javassist-3.18.1-GA.jar:javassist/bytecode/DeprecatedAttribute.class */
public class DeprecatedAttribute extends AttributeInfo {
    public static final String tag = "Deprecated";

    DeprecatedAttribute(ConstPool cp, int n, DataInputStream in) throws IOException {
        super(cp, n, in);
    }

    public DeprecatedAttribute(ConstPool cp) {
        super(cp, tag, new byte[0]);
    }

    @Override // javassist.bytecode.AttributeInfo
    public AttributeInfo copy(ConstPool newCp, Map classnames) {
        return new DeprecatedAttribute(newCp);
    }
}
