package com.jcraft.jsch;

import java.util.Enumeration;
import java.util.Hashtable;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/ChannelSession.class */
class ChannelSession extends Channel {
    private static byte[] _session = Util.str2byte("session");
    protected boolean agent_forwarding = false;
    protected boolean xforwading = false;
    protected Hashtable env = null;
    protected boolean pty = false;
    protected String ttype = "vt100";
    protected int tcol = 80;
    protected int trow = 24;
    protected int twp = 640;
    protected int thp = 480;
    protected byte[] terminal_mode = null;

    ChannelSession() {
        this.type = _session;
        this.io = new IO();
    }

    public void setAgentForwarding(boolean enable) {
        this.agent_forwarding = enable;
    }

    @Override // com.jcraft.jsch.Channel
    public void setXForwarding(boolean enable) {
        this.xforwading = enable;
    }

    public void setEnv(Hashtable env) {
        synchronized (this) {
            this.env = env;
        }
    }

    public void setEnv(String name, String value) {
        setEnv(Util.str2byte(name), Util.str2byte(value));
    }

    public void setEnv(byte[] name, byte[] value) {
        synchronized (this) {
            getEnv().put(name, value);
        }
    }

    private Hashtable getEnv() {
        if (this.env == null) {
            this.env = new Hashtable();
        }
        return this.env;
    }

    public void setPty(boolean enable) {
        this.pty = enable;
    }

    public void setTerminalMode(byte[] terminal_mode) {
        this.terminal_mode = terminal_mode;
    }

    public void setPtySize(int col, int row, int wp, int hp) {
        setPtyType(this.ttype, col, row, wp, hp);
        if (!this.pty || !isConnected()) {
            return;
        }
        try {
            RequestWindowChange request = new RequestWindowChange();
            request.setSize(col, row, wp, hp);
            request.request(getSession(), this);
        } catch (Exception e) {
        }
    }

    public void setPtyType(String ttype) {
        setPtyType(ttype, 80, 24, 640, 480);
    }

    public void setPtyType(String ttype, int col, int row, int wp, int hp) {
        this.ttype = ttype;
        this.tcol = col;
        this.trow = row;
        this.twp = wp;
        this.thp = hp;
    }

    protected void sendRequests() throws Exception {
        Session _session2 = getSession();
        if (this.agent_forwarding) {
            new RequestAgentForwarding().request(_session2, this);
        }
        if (this.xforwading) {
            new RequestX11().request(_session2, this);
        }
        if (this.pty) {
            Request request = new RequestPtyReq();
            ((RequestPtyReq) request).setTType(this.ttype);
            ((RequestPtyReq) request).setTSize(this.tcol, this.trow, this.twp, this.thp);
            if (this.terminal_mode != null) {
                ((RequestPtyReq) request).setTerminalMode(this.terminal_mode);
            }
            request.request(_session2, this);
        }
        if (this.env != null) {
            Enumeration _env = this.env.keys();
            while (_env.hasMoreElements()) {
                Object name = _env.nextElement();
                Object value = this.env.get(name);
                Request request2 = new RequestEnv();
                ((RequestEnv) request2).setEnv(toByteArray(name), toByteArray(value));
                request2.request(_session2, this);
            }
        }
    }

    private byte[] toByteArray(Object o) {
        if (o instanceof String) {
            return Util.str2byte((String) o);
        }
        return (byte[]) o;
    }

    /* JADX WARN: Code restructure failed: missing block: B:16:0x005e, code lost:
    
        eof();
     */
    @Override // com.jcraft.jsch.Channel, java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void run() {
        /*
            Method dump skipped, instructions count: 199
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.jcraft.jsch.ChannelSession.run():void");
    }
}
