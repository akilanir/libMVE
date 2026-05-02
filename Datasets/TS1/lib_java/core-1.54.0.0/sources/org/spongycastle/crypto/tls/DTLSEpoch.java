package org.spongycastle.crypto.tls;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/DTLSEpoch.class */
class DTLSEpoch {
    private final int epoch;
    private final TlsCipher cipher;
    private final DTLSReplayWindow replayWindow = new DTLSReplayWindow();
    private long sequenceNumber = 0;

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
        	at jadx.core.ProcessClass.generateCode(ProcessClass.java:117)
        	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
        	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
        	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
        */
    long allocateSequenceNumber() {
        /*
            r8 = this;
            r0 = r8
            r1 = r0
            long r1 = r1.sequenceNumber
            // decode failed: arraycopy: source index -1 out of bounds for object array[8]
            r2 = 1
            long r1 = r1 + r2
            r0.sequenceNumber = r1
            return r-1
        */
        throw new UnsupportedOperationException("Method not decompiled: org.spongycastle.crypto.tls.DTLSEpoch.allocateSequenceNumber():long");
    }

    DTLSEpoch(int epoch, TlsCipher cipher) {
        if (epoch < 0) {
            throw new IllegalArgumentException("'epoch' must be >= 0");
        }
        if (cipher == null) {
            throw new IllegalArgumentException("'cipher' cannot be null");
        }
        this.epoch = epoch;
        this.cipher = cipher;
    }

    TlsCipher getCipher() {
        return this.cipher;
    }

    int getEpoch() {
        return this.epoch;
    }

    DTLSReplayWindow getReplayWindow() {
        return this.replayWindow;
    }

    long getSequenceNumber() {
        return this.sequenceNumber;
    }
}
