package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/UserAuthKeyboardInteractive.class */
class UserAuthKeyboardInteractive extends UserAuth {
    UserAuthKeyboardInteractive() {
    }

    /* JADX WARN: Code restructure failed: missing block: B:28:0x0142, code lost:
    
        r7.buf.getInt();
        r7.buf.getByte();
        r7.buf.getByte();
        r0 = r7.buf.getString();
        r0 = r7.buf.getByte();
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x016e, code lost:
    
        if (r0 == 0) goto L32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x017d, code lost:
    
        throw new com.jcraft.jsch.JSchPartialAuthException(com.jcraft.jsch.Util.byte2str(r0));
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0180, code lost:
    
        if (r13 == false) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x0183, code lost:
    
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x0185, code lost:
    
        r8.auth_failures++;
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x034e, code lost:
    
        if (r11 == false) goto L105;
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x035a, code lost:
    
        throw new com.jcraft.jsch.JSchAuthCancelException("keyboard-interactive");
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v136, types: [byte[]] */
    /* JADX WARN: Type inference failed for: r0v178, types: [byte[]] */
    @Override // com.jcraft.jsch.UserAuth
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean start(com.jcraft.jsch.Session r8) throws java.lang.Exception {
        /*
            Method dump skipped, instructions count: 862
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.jcraft.jsch.UserAuthKeyboardInteractive.start(com.jcraft.jsch.Session):boolean");
    }
}
