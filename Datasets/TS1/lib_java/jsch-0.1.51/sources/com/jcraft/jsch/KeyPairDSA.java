package com.jcraft.jsch;

import java.math.BigInteger;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/KeyPairDSA.class */
public class KeyPairDSA extends KeyPair {
    private byte[] P_array;
    private byte[] Q_array;
    private byte[] G_array;
    private byte[] pub_array;
    private byte[] prv_array;
    private int key_size;
    private static final byte[] begin = Util.str2byte("-----BEGIN DSA PRIVATE KEY-----");
    private static final byte[] end = Util.str2byte("-----END DSA PRIVATE KEY-----");
    private static final byte[] sshdss = Util.str2byte("ssh-dss");

    public KeyPairDSA(JSch jsch) {
        this(jsch, null, null, null, null, null);
    }

    public KeyPairDSA(JSch jsch, byte[] P_array, byte[] Q_array, byte[] G_array, byte[] pub_array, byte[] prv_array) {
        super(jsch);
        this.key_size = 1024;
        this.P_array = P_array;
        this.Q_array = Q_array;
        this.G_array = G_array;
        this.pub_array = pub_array;
        this.prv_array = prv_array;
        if (P_array != null) {
            this.key_size = new BigInteger(P_array).bitLength();
        }
    }

    @Override // com.jcraft.jsch.KeyPair
    void generate(int key_size) throws JSchException {
        this.key_size = key_size;
        try {
            JSch jSch = this.jsch;
            Class c = Class.forName(JSch.getConfig("keypairgen.dsa"));
            KeyPairGenDSA keypairgen = (KeyPairGenDSA) c.newInstance();
            keypairgen.init(key_size);
            this.P_array = keypairgen.getP();
            this.Q_array = keypairgen.getQ();
            this.G_array = keypairgen.getG();
            this.pub_array = keypairgen.getY();
            this.prv_array = keypairgen.getX();
        } catch (Exception e) {
            if (e instanceof Throwable) {
                throw new JSchException(e.toString(), e);
            }
            throw new JSchException(e.toString());
        }
    }

    @Override // com.jcraft.jsch.KeyPair
    byte[] getBegin() {
        return begin;
    }

    @Override // com.jcraft.jsch.KeyPair
    byte[] getEnd() {
        return end;
    }

    @Override // com.jcraft.jsch.KeyPair
    byte[] getPrivateKey() {
        int content = 1 + countLength(1) + 1 + 1 + countLength(this.P_array.length) + this.P_array.length + 1 + countLength(this.Q_array.length) + this.Q_array.length + 1 + countLength(this.G_array.length) + this.G_array.length + 1 + countLength(this.pub_array.length) + this.pub_array.length + 1 + countLength(this.prv_array.length) + this.prv_array.length;
        int total = 1 + countLength(content) + content;
        byte[] plain = new byte[total];
        int index = writeSEQUENCE(plain, 0, content);
        writeINTEGER(plain, writeINTEGER(plain, writeINTEGER(plain, writeINTEGER(plain, writeINTEGER(plain, writeINTEGER(plain, index, new byte[1]), this.P_array), this.Q_array), this.G_array), this.pub_array), this.prv_array);
        return plain;
    }

