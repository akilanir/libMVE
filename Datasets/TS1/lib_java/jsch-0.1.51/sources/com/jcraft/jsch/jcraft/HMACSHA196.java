package com.jcraft.jsch.jcraft;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/jcraft/HMACSHA196.class */
public class HMACSHA196 extends HMACSHA1 {
    private static final String name = "hmac-sha1-96";
    private static final int BSIZE = 12;
    private final byte[] _buf16 = new byte[20];

    @Override // com.jcraft.jsch.jcraft.HMACSHA1, com.jcraft.jsch.jcraft.HMAC, com.jcraft.jsch.MAC
    public int getBlockSize() {
        return BSIZE;
    }

    @Override // com.jcraft.jsch.jcraft.HMACSHA1, com.jcraft.jsch.jcraft.HMAC, com.jcraft.jsch.MAC
    public void doFinal(byte[] buf, int offset) {
        super.doFinal(this._buf16, 0);
        System.arraycopy(this._buf16, 0, buf, offset, BSIZE);
    }

    @Override // com.jcraft.jsch.jcraft.HMACSHA1, com.jcraft.jsch.MAC
    public String getName() {
        return name;
    }
}
