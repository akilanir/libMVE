package org.zeromq;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Arrays;
import org.zeromq.ZMQ;

/* loaded from: jeromq-0.3.5.jar:org/zeromq/ZFrame.class */
public class ZFrame {
    public static final int MORE = 2;
    public static final int REUSE = 128;
    public static final int DONTWAIT = 1;
    private boolean more;
    private byte[] data;

    protected ZFrame() {
    }

    public ZFrame(byte[] data) {
        if (data != null) {
            this.data = data;
        }
    }

    public ZFrame(String data) {
        if (data != null) {
            this.data = data.getBytes(ZMQ.CHARSET);
        }
    }

    public void destroy() {
        if (hasData()) {
            this.data = null;
        }
    }

    public byte[] getData() {
        return this.data;
    }

    public boolean hasMore() {
        return this.more;
    }

    public int size() {
        if (hasData()) {
            return this.data.length;
        }
        return 0;
    }

    public boolean hasData() {
        return this.data != null;
    }

    public boolean send(ZMQ.Socket socket, int flags) {
        if (socket == null) {
            throw new IllegalArgumentException("socket parameter must be set");
        }
        return socket.send(this.data, flags);
    }

    public boolean sendAndKeep(ZMQ.Socket socket, int flags) {
        return send(socket, flags);
    }

    public boolean sendAndKeep(ZMQ.Socket socket) {
        return sendAndKeep(socket, 0);
    }

    public boolean sendAndDestroy(ZMQ.Socket socket, int flags) {
        boolean ret = send(socket, flags);
        if (ret) {
            destroy();
        }
        return ret;
    }

    public boolean sendAndDestroy(ZMQ.Socket socket) {
        return sendAndDestroy(socket, 0);
    }

    public ZFrame duplicate() {
        return new ZFrame(this.data);
    }

    public boolean hasSameData(ZFrame other) {
        if (other != null && size() == other.size()) {
            return Arrays.equals(this.data, other.data);
        }
        return false;
    }

    public void reset(String data) {
        this.data = data.getBytes(ZMQ.CHARSET);
    }

    public void reset(byte[] data) {
        this.data = data;
    }

    public String strhex() {
        StringBuilder b = new StringBuilder();
        byte[] arr$ = this.data;
        for (byte aData : arr$) {
            int b1 = (aData >>> 4) & 15;
            int b2 = aData & 15;
            b.append("0123456789ABCDEF".charAt(b1));
            b.append("0123456789ABCDEF".charAt(b2));
        }
        return b.toString();
    }

    public boolean streq(String str) {
        return hasData() && new String(this.data, ZMQ.CHARSET).compareTo(str) == 0;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ZFrame zFrame = (ZFrame) o;
        return Arrays.equals(this.data, zFrame.data);
    }

    public int hashCode() {
        return Arrays.hashCode(this.data);
    }

    public String toString() {
        if (!hasData()) {
            return "";
        }
        boolean isText = true;
        byte[] arr$ = this.data;
        int len$ = arr$.length;
        int i$ = 0;
        while (true) {
            if (i$ >= len$) {
                break;
            }
            byte aData = arr$[i$];
            if (aData >= 32) {
                i$++;
            } else {
                isText = false;
                break;
            }
        }
        if (isText) {
            return new String(this.data, ZMQ.CHARSET);
        }
        return strhex();
    }

    private byte[] recv(ZMQ.Socket socket, int flags) {
        if (socket == null) {
            throw new IllegalArgumentException("socket parameter must not be null");
        }
        this.data = socket.recv(flags);
        this.more = socket.hasReceiveMore();
        return this.data;
    }

    public static ZFrame recvFrame(ZMQ.Socket socket) {
        return recvFrame(socket, 0);
    }

    public static ZFrame recvFrame(ZMQ.Socket socket, int flags) {
        ZFrame f = new ZFrame();
        byte[] data = f.recv(socket, flags);
        if (data == null) {
            return null;
        }
        return f;
    }

    public void print(String prefix) {
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        if (prefix != null) {
            pw.printf("%s", prefix);
        }
        byte[] data = getData();
        int size = size();
        boolean isBin = false;
        for (int charNbr = 0; charNbr < size; charNbr++) {
            if (data[charNbr] < 9 || data[charNbr] > Byte.MAX_VALUE) {
                isBin = true;
            }
        }
        pw.printf("[%03d] ", Integer.valueOf(size));
        int maxSize = isBin ? 35 : 70;
        String elipsis = "";
        if (size > maxSize) {
            size = maxSize;
            elipsis = "...";
        }
        for (int charNbr2 = 0; charNbr2 < size; charNbr2++) {
            if (isBin) {
                pw.printf("%02X", Byte.valueOf(data[charNbr2]));
            } else {
                pw.printf("%c", Byte.valueOf(data[charNbr2]));
            }
        }
        pw.printf("%s\n", elipsis);
        pw.flush();
        pw.close();
        try {
            sw.close();
        } catch (IOException e) {
        }
        System.out.print(sw.toString());
    }
}
