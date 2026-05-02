package zmq;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Array;
import java.net.Socket;
import java.net.SocketException;
import java.nio.ByteBuffer;
import java.nio.channels.SelectableChannel;
import java.nio.channels.SocketChannel;
import java.security.SecureRandom;
import java.util.List;

/* loaded from: jeromq-0.3.5.jar:zmq/Utils.class */
class Utils {
    private static SecureRandom random = new SecureRandom();

    private Utils() {
    }

    public static int generateRandom() {
        return random.nextInt();
    }

    public static void tuneTcpSocket(SocketChannel ch) throws SocketException {
        tuneTcpSocket(ch.socket());
    }

    public static void tuneTcpSocket(Socket fd) throws SocketException {
        try {
            fd.setTcpNoDelay(true);
        } catch (SocketException e) {
        }
    }

    public static void tuneTcpKeepalives(SocketChannel ch, int tcpKeepalive, int tcpKeepaliveCnt, int tcpKeepaliveIdle, int tcpKeepaliveIntvl) throws SocketException {
        tuneTcpKeepalives(ch.socket(), tcpKeepalive, tcpKeepaliveCnt, tcpKeepaliveIdle, tcpKeepaliveIntvl);
    }

    public static void tuneTcpKeepalives(Socket fd, int tcpKeepalive, int tcpKeepaliveCnt, int tcpKeepaliveIdle, int tcpKeepaliveIntvl) throws SocketException {
        if (tcpKeepalive == 1) {
            fd.setKeepAlive(true);
        } else if (tcpKeepalive == 0) {
            fd.setKeepAlive(false);
        }
    }

    public static void unblockSocket(SelectableChannel s) throws IOException {
        s.configureBlocking(false);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v14, types: [java.lang.Object[]] */
    /* JADX WARN: Type inference failed for: r0v6, types: [java.lang.Object[]] */
    public static <T> T[] realloc(Class<T> klass, T[] src, int size, boolean ended) {
        T[] dest;
        if (size > src.length) {
            dest = (Object[]) Array.newInstance((Class<?>) klass, size);
            if (ended) {
                System.arraycopy(src, 0, dest, 0, src.length);
            } else {
                System.arraycopy(src, 0, dest, size - src.length, src.length);
            }
        } else if (size < src.length) {
            dest = (Object[]) Array.newInstance((Class<?>) klass, size);
            if (ended) {
                System.arraycopy(src, src.length - size, dest, 0, size);
            } else {
                System.arraycopy(src, 0, dest, 0, size);
            }
        } else {
            dest = src;
        }
        return dest;
    }

    public static <T> void swap(List<T> items, int index1, int index2) {
        if (index1 == index2) {
            return;
        }
        T item1 = items.get(index1);
        T item2 = items.get(index2);
        if (item1 != null) {
            items.set(index2, item1);
        }
        if (item2 != null) {
            items.set(index1, item2);
        }
    }

    public static byte[] bytes(ByteBuffer buf) {
        byte[] d = new byte[buf.limit()];
        buf.get(d);
        return d;
    }

    public static byte[] realloc(byte[] src, int size) {
        byte[] dest = new byte[size];
        if (src != null) {
            System.arraycopy(src, 0, dest, 0, src.length);
        }
        return dest;
    }

    public static boolean delete(File path) {
        File[] files;
        if (!path.exists()) {
            return false;
        }
        boolean ret = true;
        if (path.isDirectory() && (files = path.listFiles()) != null) {
            for (File f : files) {
                ret = ret && delete(f);
            }
        }
        return ret && path.delete();
    }
}
