package com.jcraft.jsch;

import java.io.IOException;
import java.net.Socket;
import java.util.Hashtable;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/ChannelX11.class */
class ChannelX11 extends Channel {
    private static final int LOCAL_WINDOW_SIZE_MAX = 131072;
    private static final int LOCAL_MAXIMUM_PACKET_SIZE = 16384;
    private static final int TIMEOUT = 10000;
    private boolean init = true;
    private Socket socket = null;
    private byte[] cache = new byte[0];
    private static String host = "127.0.0.1";
    private static int port = 6000;
    static byte[] cookie = null;
    private static byte[] cookie_hex = null;
    private static Hashtable faked_cookie_pool = new Hashtable();
    private static Hashtable faked_cookie_hex_pool = new Hashtable();
    private static byte[] table = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 97, 98, 99, 100, 101, 102};

    static int revtable(byte foo) {
        for (int i = 0; i < table.length; i++) {
            if (table[i] == foo) {
                return i;
            }
        }
        return 0;
    }

    static void setCookie(String foo) {
        cookie_hex = Util.str2byte(foo);
        cookie = new byte[16];
        for (int i = 0; i < 16; i++) {
            cookie[i] = (byte) (((revtable(cookie_hex[i * 2]) << 4) & 240) | (revtable(cookie_hex[(i * 2) + 1]) & 15));
        }
    }

    static void setHost(String foo) {
        host = foo;
    }

    static void setPort(int foo) {
        port = foo;
    }

    static byte[] getFakedCookie(Session session) {
        byte[] bArr;
        synchronized (faked_cookie_hex_pool) {
            byte[] foo = (byte[]) faked_cookie_hex_pool.get(session);
            if (foo == null) {
                Random random = Session.random;
                byte[] foo2 = new byte[16];
                synchronized (random) {
                    random.fill(foo2, 0, 16);
                }
                faked_cookie_pool.put(session, foo2);
                byte[] bar = new byte[32];
                for (int i = 0; i < 16; i++) {
                    bar[2 * i] = table[(foo2[i] >>> 4) & 15];
                    bar[(2 * i) + 1] = table[foo2[i] & 15];
                }
                faked_cookie_hex_pool.put(session, bar);
                foo = bar;
            }
            bArr = foo;
        }
        return bArr;
    }

    static void removeFakedCookie(Session session) {
        synchronized (faked_cookie_hex_pool) {
            faked_cookie_hex_pool.remove(session);
            faked_cookie_pool.remove(session);
        }
    }

    ChannelX11() {
        setLocalWindowSizeMax(LOCAL_WINDOW_SIZE_MAX);
        setLocalWindowSize(LOCAL_WINDOW_SIZE_MAX);
        setLocalPacketSize(LOCAL_MAXIMUM_PACKET_SIZE);
        this.type = Util.str2byte("x11");
        this.connected = true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x00ac, code lost:
    
        eof();
     */
    @Override // com.jcraft.jsch.Channel, java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void run() {
        /*
            Method dump skipped, instructions count: 240
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.jcraft.jsch.ChannelX11.run():void");
    }

    private byte[] addCache(byte[] foo, int s, int l) {
        byte[] bar = new byte[this.cache.length + l];
        System.arraycopy(foo, s, bar, this.cache.length, l);
        if (this.cache.length > 0) {
            System.arraycopy(this.cache, 0, bar, 0, this.cache.length);
        }
        this.cache = bar;
        return this.cache;
    }

    @Override // com.jcraft.jsch.Channel
    void write(byte[] foo, int s, int l) throws IOException {
        byte[] faked_cookie;
        if (this.init) {
            try {
                Session _session = getSession();
                byte[] foo2 = addCache(foo, s, l);
                int l2 = foo2.length;
                if (l2 >= 9) {
                    int plen = ((foo2[0 + 6] & 255) * 256) + (foo2[0 + 7] & 255);
                    int dlen = ((foo2[0 + 8] & 255) * 256) + (foo2[0 + 9] & 255);
                    if ((foo2[0] & 255) != 66 && (foo2[0] & 255) == 108) {
                        plen = ((plen >>> 8) & 255) | ((plen << 8) & 65280);
                        dlen = ((dlen >>> 8) & 255) | ((dlen << 8) & 65280);
                    }
                    if (l2 < 12 + plen + ((-plen) & 3) + dlen) {
                        return;
                    }
                    byte[] bar = new byte[dlen];
                    System.arraycopy(foo2, 0 + 12 + plen + ((-plen) & 3), bar, 0, dlen);
                    synchronized (faked_cookie_pool) {
                        faked_cookie = (byte[]) faked_cookie_pool.get(_session);
                    }
                    if (equals(bar, faked_cookie)) {
                        if (cookie != null) {
                            System.arraycopy(cookie, 0, foo2, 0 + 12 + plen + ((-plen) & 3), dlen);
                        }
                    } else {
                        this.thread = null;
                        eof();
                        this.io.close();
                        disconnect();
                    }
                    this.init = false;
                    this.io.put(foo2, 0, l2);
                    this.cache = null;
                    return;
                }
                return;
            } catch (JSchException e) {
                throw new IOException(e.toString());
            }
        }
        this.io.put(foo, s, l);
    }

    private static boolean equals(byte[] foo, byte[] bar) {
        if (foo.length != bar.length) {
            return false;
        }
        for (int i = 0; i < foo.length; i++) {
            if (foo[i] != bar[i]) {
                return false;
            }
        }
        return true;
    }
}