    @Override // com.jcraft.jsch.KeyPair
    boolean parse(byte[] plain) {
        try {
            if (this.vendor == 1) {
                if (plain[0] != 48) {
                    Buffer buf = new Buffer(plain);
                    buf.getInt();
                    this.P_array = buf.getMPIntBits();
                    this.G_array = buf.getMPIntBits();
                    this.Q_array = buf.getMPIntBits();
                    this.pub_array = buf.getMPIntBits();
                    this.prv_array = buf.getMPIntBits();
                    if (this.P_array != null) {
                        this.key_size = new BigInteger(this.P_array).bitLength();
                        return true;
                    }
                    return true;
                }
                return false;
            }
            if (this.vendor == 2) {
                Buffer buf2 = new Buffer(plain);
                buf2.skip(plain.length);
                try {
                    byte[][] tmp = buf2.getBytes(1, "");
                    this.prv_array = tmp[0];
                    return true;
                } catch (JSchException e) {
                    return false;
                }
            }
            if (plain[0] != 48) {
                return false;
            }
            int index = 0 + 1;
            int index2 = index + 1;
            int length = plain[index] & 255;
            if ((length & 128) != 0) {
                int foo = length & 127;
                int length2 = 0;
                while (true) {
                    int i = foo;
                    foo--;
                    if (i <= 0) {
                        break;
                    }
                    int i2 = index2;
                    index2++;
                    length2 = (length2 << 8) + (plain[i2] & 255);
                }
            }
            if (plain[index2] != 2) {
                return false;
            }
            int index3 = index2 + 1;
            int index4 = index3 + 1;
            int length3 = plain[index3] & 255;
            if ((length3 & 128) != 0) {
                int foo2 = length3 & 127;
                length3 = 0;
                while (true) {
                    int i3 = foo2;
                    foo2--;
                    if (i3 <= 0) {
                        break;
                    }
                    int i4 = index4;
                    index4++;
                    length3 = (length3 << 8) + (plain[i4] & 255);
                }
            }
            int index5 = index4 + length3 + 1;
            int index6 = index5 + 1;
            int length4 = plain[index5] & 255;
            if ((length4 & 128) != 0) {
                int foo3 = length4 & 127;
                length4 = 0;
                while (true) {
                    int i5 = foo3;
                    foo3--;
                    if (i5 <= 0) {
                        break;
                    }
                    int i6 = index6;
                    index6++;
                    length4 = (length4 << 8) + (plain[i6] & 255);
                }
            }
            this.P_array = new byte[length4];
            System.arraycopy(plain, index6, this.P_array, 0, length4);
            int index7 = index6 + length4 + 1;
            int index8 = index7 + 1;
            int length5 = plain[index7] & 255;
            if ((length5 & 128) != 0) {
                int foo4 = length5 & 127;
                length5 = 0;
                while (true) {
                    int i7 = foo4;
                    foo4--;
                    if (i7 <= 0) {
                        break;
                    }
                    int i8 = index8;
                    index8++;
                    length5 = (length5 << 8) + (plain[i8] & 255);
                }
            }
            this.Q_array = new byte[length5];
            System.arraycopy(plain, index8, this.Q_array, 0, length5);
            int index9 = index8 + length5 + 1;
            int index10 = index9 + 1;
            int length6 = plain[index9] & 255;
            if ((length6 & 128) != 0) {
                int foo5 = length6 & 127;
                length6 = 0;
                while (true) {
                    int i9 = foo5;
                    foo5--;
                    if (i9 <= 0) {
                        break;
                    }
                    int i10 = index10;
                    index10++;
                    length6 = (length6 << 8) + (plain[i10] & 255);
                }
            }
            this.G_array = new byte[length6];
            System.arraycopy(plain, index10, this.G_array, 0, length6);
            int index11 = index10 + length6 + 1;
            int index12 = index11 + 1;
            int length7 = plain[index11] & 255;
            if ((length7 & 128) != 0) {
                int foo6 = length7 & 127;
                length7 = 0;
                while (true) {
                    int i11 = foo6;
                    foo6--;
                    if (i11 <= 0) {
                        break;
                    }
                    int i12 = index12;
                    index12++;
                    length7 = (length7 << 8) + (plain[i12] & 255);
                }
            }
            this.pub_array = new byte[length7];
            System.arraycopy(plain, index12, this.pub_array, 0, length7);
            int index13 = index12 + length7 + 1;
            int index14 = index13 + 1;
            int length8 = plain[index13] & 255;
            if ((length8 & 128) != 0) {
                int foo7 = length8 & 127;
                length8 = 0;
                while (true) {
                    int i13 = foo7;
                    foo7--;
                    if (i13 <= 0) {
                        break;
                    }
                    int i14 = index14;
                    index14++;
                    length8 = (length8 << 8) + (plain[i14] & 255);
                }
            }
            this.prv_array = new byte[length8];
            System.arraycopy(plain, index14, this.prv_array, 0, length8);
            int i15 = index14 + length8;
            if (this.P_array != null) {
                this.key_size = new BigInteger(this.P_array).bitLength();
            }
            return true;
        } catch (Exception e2) {
            return false;
        }
    }

