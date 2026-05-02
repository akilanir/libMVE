package com.jcraft.jsch;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Hashtable;
import java.util.Vector;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/KeyPair.class */
public abstract class KeyPair {
    public static final int ERROR = 0;
    public static final int DSA = 1;
    public static final int RSA = 2;
    public static final int UNKNOWN = 3;
    static final int VENDOR_OPENSSH = 0;
    static final int VENDOR_FSECURE = 1;
    static final int VENDOR_PUTTY = 2;
    static final int VENDOR_PKCS8 = 3;
    JSch jsch;
    private Cipher cipher;
    private HASH hash;
    private Random random;
    private byte[] passphrase;
    private static final byte[] cr = Util.str2byte("\n");
    static byte[][] header = {Util.str2byte("Proc-Type: 4,ENCRYPTED"), Util.str2byte("DEK-Info: DES-EDE3-CBC,")};
    private static byte[] space = Util.str2byte(" ");
    private static final String[] header1 = {"PuTTY-User-Key-File-2: ", "Encryption: ", "Comment: ", "Public-Lines: "};
    private static final String[] header2 = {"Private-Lines: "};
    private static final String[] header3 = {"Private-MAC: "};
    int vendor = 0;
    protected String publicKeyComment = "no comment";
    protected boolean encrypted = false;
    protected byte[] data = null;
    private byte[] iv = null;
    private byte[] publickeyblob = null;

    abstract void generate(int i) throws JSchException;

    abstract byte[] getBegin();

    abstract byte[] getEnd();

    abstract int getKeySize();

    public abstract byte[] getSignature(byte[] bArr);

    public abstract Signature getVerifier();

    public abstract byte[] forSSHAgent() throws JSchException;

    abstract byte[] getPrivateKey();

    abstract byte[] getKeyTypeName();

    public abstract int getKeyType();

    abstract boolean parse(byte[] bArr);

    public static KeyPair genKeyPair(JSch jsch, int type) throws JSchException {
        return genKeyPair(jsch, type, 1024);
    }

    public static KeyPair genKeyPair(JSch jsch, int type, int key_size) throws JSchException {
        KeyPair kpair = null;
        if (type == 1) {
            kpair = new KeyPairDSA(jsch);
        } else if (type == 2) {
            kpair = new KeyPairRSA(jsch);
        }
        if (kpair != null) {
            kpair.generate(key_size);
        }
        return kpair;
    }

    public String getPublicKeyComment() {
        return this.publicKeyComment;
    }

    public void setPublicKeyComment(String publicKeyComment) {
        this.publicKeyComment = publicKeyComment;
    }

    public KeyPair(JSch jsch) {
        this.jsch = null;
        this.jsch = jsch;
    }

