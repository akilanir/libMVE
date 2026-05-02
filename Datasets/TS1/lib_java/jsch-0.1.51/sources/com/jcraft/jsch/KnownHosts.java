package com.jcraft.jsch;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Vector;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/KnownHosts.class */
public class KnownHosts implements HostKeyRepository {
    private static final String _known_hosts = "known_hosts";
    private JSch jsch;
    private Vector pool;
    private static final byte[] space = {32};
    private static final byte[] cr = Util.str2byte("\n");
    private String known_hosts = null;
    private MAC hmacsha1 = null;

    KnownHosts(JSch jsch) {
        this.jsch = null;
        this.pool = null;
        this.jsch = jsch;
        this.pool = new Vector();
    }

    void setKnownHosts(String filename) throws JSchException {
        try {
            this.known_hosts = filename;
            FileInputStream fis = new FileInputStream(Util.checkTilde(filename));
            setKnownHosts(fis);
        } catch (FileNotFoundException e) {
            throw new JSchException(e.toString(), e);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:101:0x023d, code lost:
    
        if (r14 >= r21) goto L234;
     */
    /* JADX WARN: Code restructure failed: missing block: B:102:0x0240, code lost:
    
        r0 = r20[r14];
     */
    /* JADX WARN: Code restructure failed: missing block: B:103:0x0249, code lost:
    
        if (r0 == 32) goto L236;
     */
    /* JADX WARN: Code restructure failed: missing block: B:105:0x024f, code lost:
    
        if (r0 != 9) goto L235;
     */
    /* JADX WARN: Code restructure failed: missing block: B:106:0x0252, code lost:
    
        r14 = r14 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:107:0x0258, code lost:
    
        r0.setLength(0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:109:0x0261, code lost:
    
        if (r14 >= r21) goto L238;
     */
    /* JADX WARN: Code restructure failed: missing block: B:110:0x0264, code lost:
    
        r1 = r14;
        r14 = r14 + 1;
        r0 = r20[r1];
     */
    /* JADX WARN: Code restructure failed: missing block: B:111:0x0270, code lost:
    
        if (r0 != 13) goto L239;
     */
    /* JADX WARN: Code restructure failed: missing block: B:114:0x0279, code lost:
    
        if (r0 != 10) goto L116;
     */
    /* JADX WARN: Code restructure failed: missing block: B:117:0x0282, code lost:
    
        if (r0 == 32) goto L241;
     */
    /* JADX WARN: Code restructure failed: missing block: B:119:0x0288, code lost:
    
        if (r0 != 9) goto L121;
     */
    /* JADX WARN: Code restructure failed: missing block: B:121:0x028e, code lost:
    
        r0.append((char) r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:122:0x0298, code lost:
    
        r0 = r0.toString();
     */
    /* JADX WARN: Code restructure failed: missing block: B:123:0x02a3, code lost:
    
        if (r0.length() != 0) goto L195;
     */
    /* JADX WARN: Code restructure failed: missing block: B:124:0x02a6, code lost:
    
        addInvalidLine(com.jcraft.jsch.Util.byte2str(r20, 0, r21));
     */
    /* JADX WARN: Code restructure failed: missing block: B:126:0x02b9, code lost:
    
        if (r14 >= r21) goto L248;
     */
    /* JADX WARN: Code restructure failed: missing block: B:127:0x02bc, code lost:
    
        r0 = r20[r14];
     */
    /* JADX WARN: Code restructure failed: missing block: B:128:0x02c5, code lost:
    
        if (r0 == 32) goto L249;
     */
    /* JADX WARN: Code restructure failed: missing block: B:130:0x02cb, code lost:
    
        if (r0 != 9) goto L247;
     */
    /* JADX WARN: Code restructure failed: missing block: B:131:0x02ce, code lost:
    
        r14 = r14 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:132:0x02d4, code lost:
    
        r23 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:133:0x02db, code lost:
    
        if (r14 >= r21) goto L145;
     */
    /* JADX WARN: Code restructure failed: missing block: B:134:0x02de, code lost:
    
        r0.setLength(0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:136:0x02e7, code lost:
    
        if (r14 >= r21) goto L251;
     */
    /* JADX WARN: Code restructure failed: missing block: B:137:0x02ea, code lost:
    
        r1 = r14;
        r14 = r14 + 1;
        r0 = r20[r1];
     */
    /* JADX WARN: Code restructure failed: missing block: B:138:0x02f6, code lost:
    
        if (r0 != 13) goto L252;
     */
    /* JADX WARN: Code restructure failed: missing block: B:141:0x02ff, code lost:
    
        if (r0 != 10) goto L143;
     */
    /* JADX WARN: Code restructure failed: missing block: B:143:0x0305, code lost:
    
        r0.append((char) r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:144:0x030f, code lost:
    
        r23 = r0.toString();
     */
    /* JADX WARN: Code restructure failed: missing block: B:145:0x0315, code lost:
    
        r10.pool.addElement(new com.jcraft.jsch.KnownHosts.HashedHostKey(r10, r22, r17, r19, com.jcraft.jsch.Util.fromBase64(com.jcraft.jsch.Util.str2byte(r0), 0, r0.length()), r23));
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x00c3, code lost:
    
        if (r14 < r21) goto L185;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x00c6, code lost:
    
        addInvalidLine(com.jcraft.jsch.Util.byte2str(r20, 0, r21));
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x00d5, code lost:
    
        r0.setLength(0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x00de, code lost:
    
        if (r14 >= r21) goto L217;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00e1, code lost:
    
        r1 = r14;
        r14 = r14 + 1;
        r0 = r20[r1];
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00ed, code lost:
    
        if (r0 == 32) goto L218;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00f3, code lost:
    
        if (r0 != 9) goto L45;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00f9, code lost:
    
        r0.append((char) r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x0103, code lost:
    
        r17 = r0.toString();
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x010d, code lost:
    
        if (r14 >= r21) goto L187;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0115, code lost:
    
        if (r17.length() != 0) goto L197;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x0118, code lost:
    
        addInvalidLine(com.jcraft.jsch.Util.byte2str(r20, 0, r21));
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x012b, code lost:
    
        if (r14 >= r21) goto L220;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x012e, code lost:
    
        r0 = r20[r14];
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x0137, code lost:
    
        if (r0 == 32) goto L222;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x013d, code lost:
    
        if (r0 != 9) goto L221;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x0140, code lost:
    
        r14 = r14 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x0146, code lost:
    
        r22 = "";
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x0152, code lost:
    
        if (r17.charAt(0) != '@') goto L189;
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x0155, code lost:
    
        r22 = r17;
        r0.setLength(0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x0162, code lost:
    
        if (r14 >= r21) goto L226;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x0165, code lost:
    
        r1 = r14;
        r14 = r14 + 1;
        r0 = r20[r1];
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x0171, code lost:
    
        if (r0 == 32) goto L224;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x0177, code lost:
    
        if (r0 != 9) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x017d, code lost:
    
        r0.append((char) r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x0187, code lost:
    
        r17 = r0.toString();
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x0191, code lost:
    
        if (r14 >= r21) goto L191;
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x0199, code lost:
    
        if (r17.length() != 0) goto L190;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x019c, code lost:
    
        addInvalidLine(com.jcraft.jsch.Util.byte2str(r20, 0, r21));
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x01af, code lost:
    
        if (r14 >= r21) goto L227;
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x01b2, code lost:
    
        r0 = r20[r14];
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x01bb, code lost:
    
        if (r0 == 32) goto L229;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x01c1, code lost:
    
        if (r0 != 9) goto L228;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x01c4, code lost:
    
        r14 = r14 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x01ca, code lost:
    
        r0.setLength(0);
        r19 = -1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x01d6, code lost:
    
        if (r14 >= r21) goto L231;
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x01d9, code lost:
    
        r1 = r14;
        r14 = r14 + 1;
        r0 = r20[r1];
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x01e5, code lost:
    
        if (r0 == 32) goto L232;
     */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x01eb, code lost:
    
        if (r0 != 9) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:89:0x01f1, code lost:
    
        r0.append((char) r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0034, code lost:
    
        if (r21 != 0) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x0204, code lost:
    
        if (r0.toString().equals("ssh-dss") == false) goto L93;
     */
    /* JADX WARN: Code restructure failed: missing block: B:92:0x0207, code lost:
    
        r19 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:94:0x0216, code lost:
    
        if (r0.toString().equals("ssh-rsa") == false) goto L96;
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x0219, code lost:
    
        r19 = 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:96:0x021f, code lost:
    
        r14 = r21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:98:0x0227, code lost:
    
        if (r14 < r21) goto L193;
     */
    /* JADX WARN: Code restructure failed: missing block: B:99:0x022a, code lost:
    
        addInvalidLine(com.jcraft.jsch.Util.byte2str(r20, 0, r21));
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    void setKnownHosts(java.io.InputStream r11) throws com.jcraft.jsch.JSchException {
        /*
            Method dump skipped, instructions count: 957
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.jcraft.jsch.KnownHosts.setKnownHosts(java.io.InputStream):void");
    }

    private void addInvalidLine(String line) throws JSchException {
        HostKey hk = new HostKey(line, 3, null);
        this.pool.addElement(hk);
    }

    String getKnownHostsFile() {
        return this.known_hosts;
    }

    @Override // com.jcraft.jsch.HostKeyRepository
    public String getKnownHostsRepositoryID() {
        return this.known_hosts;
    }

    @Override // com.jcraft.jsch.HostKeyRepository
    public int check(String host, byte[] key) {
        int result = 1;
        if (host == null) {
            return 1;
        }
        int type = getType(key);
        synchronized (this.pool) {
            for (int i = 0; i < this.pool.size(); i++) {
                HostKey hk = (HostKey) this.pool.elementAt(i);
                if (hk.isMatched(host) && hk.type == type) {
                    if (Util.array_equals(hk.key, key)) {
                        return 0;
                    }
                    result = 2;
                }
            }
            if (result == 1 && host.startsWith("[") && host.indexOf("]:") > 1) {
                return check(host.substring(1, host.indexOf("]:")), key);
            }
            return result;
        }
    }

    @Override // com.jcraft.jsch.HostKeyRepository
    public void add(HostKey hostkey, UserInfo userinfo) {
        int type = hostkey.type;
        String host = hostkey.getHost();
        byte[] bArr = hostkey.key;
        synchronized (this.pool) {
            for (int i = 0; i < this.pool.size(); i++) {
                HostKey hk = (HostKey) this.pool.elementAt(i);
                if (!hk.isMatched(host) || hk.type == type) {
                }
            }
        }
        this.pool.addElement(hostkey);
        String bar = getKnownHostsRepositoryID();
        if (bar != null) {
            boolean foo = true;
            File goo = new File(Util.checkTilde(bar));
            if (!goo.exists()) {
                foo = false;
                if (userinfo != null) {
                    foo = userinfo.promptYesNo(bar + " does not exist.\nAre you sure you want to create it?");
                    File goo2 = goo.getParentFile();
                    if (foo && goo2 != null && !goo2.exists()) {
                        foo = userinfo.promptYesNo("The parent directory " + goo2 + " does not exist.\nAre you sure you want to create it?");
                        if (foo) {
                            if (!goo2.mkdirs()) {
                                userinfo.showMessage(goo2 + " has not been created.");
                                foo = false;
                            } else {
                                userinfo.showMessage(goo2 + " has been succesfully created.\nPlease check its access permission.");
                            }
                        }
                    }
                    if (goo2 == null) {
                        foo = false;
                    }
                }
            }
            if (foo) {
                try {
                    sync(bar);
                } catch (Exception e) {
                    System.err.println("sync known_hosts: " + e);
                }
            }
        }
    }

    @Override // com.jcraft.jsch.HostKeyRepository
    public HostKey[] getHostKey() {
        return getHostKey(null, (String) null);
    }

    @Override // com.jcraft.jsch.HostKeyRepository
    public HostKey[] getHostKey(String host, String type) {
        HostKey[] hostKeyArr;
        synchronized (this.pool) {
            ArrayList v = new ArrayList();
            for (int i = 0; i < this.pool.size(); i++) {
                HostKey hk = (HostKey) this.pool.elementAt(i);
                if (hk.type != 3 && (host == null || (hk.isMatched(host) && (type == null || hk.getType().equals(type))))) {
                    v.add(hk);
                }
            }
            HostKey[] foo = new HostKey[v.size()];
            for (int i2 = 0; i2 < v.size(); i2++) {
                foo[i2] = (HostKey) v.get(i2);
            }
            if (host != null && host.startsWith("[") && host.indexOf("]:") > 1) {
                HostKey[] tmp = getHostKey(host.substring(1, host.indexOf("]:")), type);
                if (tmp.length > 0) {
                    HostKey[] bar = new HostKey[foo.length + tmp.length];
                    System.arraycopy(foo, 0, bar, 0, foo.length);
                    System.arraycopy(tmp, 0, bar, foo.length, tmp.length);
                    foo = bar;
                }
            }
            hostKeyArr = foo;
        }
        return hostKeyArr;
    }

    @Override // com.jcraft.jsch.HostKeyRepository
    public void remove(String host, String type) {
        remove(host, type, null);
    }

    @Override // com.jcraft.jsch.HostKeyRepository
    public void remove(String host, String type, byte[] key) {
        boolean sync = false;
        synchronized (this.pool) {
            for (int i = 0; i < this.pool.size(); i++) {
                HostKey hk = (HostKey) this.pool.elementAt(i);
                if (host == null || (hk.isMatched(host) && (type == null || (hk.getType().equals(type) && (key == null || Util.array_equals(key, hk.key)))))) {
                    String hosts = hk.getHost();
                    if (hosts.equals(host) || ((hk instanceof HashedHostKey) && ((HashedHostKey) hk).isHashed())) {
                        this.pool.removeElement(hk);
                    } else {
                        hk.host = deleteSubString(hosts, host);
                    }
                    sync = true;
                }
            }
        }
        if (sync) {
            try {
                sync();
            } catch (Exception e) {
            }
        }
    }

    protected void sync() throws IOException {
        if (this.known_hosts != null) {
            sync(this.known_hosts);
        }
    }

    protected synchronized void sync(String foo) throws IOException {
        if (foo == null) {
            return;
        }
        FileOutputStream fos = new FileOutputStream(Util.checkTilde(foo));
        dump(fos);
        fos.close();
    }

    void dump(OutputStream out) throws IOException {
        try {
            synchronized (this.pool) {
                for (int i = 0; i < this.pool.size(); i++) {
                    HostKey hk = (HostKey) this.pool.elementAt(i);
                    String marker = hk.getMarker();
                    String host = hk.getHost();
                    String type = hk.getType();
                    String comment = hk.getComment();
                    if (type.equals("UNKNOWN")) {
                        out.write(Util.str2byte(host));
                        out.write(cr);
                    } else {
                        if (marker.length() != 0) {
                            out.write(Util.str2byte(marker));
                            out.write(space);
                        }
                        out.write(Util.str2byte(host));
                        out.write(space);
                        out.write(Util.str2byte(type));
                        out.write(space);
                        out.write(Util.str2byte(hk.getKey()));
                        if (comment != null) {
                            out.write(space);
                            out.write(Util.str2byte(comment));
                        }
                        out.write(cr);
                    }
                }
            }
        } catch (Exception e) {
            System.err.println(e);
        }
    }

    private int getType(byte[] key) {
        if (key[8] == 100) {
            return 1;
        }
        return key[8] == 114 ? 2 : 3;
    }

    private String deleteSubString(String hosts, String host) {
        int j;
        int i = 0;
        int hostlen = host.length();
        int hostslen = hosts.length();
        while (i < hostslen && (j = hosts.indexOf(44, i)) != -1) {
            if (!host.equals(hosts.substring(i, j))) {
                i = j + 1;
            } else {
                return hosts.substring(0, i) + hosts.substring(j + 1);
            }
        }
        if (hosts.endsWith(host) && hostslen - i == hostlen) {
            return hosts.substring(0, hostlen == hostslen ? 0 : (hostslen - hostlen) - 1);
        }
        return hosts;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized MAC getHMACSHA1() {
        if (this.hmacsha1 == null) {
            try {
                JSch jSch = this.jsch;
                Class c = Class.forName(JSch.getConfig("hmac-sha1"));
                this.hmacsha1 = (MAC) c.newInstance();
            } catch (Exception e) {
                System.err.println("hmacsha1: " + e);
            }
        }
        return this.hmacsha1;
    }

    HostKey createHashedHostKey(String host, byte[] key) throws JSchException {
        HashedHostKey hhk = new HashedHostKey(this, host, key);
        hhk.hash();
        return hhk;
    }

    /* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/KnownHosts$HashedHostKey.class */
    class HashedHostKey extends HostKey {
        private static final String HASH_MAGIC = "|1|";
        private static final String HASH_DELIM = "|";
        private boolean hashed;
        byte[] salt;
        byte[] hash;

        HashedHostKey(KnownHosts knownHosts, String host, byte[] key) throws JSchException {
            this(knownHosts, host, 0, key);
        }

        HashedHostKey(KnownHosts knownHosts, String host, int type, byte[] key) throws JSchException {
            this("", host, type, key, null);
        }

        HashedHostKey(String marker, String host, int type, byte[] key, String comment) throws JSchException {
            super(marker, host, type, key, comment);
            this.hashed = false;
            this.salt = null;
            this.hash = null;
            if (this.host.startsWith(HASH_MAGIC) && this.host.substring(HASH_MAGIC.length()).indexOf(HASH_DELIM) > 0) {
                String data = this.host.substring(HASH_MAGIC.length());
                String _salt = data.substring(0, data.indexOf(HASH_DELIM));
                String _hash = data.substring(data.indexOf(HASH_DELIM) + 1);
                this.salt = Util.fromBase64(Util.str2byte(_salt), 0, _salt.length());
                this.hash = Util.fromBase64(Util.str2byte(_hash), 0, _hash.length());
                if (this.salt.length != 20 || this.hash.length != 20) {
                    this.salt = null;
                    this.hash = null;
                } else {
                    this.hashed = true;
                }
            }
        }

        @Override // com.jcraft.jsch.HostKey
        boolean isMatched(String _host) {
            boolean array_equals;
            if (this.hashed) {
                MAC macsha1 = KnownHosts.this.getHMACSHA1();
                try {
                    synchronized (macsha1) {
                        macsha1.init(this.salt);
                        byte[] foo = Util.str2byte(_host);
                        macsha1.update(foo, 0, foo.length);
                        byte[] bar = new byte[macsha1.getBlockSize()];
                        macsha1.doFinal(bar, 0);
                        array_equals = Util.array_equals(this.hash, bar);
                    }
                    return array_equals;
                } catch (Exception e) {
                    System.out.println(e);
                    return false;
                }
            }
            return super.isMatched(_host);
        }

        boolean isHashed() {
            return this.hashed;
        }

        void hash() {
            if (!this.hashed) {
                MAC macsha1 = KnownHosts.this.getHMACSHA1();
                if (this.salt == null) {
                    Random random = Session.random;
                    synchronized (random) {
                        this.salt = new byte[macsha1.getBlockSize()];
                        random.fill(this.salt, 0, this.salt.length);
                    }
                }
                try {
                    synchronized (macsha1) {
                        macsha1.init(this.salt);
                        byte[] foo = Util.str2byte(this.host);
                        macsha1.update(foo, 0, foo.length);
                        this.hash = new byte[macsha1.getBlockSize()];
                        macsha1.doFinal(this.hash, 0);
                    }
                } catch (Exception e) {
                }
                this.host = HASH_MAGIC + Util.byte2str(Util.toBase64(this.salt, 0, this.salt.length)) + HASH_DELIM + Util.byte2str(Util.toBase64(this.hash, 0, this.hash.length));
                this.hashed = true;
            }
        }
    }
}
