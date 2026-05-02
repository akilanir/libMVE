package com.jcraft.jsch;

import java.util.Hashtable;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/ChannelShell.class */
public class ChannelShell extends ChannelSession {
    @Override // com.jcraft.jsch.ChannelSession, com.jcraft.jsch.Channel, java.lang.Runnable
    public /* bridge */ /* synthetic */ void run() {
        super.run();
    }

    @Override // com.jcraft.jsch.ChannelSession
    public /* bridge */ /* synthetic */ void setPtyType(String x0, int x1, int x2, int x3, int x4) {
        super.setPtyType(x0, x1, x2, x3, x4);
    }

    @Override // com.jcraft.jsch.ChannelSession
    public /* bridge */ /* synthetic */ void setPtyType(String x0) {
        super.setPtyType(x0);
    }

    @Override // com.jcraft.jsch.ChannelSession
    public /* bridge */ /* synthetic */ void setPtySize(int x0, int x1, int x2, int x3) {
        super.setPtySize(x0, x1, x2, x3);
    }

    @Override // com.jcraft.jsch.ChannelSession
    public /* bridge */ /* synthetic */ void setTerminalMode(byte[] x0) {
        super.setTerminalMode(x0);
    }

    @Override // com.jcraft.jsch.ChannelSession
    public /* bridge */ /* synthetic */ void setPty(boolean x0) {
        super.setPty(x0);
    }

    @Override // com.jcraft.jsch.ChannelSession
    public /* bridge */ /* synthetic */ void setEnv(byte[] x0, byte[] x1) {
        super.setEnv(x0, x1);
    }

    @Override // com.jcraft.jsch.ChannelSession
    public /* bridge */ /* synthetic */ void setEnv(String x0, String x1) {
        super.setEnv(x0, x1);
    }

    @Override // com.jcraft.jsch.ChannelSession
    public /* bridge */ /* synthetic */ void setEnv(Hashtable x0) {
        super.setEnv(x0);
    }

    @Override // com.jcraft.jsch.ChannelSession, com.jcraft.jsch.Channel
    public /* bridge */ /* synthetic */ void setXForwarding(boolean x0) {
        super.setXForwarding(x0);
    }

    @Override // com.jcraft.jsch.ChannelSession
    public /* bridge */ /* synthetic */ void setAgentForwarding(boolean x0) {
        super.setAgentForwarding(x0);
    }

    ChannelShell() {
        this.pty = true;
    }

    @Override // com.jcraft.jsch.Channel
    public void start() throws JSchException {
        Session _session = getSession();
        try {
            sendRequests();
            Request request = new RequestShell();
            request.request(_session, this);
            if (this.io.in != null) {
                this.thread = new Thread(this);
                this.thread.setName("Shell for " + _session.host);
                if (_session.daemon_thread) {
                    this.thread.setDaemon(_session.daemon_thread);
                }
                this.thread.start();
            }
        } catch (Exception e) {
            if (e instanceof JSchException) {
                throw ((JSchException) e);
            }
            if (e instanceof Throwable) {
                throw new JSchException("ChannelShell", e);
            }
            throw new JSchException("ChannelShell");
        }
    }

    @Override // com.jcraft.jsch.Channel
    void init() throws JSchException {
        this.io.setInputStream(getSession().in);
        this.io.setOutputStream(getSession().out);
    }
}
