package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/UserAuthPassword.class */
class UserAuthPassword extends UserAuth {
    private final int SSH_MSG_USERAUTH_PASSWD_CHANGEREQ = 60;

    UserAuthPassword() {
    }

    /* JADX WARN: Code restructure failed: missing block: B:50:0x01e4, code lost:
    
        if (r7.userinfo == null) goto L52;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x01e7, code lost:
    
        r7.userinfo.showMessage("Password must be changed.");
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x01f6, code lost:
    
        if (r9 == null) goto L55;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x01f9, code lost:
    
        com.jcraft.jsch.Util.bzero(r9);
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x0201, code lost:
    
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x02b1, code lost:
    
        if (r0 != 51) goto L94;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x02b4, code lost:
    
        r7.buf.getInt();
        r7.buf.getByte();
        r7.buf.getByte();
        r0 = r7.buf.getString();
        r0 = r7.buf.getByte();
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x02e0, code lost:
    
        if (r0 == 0) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x02ef, code lost:
    
        throw new com.jcraft.jsch.JSchPartialAuthException(com.jcraft.jsch.Util.byte2str(r0));
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x02f0, code lost:
    
        r8.auth_failures++;
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x0301, code lost:
    
        if (r9 == null) goto L72;
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x0304, code lost:
    
        com.jcraft.jsch.Util.bzero(r9);
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x030c, code lost:
    
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x030e, code lost:
    
        if (r9 == null) goto L96;
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x0311, code lost:
    
        com.jcraft.jsch.Util.bzero(r9);
        r9 = null;
     */
    @Override // com.jcraft.jsch.UserAuth
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean start(com.jcraft.jsch.Session r8) throws java.lang.Exception {
        /*
            Method dump skipped, instructions count: 809
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.jcraft.jsch.UserAuthPassword.start(com.jcraft.jsch.Session):boolean");
    }
}
