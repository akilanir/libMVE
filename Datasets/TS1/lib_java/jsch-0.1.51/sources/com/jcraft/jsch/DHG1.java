package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/DHG1.class */
public class DHG1 extends KeyExchange {
    private static final int SSH_MSG_KEXDH_INIT = 30;
    static final int RSA = 0;
    static final int DSS = 1;
    private int type = 0;
    private int state;
    DH dh;
    byte[] V_S;
    byte[] V_C;
    byte[] I_S;
    byte[] I_C;
    byte[] e;
    private Buffer buf;
    private Packet packet;
    static final byte[] g = {2};
    private static final int SSH_MSG_KEXDH_REPLY = 31;
    static final byte[] p = {0, -1, -1, -1, -1, -1, -1, -1, -1, -55, 15, -38, -94, 33, 104, -62, 52, -60, -58, 98, -117, Byte.MIN_VALUE, -36, 28, -47, 41, 2, 78, 8, -118, 103, -52, 116, 2, 11, -66, -90, 59, 19, -101, 34, 81, 74, 8, 121, -114, 52, 4, -35, -17, -107, 25, -77, -51, 58, 67, 27, 48, 43, 10, 109, -14, 95, 20, 55, 79, -31, 53, 109, 109, 81, -62, 69, -28, -123, -75, 118, 98, 94, 126, -58, -12, 76, 66, -23, -90, 55, -19, 107, 11, -1, 92, -74, -12, 6, -73, -19, -18, 56, 107, -5, 90, -119, -97, -91, -82, -97, 36, 17, 124, 75, SSH_MSG_KEXDH_REPLY, -26, 73, 40, 102, 81, -20, -26, 83, -127, -1, -1, -1, -1, -1, -1, -1, -1};

    @Override // com.jcraft.jsch.KeyExchange
    public void init(Session session, byte[] V_S, byte[] V_C, byte[] I_S, byte[] I_C) throws Exception {
        this.session = session;
        this.V_S = V_S;
        this.V_C = V_C;
        this.I_S = I_S;
        this.I_C = I_C;
        try {
            Class c = Class.forName(session.getConfig("sha-1"));
            this.sha = (HASH) c.newInstance();
            this.sha.init();
        } catch (Exception e) {
            System.err.println(e);
        }
        this.buf = new Buffer();
        this.packet = new Packet(this.buf);
        try {
            Class c2 = Class.forName(session.getConfig("dh"));
            this.dh = (DH) c2.newInstance();
            this.dh.init();
            this.dh.setP(p);
            this.dh.setG(g);
            this.e = this.dh.getE();
            this.packet.reset();
            this.buf.putByte((byte) 30);
            this.buf.putMPInt(this.e);
            session.write(this.packet);
            if (JSch.getLogger().isEnabled(1)) {
                JSch.getLogger().log(1, "SSH_MSG_KEXDH_INIT sent");
                JSch.getLogger().log(1, "expecting SSH_MSG_KEXDH_REPLY");
            }
            this.state = SSH_MSG_KEXDH_REPLY;
        } catch (Exception e2) {
            throw e2;
        }
    }

