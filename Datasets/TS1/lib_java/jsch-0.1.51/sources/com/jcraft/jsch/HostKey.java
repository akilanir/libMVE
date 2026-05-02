package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/HostKey.class */
public class HostKey {
    private static final byte[] sshdss = Util.str2byte("ssh-dss");
    private static final byte[] sshrsa = Util.str2byte("ssh-rsa");
    protected static final int GUESS = 0;
    public static final int SSHDSS = 1;
    public static final int SSHRSA = 2;
    static final int UNKNOWN = 3;
    protected String marker;
    protected String host;
    protected int type;
    protected byte[] key;
    protected String comment;

    public HostKey(String host, byte[] key) throws JSchException {
        this(host, 0, key);
    }

    public HostKey(String host, int type, byte[] key) throws JSchException {
        this(host, type, key, null);
    }

    public HostKey(String host, int type, byte[] key, String comment) throws JSchException {
        this("", host, type, key, comment);
    }

    public HostKey(String marker, String host, int type, byte[] key, String comment) throws JSchException {
        this.marker = marker;
        this.host = host;
        if (type == 0) {
            if (key[8] == 100) {
                this.type = 1;
            } else {
                if (key[8] != 114) {
                    throw new JSchException("invalid key type");
                }
                this.type = 2;
            }
        } else {
            this.type = type;
        }
        this.key = key;
        this.comment = comment;
    }

    public String getHost() {
        return this.host;
    }

    public String getType() {
        return this.type == 1 ? Util.byte2str(sshdss) : this.type == 2 ? Util.byte2str(sshrsa) : "UNKNOWN";
    }

    public String getKey() {
        return Util.byte2str(Util.toBase64(this.key, 0, this.key.length));
    }

    public String getFingerPrint(JSch jsch) {
        HASH hash = null;
        try {
            Class c = Class.forName(JSch.getConfig("md5"));
            hash = (HASH) c.newInstance();
        } catch (Exception e) {
            System.err.println("getFingerPrint: " + e);
        }
        return Util.getFingerPrint(hash, this.key);
    }

    public String getComment() {
        return this.comment;
    }

    public String getMarker() {
        return this.marker;
    }

    boolean isMatched(String _host) {
        return isIncluded(_host);
    }

    private boolean isIncluded(String _host) {
        int i = 0;
        String hosts = this.host;
        int hostslen = hosts.length();
        int hostlen = _host.length();
        while (i < hostslen) {
            int j = hosts.indexOf(44, i);
            if (j == -1) {
                if (hostlen != hostslen - i) {
                    return false;
                }
                return hosts.regionMatches(true, i, _host, 0, hostlen);
            }
            if (hostlen == j - i && hosts.regionMatches(true, i, _host, 0, hostlen)) {
                return true;
            }
            i = j + 1;
        }
        return false;
    }
}
