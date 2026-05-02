package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/KeyExchange.class */
public abstract class KeyExchange {
    static final int PROPOSAL_KEX_ALGS = 0;
    static final int PROPOSAL_SERVER_HOST_KEY_ALGS = 1;
    static final int PROPOSAL_ENC_ALGS_CTOS = 2;
    static final int PROPOSAL_ENC_ALGS_STOC = 3;
    static final int PROPOSAL_MAC_ALGS_CTOS = 4;
    static final int PROPOSAL_MAC_ALGS_STOC = 5;
    static final int PROPOSAL_COMP_ALGS_CTOS = 6;
    static final int PROPOSAL_COMP_ALGS_STOC = 7;
    static final int PROPOSAL_LANG_CTOS = 8;
    static final int PROPOSAL_LANG_STOC = 9;
    static final int PROPOSAL_MAX = 10;
    static String kex = "diffie-hellman-group1-sha1";
    static String server_host_key = "ssh-rsa,ssh-dss";
    static String enc_c2s = "blowfish-cbc";
    static String enc_s2c = "blowfish-cbc";
    static String mac_c2s = "hmac-md5";
    static String mac_s2c = "hmac-md5";
    static String lang_c2s = "";
    static String lang_s2c = "";
    public static final int STATE_END = 0;
    protected Session session = null;
    protected HASH sha = null;
    protected byte[] K = null;
    protected byte[] H = null;
    protected byte[] K_S = null;

    public abstract void init(Session session, byte[] bArr, byte[] bArr2, byte[] bArr3, byte[] bArr4) throws Exception;

    public abstract boolean next(Buffer buffer) throws Exception;

    public abstract String getKeyType();

    public abstract int getState();

    protected static String[] guess(byte[] I_S, byte[] I_C) {
        String[] guess = new String[PROPOSAL_MAX];
        Buffer sb = new Buffer(I_S);
        sb.setOffSet(17);
        Buffer cb = new Buffer(I_C);
        cb.setOffSet(17);
        if (JSch.getLogger().isEnabled(1)) {
            for (int i = 0; i < PROPOSAL_MAX; i++) {
                JSch.getLogger().log(1, "kex: server: " + Util.byte2str(sb.getString()));
            }
            for (int i2 = 0; i2 < PROPOSAL_MAX; i2++) {
                JSch.getLogger().log(1, "kex: client: " + Util.byte2str(cb.getString()));
            }
            sb.setOffSet(17);
            cb.setOffSet(17);
        }
        for (int i3 = 0; i3 < PROPOSAL_MAX; i3++) {
            byte[] sp = sb.getString();
            byte[] cp = cb.getString();
            int j = 0;
            int i4 = 0;
            while (true) {
                int k = i4;
                if (j >= cp.length) {
                    break;
                }
                while (j < cp.length && cp[j] != 44) {
                    j++;
                }
                if (k == j) {
                    return null;
                }
                String algorithm = Util.byte2str(cp, k, j - k);
                int l = 0;
                int i5 = 0;
                while (true) {
                    int m = i5;
                    if (l < sp.length) {
                        while (l < sp.length && sp[l] != 44) {
                            l++;
                        }
                        if (m == l) {
                            return null;
                        }
                        if (algorithm.equals(Util.byte2str(sp, m, l - m))) {
                            guess[i3] = algorithm;
                            break;
                        }
                        l++;
                        i5 = l;
                    }
                }
                j++;
                i4 = j;
            }
            if (j == 0) {
                guess[i3] = "";
            } else if (guess[i3] == null) {
                return null;
            }
        }
        if (JSch.getLogger().isEnabled(1)) {
            JSch.getLogger().log(1, "kex: server->client " + guess[3] + " " + guess[5] + " " + guess[7]);
            JSch.getLogger().log(1, "kex: client->server " + guess[2] + " " + guess[4] + " " + guess[6]);
        }
        return guess;
    }

    public String getFingerPrint() {
        HASH hash = null;
        try {
            Class c = Class.forName(this.session.getConfig("md5"));
            hash = (HASH) c.newInstance();
        } catch (Exception e) {
            System.err.println("getFingerPrint: " + e);
        }
        return Util.getFingerPrint(hash, getHostKey());
    }

    byte[] getK() {
        return this.K;
    }

    byte[] getH() {
        return this.H;
    }

    HASH getHash() {
        return this.sha;
    }

    byte[] getHostKey() {
        return this.K_S;
    }

    protected byte[] normalize(byte[] secret) {
        if (secret.length > 1 && secret[0] == 0 && (secret[1] & 128) == 0) {
            byte[] tmp = new byte[secret.length - 1];
            System.arraycopy(secret, 1, tmp, 0, tmp.length);
            return normalize(tmp);
        }
        return secret;
    }
}
