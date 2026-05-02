package ch.qos.logback.core.util;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/util/InvocationGate.class */
public class InvocationGate {
    private static final int MAX_MASK = 65535;
    private static final long thresholdForMaskIncrease = 100;
    private volatile long mask = 15;
    private volatile long lastMaskCheck = System.currentTimeMillis();
    private long invocationCounter = 0;
    private final long thresholdForMaskDecrease = 800;

    /*  JADX ERROR: Failed to decode insn: 0x0005: MOVE_MULTI
        java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[8]
        	at java.base/java.lang.System.arraycopy(Native Method)
        	at jadx.plugins.input.java.data.code.StackState.insert(StackState.java:52)
        	at jadx.plugins.input.java.data.code.CodeDecodeState.insert(CodeDecodeState.java:137)
        	at jadx.plugins.input.java.data.code.JavaInsnsRegister.dup2x1(JavaInsnsRegister.java:313)
        	at jadx.plugins.input.java.data.code.JavaInsnData.decode(JavaInsnData.java:46)
        	at jadx.core.dex.instructions.InsnDecoder.lambda$process$0(InsnDecoder.java:50)
        	at jadx.plugins.input.java.data.code.JavaCodeReader.visitInstructions(JavaCodeReader.java:85)
        	at jadx.core.dex.instructions.InsnDecoder.process(InsnDecoder.java:46)
        	at jadx.core.dex.nodes.MethodNode.load(MethodNode.java:157)
        	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:458)
        	at jadx.core.ProcessClass.process(ProcessClass.java:69)
        	at jadx.core.ProcessClass.generateCode(ProcessClass.java:109)
        	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
        	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
        	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
        */
    public boolean skipFurtherWork() {
        /*
            r8 = this;
            r0 = r8
            r1 = r0
            long r1 = r1.invocationCounter
            // decode failed: arraycopy: source index -1 out of bounds for object array[8]
            r2 = 1
            long r1 = r1 + r2
            r0.invocationCounter = r1
            r0 = r8
            long r0 = r0.mask
            long r-1 = r-1 & r0
            r0 = r8
            long r0 = r0.mask
            int r-1 = (r-1 > r0 ? 1 : (r-1 == r0 ? 0 : -1))
            if (r-1 == 0) goto L1c
            r-1 = 1
            goto L1d
            r-1 = 0
            return r-1
        */
        throw new UnsupportedOperationException("Method not decompiled: ch.qos.logback.core.util.InvocationGate.skipFurtherWork():boolean");
    }

    public void updateMaskIfNecessary(long j) {
        long j2 = j - this.lastMaskCheck;
        this.lastMaskCheck = j;
        if (j2 < thresholdForMaskIncrease && this.mask < 65535) {
            this.mask = (this.mask << 1) | 1;
        } else if (j2 > 800) {
            this.mask >>>= 2;
        }
    }
}
