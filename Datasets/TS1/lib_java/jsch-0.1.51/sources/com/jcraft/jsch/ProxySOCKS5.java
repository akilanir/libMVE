package com.jcraft.jsch;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/ProxySOCKS5.class */
public class ProxySOCKS5 implements Proxy {
    private static int DEFAULTPORT = 1080;
    private String proxy_host;
    private int proxy_port;
    private InputStream in;
    private OutputStream out;
    private Socket socket;
    private String user;
    private String passwd;

    public ProxySOCKS5(String proxy_host) {
        int port = DEFAULTPORT;
        String host = proxy_host;
        if (proxy_host.indexOf(58) != -1) {
            try {
                host = proxy_host.substring(0, proxy_host.indexOf(58));
                port = Integer.parseInt(proxy_host.substring(proxy_host.indexOf(58) + 1));
            } catch (Exception e) {
            }
        }
        this.proxy_host = host;
        this.proxy_port = port;
    }

    public ProxySOCKS5(String proxy_host, int proxy_port) {
        this.proxy_host = proxy_host;
        this.proxy_port = proxy_port;
    }

    public void setUserPasswd(String user, String passwd) {
        this.user = user;
        this.passwd = passwd;
    }

    @Override // com.jcraft.jsch.Proxy
    public void connect(SocketFactory socket_factory, String host, int port, int timeout) throws JSchException {
        try {
            if (socket_factory == null) {
                this.socket = Util.createSocket(this.proxy_host, this.proxy_port, timeout);
                this.in = this.socket.getInputStream();
                this.out = this.socket.getOutputStream();
            } else {
                this.socket = socket_factory.createSocket(this.proxy_host, this.proxy_port);
                this.in = socket_factory.getInputStream(this.socket);
                this.out = socket_factory.getOutputStream(this.socket);
            }
            if (timeout > 0) {
                this.socket.setSoTimeout(timeout);
            }
            this.socket.setTcpNoDelay(true);
            byte[] buf = new byte[1024];
            int index = 0 + 1;
            buf[0] = 5;
            int index2 = index + 1;
            buf[index] = 2;
            int index3 = index2 + 1;
            buf[index2] = 0;
            buf[index3] = 2;
            this.out.write(buf, 0, index3 + 1);
            fill(this.in, buf, 2);
            boolean check = false;
            switch (buf[1] & 255) {
                case 0:
                    check = true;
                    break;
                case 2:
                    if (this.user != null && this.passwd != null) {
                        int index4 = 0 + 1;
                        buf[0] = 1;
                        int index5 = index4 + 1;
                        buf[index4] = (byte) this.user.length();
                        System.arraycopy(Util.str2byte(this.user), 0, buf, index5, this.user.length());
                        int index6 = index5 + this.user.length();
                        int index7 = index6 + 1;
                        buf[index6] = (byte) this.passwd.length();
                        System.arraycopy(Util.str2byte(this.passwd), 0, buf, index7, this.passwd.length());
                        this.out.write(buf, 0, index7 + this.passwd.length());
                        fill(this.in, buf, 2);
                        if (buf[1] == 0) {
                            check = true;
                            break;
                        }
                    }
                    break;
            }
            if (!check) {
                try {
                    this.socket.close();
                } catch (Exception e) {
                }
                throw new JSchException("fail in SOCKS5 proxy");
            }
            int index8 = 0 + 1;
            buf[0] = 5;
            int index9 = index8 + 1;
            buf[index8] = 1;
            int index10 = index9 + 1;
            buf[index9] = 0;
            byte[] hostb = Util.str2byte(host);
            int len = hostb.length;
            int index11 = index10 + 1;
            buf[index10] = 3;
            int index12 = index11 + 1;
            buf[index11] = (byte) len;
            System.arraycopy(hostb, 0, buf, index12, len);
            int index13 = index12 + len;
            int index14 = index13 + 1;
            buf[index13] = (byte) (port >>> 8);
            buf[index14] = (byte) (port & 255);
            this.out.write(buf, 0, index14 + 1);
            fill(this.in, buf, 4);
            if (buf[1] != 0) {
                try {
                    this.socket.close();
                } catch (Exception e2) {
                }
                throw new JSchException("ProxySOCKS5: server returns " + ((int) buf[1]));
            }
            switch (buf[3] & 255) {
                case 1:
                    fill(this.in, buf, 6);
                    break;
                case 3:
                    fill(this.in, buf, 1);
                    fill(this.in, buf, (buf[0] & 255) + 2);
                    break;
                case 4:
                    fill(this.in, buf, 18);
                    break;
            }
        } catch (RuntimeException e3) {
            throw e3;
        } catch (Exception e4) {
            try {
                if (this.socket != null) {
                    this.socket.close();
                }
            } catch (Exception e5) {
            }
            String message = "ProxySOCKS5: " + e4.toString();
            if (e4 instanceof Throwable) {
                throw new JSchException(message, e4);
            }
            throw new JSchException(message);
        }
    }

    @Override // com.jcraft.jsch.Proxy
    public InputStream getInputStream() {
        return this.in;
    }

    @Override // com.jcraft.jsch.Proxy
    public OutputStream getOutputStream() {
        return this.out;
    }

    @Override // com.jcraft.jsch.Proxy
    public Socket getSocket() {
        return this.socket;
    }

    @Override // com.jcraft.jsch.Proxy
    public void close() {
        try {
            if (this.in != null) {
                this.in.close();
            }
            if (this.out != null) {
                this.out.close();
            }
            if (this.socket != null) {
                this.socket.close();
            }
        } catch (Exception e) {
        }
        this.in = null;
        this.out = null;
        this.socket = null;
    }

    public static int getDefaultPort() {
        return DEFAULTPORT;
    }

    private void fill(InputStream in, byte[] buf, int len) throws JSchException, IOException {
        int i = 0;
        while (true) {
            int s = i;
            if (s < len) {
                int i2 = in.read(buf, s, len - s);
                if (i2 <= 0) {
                    throw new JSchException("ProxySOCKS5: stream is closed");
                }
                i = s + i2;
            } else {
                return;
            }
        }
    }
}