    @Override // com.jcraft.jsch.KeyExchange
    public boolean next(Buffer _buf) throws Exception {
        switch (this.state) {
            case SSH_MSG_KEXDH_REPLY /* 31 */:
                _buf.getInt();
                _buf.getByte();
                int j = _buf.getByte();
                if (j != SSH_MSG_KEXDH_REPLY) {
                    System.err.println("type: must be 31 " + j);
                    return false;
                }
                this.K_S = _buf.getString();
                byte[] f = _buf.getMPInt();
                byte[] sig_of_H = _buf.getString();
                this.dh.setF(f);
                this.K = normalize(this.dh.getK());
                this.buf.reset();
                this.buf.putString(this.V_C);
                this.buf.putString(this.V_S);
                this.buf.putString(this.I_C);
                this.buf.putString(this.I_S);
                this.buf.putString(this.K_S);
                this.buf.putMPInt(this.e);
                this.buf.putMPInt(f);
                this.buf.putMPInt(this.K);
                byte[] foo = new byte[this.buf.getLength()];
                this.buf.getByte(foo);
                this.sha.update(foo, 0, foo.length);
                this.H = this.sha.digest();
                int i = 0 + 1;
                int i2 = i + 1;
                int i3 = ((this.K_S[0] << 24) & (-16777216)) | ((this.K_S[i] << 16) & 16711680);
                int i4 = i2 + 1;
                int i5 = i3 | ((this.K_S[i2] << 8) & 65280);
                int i6 = i4 + 1;
                int j2 = i5 | (this.K_S[i4] & 255);
                String alg = Util.byte2str(this.K_S, i6, j2);
                int i7 = i6 + j2;
                boolean result = false;
                if (alg.equals("ssh-rsa")) {
                    this.type = 0;
                    int i8 = i7 + 1;
                    int i9 = i8 + 1;
                    int i10 = ((this.K_S[i7] << 24) & (-16777216)) | ((this.K_S[i8] << 16) & 16711680);
                    int i11 = i9 + 1;
                    int i12 = i10 | ((this.K_S[i9] << 8) & 65280);
                    int i13 = i11 + 1;
                    int j3 = i12 | (this.K_S[i11] & 255);
                    byte[] tmp = new byte[j3];
                    System.arraycopy(this.K_S, i13, tmp, 0, j3);
                    int i14 = i13 + j3;
                    int i15 = i14 + 1;
                    int i16 = i15 + 1;
                    int i17 = ((this.K_S[i14] << 24) & (-16777216)) | ((this.K_S[i15] << 16) & 16711680);
                    int i18 = i16 + 1;
                    int i19 = i17 | ((this.K_S[i16] << 8) & 65280);
                    int i20 = i18 + 1;
                    int j4 = i19 | (this.K_S[i18] & 255);
                    byte[] tmp2 = new byte[j4];
                    System.arraycopy(this.K_S, i20, tmp2, 0, j4);
                    int i21 = i20 + j4;
                    SignatureRSA sig = null;
                    try {
                        Class c = Class.forName(this.session.getConfig("signature.rsa"));
                        sig = (SignatureRSA) c.newInstance();
                        sig.init();
                    } catch (Exception e) {
                        System.err.println(e);
                    }
                    sig.setPubKey(tmp, tmp2);
                    sig.update(this.H);
                    result = sig.verify(sig_of_H);
                    if (JSch.getLogger().isEnabled(1)) {
                        JSch.getLogger().log(1, "ssh_rsa_verify: signature " + result);
                    }
                } else if (alg.equals("ssh-dss")) {
                    this.type = 1;
                    int i22 = i7 + 1;
                    int i23 = i22 + 1;
                    int i24 = ((this.K_S[i7] << 24) & (-16777216)) | ((this.K_S[i22] << 16) & 16711680);
                    int i25 = i23 + 1;
                    int i26 = i24 | ((this.K_S[i23] << 8) & 65280);
                    int i27 = i25 + 1;
                    int j5 = i26 | (this.K_S[i25] & 255);
                    byte[] tmp3 = new byte[j5];
                    System.arraycopy(this.K_S, i27, tmp3, 0, j5);
                    int i28 = i27 + j5;
                    int i29 = i28 + 1;
                    int i30 = i29 + 1;
                    int i31 = ((this.K_S[i28] << 24) & (-16777216)) | ((this.K_S[i29] << 16) & 16711680);
                    int i32 = i30 + 1;
                    int i33 = i31 | ((this.K_S[i30] << 8) & 65280);
                    int i34 = i32 + 1;
                    int j6 = i33 | (this.K_S[i32] & 255);
                    byte[] tmp4 = new byte[j6];
                    System.arraycopy(this.K_S, i34, tmp4, 0, j6);
                    int i35 = i34 + j6;
                    int i36 = i35 + 1;
                    int i37 = i36 + 1;
                    int i38 = ((this.K_S[i35] << 24) & (-16777216)) | ((this.K_S[i36] << 16) & 16711680);
                    int i39 = i37 + 1;
                    int i40 = i38 | ((this.K_S[i37] << 8) & 65280);
                    int i41 = i39 + 1;
                    int j7 = i40 | (this.K_S[i39] & 255);
                    byte[] tmp5 = new byte[j7];
                    System.arraycopy(this.K_S, i41, tmp5, 0, j7);
                    int i42 = i41 + j7;
                    int i43 = i42 + 1;
                    int i44 = i43 + 1;
                    int i45 = ((this.K_S[i42] << 24) & (-16777216)) | ((this.K_S[i43] << 16) & 16711680);
                    int i46 = i44 + 1;
                    int i47 = i45 | ((this.K_S[i44] << 8) & 65280);
                    int i48 = i46 + 1;
                    int j8 = i47 | (this.K_S[i46] & 255);
                    byte[] tmp6 = new byte[j8];
                    System.arraycopy(this.K_S, i48, tmp6, 0, j8);
                    int i49 = i48 + j8;
                    SignatureDSA sig2 = null;
                    try {
                        Class c2 = Class.forName(this.session.getConfig("signature.dss"));
                        sig2 = (SignatureDSA) c2.newInstance();
                        sig2.init();
                    } catch (Exception e2) {
                        System.err.println(e2);
                    }
                    sig2.setPubKey(tmp6, tmp3, tmp4, tmp5);
                    sig2.update(this.H);
                    result = sig2.verify(sig_of_H);
                    if (JSch.getLogger().isEnabled(1)) {
                        JSch.getLogger().log(1, "ssh_dss_verify: signature " + result);
                    }
                } else {
                    System.err.println("unknown alg");
                }
                this.state = 0;
                return result;
            default:
                return false;
        }
    }

    @Override // com.jcraft.jsch.KeyExchange
    public String getKeyType() {
        return this.type == 1 ? "DSA" : "RSA";
    }

    @Override // com.jcraft.jsch.KeyExchange
    public int getState() {
        return this.state;
    }
}