    /* JADX WARN: Type inference failed for: r0v6, types: [byte[], byte[][]] */
    @Override // com.jcraft.jsch.KeyPair
    public byte[] getPublicKeyBlob() {
        byte[] foo = super.getPublicKeyBlob();
        if (foo != null) {
            return foo;
        }
        if (this.P_array == null) {
            return null;
        }
        return Buffer.fromBytes(new byte[]{sshdss, this.P_array, this.Q_array, this.G_array, this.pub_array}).buffer;
    }

    @Override // com.jcraft.jsch.KeyPair
    byte[] getKeyTypeName() {
        return sshdss;
    }

    @Override // com.jcraft.jsch.KeyPair
    public int getKeyType() {
        return 1;
    }

    @Override // com.jcraft.jsch.KeyPair
    public int getKeySize() {
        return this.key_size;
    }

    /* JADX WARN: Type inference failed for: r0v16, types: [byte[], byte[][]] */
    @Override // com.jcraft.jsch.KeyPair
    public byte[] getSignature(byte[] data) {
        try {
            JSch jSch = this.jsch;
            Class c = Class.forName(JSch.getConfig("signature.dss"));
            SignatureDSA dsa = (SignatureDSA) c.newInstance();
            dsa.init();
            dsa.setPrvKey(this.prv_array, this.P_array, this.Q_array, this.G_array);
            dsa.update(data);
            byte[] sig = dsa.sign();
            return Buffer.fromBytes(new byte[]{sshdss, sig}).buffer;
        } catch (Exception e) {
            return null;
        }
    }

    @Override // com.jcraft.jsch.KeyPair
    public Signature getVerifier() {
        try {
            JSch jSch = this.jsch;
            Class c = Class.forName(JSch.getConfig("signature.dss"));
            SignatureDSA dsa = (SignatureDSA) c.newInstance();
            dsa.init();
            if (this.pub_array == null && this.P_array == null && getPublicKeyBlob() != null) {
                Buffer buf = new Buffer(getPublicKeyBlob());
                buf.getString();
                this.P_array = buf.getString();
                this.Q_array = buf.getString();
                this.G_array = buf.getString();
                this.pub_array = buf.getString();
            }
            dsa.setPubKey(this.pub_array, this.P_array, this.Q_array, this.G_array);
            return dsa;
        } catch (Exception e) {
            return null;
        }
    }

    static KeyPair fromSSHAgent(JSch jsch, Buffer buf) throws JSchException {
        byte[][] tmp = buf.getBytes(7, "invalid key format");
        byte[] P_array = tmp[1];
        byte[] Q_array = tmp[2];
        byte[] G_array = tmp[3];
        byte[] pub_array = tmp[4];
        byte[] prv_array = tmp[5];
        KeyPairDSA kpair = new KeyPairDSA(jsch, P_array, Q_array, G_array, pub_array, prv_array);
        kpair.publicKeyComment = new String(tmp[6]);
        kpair.vendor = 0;
        return kpair;
    }

    @Override // com.jcraft.jsch.KeyPair
    public byte[] forSSHAgent() throws JSchException {
        if (isEncrypted()) {
            throw new JSchException("key is encrypted.");
        }
        Buffer buf = new Buffer();
        buf.putString(sshdss);
        buf.putString(this.P_array);
        buf.putString(this.Q_array);
        buf.putString(this.G_array);
        buf.putString(this.pub_array);
        buf.putString(this.prv_array);
        buf.putString(Util.str2byte(this.publicKeyComment));
        byte[] result = new byte[buf.getLength()];
        buf.getByte(result, 0, result.length);
        return result;
    }

    @Override // com.jcraft.jsch.KeyPair
    public void dispose() {
        super.dispose();
        Util.bzero(this.prv_array);
    }
}
