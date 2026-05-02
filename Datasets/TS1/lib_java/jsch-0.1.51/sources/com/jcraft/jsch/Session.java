package com.jcraft.jsch;

import com.jcraft.jsch.ConfigRepository;
import com.jcraft.jsch.IdentityRepository;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;
import java.util.Vector;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/Session.class */
public class Session implements Runnable {
    static final int SSH_MSG_DISCONNECT = 1;
    static final int SSH_MSG_IGNORE = 2;
    static final int SSH_MSG_UNIMPLEMENTED = 3;
    static final int SSH_MSG_DEBUG = 4;
    static final int SSH_MSG_SERVICE_REQUEST = 5;
    static final int SSH_MSG_SERVICE_ACCEPT = 6;
    static final int SSH_MSG_KEXINIT = 20;
    static final int SSH_MSG_NEWKEYS = 21;
    static final int SSH_MSG_KEXDH_INIT = 30;
    static final int SSH_MSG_KEXDH_REPLY = 31;
    static final int SSH_MSG_KEX_DH_GEX_GROUP = 31;
    static final int SSH_MSG_KEX_DH_GEX_INIT = 32;
    static final int SSH_MSG_KEX_DH_GEX_REPLY = 33;
    static final int SSH_MSG_KEX_DH_GEX_REQUEST = 34;
    static final int SSH_MSG_GLOBAL_REQUEST = 80;
    static final int SSH_MSG_REQUEST_SUCCESS = 81;
    static final int SSH_MSG_REQUEST_FAILURE = 82;
    static final int SSH_MSG_CHANNEL_OPEN = 90;
    static final int SSH_MSG_CHANNEL_OPEN_CONFIRMATION = 91;
    static final int SSH_MSG_CHANNEL_OPEN_FAILURE = 92;
    static final int SSH_MSG_CHANNEL_WINDOW_ADJUST = 93;
    static final int SSH_MSG_CHANNEL_DATA = 94;
    static final int SSH_MSG_CHANNEL_EXTENDED_DATA = 95;
    static final int SSH_MSG_CHANNEL_EOF = 96;
    static final int SSH_MSG_CHANNEL_CLOSE = 97;
    static final int SSH_MSG_CHANNEL_REQUEST = 98;
    static final int SSH_MSG_CHANNEL_SUCCESS = 99;
    static final int SSH_MSG_CHANNEL_FAILURE = 100;
    private static final int PACKET_MAX_SIZE = 262144;
    private byte[] V_S;
    private byte[] I_C;
    private byte[] I_S;
    private byte[] K_S;
    private byte[] session_id;
    private byte[] IVc2s;
    private byte[] IVs2c;
    private byte[] Ec2s;
    private byte[] Es2c;
    private byte[] MACc2s;
    private byte[] MACs2c;
    private Cipher s2ccipher;
    private Cipher c2scipher;
    private MAC s2cmac;
    private MAC c2smac;
    private byte[] s2cmac_result1;
    private byte[] s2cmac_result2;
    private Compression deflater;
    private Compression inflater;
    private IO io;
    private Socket socket;
    static Random random;
    static final int buffer_margin = 84;
    private UserInfo userinfo;
    String host;
    String org_host;
    int port;
    String username;
    JSch jsch;
    Runnable thread;
    private static final byte[] keepalivemsg = Util.str2byte("keepalive@jcraft.com");
    private static final byte[] nomoresessions = Util.str2byte("no-more-sessions@openssh.com");
    private byte[] V_C = Util.str2byte("SSH-2.0-JSCH-0.1.51");
    private int seqi = 0;
    private int seqo = 0;
    String[] guess = null;
    private int timeout = 0;
    private volatile boolean isConnected = false;
    private boolean isAuthed = false;
    private Thread connectThread = null;
    private Object lock = new Object();
    boolean x11_forwarding = false;
    boolean agent_forwarding = false;
    InputStream in = null;
    OutputStream out = null;
    SocketFactory socket_factory = null;
    private Hashtable config = null;
    private Proxy proxy = null;
    private String hostKeyAlias = null;
    private int serverAliveInterval = 0;
    private int serverAliveCountMax = 1;
    private IdentityRepository identityRepository = null;
    private HostKeyRepository hostkeyRepository = null;
    protected boolean daemon_thread = false;
    private long kex_start_time = 0;
    int max_auth_tries = 6;
    int auth_failures = 0;
    byte[] password = null;
    private boolean in_kex = false;
    int[] uncompress_len = new int[1];
    int[] compress_len = new int[1];
    private int s2ccipher_size = 8;
    private int c2scipher_size = 8;
    private GlobalRequestReply grr = new GlobalRequestReply();
    private HostKey hostkey = null;
    Buffer buf = new Buffer();
    Packet packet = new Packet(this.buf);

    Session(JSch jsch, String username, String host, int port) throws JSchException {
        this.host = "127.0.0.1";
        this.org_host = "127.0.0.1";
        this.port = 22;
        this.username = null;
        this.jsch = jsch;
        this.username = username;
        this.host = host;
        this.org_host = host;
        this.port = port;
        applyConfig();
        if (this.username == null) {
            try {
                this.username = (String) System.getProperties().get("user.name");
            } catch (SecurityException e) {
            }
        }
        if (this.username == null) {
            throw new JSchException("username is not given.");
        }
    }

    public void connect() throws JSchException {
        connect(this.timeout);
    }

    /* JADX WARN: Code restructure failed: missing block: B:100:0x03dc, code lost:
    
        throw new com.jcraft.jsch.JSchException("verify: " + r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:102:0x03e0, code lost:
    
        r6.in_kex = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:103:0x0405, code lost:
    
        throw new com.jcraft.jsch.JSchException("invalid protocol(kex): " + ((int) r6.buf.getCommand()));
     */
    /* JADX WARN: Code restructure failed: missing block: B:105:0x040b, code lost:
    
        if (r0.getState() != 0) goto L304;
     */
    /* JADX WARN: Code restructure failed: missing block: B:107:0x0411, code lost:
    
        checkHost(r6.host, r6.port, r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:108:0x0422, code lost:
    
        r11 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:109:0x0424, code lost:
    
        r6.in_kex = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:110:0x042b, code lost:
    
        throw r11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:111:0x042c, code lost:
    
        send_newkeys();
        r6.buf = read(r6.buf);
     */
    /* JADX WARN: Code restructure failed: missing block: B:112:0x0445, code lost:
    
        if (r6.buf.getCommand() != com.jcraft.jsch.Session.SSH_MSG_NEWKEYS) goto L117;
     */
    /* JADX WARN: Code restructure failed: missing block: B:114:0x0451, code lost:
    
        if (com.jcraft.jsch.JSch.getLogger().isEnabled(1) == false) goto L116;
     */
    /* JADX WARN: Code restructure failed: missing block: B:115:0x0454, code lost:
    
        com.jcraft.jsch.JSch.getLogger().log(1, "SSH_MSG_NEWKEYS received");
     */
    /* JADX WARN: Code restructure failed: missing block: B:116:0x045f, code lost:
    
        receive_newkeys(r6.buf, r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:117:0x046c, code lost:
    
        r6.in_kex = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:118:0x0491, code lost:
    
        throw new com.jcraft.jsch.JSchException("invalid protocol(newkyes): " + ((int) r6.buf.getCommand()));
     */
    /* JADX WARN: Code restructure failed: missing block: B:119:0x0492, code lost:
    
        r0 = getConfig("MaxAuthTries");
     */
    /* JADX WARN: Code restructure failed: missing block: B:120:0x049c, code lost:
    
        if (r0 == null) goto L122;
     */
    /* JADX WARN: Code restructure failed: missing block: B:121:0x049f, code lost:
    
        r6.max_auth_tries = java.lang.Integer.parseInt(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:123:0x04ab, code lost:
    
        r11 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:125:0x04ce, code lost:
    
        throw new com.jcraft.jsch.JSchException("MaxAuthTries: " + getConfig("MaxAuthTries"), r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:126:0x04cf, code lost:
    
        r12 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:127:0x04d8, code lost:
    
        r0 = java.lang.Class.forName(getConfig("userauth.none"));
        r0 = (com.jcraft.jsch.UserAuth) r0.newInstance();
     */
    /* JADX WARN: Code restructure failed: missing block: B:128:0x04f3, code lost:
    
        r14 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:130:0x0503, code lost:
    
        throw new com.jcraft.jsch.JSchException(r14.toString(), r14);
     */
    /* JADX WARN: Code restructure failed: missing block: B:131:0x0504, code lost:
    
        r11 = r0.start(r6);
        r0 = getConfig("PreferredAuthentications");
        r0 = com.jcraft.jsch.Util.split(r0, ",");
        r16 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:132:0x0522, code lost:
    
        if (r11 != false) goto L137;
     */
    /* JADX WARN: Code restructure failed: missing block: B:133:0x0525, code lost:
    
        r0 = ((com.jcraft.jsch.UserAuthNone) r0).getMethods();
     */
    /* JADX WARN: Code restructure failed: missing block: B:134:0x0531, code lost:
    
        if (r0 == null) goto L136;
     */
    /* JADX WARN: Code restructure failed: missing block: B:135:0x0534, code lost:
    
        r16 = r0.toLowerCase();
     */
    /* JADX WARN: Code restructure failed: missing block: B:136:0x053e, code lost:
    
        r16 = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:137:0x0542, code lost:
    
        r17 = com.jcraft.jsch.Util.split(r16, ",");
        r18 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x028f, code lost:
    
        if (r8 == r6.buf.buffer.length) goto L82;
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x0295, code lost:
    
        if (r8 < 7) goto L82;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x02a3, code lost:
    
        if (r6.buf.buffer[4] != 49) goto L84;
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x02b2, code lost:
    
        if (r6.buf.buffer[6] == 57) goto L84;
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x02be, code lost:
    
        throw new com.jcraft.jsch.JSchException("invalid server's version string");
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x02bf, code lost:
    
        r6.V_S = new byte[r8];
        java.lang.System.arraycopy(r6.buf.buffer, 0, r6.V_S, 0, r8);
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x02e0, code lost:
    
        if (com.jcraft.jsch.JSch.getLogger().isEnabled(1) == false) goto L87;
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x02e3, code lost:
    
        com.jcraft.jsch.JSch.getLogger().log(1, "Remote version string: " + com.jcraft.jsch.Util.byte2str(r6.V_S));
        com.jcraft.jsch.JSch.getLogger().log(1, "Local version string: " + com.jcraft.jsch.Util.byte2str(r6.V_C));
     */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x0327, code lost:
    