    public void writePrivateKey(OutputStream out) {
        writePrivateKey(out, (byte[]) null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v4, types: [byte[], byte[][]] */
    public void writePrivateKey(OutputStream outputStream, byte[] bArr) {
        if (bArr == null) {
            bArr = this.passphrase;
        }
        byte[] privateKey = getPrivateKey();
        ?? r0 = new byte[1];
        byte[] encrypt = encrypt(privateKey, r0, bArr);
        if (encrypt != privateKey) {
            Util.bzero(privateKey);
        }
        Object[] objArr = r0[0];
        byte[] base64 = Util.toBase64(encrypt, 0, encrypt.length);
        try {
            outputStream.write(getBegin());
            outputStream.write(cr);
            if (bArr != null) {
                outputStream.write(header[0]);
                outputStream.write(cr);
                outputStream.write(header[1]);
                for (int i = 0; i < objArr.length; i++) {
                    outputStream.write(b2a((byte) (((objArr[i] ? 1 : 0) >>> 4) & 15)));
                    outputStream.write(b2a((byte) ((objArr[i] ? 1 : 0) & 15)));
                }
                outputStream.write(cr);
                outputStream.write(cr);
            }
            int i2 = 0;
            while (true) {
                if (i2 >= base64.length) {
                    break;
                }
                if (i2 + 64 < base64.length) {
                    outputStream.write(base64, i2, 64);
                    outputStream.write(cr);
                    i2 += 64;
                } else {
                    outputStream.write(base64, i2, base64.length - i2);
                    outputStream.write(cr);
                    break;
                }
            }
            outputStream.write(getEnd());
            outputStream.write(cr);
        } catch (Exception e) {
        }
    }

    public byte[] getPublicKeyBlob() {
        return this.publickeyblob;
    }

    public void writePublicKey(OutputStream out, String comment) {
        byte[] pubblob = getPublicKeyBlob();
        byte[] pub = Util.toBase64(pubblob, 0, pubblob.length);
        try {
            out.write(getKeyTypeName());
            out.write(space);
            out.write(pub, 0, pub.length);
            out.write(space);
            out.write(Util.str2byte(comment));
            out.write(cr);
        } catch (Exception e) {
        }
    }

    public void writePublicKey(String name, String comment) throws FileNotFoundException, IOException {
        FileOutputStream fos = new FileOutputStream(name);
        writePublicKey(fos, comment);
        fos.close();
    }

    public void writeSECSHPublicKey(OutputStream out, String comment) {
        byte[] pubblob = getPublicKeyBlob();
        byte[] pub = Util.toBase64(pubblob, 0, pubblob.length);
        try {
            out.write(Util.str2byte("---- BEGIN SSH2 PUBLIC KEY ----"));
            out.write(cr);
            out.write(Util.str2byte("Comment: \"" + comment + "\""));
            out.write(cr);
            int index = 0;
            while (index < pub.length) {
                int len = 70;
                if (pub.length - index < 70) {
                    len = pub.length - index;
                }
                out.write(pub, index, len);
                out.write(cr);
                index += len;
            }
            out.write(Util.str2byte("---- END SSH2 PUBLIC KEY ----"));
            out.write(cr);
        } catch (Exception e) {
        }
    }

    public void writeSECSHPublicKey(String name, String comment) throws FileNotFoundException, IOException {
        FileOutputStream fos = new FileOutputStream(name);
        writeSECSHPublicKey(fos, comment);
        fos.close();
    }

    public void writePrivateKey(String name) throws FileNotFoundException, IOException {
        writePrivateKey(name, (byte[]) null);
    }

    public void writePrivateKey(String name, byte[] passphrase) throws FileNotFoundException, IOException {
        FileOutputStream fos = new FileOutputStream(name);
        writePrivateKey(fos, passphrase);
        fos.close();
    }

    public String getFingerPrint() {
        if (this.hash == null) {
            this.hash = genHash();
        }
        byte[] kblob = getPublicKeyBlob();
        if (kblob == null) {
            return null;
        }
        return Util.getFingerPrint(this.hash, kblob);
    }

    private byte[] encrypt(byte[] plain, byte[][] _iv, byte[] passphrase) {
        if (passphrase == null) {
            return plain;
        }
        if (this.cipher == null) {
            this.cipher = genCipher();
        }
        byte[] iv = new byte[this.cipher.getIVSize()];
        _iv[0] = iv;
        if (this.random == null) {
            this.random = genRandom();
        }
        this.random.fill(iv, 0, iv.length);
        byte[] key = genKey(passphrase, iv);
        int bsize = this.cipher.getIVSize();
        byte[] foo = new byte[((plain.length / bsize) + 1) * bsize];
        System.arraycopy(plain, 0, foo, 0, plain.length);
        int padding = bsize - (plain.length % bsize);
        for (int i = foo.length - 1; foo.length - padding <= i; i--) {
            foo[i] = (byte) padding;
        }
        try {
            this.cipher.init(0, key, iv);
            this.cipher.update(foo, 0, foo.length, foo, 0);
        } catch (Exception e) {
        }
        Util.bzero(key);
        return foo;
    }

    private byte[] decrypt(byte[] data, byte[] passphrase, byte[] iv) {
        try {
            byte[] key = genKey(passphrase, iv);
            this.cipher.init(1, key, iv);
            Util.bzero(key);
            byte[] plain = new byte[data.length];
            this.cipher.update(data, 0, data.length, plain, 0);
            return plain;
        } catch (Exception e) {
            return null;
        }
    }

    int writeSEQUENCE(byte[] buf, int index, int len) {
        buf[index] = 48;
        return writeLength(buf, index + 1, len);
    }

    int writeINTEGER(byte[] buf, int index, byte[] data) {
        buf[index] = 2;
        int index2 = writeLength(buf, index + 1, data.length);
        System.arraycopy(data, 0, buf, index2, data.length);
        return index2 + data.length;
    }

    int countLength(int len) {
        int i = 1;
        if (len <= 127) {
            return 1;
        }
        while (len > 0) {
            len >>>= 8;
            i++;
        }
        return i;
    }

    int writeLength(byte[] data, int index, int len) {
        int i = countLength(len) - 1;
        if (i == 0) {
            int index2 = index + 1;
            data[index] = (byte) len;
            return index2;
        }
        int index3 = index + 1;
        data[index] = (byte) (128 | i);
        int j = index3 + i;
        while (i > 0) {
            data[(index3 + i) - 1] = (byte) (len & 255);
            len >>>= 8;
            i--;
        }
        return j;
    }

    private Random genRandom() {
        if (this.random == null) {
            try {
                JSch jSch = this.jsch;
                Class c = Class.forName(JSch.getConfig("random"));
                this.random = (Random) c.newInstance();
            } catch (Exception e) {
                System.err.println("connect: random " + e);
            }
        }
        return this.random;
    }

    private HASH genHash() {
        try {
            JSch jSch = this.jsch;
            Class c = Class.forName(JSch.getConfig("md5"));
            this.hash = (HASH) c.newInstance();
            this.hash.init();
        } catch (Exception e) {
        }
        return this.hash;
    }

    private Cipher genCipher() {
        try {
            JSch jSch = this.jsch;
            Class c = Class.forName(JSch.getConfig("3des-cbc"));
            this.cipher = (Cipher) c.newInstance();
        } catch (Exception e) {
        }
        return this.cipher;
    }

    synchronized byte[] genKey(byte[] passphrase, byte[] iv) {
        if (this.cipher == null) {
            this.cipher = genCipher();
        }
        if (this.hash == null) {
            this.hash = genHash();
        }
        byte[] key = new byte[this.cipher.getBlockSize()];
        int hsize = this.hash.getBlockSize();
        byte[] hn = new byte[((key.length / hsize) * hsize) + (key.length % hsize == 0 ? 0 : hsize)];
        try {
            byte[] tmp = null;
            if (this.vendor == 0) {
                int index = 0;
                while (index + hsize <= hn.length) {
                    if (tmp != null) {
                        this.hash.update(tmp, 0, tmp.length);
                    }
                    this.hash.update(passphrase, 0, passphrase.length);
                    this.hash.update(iv, 0, iv.length > 8 ? 8 : iv.length);
                    tmp = this.hash.digest();
                    System.arraycopy(tmp, 0, hn, index, tmp.length);
                    index += tmp.length;
                }
                System.arraycopy(hn, 0, key, 0, key.length);
            } else if (this.vendor == 1) {
                int index2 = 0;
                while (index2 + hsize <= hn.length) {
                    if (tmp != null) {
                        this.hash.update(tmp, 0, tmp.length);
                    }
                    this.hash.update(passphrase, 0, passphrase.length);
                    tmp = this.hash.digest();
                    System.arraycopy(tmp, 0, hn, index2, tmp.length);
                    index2 += tmp.length;
                }
                System.arraycopy(hn, 0, key, 0, key.length);
            } else if (this.vendor == 2) {
                JSch jSch = this.jsch;
                Class c = Class.forName(JSch.getConfig("sha-1"));
                HASH sha1 = (HASH) c.newInstance();
                byte[] tmp2 = new byte[4];
                key = new byte[40];
                for (int i = 0; i < 2; i++) {
                    sha1.init();
                    tmp2[3] = (byte) i;
                    sha1.update(tmp2, 0, tmp2.length);
                    sha1.update(passphrase, 0, passphrase.length);
                    System.arraycopy(sha1.digest(), 0, key, i * 20, 20);
                }
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return key;
    }

    public void setPassphrase(String passphrase) {
        if (passphrase == null || passphrase.length() == 0) {
            setPassphrase((byte[]) null);
        } else {
            setPassphrase(Util.str2byte(passphrase));
        }
    }

    public void setPassphrase(byte[] passphrase) {
        if (passphrase != null && passphrase.length == 0) {
            passphrase = null;
        }
        this.passphrase = passphrase;
    }

    public boolean isEncrypted() {
        return this.encrypted;
    }

    public boolean decrypt(String _passphrase) {
        if (_passphrase == null || _passphrase.length() == 0) {
            return !this.encrypted;
        }
        return decrypt(Util.str2byte(_passphrase));
    }

    public boolean decrypt(byte[] _passphrase) {
        if (!this.encrypted) {
            return true;
        }
        if (_passphrase == null) {
            return !this.encrypted;
        }
        byte[] bar = new byte[_passphrase.length];
        System.arraycopy(_passphrase, 0, bar, 0, bar.length);
        byte[] foo = decrypt(this.data, bar, this.iv);
        Util.bzero(bar);
        if (parse(foo)) {
            this.encrypted = false;
        }
        return !this.encrypted;
    }

    public static KeyPair load(JSch jsch, String prvkey) throws JSchException {
        String pubkey = prvkey + ".pub";
        if (!new File(pubkey).exists()) {
            pubkey = null;
        }
        return load(jsch, prvkey, pubkey);
    }

    public static KeyPair load(JSch jsch, String prvfile, String pubfile) throws JSchException {
        byte[] pubkey = null;
        try {
            byte[] prvkey = Util.fromFile(prvfile);
            String _pubfile = pubfile;
            if (pubfile == null) {
                _pubfile = prvfile + ".pub";
            }
            try {
                pubkey = Util.fromFile(_pubfile);
            } catch (IOException e) {
                if (pubfile != null) {
                    throw new JSchException(e.toString(), e);
                }
            }
            try {
                KeyPair load = load(jsch, prvkey, pubkey);
                Util.bzero(prvkey);
                return load;
            } catch (Throwable th) {
                Util.bzero(prvkey);
                throw th;
            }
        } catch (IOException e2) {
            throw new JSchException(e2.toString(), e2);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:129:0x0322, code lost:
    
        throw new com.jcraft.jsch.JSchException("invalid privatekey: " + r10);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static com.jcraft.jsch.KeyPair load(com.jcraft.jsch.JSch r9, byte[] r10, byte[] r11) throws com.jcraft.jsch.JSchException {
        /*
            Method dump skipped, instructions count: 2955
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.jcraft.jsch.KeyPair.load(com.jcraft.jsch.JSch, byte[], byte[]):com.jcraft.jsch.KeyPair");
    }

    private static byte a2b(byte c) {
        return (48 > c || c > 57) ? (byte) ((c - 97) + 10) : (byte) (c - 48);
    }

    private static byte b2a(byte c) {
        return (0 > c || c > 9) ? (byte) ((c - 10) + 65) : (byte) (c + 48);
    }

    public void dispose() {
        Util.bzero(this.passphrase);
    }

    public void finalize() {
        dispose();
    }

    static KeyPair loadPPK(JSch jsch, byte[] buf) throws JSchException {
        KeyPair kpair;
        Buffer buffer = new Buffer(buf);
        Hashtable v = new Hashtable();
        while (parseHeader(buffer, v)) {
        }
        String typ = (String) v.get("PuTTY-User-Key-File-2");
        if (typ == null) {
            return null;
        }
        int lines = Integer.parseInt((String) v.get("Public-Lines"));
        byte[] pubkey = parseLines(buffer, lines);
        while (parseHeader(buffer, v)) {
        }
        int lines2 = Integer.parseInt((String) v.get("Private-Lines"));
        byte[] prvkey = parseLines(buffer, lines2);
        while (parseHeader(buffer, v)) {
        }
        byte[] prvkey2 = Util.fromBase64(prvkey, 0, prvkey.length);
        byte[] pubkey2 = Util.fromBase64(pubkey, 0, pubkey.length);
        if (typ.equals("ssh-rsa")) {
            Buffer _buf = new Buffer(pubkey2);
            _buf.skip(pubkey2.length);
            int len = _buf.getInt();
            _buf.getByte(new byte[len]);
            byte[] pub_array = new byte[_buf.getInt()];
            _buf.getByte(pub_array);
            byte[] n_array = new byte[_buf.getInt()];
            _buf.getByte(n_array);
            kpair = new KeyPairRSA(jsch, n_array, pub_array, null);
        } else if (typ.equals("ssh-dss")) {
            Buffer _buf2 = new Buffer(pubkey2);
            _buf2.skip(pubkey2.length);
            int len2 = _buf2.getInt();
            _buf2.getByte(new byte[len2]);
            byte[] p_array = new byte[_buf2.getInt()];
            _buf2.getByte(p_array);
            byte[] q_array = new byte[_buf2.getInt()];
            _buf2.getByte(q_array);
            byte[] g_array = new byte[_buf2.getInt()];
            _buf2.getByte(g_array);
            byte[] y_array = new byte[_buf2.getInt()];
            _buf2.getByte(y_array);
            kpair = new KeyPairDSA(jsch, p_array, q_array, g_array, y_array, null);
        } else {
            return null;
        }
        if (kpair == null) {
            return null;
        }
        kpair.encrypted = !v.get("Encryption").equals("none");
        kpair.vendor = 2;
        kpair.publicKeyComment = (String) v.get("Comment");
        if (!kpair.encrypted) {
            kpair.data = prvkey2;
            kpair.parse(prvkey2);
        } else if (Session.checkCipher(JSch.getConfig("aes256-cbc"))) {
            try {
                Class c = Class.forName(JSch.getConfig("aes256-cbc"));
                kpair.cipher = (Cipher) c.newInstance();
                kpair.iv = new byte[kpair.cipher.getIVSize()];
                kpair.data = prvkey2;
            } catch (Exception e) {
                throw new JSchException("The cipher 'aes256-cbc' is required, but it is not available.");
            }
        } else {
            throw new JSchException("The cipher 'aes256-cbc' is required, but it is not available.");
        }
        return kpair;
    }

    private static byte[] parseLines(Buffer buffer, int lines) {
        byte[] buf = buffer.buffer;
        int index = buffer.index;
        byte[] data = null;
        int i = index;
        while (true) {
            int i2 = lines;
            lines--;
            if (i2 <= 0) {
                break;
            }
            while (true) {
                if (buf.length <= i) {
                    break;
                }
                int i3 = i;
                i++;
                if (buf[i3] == 13) {
                    if (data == null) {
                        data = new byte[(i - index) - 1];
                        System.arraycopy(buf, index, data, 0, (i - index) - 1);
                    } else {
                        byte[] tmp = new byte[((data.length + i) - index) - 1];
                        System.arraycopy(data, 0, tmp, 0, data.length);
                        System.arraycopy(buf, index, tmp, data.length, (i - index) - 1);
                        for (int j = 0; j < data.length; j++) {
                            data[j] = 0;
                        }
                        data = tmp;
                    }
                }
            }
            if (buf[i] == 10) {
                i++;
            }
            index = i;
        }
        if (data != null) {
            buffer.index = index;
        }
        return data;
    }

    private static boolean parseHeader(Buffer buffer, Hashtable v) {
        byte[] buf = buffer.buffer;
        int index = buffer.index;
        String key = null;
        String value = null;
        int i = index;
        while (true) {
            if (i >= buf.length || buf[i] == 13) {
                break;
            }
            if (buf[i] != 58) {
                i++;
            } else {
                key = new String(buf, index, i - index);
                int i2 = i + 1;
                if (i2 < buf.length && buf[i2] == 32) {
                    i2++;
                }
                index = i2;
            }
        }
        if (key == null) {
            return false;
        }
        int i3 = index;
        while (true) {
            if (i3 >= buf.length) {
                break;
            }
            if (buf[i3] != 13) {
                i3++;
            } else {
                value = new String(buf, index, i3 - index);
                int i4 = i3 + 1;
                if (i4 < buf.length && buf[i4] == 10) {
                    i4++;
                }
                index = i4;
            }
        }
        if (value != null) {
            v.put(key, value);
            buffer.index = index;
        }
        return (key == null || value == null) ? false : true;
    }

    void copy(KeyPair kpair) {
        this.publickeyblob = kpair.publickeyblob;
        this.vendor = kpair.vendor;
        this.publicKeyComment = kpair.publicKeyComment;
        this.cipher = kpair.cipher;
    }

    /* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/KeyPair$ASN1Exception.class */
    class ASN1Exception extends Exception {
        ASN1Exception() {
        }
    }

    /* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/KeyPair$ASN1.class */
    class ASN1 {
        byte[] buf;
        int start;
        int length;

        ASN1(KeyPair keyPair, byte[] buf) throws ASN1Exception {
            this(buf, 0, buf.length);
        }

        ASN1(byte[] buf, int start, int length) throws ASN1Exception {
            this.buf = buf;
            this.start = start;
            this.length = length;
            if (start + length > buf.length) {
                throw KeyPair.this.new ASN1Exception();
            }
        }

        int getType() {
            return this.buf[this.start] & 255;
        }

        boolean isSEQUENCE() {
            return getType() == 48;
        }

        boolean isINTEGER() {
            return getType() == 2;
        }

        boolean isOBJECT() {
            return getType() == 6;
        }

        boolean isOCTETSTRING() {
            return getType() == 4;
        }

        private int getLength(int[] indexp) {
            int index = indexp[0];
            int index2 = index + 1;
            int length = this.buf[index] & 255;
            if ((length & 128) != 0) {
                int foo = length & 127;
                int i = 0;
                while (true) {
                    length = i;
                    int i2 = foo;
                    foo--;
                    if (i2 <= 0) {
                        break;
                    }
                    int i3 = index2;
                    index2++;
                    i = (length << 8) + (this.buf[i3] & 255);
                }
            }
            indexp[0] = index2;
            return length;
        }

        byte[] getContent() {
            int[] indexp = {this.start + 1};
            int length = getLength(indexp);
            int index = indexp[0];
            byte[] tmp = new byte[length];
            System.arraycopy(this.buf, index, tmp, 0, tmp.length);
            return tmp;
        }

        ASN1[] getContents() throws ASN1Exception {
            byte b = this.buf[this.start];
            int[] indexp = {this.start + 1};
            int length = getLength(indexp);
            if (b == 5) {
                return new ASN1[0];
            }
            int index = indexp[0];
            Vector values = new Vector();
            while (length > 0) {
                int index2 = index + 1;
                indexp[0] = index2;
                int l = getLength(indexp);
                int index3 = indexp[0];
                int length2 = (length - 1) - (index3 - index2);
                values.addElement(KeyPair.this.new ASN1(this.buf, index2 - 1, 1 + (index3 - index2) + l));
                index = index3 + l;
                length = length2 - l;
            }
            ASN1[] result = new ASN1[values.size()];
            for (int i = 0; i < values.size(); i++) {
                result[i] = (ASN1) values.elementAt(i);
            }
            return result;
        }
    }
}
