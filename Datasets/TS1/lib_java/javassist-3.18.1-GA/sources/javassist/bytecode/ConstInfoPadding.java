package javassist.bytecode;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

/* compiled from: ConstPool.java */
/* loaded from: javassist-3.18.1-GA.jar:javassist/bytecode/ConstInfoPadding.class */
class ConstInfoPadding extends ConstInfo {
    public ConstInfoPadding(int i) {
        super(i);
    }

    @Override // javassist.bytecode.ConstInfo
    public int getTag() {
        return 0;
    }

    @Override // javassist.bytecode.ConstInfo
    public int copy(ConstPool src, ConstPool dest, Map map) {
        return dest.addConstInfoPadding();
    }

    @Override // javassist.bytecode.ConstInfo
    public void write(DataOutputStream out) throws IOException {
    }

    @Override // javassist.bytecode.ConstInfo
    public void print(PrintWriter out) {
        out.println("padding");
    }
}