        send_kexinit();
        r6.buf = read(r6.buf);
     */
    /* JADX WARN: Code restructure failed: missing block: B:88:0x0340, code lost:
    
        if (r6.buf.getCommand() == com.jcraft.jsch.Session.SSH_MSG_KEXINIT) goto L91;
     */
    /* JADX WARN: Code restructure failed: missing block: B:89:0x0343, code lost:
    
        r6.in_kex = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:0x0368, code lost:
    
        throw new com.jcraft.jsch.JSchException("invalid protocol: " + ((int) r6.buf.getCommand()));
     */
    /* JADX WARN: Code restructure failed: missing block: B:92:0x0372, code lost:
    
        if (com.jcraft.jsch.JSch.getLogger().isEnabled(1) == false) goto L94;
     */
    /* JADX WARN: Code restructure failed: missing block: B:93:0x0375, code lost:
    
        com.jcraft.jsch.JSch.getLogger().log(1, "SSH_MSG_KEXINIT received");
     */
    /* JADX WARN: Code restructure failed: missing block: B:94:0x0380, code lost:
    
        r0 = receive_kexinit(r6.buf);
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x038a, code lost:
    
        r6.buf = read(r6.buf);
     */
    /* JADX WARN: Code restructure failed: missing block: B:96:0x03a2, code lost:
    
        if (r0.getState() != r6.buf.getCommand()) goto L301;
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x03a5, code lost:
    
        r6.kex_start_time = java.lang.System.currentTimeMillis();
        r0 = r0.next(r6.buf);
     */
    /* JADX WARN: Code restructure failed: missing block: B:98:0x03b9, code lost:
    
        if (r0 != false) goto L101;
     */
    /* JADX WARN: Code restructure failed: missing block: B:99:0x03bc, code lost:
    
        r6.in_kex = false;
     */
    /* JADX WARN: Removed duplicated region for block: B:203:0x0756 A[Catch: Exception -> 0x083e, all -> 0x08dd, TryCatch #7 {Exception -> 0x083e, blocks: (B:15:0x0087, B:17:0x008e, B:19:0x0095, B:21:0x00ed, B:34:0x0167, B:36:0x016e, B:37:0x0176, B:39:0x0187, B:40:0x0192, B:42:0x01d0, B:44:0x01dc, B:47:0x01eb, B:52:0x0206, B:53:0x020f, B:54:0x0210, B:56:0x0220, B:58:0x0227, B:60:0x0237, B:63:0x023f, B:65:0x024b, B:67:0x0259, B:69:0x0267, B:71:0x0275, B:74:0x0286, B:78:0x0298, B:80:0x02a6, B:84:0x02bf, B:86:0x02e3, B:87:0x0327, B:89:0x0343, B:90:0x0368, B:91:0x0369, B:93:0x0375, B:94:0x0380, B:95:0x038a, B:97:0x03a5, B:99:0x03bc, B:100:0x03dc, B:104:0x0406, B:107:0x0411, B:111:0x042c, B:113:0x0448, B:115:0x0454, B:116:0x045f, B:119:0x0492, B:121:0x049f, B:127:0x04d8, B:131:0x0504, B:133:0x0525, B:135:0x0534, B:137:0x0542, B:142:0x0558, B:144:0x0560, B:145:0x0570, B:147:0x0578, B:150:0x058b, B:154:0x0599, B:156:0x05a5, B:157:0x05af, B:159:0x05b7, B:161:0x05da, B:162:0x05f0, B:163:0x05f6, B:165:0x0621, B:167:0x063f, B:176:0x06a4, B:178:0x06b1, B:180:0x06bd, B:185:0x06ec, B:191:0x0717, B:194:0x071c, B:196:0x071f, B:198:0x072b, B:170:0x066e, B:172:0x067a, B:203:0x0756, B:205:0x0761, B:207:0x076d, B:210:0x0791, B:211:0x079a, B:212:0x079b, B:213:0x07a4, B:214:0x07a5, B:218:0x07b0, B:220:0x07b7, B:221:0x07c2, B:222:0x07ce, B:223:0x07cf, B:225:0x07d6, B:227:0x080b, B:228:0x0816, B:230:0x0823, B:234:0x082b, B:236:0x082e, B:129:0x04f5, B:130:0x0503, B:124:0x04ad, B:125:0x04ce, B:117:0x046c, B:118:0x0491, B:109:0x0424, B:110:0x042b, B:102:0x03e0, B:103:0x0405, B:82:0x02b5, B:83:0x02be, B:20:0x00ba, B:22:0x010a, B:23:0x0111, B:24:0x0112, B:25:0x0157, B:29:0x015f, B:31:0x0162), top: B:271:0x0087, outer: #14 }] */
    /* JADX WARN: Removed duplicated region for block: B:214:0x07a5 A[Catch: Exception -> 0x083e, all -> 0x08dd, TryCatch #7 {Exception -> 0x083e, blocks: (B:15:0x0087, B:17:0x008e, B:19:0x0095, B:21:0x00ed, B:34:0x0167, B:36:0x016e, B:37:0x0176, B:39:0x0187, B:40:0x0192, B:42:0x01d0, B:44:0x01dc, B:47:0x01eb, B:52:0x0206, B:53:0x020f, B:54:0x0210, B:56:0x0220, B:58:0x0227, B:60:0x0237, B:63:0x023f, B:65:0x024b, B:67:0x0259, B:69:0x0267, B:71:0x0275, B:74:0x0286, B:78:0x0298, B:80:0x02a6, B:84:0x02bf, B:86:0x02e3, B:87:0x0327, B:89:0x0343, B:90:0x0368, B:91:0x0369, B:93:0x0375, B:94:0x0380, B:95:0x038a, B:97:0x03a5, B:99:0x03bc, B:100:0x03dc, B:104:0x0406, B:107:0x0411, B:111:0x042c, B:113:0x0448, B:115:0x0454, B:116:0x045f, B:119:0x0492, B:121:0x049f, B:127:0x04d8, B:131:0x0504, B:133:0x0525, B:135:0x0534, B:137:0x0542, B:142:0x0558, B:144:0x0560, B:145:0x0570, B:147:0x0578, B:150:0x058b, B:154:0x0599, B:156:0x05a5, B:157:0x05af, B:159:0x05b7, B:161:0x05da, B:162:0x05f0, B:163:0x05f6, B:165:0x0621, B:167:0x063f, B:176:0x06a4, B:178:0x06b1, B:180:0x06bd, B:185:0x06ec, B:191:0x0717, B:194:0x071c, B:196:0x071f, B:198:0x072b, B:170:0x066e, B:172:0x067a, B:203:0x0756, B:205:0x0761, B:207:0x076d, B:210:0x0791, B:211:0x079a, B:212:0x079b, B:213:0x07a4, B:214:0x07a5, B:218:0x07b0, B:220:0x07b7, B:221:0x07c2, B:222:0x07ce, B:223:0x07cf, B:225:0x07d6, B:227:0x080b, B:228:0x0816, B:230:0x0823, B:234:0x082b, B:236:0x082e, B:129:0x04f5, B:130:0x0503, B:124:0x04ad, B:125:0x04ce, B:117:0x046c, B:118:0x0491, B:109:0x0424, B:110:0x042b, B:102:0x03e0, B:103:0x0405, B:82:0x02b5, B:83:0x02be, B:20:0x00ba, B:22:0x010a, B:23:0x0111, B:24:0x0112, B:25:0x0157, B:29:0x015f, B:31:0x0162), top: B:271:0x0087, outer: #14 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void connect(int r7) throws com.jcraft.jsch.JSchException {
        /*
            Method dump skipped, instructions count: 2287
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.jcraft.jsch.Session.connect(int):void");
    }

    private KeyExchange receive_kexinit(Buffer buf) throws Exception {
        int j = buf.getInt();
        if (j != buf.getLength()) {
            buf.getByte();
            this.I_S = new byte[buf.index - 5];
        } else {
            this.I_S = new byte[(j - 1) - buf.getByte()];
        }
        System.arraycopy(buf.buffer, buf.s, this.I_S, 0, this.I_S.length);
        if (!this.in_kex) {
            send_kexinit();
        }
        this.guess = KeyExchange.guess(this.I_S, this.I_C);
        if (this.guess == null) {
            throw new JSchException("Algorithm negotiation fail");
        }
        if (!this.isAuthed && (this.guess[2].equals("none") || this.guess[3].equals("none"))) {
            throw new JSchException("NONE Cipher should not be chosen before authentification is successed.");
        }
        try {
            Class c = Class.forName(getConfig(this.guess[0]));
            KeyExchange kex = (KeyExchange) c.newInstance();
            kex.init(this, this.V_S, this.V_C, this.I_S, this.I_C);
            return kex;
        } catch (Exception e) {
            throw new JSchException(e.toString(), e);
        }
    }

    public void rekey() throws Exception {
        send_kexinit();
    }

    private void send_kexinit() throws Exception {
        if (this.in_kex) {
            return;
        }
        String cipherc2s = getConfig("cipher.c2s");
        String ciphers2c = getConfig("cipher.s2c");
        String[] not_available_ciphers = checkCiphers(getConfig("CheckCiphers"));
        if (not_available_ciphers != null && not_available_ciphers.length > 0) {
            cipherc2s = Util.diffString(cipherc2s, not_available_ciphers);
            ciphers2c = Util.diffString(ciphers2c, not_available_ciphers);
            if (cipherc2s == null || ciphers2c == null) {
                throw new JSchException("There are not any available ciphers.");
            }
        }
        String kex = getConfig("kex");
        String[] not_available_kexes = checkKexes(getConfig("CheckKexes"));
        if (not_available_kexes != null && not_available_kexes.length > 0) {
            kex = Util.diffString(kex, not_available_kexes);
            if (kex == null) {
                throw new JSchException("There are not any available kexes.");
            }
        }
        this.in_kex = true;
        this.kex_start_time = System.currentTimeMillis();
        Buffer buf = new Buffer();
        Packet packet = new Packet(buf);
        packet.reset();
        buf.putByte((byte) 20);
        synchronized (random) {
            random.fill(buf.buffer, buf.index, 16);
            buf.skip(16);
        }
        buf.putString(Util.str2byte(kex));
        buf.putString(Util.str2byte(getConfig("server_host_key")));
        buf.putString(Util.str2byte(cipherc2s));
        buf.putString(Util.str2byte(ciphers2c));
        buf.putString(Util.str2byte(getConfig("mac.c2s")));
        buf.putString(Util.str2byte(getConfig("mac.s2c")));
        buf.putString(Util.str2byte(getConfig("compression.c2s")));
        buf.putString(Util.str2byte(getConfig("compression.s2c")));
        buf.putString(Util.str2byte(getConfig("lang.c2s")));
        buf.putString(Util.str2byte(getConfig("lang.s2c")));
        buf.putByte((byte) 0);
        buf.putInt(0);
        buf.setOffSet(5);
        this.I_C = new byte[buf.getLength()];
        buf.getByte(this.I_C);
        write(packet);
        if (JSch.getLogger().isEnabled(1)) {
            JSch.getLogger().log(1, "SSH_MSG_KEXINIT sent");
        }
    }

    private void send_newkeys() throws Exception {
        this.packet.reset();
        this.buf.putByte((byte) 21);
        write(this.packet);
        if (JSch.getLogger().isEnabled(1)) {
            JSch.getLogger().log(1, "SSH_MSG_NEWKEYS sent");
        }
    }

    private void checkHost(String chost, int port, KeyExchange kex) throws JSchException {
        int i;
        String file;
        String shkc = getConfig("StrictHostKeyChecking");
        if (this.hostKeyAlias != null) {
            chost = this.hostKeyAlias;
        }
        byte[] K_S = kex.getHostKey();
        String key_type = kex.getKeyType();
        String key_fprint = kex.getFingerPrint();
        if (this.hostKeyAlias == null && port != 22) {
            chost = "[" + chost + "]:" + port;
        }
        HostKeyRepository hkr = getHostKeyRepository();
        String hkh = getConfig("HashKnownHosts");
        if (hkh.equals("yes") && (hkr instanceof KnownHosts)) {
            this.hostkey = ((KnownHosts) hkr).createHashedHostKey(chost, K_S);
        } else {
            this.hostkey = new HostKey(chost, K_S);
        }
        synchronized (hkr) {
            i = hkr.check(chost, K_S);
        }
        boolean insert = false;
        if ((shkc.equals("ask") || shkc.equals("yes")) && i == 2) {
            synchronized (hkr) {
                file = hkr.getKnownHostsRepositoryID();
            }
            if (file == null) {
                file = "known_hosts";
            }
            boolean b = false;
            if (this.userinfo != null) {
                String message = "WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!\nIT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!\nSomeone could be eavesdropping on you right now (man-in-the-middle attack)!\nIt is also possible that the " + key_type + " host key has just been changed.\nThe fingerprint for the " + key_type + " key sent by the remote host is\n" + key_fprint + ".\nPlease contact your system administrator.\nAdd correct host key in " + file + " to get rid of this message.";
                if (shkc.equals("ask")) {
                    b = this.userinfo.promptYesNo(message + "\nDo you want to delete the old key and insert the new key?");
                } else {
                    this.userinfo.showMessage(message);
                }
            }
            if (!b) {
                throw new JSchException("HostKey has been changed: " + chost);
            }
            synchronized (hkr) {
                hkr.remove(chost, key_type.equals("DSA") ? "ssh-dss" : "ssh-rsa", null);
                insert = true;
            }
        }
        if ((shkc.equals("ask") || shkc.equals("yes")) && i != 0 && !insert) {
            if (shkc.equals("yes")) {
                throw new JSchException("reject HostKey: " + this.host);
            }
            if (this.userinfo != null) {
                boolean foo = this.userinfo.promptYesNo("The authenticity of host '" + this.host + "' can't be established.\n" + key_type + " key fingerprint is " + key_fprint + ".\nAre you sure you want to continue connecting?");
                if (!foo) {
                    throw new JSchException("reject HostKey: " + this.host);
                }
                insert = true;
            } else {
                if (i == 1) {
                    throw new JSchException("UnknownHostKey: " + this.host + ". " + key_type + " key fingerprint is " + key_fprint);
                }
                throw new JSchException("HostKey has been changed: " + this.host);
            }
        }
        if (shkc.equals("no") && 1 == i) {
            insert = true;
        }
        if (i == 0) {
            HostKey[] keys = hkr.getHostKey(chost, key_type.equals("DSA") ? "ssh-dss" : "ssh-rsa");
            String _key = Util.byte2str(Util.toBase64(K_S, 0, K_S.length));
            for (HostKey hostKey : keys) {
                if (keys[i].getKey().equals(_key) && hostKey.getMarker().equals("@revoked")) {
                    if (this.userinfo != null) {
                        this.userinfo.showMessage("The " + key_type + " host key for " + this.host + " is marked as revoked.\nThis could mean that a stolen key is being used to impersonate this host.");
                    }
                    if (JSch.getLogger().isEnabled(1)) {
                        JSch.getLogger().log(1, "Host '" + this.host + "' has provided revoked key.");
                    }
                    throw new JSchException("revoked HostKey: " + this.host);
                }
            }
        }
        if (i == 0 && JSch.getLogger().isEnabled(1)) {
            JSch.getLogger().log(1, "Host '" + this.host + "' is known and mathces the " + key_type + " host key");
        }
        if (insert && JSch.getLogger().isEnabled(2)) {
            JSch.getLogger().log(2, "Permanently added '" + this.host + "' (" + key_type + ") to the list of known hosts.");
        }
        if (insert) {
            synchronized (hkr) {
                hkr.add(this.hostkey, this.userinfo);
            }
        }
    }

    public Channel openChannel(String type) throws JSchException {
        if (!this.isConnected) {
            throw new JSchException("session is down");
        }
        try {
            Channel channel = Channel.getChannel(type);
            addChannel(channel);
            channel.init();
            if (channel instanceof ChannelSession) {
                applyConfigChannel((ChannelSession) channel);
            }
            return channel;
        } catch (Exception e) {
            return null;
        }
    }

    public void encode(Packet packet) throws Exception {
        if (this.deflater != null) {
            this.compress_len[0] = packet.buffer.index;
            packet.buffer.buffer = this.deflater.compress(packet.buffer.buffer, 5, this.compress_len);
            packet.buffer.index = this.compress_len[0];
        }
        if (this.c2scipher != null) {
            packet.padding(this.c2scipher_size);
            byte b = packet.buffer.buffer[4];
            synchronized (random) {
                random.fill(packet.buffer.buffer, packet.buffer.index - b, b);
            }
        } else {
            packet.padding(8);
        }
        if (this.c2smac != null) {
            this.c2smac.update(this.seqo);
            this.c2smac.update(packet.buffer.buffer, 0, packet.buffer.index);
            this.c2smac.doFinal(packet.buffer.buffer, packet.buffer.index);
        }
        if (this.c2scipher != null) {
            byte[] buf = packet.buffer.buffer;
            this.c2scipher.update(buf, 0, packet.buffer.index, buf, 0);
        }
        if (this.c2smac != null) {
            packet.buffer.skip(this.c2smac.getBlockSize());
        }
    }

    public Buffer read(Buffer buf) throws Exception {
        while (true) {
            buf.reset();
            this.io.getByte(buf.buffer, buf.index, this.s2ccipher_size);
            buf.index += this.s2ccipher_size;
            if (this.s2ccipher != null) {
                this.s2ccipher.update(buf.buffer, 0, this.s2ccipher_size, buf.buffer, 0);
            }
            int j = ((buf.buffer[0] << 24) & (-16777216)) | ((buf.buffer[1] << 16) & 16711680) | ((buf.buffer[2] << 8) & 65280) | (buf.buffer[3] & 255);
            if (j < 5 || j > PACKET_MAX_SIZE) {
                start_discard(buf, this.s2ccipher, this.s2cmac, j, PACKET_MAX_SIZE);
            }
            int need = (j + 4) - this.s2ccipher_size;
            if (buf.index + need > buf.buffer.length) {
                byte[] foo = new byte[buf.index + need];
                System.arraycopy(buf.buffer, 0, foo, 0, buf.index);
                buf.buffer = foo;
            }
            if (need % this.s2ccipher_size != 0) {
                String message = "Bad packet length " + need;
                if (JSch.getLogger().isEnabled(4)) {
                    JSch.getLogger().log(4, message);
                }
                start_discard(buf, this.s2ccipher, this.s2cmac, j, PACKET_MAX_SIZE - this.s2ccipher_size);
            }
            if (need > 0) {
                this.io.getByte(buf.buffer, buf.index, need);
                buf.index += need;
                if (this.s2ccipher != null) {
                    this.s2ccipher.update(buf.buffer, this.s2ccipher_size, need, buf.buffer, this.s2ccipher_size);
                }
            }
            if (this.s2cmac != null) {
                this.s2cmac.update(this.seqi);
                this.s2cmac.update(buf.buffer, 0, buf.index);
                this.s2cmac.doFinal(this.s2cmac_result1, 0);
                this.io.getByte(this.s2cmac_result2, 0, this.s2cmac_result2.length);
                if (!Arrays.equals(this.s2cmac_result1, this.s2cmac_result2)) {
                    if (need > PACKET_MAX_SIZE) {
                        throw new IOException("MAC Error");
                    }
                    start_discard(buf, this.s2ccipher, this.s2cmac, j, PACKET_MAX_SIZE - need);
                }
            }
            this.seqi++;
            if (this.inflater != null) {
                this.uncompress_len[0] = (buf.index - 5) - buf.buffer[4];
                byte[] foo2 = this.inflater.uncompress(buf.buffer, 5, this.uncompress_len);
                if (foo2 != null) {
                    buf.buffer = foo2;
                    buf.index = 5 + this.uncompress_len[0];
                } else {
                    System.err.println("fail in inflater");
                    break;
                }
            }
            int type = buf.getCommand() & 255;
            if (type == 1) {
                buf.rewind();
                buf.getInt();
                buf.getShort();
                int reason_code = buf.getInt();
                byte[] description = buf.getString();
                byte[] language_tag = buf.getString();
                throw new JSchException("SSH_MSG_DISCONNECT: " + reason_code + " " + Util.byte2str(description) + " " + Util.byte2str(language_tag));
            }
            if (type == 2) {
                continue;
            } else if (type == 3) {
                buf.rewind();
                buf.getInt();
                buf.getShort();
                int reason_id = buf.getInt();
                if (JSch.getLogger().isEnabled(1)) {
                    JSch.getLogger().log(1, "Received SSH_MSG_UNIMPLEMENTED for " + reason_id);
                }
            } else if (type == 4) {
                buf.rewind();
                buf.getInt();
                buf.getShort();
            } else if (type == SSH_MSG_CHANNEL_WINDOW_ADJUST) {
                buf.rewind();
                buf.getInt();
                buf.getShort();
                Channel c = Channel.getChannel(buf.getInt(), this);
                if (c != null) {
                    c.addRemoteWindowSize(buf.getUInt());
                }
            } else if (type == 52) {
                this.isAuthed = true;
                if (this.inflater == null && this.deflater == null) {
                    String method = this.guess[6];
                    initDeflater(method);
                    String method2 = this.guess[7];
                    initInflater(method2);
                }
            }
        }
        buf.rewind();
        return buf;
    }

    private void start_discard(Buffer buf, Cipher cipher, MAC mac, int packet_length, int discard) throws JSchException, IOException {
        MAC discard_mac = null;
        if (!cipher.isCBC()) {
            throw new JSchException("Packet corrupt");
        }
        if (packet_length != PACKET_MAX_SIZE && mac != null) {
            discard_mac = mac;
        }
        int i = discard;
        int i2 = buf.index;
        while (true) {
            int discard2 = i - i2;
            if (discard2 <= 0) {
                break;
            }
            buf.reset();
            int len = discard2 > buf.buffer.length ? buf.buffer.length : discard2;
            this.io.getByte(buf.buffer, 0, len);
            if (discard_mac != null) {
                discard_mac.update(buf.buffer, 0, len);
            }
            i = discard2;
            i2 = len;
        }
        if (discard_mac != null) {
            discard_mac.doFinal(buf.buffer, 0);
        }
        throw new JSchException("Packet corrupt");
    }

    byte[] getSessionId() {
        return this.session_id;
    }

    private void receive_newkeys(Buffer buf, KeyExchange kex) throws Exception {
        updateKeys(kex);
        this.in_kex = false;
    }

    private void updateKeys(KeyExchange kex) throws Exception {
        byte[] K = kex.getK();
        byte[] H = kex.getH();
        HASH hash = kex.getHash();
        if (this.session_id == null) {
            this.session_id = new byte[H.length];
            System.arraycopy(H, 0, this.session_id, 0, H.length);
        }
        this.buf.reset();
        this.buf.putMPInt(K);
        this.buf.putByte(H);
        this.buf.putByte((byte) 65);
        this.buf.putByte(this.session_id);
        hash.update(this.buf.buffer, 0, this.buf.index);
        this.IVc2s = hash.digest();
        int j = (this.buf.index - this.session_id.length) - 1;
        byte[] bArr = this.buf.buffer;
        bArr[j] = (byte) (bArr[j] + 1);
        hash.update(this.buf.buffer, 0, this.buf.index);
        this.IVs2c = hash.digest();
        byte[] bArr2 = this.buf.buffer;
        bArr2[j] = (byte) (bArr2[j] + 1);
        hash.update(this.buf.buffer, 0, this.buf.index);
        this.Ec2s = hash.digest();
        byte[] bArr3 = this.buf.buffer;
        bArr3[j] = (byte) (bArr3[j] + 1);
        hash.update(this.buf.buffer, 0, this.buf.index);
        this.Es2c = hash.digest();
        byte[] bArr4 = this.buf.buffer;
        bArr4[j] = (byte) (bArr4[j] + 1);
        hash.update(this.buf.buffer, 0, this.buf.index);
        this.MACc2s = hash.digest();
        byte[] bArr5 = this.buf.buffer;
        bArr5[j] = (byte) (bArr5[j] + 1);
        hash.update(this.buf.buffer, 0, this.buf.index);
        this.MACs2c = hash.digest();
        try {
            String method = this.guess[3];
            Class c = Class.forName(getConfig(method));
            this.s2ccipher = (Cipher) c.newInstance();
            while (this.s2ccipher.getBlockSize() > this.Es2c.length) {
                this.buf.reset();
                this.buf.putMPInt(K);
                this.buf.putByte(H);
                this.buf.putByte(this.Es2c);
                hash.update(this.buf.buffer, 0, this.buf.index);
                byte[] foo = hash.digest();
                byte[] bar = new byte[this.Es2c.length + foo.length];
                System.arraycopy(this.Es2c, 0, bar, 0, this.Es2c.length);
                System.arraycopy(foo, 0, bar, this.Es2c.length, foo.length);
                this.Es2c = bar;
            }
            this.s2ccipher.init(1, this.Es2c, this.IVs2c);
            this.s2ccipher_size = this.s2ccipher.getIVSize();
            String method2 = this.guess[5];
            Class c2 = Class.forName(getConfig(method2));
            this.s2cmac = (MAC) c2.newInstance();
            this.MACs2c = expandKey(this.buf, K, H, this.MACs2c, hash, this.s2cmac.getBlockSize());
            this.s2cmac.init(this.MACs2c);
            this.s2cmac_result1 = new byte[this.s2cmac.getBlockSize()];
            this.s2cmac_result2 = new byte[this.s2cmac.getBlockSize()];
            String method3 = this.guess[2];
            Class c3 = Class.forName(getConfig(method3));
            this.c2scipher = (Cipher) c3.newInstance();
            while (this.c2scipher.getBlockSize() > this.Ec2s.length) {
                this.buf.reset();
                this.buf.putMPInt(K);
                this.buf.putByte(H);
                this.buf.putByte(this.Ec2s);
                hash.update(this.buf.buffer, 0, this.buf.index);
                byte[] foo2 = hash.digest();
                byte[] bar2 = new byte[this.Ec2s.length + foo2.length];
                System.arraycopy(this.Ec2s, 0, bar2, 0, this.Ec2s.length);
                System.arraycopy(foo2, 0, bar2, this.Ec2s.length, foo2.length);
                this.Ec2s = bar2;
            }
            this.c2scipher.init(0, this.Ec2s, this.IVc2s);
            this.c2scipher_size = this.c2scipher.getIVSize();
            String method4 = this.guess[4];
            Class c4 = Class.forName(getConfig(method4));
            this.c2smac = (MAC) c4.newInstance();
            this.MACc2s = expandKey(this.buf, K, H, this.MACc2s, hash, this.c2smac.getBlockSize());
            this.c2smac.init(this.MACc2s);
            String method5 = this.guess[6];
            initDeflater(method5);
            String method6 = this.guess[7];
            initInflater(method6);
        } catch (Exception e) {
            if (e instanceof JSchException) {
                throw e;
            }
            throw new JSchException(e.toString(), e);
        }
    }

    private byte[] expandKey(Buffer buf, byte[] K, byte[] H, byte[] key, HASH hash, int required_length) throws Exception {
        byte[] result = key;
        int size = hash.getBlockSize();
        while (result.length < required_length) {
            buf.reset();
            buf.putMPInt(K);
            buf.putByte(H);
            buf.putByte(result);
            hash.update(buf.buffer, 0, buf.index);
            byte[] tmp = new byte[result.length + size];
            System.arraycopy(result, 0, tmp, 0, result.length);
            System.arraycopy(hash.digest(), 0, tmp, result.length, size);
            Util.bzero(result);
            result = tmp;
        }
        return result;
    }

    /* JADX WARN: Code restructure failed: missing block: B:45:0x00c8, code lost:
    
        throw new java.io.IOException("channel is broken");
     */
    /* JADX WARN: Code restructure failed: missing block: B:88:0x0192, code lost:
    
        r8.rwsize -= r9;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    void write(com.jcraft.jsch.Packet r7, com.jcraft.jsch.Channel r8, int r9) throws java.lang.Exception {
        /*
            Method dump skipped, instructions count: 442
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.jcraft.jsch.Session.write(com.jcraft.jsch.Packet, com.jcraft.jsch.Channel, int):void");
    }

    public void write(Packet packet) throws Exception {
        long t = getTimeout();
        while (this.in_kex) {
            if (t > 0 && System.currentTimeMillis() - this.kex_start_time > t) {
                throw new JSchException("timeout in wating for rekeying process.");
            }
            byte command = packet.buffer.getCommand();
            if (command == SSH_MSG_KEXINIT || command == SSH_MSG_NEWKEYS || command == SSH_MSG_KEXDH_INIT || command == 31 || command == 31 || command == SSH_MSG_KEX_DH_GEX_INIT || command == SSH_MSG_KEX_DH_GEX_REPLY || command == SSH_MSG_KEX_DH_GEX_REQUEST || command == 1) {
                break;
            } else {
                try {
                    Thread.sleep(10L);
                } catch (InterruptedException e) {
                }
            }
        }
        _write(packet);
    }

    private void _write(Packet packet) throws Exception {
        synchronized (this.lock) {
            encode(packet);
            if (this.io != null) {
                this.io.put(packet);
                this.seqo++;
            }
        }
    }

    @Override // java.lang.Runnable
    public void run() {
        int msgType;
        this.thread = this;
        Buffer buf = new Buffer();
        Packet packet = new Packet(buf);
        int[] start = new int[1];
        int[] length = new int[1];
        KeyExchange kex = null;
        int stimeout = 0;
        while (this.isConnected && this.thread != null) {
            try {
                try {
                    buf = read(buf);
                    stimeout = 0;
                    msgType = buf.getCommand() & 255;
                } catch (InterruptedIOException ee) {
                    if (!this.in_kex && stimeout < this.serverAliveCountMax) {
                        sendKeepAliveMsg();
                        stimeout++;
                    } else if (this.in_kex && stimeout < this.serverAliveCountMax) {
                        stimeout++;
                    } else {
                        throw ee;
                    }
                }
                if (kex != null && kex.getState() == msgType) {
                    this.kex_start_time = System.currentTimeMillis();
                    boolean result = kex.next(buf);
                    if (!result) {
                        throw new JSchException("verify: " + result);
                    }
                } else {
                    switch (msgType) {
                        case SSH_MSG_KEXINIT /* 20 */:
                            kex = receive_kexinit(buf);
                        case SSH_MSG_NEWKEYS /* 21 */:
                            send_newkeys();
                            receive_newkeys(buf, kex);
                            kex = null;
                        case SSH_MSG_GLOBAL_REQUEST /* 80 */:
                            buf.getInt();
                            buf.getShort();
                            buf.getString();
                            boolean reply = buf.getByte() != 0;
                            if (reply) {
                                packet.reset();
                                buf.putByte((byte) 82);
                                write(packet);
                            }
                        case SSH_MSG_REQUEST_SUCCESS /* 81 */:
                        case SSH_MSG_REQUEST_FAILURE /* 82 */:
                            Thread t = this.grr.getThread();
                            if (t != null) {
                                this.grr.setReply(msgType == SSH_MSG_REQUEST_SUCCESS ? 1 : 0);
                                if (msgType == SSH_MSG_REQUEST_SUCCESS && this.grr.getPort() == 0) {
                                    buf.getInt();
                                    buf.getShort();
                                    this.grr.setPort(buf.getInt());
                                }
                                t.interrupt();
                            }
                            break;
                        case SSH_MSG_CHANNEL_OPEN /* 90 */:
                            buf.getInt();
                            buf.getShort();
                            byte[] foo = buf.getString();
                            String ctyp = Util.byte2str(foo);
                            if (!"forwarded-tcpip".equals(ctyp) && ((!"x11".equals(ctyp) || !this.x11_forwarding) && (!"auth-agent@openssh.com".equals(ctyp) || !this.agent_forwarding))) {
                                packet.reset();
                                buf.putByte((byte) 92);
                                buf.putInt(buf.getInt());
                                buf.putInt(1);
                                buf.putString(Util.empty);
                                buf.putString(Util.empty);
                                write(packet);
                            } else {
                                Channel channel = Channel.getChannel(ctyp);
                                addChannel(channel);
                                channel.getData(buf);
                                channel.init();
                                Thread tmp = new Thread(channel);
                                tmp.setName("Channel " + ctyp + " " + this.host);
                                if (this.daemon_thread) {
                                    tmp.setDaemon(this.daemon_thread);
                                }
                                tmp.start();
                            }
                            break;
                        case SSH_MSG_CHANNEL_OPEN_CONFIRMATION /* 91 */:
                            buf.getInt();
                            buf.getShort();
                            int i = buf.getInt();
                            Channel channel2 = Channel.getChannel(i, this);
                            int r = buf.getInt();
                            long rws = buf.getUInt();
                            int rps = buf.getInt();
                            if (channel2 != null) {
                                channel2.setRemoteWindowSize(rws);
                                channel2.setRemotePacketSize(rps);
                                channel2.open_confirmation = true;
                                channel2.setRecipient(r);
                            }
                        case SSH_MSG_CHANNEL_OPEN_FAILURE /* 92 */:
                            buf.getInt();
                            buf.getShort();
                            int i2 = buf.getInt();
                            Channel channel3 = Channel.getChannel(i2, this);
                            if (channel3 != null) {
                                int reason_code = buf.getInt();
                                channel3.setExitStatus(reason_code);
                                channel3.close = true;
                                channel3.eof_remote = true;
                                channel3.setRecipient(0);
                            }
                        case SSH_MSG_CHANNEL_WINDOW_ADJUST /* 93 */:
                            buf.getInt();
                            buf.getShort();
                            int i3 = buf.getInt();
                            Channel channel4 = Channel.getChannel(i3, this);
                            if (channel4 != null) {
                                channel4.addRemoteWindowSize(buf.getUInt());
                            }
                        case SSH_MSG_CHANNEL_DATA /* 94 */:
                            buf.getInt();
                            buf.getByte();
                            buf.getByte();
                            int i4 = buf.getInt();
                            Channel channel5 = Channel.getChannel(i4, this);
                            byte[] foo2 = buf.getString(start, length);
                            if (channel5 != null && length[0] != 0) {
                                try {
                                    channel5.write(foo2, start[0], length[0]);
                                    int len = length[0];
                                    channel5.setLocalWindowSize(channel5.lwsize - len);
                                    if (channel5.lwsize < channel5.lwsize_max / 2) {
                                        packet.reset();
                                        buf.putByte((byte) 93);
                                        buf.putInt(channel5.getRecipient());
                                        buf.putInt(channel5.lwsize_max - channel5.lwsize);
                                        synchronized (channel5) {
                                            if (!channel5.close) {
                                                write(packet);
                                            }
                                        }
                                        channel5.setLocalWindowSize(channel5.lwsize_max);
                                    }
                                } catch (Exception e) {
                                    try {
                                        channel5.disconnect();
                                    } catch (Exception e2) {
                                    }
                                }
                            }
                            break;
                        case SSH_MSG_CHANNEL_EXTENDED_DATA /* 95 */:
                            buf.getInt();
                            buf.getShort();
                            int i5 = buf.getInt();
                            Channel channel6 = Channel.getChannel(i5, this);
                            buf.getInt();
                            byte[] foo3 = buf.getString(start, length);
                            if (channel6 != null && length[0] != 0) {
                                channel6.write_ext(foo3, start[0], length[0]);
                                int len2 = length[0];
                                channel6.setLocalWindowSize(channel6.lwsize - len2);
                                if (channel6.lwsize < channel6.lwsize_max / 2) {
                                    packet.reset();
                                    buf.putByte((byte) 93);
                                    buf.putInt(channel6.getRecipient());
                                    buf.putInt(channel6.lwsize_max - channel6.lwsize);
                                    synchronized (channel6) {
                                        if (!channel6.close) {
                                            write(packet);
                                        }
                                    }
                                    channel6.setLocalWindowSize(channel6.lwsize_max);
                                }
                            }
                            break;
                        case SSH_MSG_CHANNEL_EOF /* 96 */:
                            buf.getInt();
                            buf.getShort();
                            int i6 = buf.getInt();
                            Channel channel7 = Channel.getChannel(i6, this);
                            if (channel7 != null) {
                                channel7.eof_remote();
                            }
                        case SSH_MSG_CHANNEL_CLOSE /* 97 */:
                            buf.getInt();
                            buf.getShort();
                            int i7 = buf.getInt();
                            Channel channel8 = Channel.getChannel(i7, this);
                            if (channel8 != null) {
                                channel8.disconnect();
                            }
                        case SSH_MSG_CHANNEL_REQUEST /* 98 */:
                            buf.getInt();
                            buf.getShort();
                            int i8 = buf.getInt();
                            byte[] foo4 = buf.getString();
                            boolean reply2 = buf.getByte() != 0;
                            Channel channel9 = Channel.getChannel(i8, this);
                            if (channel9 != null) {
                                byte reply_type = SSH_MSG_CHANNEL_FAILURE;
                                if (Util.byte2str(foo4).equals("exit-status")) {
                                    int i9 = buf.getInt();
                                    channel9.setExitStatus(i9);
                                    reply_type = SSH_MSG_CHANNEL_SUCCESS;
                                }
                                if (reply2) {
                                    packet.reset();
                                    buf.putByte(reply_type);
                                    buf.putInt(channel9.getRecipient());
                                    write(packet);
                                }
                            }
                        case SSH_MSG_CHANNEL_SUCCESS /* 99 */:
                            buf.getInt();
                            buf.getShort();
                            int i10 = buf.getInt();
                            Channel channel10 = Channel.getChannel(i10, this);
                            if (channel10 != null) {
                                channel10.reply = 1;
                            }
                        case SSH_MSG_CHANNEL_FAILURE /* 100 */:
                            buf.getInt();
                            buf.getShort();
                            int i11 = buf.getInt();
                            Channel channel11 = Channel.getChannel(i11, this);
                            if (channel11 != null) {
                                channel11.reply = 0;
                            }
                        default:
                            throw new IOException("Unknown SSH message type " + msgType);
                    }
                }
            } catch (Exception e3) {
                this.in_kex = false;
                if (JSch.getLogger().isEnabled(1)) {
                    JSch.getLogger().log(1, "Caught an exception, leaving main loop due to " + e3.getMessage());
                }
            }
        }
        try {
            disconnect();
        } catch (NullPointerException e4) {
        } catch (Exception e5) {
        }
        this.isConnected = false;
    }

    public void disconnect() {
        if (this.isConnected) {
            if (JSch.getLogger().isEnabled(1)) {
                JSch.getLogger().log(1, "Disconnecting from " + this.host + " port " + this.port);
            }
            Channel.disconnect(this);
            this.isConnected = false;
            PortWatcher.delPort(this);
            ChannelForwardedTCPIP.delPort(this);
            ChannelX11.removeFakedCookie(this);
            synchronized (this.lock) {
                if (this.connectThread != null) {
                    Thread.yield();
                    this.connectThread.interrupt();
                    this.connectThread = null;
                }
            }
            this.thread = null;
            try {
                if (this.io != null) {
                    if (this.io.in != null) {
                        this.io.in.close();
                    }
                    if (this.io.out != null) {
                        this.io.out.close();
                    }
                    if (this.io.out_ext != null) {
                        this.io.out_ext.close();
                    }
                }
                if (this.proxy == null) {
                    if (this.socket != null) {
                        this.socket.close();
                    }
                } else {
                    synchronized (this.proxy) {
                        this.proxy.close();
                    }
                    this.proxy = null;
                }
            } catch (Exception e) {
            }
            this.io = null;
            this.socket = null;
            this.jsch.removeSession(this);
        }
    }

    public int setPortForwardingL(int lport, String host, int rport) throws JSchException {
        return setPortForwardingL("127.0.0.1", lport, host, rport);
    }

    public int setPortForwardingL(String bind_address, int lport, String host, int rport) throws JSchException {
        return setPortForwardingL(bind_address, lport, host, rport, null);
    }

    public int setPortForwardingL(String bind_address, int lport, String host, int rport, ServerSocketFactory ssf) throws JSchException {
        return setPortForwardingL(bind_address, lport, host, rport, ssf, 0);
    }

    public int setPortForwardingL(String bind_address, int lport, String host, int rport, ServerSocketFactory ssf, int connectTimeout) throws JSchException {
        PortWatcher pw = PortWatcher.addPort(this, bind_address, lport, host, rport, ssf);
        pw.setConnectTimeout(connectTimeout);
        Thread tmp = new Thread(pw);
        tmp.setName("PortWatcher Thread for " + host);
        if (this.daemon_thread) {
            tmp.setDaemon(this.daemon_thread);
        }
        tmp.start();
        return pw.lport;
    }

    public void delPortForwardingL(int lport) throws JSchException {
        delPortForwardingL("127.0.0.1", lport);
    }

    public void delPortForwardingL(String bind_address, int lport) throws JSchException {
        PortWatcher.delPort(this, bind_address, lport);
    }

    public String[] getPortForwardingL() throws JSchException {
        return PortWatcher.getPortForwarding(this);
    }

    public void setPortForwardingR(int rport, String host, int lport) throws JSchException {
        setPortForwardingR(null, rport, host, lport, (SocketFactory) null);
    }

    public void setPortForwardingR(String bind_address, int rport, String host, int lport) throws JSchException {
        setPortForwardingR(bind_address, rport, host, lport, (SocketFactory) null);
    }

    public void setPortForwardingR(int rport, String host, int lport, SocketFactory sf) throws JSchException {
        setPortForwardingR(null, rport, host, lport, sf);
    }

    public void setPortForwardingR(String bind_address, int rport, String host, int lport, SocketFactory sf) throws JSchException {
        int allocated = _setPortForwardingR(bind_address, rport);
        ChannelForwardedTCPIP.addPort(this, bind_address, rport, allocated, host, lport, sf);
    }

    public void setPortForwardingR(int rport, String daemon) throws JSchException {
        setPortForwardingR((String) null, rport, daemon, (Object[]) null);
    }

    public void setPortForwardingR(int rport, String daemon, Object[] arg) throws JSchException {
        setPortForwardingR((String) null, rport, daemon, arg);
    }

    public void setPortForwardingR(String bind_address, int rport, String daemon, Object[] arg) throws JSchException {
        int allocated = _setPortForwardingR(bind_address, rport);
        ChannelForwardedTCPIP.addPort(this, bind_address, rport, allocated, daemon, arg);
    }

    public String[] getPortForwardingR() throws JSchException {
        return ChannelForwardedTCPIP.getPortForwarding(this);
    }

    /* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/Session$Forwarding.class */
    private class Forwarding {
        String bind_address;
        int port;
        String host;
        int hostport;

        private Forwarding() {
            this.bind_address = null;
            this.port = -1;
            this.host = null;
            this.hostport = -1;
        }
    }

    private Forwarding parseForwarding(String conf) throws JSchException {
        String[] tmp = conf.split(" ");
        if (tmp.length > 1) {
            Vector foo = new Vector();
            for (int i = 0; i < tmp.length; i++) {
                if (tmp[i].length() != 0) {
                    foo.addElement(tmp[i].trim());
                }
            }
            StringBuffer sb = new StringBuffer();
            for (int i2 = 0; i2 < foo.size(); i2++) {
                sb.append((String) foo.elementAt(i2));
                if (i2 + 1 < foo.size()) {
                    sb.append(":");
                }
            }
            conf = sb.toString();
        }
        String org = conf;
        Forwarding f = new Forwarding();
        try {
            if (conf.lastIndexOf(":") == -1) {
                throw new JSchException("parseForwarding: " + org);
            }
            f.hostport = Integer.parseInt(conf.substring(conf.lastIndexOf(":") + 1));
            String conf2 = conf.substring(0, conf.lastIndexOf(":"));
            if (conf2.lastIndexOf(":") == -1) {
                throw new JSchException("parseForwarding: " + org);
            }
            f.host = conf2.substring(conf2.lastIndexOf(":") + 1);
            String conf3 = conf2.substring(0, conf2.lastIndexOf(":"));
            if (conf3.lastIndexOf(":") != -1) {
                f.port = Integer.parseInt(conf3.substring(conf3.lastIndexOf(":") + 1));
                String conf4 = conf3.substring(0, conf3.lastIndexOf(":"));
                if (conf4.length() == 0 || conf4.equals("*")) {
                    conf4 = "0.0.0.0";
                }
                if (conf4.equals("localhost")) {
                    conf4 = "127.0.0.1";
                }
                f.bind_address = conf4;
            } else {
                f.port = Integer.parseInt(conf3);
                f.bind_address = "127.0.0.1";
            }
            return f;
        } catch (NumberFormatException e) {
            throw new JSchException("parseForwarding: " + e.toString());
        }
    }

    public int setPortForwardingL(String conf) throws JSchException {
        Forwarding f = parseForwarding(conf);
        return setPortForwardingL(f.bind_address, f.port, f.host, f.hostport);
    }

    public int setPortForwardingR(String conf) throws JSchException {
        Forwarding f = parseForwarding(conf);
        int allocated = _setPortForwardingR(f.bind_address, f.port);
        ChannelForwardedTCPIP.addPort(this, f.bind_address, f.port, allocated, f.host, f.hostport, null);
        return allocated;
    }

    public Channel getStreamForwarder(String host, int port) throws JSchException {
        ChannelDirectTCPIP channel = new ChannelDirectTCPIP();
        channel.init();
        addChannel(channel);
        channel.setHost(host);
        channel.setPort(port);
        return channel;
    }

    /* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/Session$GlobalRequestReply.class */
    private class GlobalRequestReply {
        private Thread thread;
        private int reply;
        private int port;

        private GlobalRequestReply() {
            this.thread = null;
            this.reply = -1;
            this.port = 0;
        }

        void setThread(Thread thread) {
            this.thread = thread;
            this.reply = -1;
        }

        Thread getThread() {
            return this.thread;
        }

        void setReply(int reply) {
            this.reply = reply;
        }

        int getReply() {
            return this.reply;
        }

        int getPort() {
            return this.port;
        }

        void setPort(int port) {
            this.port = port;
        }
    }

    private int _setPortForwardingR(String bind_address, int rport) throws JSchException {
        int rport2;
        synchronized (this.grr) {
            Buffer buf = new Buffer(SSH_MSG_CHANNEL_FAILURE);
            Packet packet = new Packet(buf);
            String address_to_bind = ChannelForwardedTCPIP.normalize(bind_address);
            this.grr.setThread(Thread.currentThread());
            this.grr.setPort(rport);
            try {
                packet.reset();
                buf.putByte((byte) 80);
                buf.putString(Util.str2byte("tcpip-forward"));
                buf.putByte((byte) 1);
                buf.putString(Util.str2byte(address_to_bind));
                buf.putInt(rport);
                write(packet);
                int count = 0;
                int reply = this.grr.getReply();
                while (count < 10 && reply == -1) {
                    try {
                        Thread.sleep(1000L);
                    } catch (Exception e) {
                    }
                    count++;
                    reply = this.grr.getReply();
                }
                this.grr.setThread(null);
                if (reply != 1) {
                    throw new JSchException("remote port forwarding failed for listen port " + rport);
                }
                rport2 = this.grr.getPort();
            } catch (Exception e2) {
                this.grr.setThread(null);
                if (e2 instanceof Throwable) {
                    throw new JSchException(e2.toString(), e2);
                }
                throw new JSchException(e2.toString());
            }
        }
        return rport2;
    }

    public void delPortForwardingR(int rport) throws JSchException {
        delPortForwardingR(null, rport);
    }

    public void delPortForwardingR(String bind_address, int rport) throws JSchException {
        ChannelForwardedTCPIP.delPort(this, bind_address, rport);
    }

    private void initDeflater(String method) throws JSchException {
        if (method.equals("none")) {
            this.deflater = null;
            return;
        }
        String foo = getConfig(method);
        if (foo != null) {
            if (method.equals("zlib") || (this.isAuthed && method.equals("zlib@openssh.com"))) {
                try {
                    Class c = Class.forName(foo);
                    this.deflater = (Compression) c.newInstance();
                    int level = 6;
                    try {
                        level = Integer.parseInt(getConfig("compression_level"));
                    } catch (Exception e) {
                    }
                    this.deflater.init(1, level);
                } catch (Exception ee) {
                    throw new JSchException(ee.toString(), ee);
                } catch (NoClassDefFoundError ee2) {
                    throw new JSchException(ee2.toString(), ee2);
                }
            }
        }
    }

    private void initInflater(String method) throws JSchException {
        if (method.equals("none")) {
            this.inflater = null;
            return;
        }
        String foo = getConfig(method);
        if (foo != null) {
            if (method.equals("zlib") || (this.isAuthed && method.equals("zlib@openssh.com"))) {
                try {
                    Class c = Class.forName(foo);
                    this.inflater = (Compression) c.newInstance();
                    this.inflater.init(0, 0);
                } catch (Exception ee) {
                    throw new JSchException(ee.toString(), ee);
                }
            }
        }
    }

    void addChannel(Channel channel) {
        channel.setSession(this);
    }

    public void setProxy(Proxy proxy) {
        this.proxy = proxy;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public void setPort(int port) {
        this.port = port;
    }

    void setUserName(String username) {
        this.username = username;
    }

    public void setUserInfo(UserInfo userinfo) {
        this.userinfo = userinfo;
    }

    public UserInfo getUserInfo() {
        return this.userinfo;
    }

    public void setInputStream(InputStream in) {
        this.in = in;
    }

    public void setOutputStream(OutputStream out) {
        this.out = out;
    }

    public void setX11Host(String host) {
        ChannelX11.setHost(host);
    }

    public void setX11Port(int port) {
        ChannelX11.setPort(port);
    }

    public void setX11Cookie(String cookie) {
        ChannelX11.setCookie(cookie);
    }

    public void setPassword(String password) {
        if (password != null) {
            this.password = Util.str2byte(password);
        }
    }

    public void setPassword(byte[] password) {
        if (password != null) {
            this.password = new byte[password.length];
            System.arraycopy(password, 0, this.password, 0, password.length);
        }
    }

    public void setConfig(Properties newconf) {
        setConfig((Hashtable) newconf);
    }

    public void setConfig(Hashtable newconf) {
        synchronized (this.lock) {
            if (this.config == null) {
                this.config = new Hashtable();
            }
            Enumeration e = newconf.keys();
            while (e.hasMoreElements()) {
                String key = (String) e.nextElement();
                this.config.put(key, (String) newconf.get(key));
            }
        }
    }

    public void setConfig(String key, String value) {
        synchronized (this.lock) {
            if (this.config == null) {
                this.config = new Hashtable();
            }
            this.config.put(key, value);
        }
    }

    public String getConfig(String key) {
        if (this.config != null) {
            Object foo = this.config.get(key);
            if (foo instanceof String) {
                return (String) foo;
            }
        }
        JSch jSch = this.jsch;
        Object foo2 = JSch.getConfig(key);
        if (foo2 instanceof String) {
            return (String) foo2;
        }
        return null;
    }

    public void setSocketFactory(SocketFactory sfactory) {
        this.socket_factory = sfactory;
    }

    public boolean isConnected() {
        return this.isConnected;
    }

    public int getTimeout() {
        return this.timeout;
    }

    public void setTimeout(int timeout) throws JSchException {
        if (this.socket == null) {
            if (timeout < 0) {
                throw new JSchException("invalid timeout value");
            }
            this.timeout = timeout;
        } else {
            try {
                this.socket.setSoTimeout(timeout);
                this.timeout = timeout;
            } catch (Exception e) {
                if (e instanceof Throwable) {
                    throw new JSchException(e.toString(), e);
                }
                throw new JSchException(e.toString());
            }
        }
    }

    public String getServerVersion() {
        return Util.byte2str(this.V_S);
    }

    public String getClientVersion() {
        return Util.byte2str(this.V_C);
    }

    public void setClientVersion(String cv) {
        this.V_C = Util.str2byte(cv);
    }

    public void sendIgnore() throws Exception {
        Buffer buf = new Buffer();
        Packet packet = new Packet(buf);
        packet.reset();
        buf.putByte((byte) 2);
        write(packet);
    }

    public void sendKeepAliveMsg() throws Exception {
        Buffer buf = new Buffer();
        Packet packet = new Packet(buf);
        packet.reset();
        buf.putByte((byte) 80);
        buf.putString(keepalivemsg);
        buf.putByte((byte) 1);
        write(packet);
    }

    public void noMoreSessionChannels() throws Exception {
        Buffer buf = new Buffer();
        Packet packet = new Packet(buf);
        packet.reset();
        buf.putByte((byte) 80);
        buf.putString(nomoresessions);
        buf.putByte((byte) 0);
        write(packet);
    }

    public HostKey getHostKey() {
        return this.hostkey;
    }

    public String getHost() {
        return this.host;
    }

    public String getUserName() {
        return this.username;
    }

    public int getPort() {
        return this.port;
    }

    public void setHostKeyAlias(String hostKeyAlias) {
        this.hostKeyAlias = hostKeyAlias;
    }

    public String getHostKeyAlias() {
        return this.hostKeyAlias;
    }

    public void setServerAliveInterval(int interval) throws JSchException {
        setTimeout(interval);
        this.serverAliveInterval = interval;
    }

    public int getServerAliveInterval() {
        return this.serverAliveInterval;
    }

    public void setServerAliveCountMax(int count) {
        this.serverAliveCountMax = count;
    }

    public int getServerAliveCountMax() {
        return this.serverAliveCountMax;
    }

    public void setDaemonThread(boolean enable) {
        this.daemon_thread = enable;
    }

    private String[] checkCiphers(String ciphers) {
        if (ciphers == null || ciphers.length() == 0) {
            return null;
        }
        if (JSch.getLogger().isEnabled(1)) {
            JSch.getLogger().log(1, "CheckCiphers: " + ciphers);
        }
        String cipherc2s = getConfig("cipher.c2s");
        String ciphers2c = getConfig("cipher.s2c");
        Vector result = new Vector();
        String[] _ciphers = Util.split(ciphers, ",");
        for (String cipher : _ciphers) {
            if ((ciphers2c.indexOf(cipher) != -1 || cipherc2s.indexOf(cipher) != -1) && !checkCipher(getConfig(cipher))) {
                result.addElement(cipher);
            }
        }
        if (result.size() == 0) {
            return null;
        }
        String[] foo = new String[result.size()];
        System.arraycopy(result.toArray(), 0, foo, 0, result.size());
        if (JSch.getLogger().isEnabled(1)) {
            for (String str : foo) {
                JSch.getLogger().log(1, str + " is not available.");
            }
        }
        return foo;
    }

    static boolean checkCipher(String cipher) {
        try {
            Class c = Class.forName(cipher);
            Cipher _c = (Cipher) c.newInstance();
            _c.init(0, new byte[_c.getBlockSize()], new byte[_c.getIVSize()]);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    private String[] checkKexes(String kexes) {
        if (kexes == null || kexes.length() == 0) {
            return null;
        }
        if (JSch.getLogger().isEnabled(1)) {
            JSch.getLogger().log(1, "CheckKexes: " + kexes);
        }
        Vector result = new Vector();
        String[] _kexes = Util.split(kexes, ",");
        for (int i = 0; i < _kexes.length; i++) {
            if (!checkKex(this, getConfig(_kexes[i]))) {
                result.addElement(_kexes[i]);
            }
        }
        if (result.size() == 0) {
            return null;
        }
        String[] foo = new String[result.size()];
        System.arraycopy(result.toArray(), 0, foo, 0, result.size());
        if (JSch.getLogger().isEnabled(1)) {
            for (String str : foo) {
                JSch.getLogger().log(1, str + " is not available.");
            }
        }
        return foo;
    }

    static boolean checkKex(Session s, String kex) {
        try {
            Class c = Class.forName(kex);
            KeyExchange _c = (KeyExchange) c.newInstance();
            _c.init(s, null, null, null, null);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public void setIdentityRepository(IdentityRepository identityRepository) {
        this.identityRepository = identityRepository;
    }

    IdentityRepository getIdentityRepository() {
        if (this.identityRepository == null) {
            return this.jsch.getIdentityRepository();
        }
        return this.identityRepository;
    }

    public void setHostKeyRepository(HostKeyRepository hostkeyRepository) {
        this.hostkeyRepository = hostkeyRepository;
    }

    public HostKeyRepository getHostKeyRepository() {
        if (this.hostkeyRepository == null) {
            return this.jsch.getHostKeyRepository();
        }
        return this.hostkeyRepository;
    }

    private void applyConfig() throws JSchException {
        ConfigRepository configRepository = this.jsch.getConfigRepository();
        if (configRepository == null) {
            return;
        }
        ConfigRepository.Config config = configRepository.getConfig(this.org_host);
        String value = config.getUser();
        if (value != null) {
            this.username = value;
        }
        String value2 = config.getHostname();
        if (value2 != null) {
            this.host = value2;
        }
        int port = config.getPort();
        if (port != -1) {
            this.port = port;
        }
        checkConfig(config, "kex");
        checkConfig(config, "server_host_key");
        checkConfig(config, "cipher.c2s");
        checkConfig(config, "cipher.s2c");
        checkConfig(config, "mac.c2s");
        checkConfig(config, "mac.s2c");
        checkConfig(config, "compression.c2s");
        checkConfig(config, "compression.s2c");
        checkConfig(config, "compression_level");
        checkConfig(config, "StrictHostKeyChecking");
        checkConfig(config, "HashKnownHosts");
        checkConfig(config, "PreferredAuthentications");
        checkConfig(config, "MaxAuthTries");
        checkConfig(config, "ClearAllForwardings");
        String value3 = config.getValue("HostKeyAlias");
        if (value3 != null) {
            setHostKeyAlias(value3);
        }
        String value4 = config.getValue("UserKnownHostsFile");
        if (value4 != null) {
            KnownHosts kh = new KnownHosts(this.jsch);
            kh.setKnownHosts(value4);
            setHostKeyRepository(kh);
        }
        String[] values = config.getValues("IdentityFile");
        if (values != null) {
            String[] global = configRepository.getConfig("").getValues("IdentityFile");
            if (global != null) {
                for (String str : global) {
                    this.jsch.addIdentity(str);
                }
            } else {
                global = new String[0];
            }
            if (values.length - global.length > 0) {
                IdentityRepository.Wrapper ir = new IdentityRepository.Wrapper(this.jsch.getIdentityRepository(), true);
                for (int i = 0; i < values.length; i++) {
                    String ifile = values[i];
                    int j = 0;
                    while (true) {
                        if (j >= global.length) {
                            break;
                        }
                        if (!ifile.equals(global[j])) {
                            j++;
                        } else {
                            ifile = null;
                            break;
                        }
                    }
                    if (ifile != null) {
                        Identity identity = IdentityFile.newInstance(ifile, null, this.jsch);
                        ir.add(identity);
                    }
                }
                setIdentityRepository(ir);
            }
        }
        String value5 = config.getValue("ServerAliveInterval");
        if (value5 != null) {
            try {
                setServerAliveInterval(Integer.parseInt(value5));
            } catch (NumberFormatException e) {
            }
        }
        String value6 = config.getValue("ConnectTimeout");
        if (value6 != null) {
            try {
                setTimeout(Integer.parseInt(value6));
            } catch (NumberFormatException e2) {
            }
        }
        String value7 = config.getValue("MaxAuthTries");
        if (value7 != null) {
            setConfig("MaxAuthTries", value7);
        }
        String value8 = config.getValue("ClearAllForwardings");
        if (value8 != null) {
            setConfig("ClearAllForwardings", value8);
        }
    }

    private void applyConfigChannel(ChannelSession channel) throws JSchException {
        ConfigRepository configRepository = this.jsch.getConfigRepository();
        if (configRepository == null) {
            return;
        }
        ConfigRepository.Config config = configRepository.getConfig(this.org_host);
        String value = config.getValue("ForwardAgent");
        if (value != null) {
            channel.setAgentForwarding(value.equals("yes"));
        }
        String value2 = config.getValue("RequestTTY");
        if (value2 != null) {
            channel.setPty(value2.equals("yes"));
        }
    }

    private void requestPortForwarding() throws JSchException {
        ConfigRepository configRepository;
        if (getConfig("ClearAllForwardings").equals("yes") || (configRepository = this.jsch.getConfigRepository()) == null) {
            return;
        }
        ConfigRepository.Config config = configRepository.getConfig(this.org_host);
        String[] values = config.getValues("LocalForward");
        if (values != null) {
            for (String str : values) {
                setPortForwardingL(str);
            }
        }
        String[] values2 = config.getValues("RemoteForward");
        if (values2 != null) {
            for (String str2 : values2) {
                setPortForwardingR(str2);
            }
        }
    }

    private void checkConfig(ConfigRepository.Config config, String key) {
        String value = config.getValue(key);
        if (value != null) {
            setConfig(key, value);
        }
    }
}
