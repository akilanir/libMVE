package com.jcraft.jsch;

import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/ChannelDirectTCPIP.class */
public class ChannelDirectTCPIP extends Channel {
    private static final int LOCAL_WINDOW_SIZE_MAX = 131072;
    private static final int LOCAL_MAXIMUM_PACKET_SIZE = 16384;
    private static final byte[] _type = Util.str2byte("direct-tcpip");
    String host;
    int port;
    String originator_IP_address = "127.0.0.1";
    int originator_port = 0;

    ChannelDirectTCPIP() {
        this.type = _type;
        setLocalWindowSizeMax(LOCAL_WINDOW_SIZE_MAX);
        setLocalWindowSize(LOCAL_WINDOW_SIZE_MAX);
        setLocalPacketSize(LOCAL_MAXIMUM_PACKET_SIZE);
    }

    @Override // com.jcraft.jsch.Channel
    void init() {
        this.io = new IO();
    }

    @Override // com.jcraft.jsch.Channel
    public void connect(int connectTimeout) throws JSchException {
        this.connectTimeout = connectTimeout;
        try {
            Session _session = getSession();
            if (!_session.isConnected()) {
                throw new JSchException("session is down");
            }
            if (this.io.in != null) {
                this.thread = new Thread(this);
                this.thread.setName("DirectTCPIP thread " + _session.getHost());
                if (_session.daemon_thread) {
                    this.thread.setDaemon(_session.daemon_thread);
                }
                this.thread.start();
            } else {
                sendChannelOpen();
            }
        } catch (Exception e) {
            this.io.close();
            this.io = null;
            Channel.del(this);
            if (e instanceof JSchException) {
                throw ((JSchException) e);
            }
        }
    }

    @Override // com.jcraft.jsch.Channel, java.lang.Runnable
    public void run() {
        try {
            sendChannelOpen();
            Buffer buf = new Buffer(this.rmpsize);
            Packet packet = new Packet(buf);
            Session _session = getSession();
            while (true) {
                if (isConnected() && this.thread != null && this.io != null && this.io.in != null) {
                    int i = this.io.in.read(buf.buffer, 14, (buf.buffer.length - 14) - 84);
                    if (i <= 0) {
                        eof();
                        break;
                    }
                    packet.reset();
                    buf.putByte((byte) 94);
                    buf.putInt(this.recipient);
                    buf.putInt(i);
                    buf.skip(i);
                    synchronized (this) {
                        if (this.close) {
                            break;
                        } else {
                            _session.write(packet, this, i);
                        }
                    }
                    break;
                }
                break;
            }
            eof();
            disconnect();
        } catch (Exception e) {
            if (!this.connected) {
                this.connected = true;
            }
            disconnect();
        }
    }

    @Override // com.jcraft.jsch.Channel
    public void setInputStream(InputStream in) {
        this.io.setInputStream(in);
    }

    @Override // com.jcraft.jsch.Channel
    public void setOutputStream(OutputStream out) {
        this.io.setOutputStream(out);
    }

    public void setHost(String host) {
        this.host = host;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public void setOrgIPAddress(String foo) {
        this.originator_IP_address = foo;
    }

    public void setOrgPort(int foo) {
        this.originator_port = foo;
    }

    @Override // com.jcraft.jsch.Channel
    protected Packet genChannelOpenPacket() {
        Buffer buf = new Buffer(50 + this.host.length() + this.originator_IP_address.length() + 84);
        Packet packet = new Packet(buf);
        packet.reset();
        buf.putByte((byte) 90);
        buf.putString(this.type);
        buf.putInt(this.id);
        buf.putInt(this.lwsize);
        buf.putInt(this.lmpsize);
        buf.putString(Util.str2byte(this.host));
        buf.putInt(this.port);
        buf.putString(Util.str2byte(this.originator_IP_address));
        buf.putInt(this.originator_port);
        return packet;
    }
}
