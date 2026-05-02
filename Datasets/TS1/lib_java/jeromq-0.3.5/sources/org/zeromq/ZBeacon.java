package org.zeromq;

import java.io.IOException;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.SocketAddress;
import java.net.UnknownHostException;
import java.nio.ByteBuffer;
import java.nio.channels.ClosedChannelException;
import java.nio.channels.DatagramChannel;
import java.util.Arrays;

/* loaded from: jeromq-0.3.5.jar:org/zeromq/ZBeacon.class */
public class ZBeacon {
    public static final long DEFAULT_BROADCAST_INTERVAL = 1000;
    public static final String DEFAULT_BROADCAST_HOST = "255.255.255.255";
    private final int port;
    private InetAddress broadcastInetAddress;
    private final BroadcastClient broadcastClient;
    private final BroadcastServer broadcastServer;
    private final byte[] beacon;
    private byte[] prefix;
    private long broadcastInterval;
    private Listener listener;

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZBeacon$Listener.class */
    public interface Listener {
        void onBeacon(InetAddress inetAddress, byte[] bArr);
    }

    public ZBeacon(int port, byte[] beacon) {
        this(DEFAULT_BROADCAST_HOST, port, beacon);
    }

    public ZBeacon(String host, int port, byte[] beacon) {
        this(host, port, beacon, true);
    }

    public ZBeacon(String host, int port, byte[] beacon, boolean ignoreLocalAddress) {
        this.prefix = new byte[0];
        this.broadcastInterval = 1000L;
        this.listener = null;
        this.port = port;
        this.beacon = beacon;
        try {
            this.broadcastInetAddress = InetAddress.getByName(host);
            this.broadcastServer = new BroadcastServer(ignoreLocalAddress);
            this.broadcastServer.setDaemon(true);
            this.broadcastClient = new BroadcastClient();
            this.broadcastClient.setDaemon(true);
        } catch (UnknownHostException unknownHostException) {
            throw new RuntimeException(unknownHostException);
        }
    }

    public void start() {
        if (this.listener != null) {
            this.broadcastServer.start();
        }
        this.broadcastClient.start();
    }

    public void stop() throws InterruptedException {
        if (this.broadcastClient != null) {
            this.broadcastClient.interrupt();
            this.broadcastClient.join();
        }
        if (this.broadcastServer != null) {
            this.broadcastServer.interrupt();
            this.broadcastServer.join();
        }
    }

    public void setPrefix(byte[] prefix) {
        this.prefix = prefix;
    }

    public byte[] getPrefix() {
        return this.prefix;
    }

    public void setListener(Listener listener) {
        this.listener = listener;
    }

    public Listener getListener() {
        return this.listener;
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZBeacon$BroadcastClient.class */
    private class BroadcastClient extends Thread {
        private DatagramChannel broadcastChannel;
        private final InetSocketAddress broadcastInetSocketAddress;

        public BroadcastClient() {
            this.broadcastInetSocketAddress = new InetSocketAddress(ZBeacon.this.broadcastInetAddress, ZBeacon.this.port);
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            try {
                try {
                    this.broadcastChannel = DatagramChannel.open();
                    this.broadcastChannel.socket().setBroadcast(true);
                    while (!interrupted()) {
                        try {
                            this.broadcastChannel.send(ByteBuffer.wrap(ZBeacon.this.beacon), this.broadcastInetSocketAddress);
                            Thread.sleep(ZBeacon.this.broadcastInterval);
                        } catch (InterruptedException e) {
                        } catch (Exception exception) {
                            throw new RuntimeException(exception);
                        }
                    }
                    try {
                        this.broadcastChannel.close();
                    } catch (IOException ioException) {
                        throw new RuntimeException(ioException);
                    }
                } catch (Throwable th) {
                    try {
                        this.broadcastChannel.close();
                        throw th;
                    } catch (IOException ioException2) {
                        throw new RuntimeException(ioException2);
                    }
                }
            } catch (IOException ioException3) {
                throw new RuntimeException(ioException3);
            }
        }
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZBeacon$BroadcastServer.class */
    private class BroadcastServer extends Thread {
        private DatagramChannel handle;
        private final boolean ignoreLocalAddress;

        public BroadcastServer(boolean ignoreLocalAddress) {
            this.ignoreLocalAddress = ignoreLocalAddress;
            try {
                this.handle = DatagramChannel.open();
                this.handle.configureBlocking(false);
                DatagramSocket sock = this.handle.socket();
                sock.setReuseAddress(true);
                sock.bind(new InetSocketAddress(InetAddress.getByAddress(new byte[]{0, 0, 0, 0}), ZBeacon.this.port));
            } catch (IOException ioException) {
                throw new RuntimeException(ioException);
            }
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            ByteBuffer buffer = ByteBuffer.allocate(65535);
            while (!interrupted()) {
                buffer.clear();
                try {
                    int read = buffer.remaining();
                    SocketAddress sender = this.handle.receive(buffer);
                    if (sender != null) {
                        InetAddress senderAddress = ((InetSocketAddress) sender).getAddress();
                        if (!this.ignoreLocalAddress || (!InetAddress.getLocalHost().getHostAddress().equals(senderAddress.getHostAddress()) && !senderAddress.isAnyLocalAddress() && !senderAddress.isLoopbackAddress())) {
                            int size = read - buffer.remaining();
                            handleMessage(buffer, size, senderAddress);
                        }
                    }
                } catch (ClosedChannelException e) {
                } catch (IOException ioException) {
                    throw new RuntimeException(ioException);
                }
            }
            this.handle.socket().close();
        }

        private void handleMessage(ByteBuffer buffer, int size, InetAddress from) {
            if (size < ZBeacon.this.prefix.length) {
                return;
            }
            byte[] bytes = buffer.array();
            for (int i = 0; i < ZBeacon.this.prefix.length; i++) {
                if (bytes[i] != ZBeacon.this.prefix[i]) {
                    return;
                }
            }
            ZBeacon.this.listener.onBeacon(from, Arrays.copyOf(bytes, size));
        }
    }

    public long getBroadcastInterval() {
        return this.broadcastInterval;
    }

    public void setBroadcastInterval(long broadcastInterval) {
        this.broadcastInterval = broadcastInterval;
    }
}
