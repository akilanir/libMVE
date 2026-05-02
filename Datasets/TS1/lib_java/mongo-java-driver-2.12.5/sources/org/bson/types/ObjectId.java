package org.bson.types;

import java.io.Serializable;
import java.lang.management.ManagementFactory;
import java.net.NetworkInterface;
import java.nio.ByteBuffer;
import java.util.Date;
import java.util.Enumeration;
import java.util.Random;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: mongo-java-driver-2.12.5.jar:org/bson/types/ObjectId.class */
public class ObjectId implements Comparable<ObjectId>, Serializable {
    private static final long serialVersionUID = -4415279469780082174L;
    final int _time;
    final int _machine;
    final int _inc;
    boolean _new;
    private static final int _genmachine;
    static final Logger LOGGER = Logger.getLogger("org.bson.ObjectId");
    private static AtomicInteger _nextInc = new AtomicInteger(new Random().nextInt());

    static {
        int machinePiece;
        try {
            try {
                StringBuilder sb = new StringBuilder();
                Enumeration<NetworkInterface> e = NetworkInterface.getNetworkInterfaces();
                while (e.hasMoreElements()) {
                    NetworkInterface ni = e.nextElement();
                    sb.append(ni.toString());
                }
                machinePiece = sb.toString().hashCode() << 16;
            } catch (Throwable e2) {
                LOGGER.log(Level.WARNING, e2.getMessage(), e2);
                machinePiece = new Random().nextInt() << 16;
            }
            LOGGER.fine("machine piece post: " + Integer.toHexString(machinePiece));
            int processId = new Random().nextInt();
            try {
                processId = ManagementFactory.getRuntimeMXBean().getName().hashCode();
            } catch (Throwable th) {
            }
            ClassLoader loader = ObjectId.class.getClassLoader();
            int loaderId = loader != null ? System.identityHashCode(loader) : 0;
            int processPiece = (Integer.toHexString(processId) + Integer.toHexString(loaderId)).hashCode() & 65535;
            LOGGER.fine(new StringBuilder().append("process piece: ").append(Integer.toHexString(processPiece)).toString());
            _genmachine = machinePiece | processPiece;
            LOGGER.fine(new StringBuilder().append("machine : ").append(Integer.toHexString(_genmachine)).toString());
        } catch (Exception e3) {
            throw new RuntimeException(e3);
        }
    }

    public static ObjectId get() {
        return new ObjectId();
    }

    public static ObjectId createFromLegacyFormat(int time, int machine, int inc) {
        return new ObjectId(time, machine, inc);
    }

    public static boolean isValid(String s) {
        int len;
        if (s == null || (len = s.length()) != 24) {
            return false;
        }
        for (int i = 0; i < len; i++) {
            char c = s.charAt(i);
            if ((c < '0' || c > '9') && ((c < 'a' || c > 'f') && (c < 'A' || c > 'F'))) {
                return false;
            }
        }
        return true;
    }

    @Deprecated
    public static ObjectId massageToObjectId(Object o) {
        if (o == null) {
            return null;
        }
        if (o instanceof ObjectId) {
            return (ObjectId) o;
        }
        if (o instanceof String) {
            String s = o.toString();
            if (isValid(s)) {
                return new ObjectId(s);
            }
            return null;
        }
        return null;
    }

    public ObjectId(Date time) {
        this(time, _genmachine, _nextInc.getAndIncrement());
    }

    public ObjectId(Date time, int inc) {
        this(time, _genmachine, inc);
    }

    @Deprecated
    public ObjectId(Date time, int machine, int inc) {
        this._time = (int) (time.getTime() / 1000);
        this._machine = machine;
        this._inc = inc;
        this._new = false;
    }

    public ObjectId(String s) {
        this(s, false);
    }

    @Deprecated
    public ObjectId(String s, boolean babble) {
        if (!isValid(s)) {
            throw new IllegalArgumentException("invalid ObjectId [" + s + "]");
        }
        s = babble ? babbleToMongod(s) : s;
        byte[] b = new byte[12];
        for (int i = 0; i < b.length; i++) {
            b[i] = (byte) Integer.parseInt(s.substring(i * 2, (i * 2) + 2), 16);
        }
        ByteBuffer bb = ByteBuffer.wrap(b);
        this._time = bb.getInt();
        this._machine = bb.getInt();
        this._inc = bb.getInt();
        this._new = false;
    }

    public ObjectId(byte[] b) {
        if (b.length != 12) {
            throw new IllegalArgumentException("need 12 bytes");
        }
        ByteBuffer bb = ByteBuffer.wrap(b);
        this._time = bb.getInt();
        this._machine = bb.getInt();
        this._inc = bb.getInt();
        this._new = false;
    }

    @Deprecated
    public ObjectId(int time, int machine, int inc) {
        this._time = time;
        this._machine = machine;
        this._inc = inc;
        this._new = false;
    }

    public ObjectId() {
        this._time = (int) (System.currentTimeMillis() / 1000);
        this._machine = _genmachine;
        this._inc = _nextInc.getAndIncrement();
        this._new = true;
    }

    public int hashCode() {
        int x = this._time;
        return x + (this._machine * 111) + (this._inc * 17);
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        ObjectId other = massageToObjectId(o);
        return other != null && this._time == other._time && this._machine == other._machine && this._inc == other._inc;
    }

    @Deprecated
    public String toStringBabble() {
        return babbleToMongod(toStringMongod());
    }

    public String toHexString() {
        StringBuilder buf = new StringBuilder(24);
        byte[] arr$ = toByteArray();
        for (byte b : arr$) {
            buf.append(String.format("%02x", Integer.valueOf(b & 255)));
        }
        return buf.toString();
    }

    @Deprecated
    public String toStringMongod() {
        byte[] b = toByteArray();
        StringBuilder buf = new StringBuilder(24);
        for (byte b2 : b) {
            int x = b2 & 255;
            String s = Integer.toHexString(x);
            if (s.length() == 1) {
                buf.append("0");
            }
            buf.append(s);
        }
        return buf.toString();
    }

    public byte[] toByteArray() {
        byte[] b = new byte[12];
        ByteBuffer bb = ByteBuffer.wrap(b);
        bb.putInt(this._time);
        bb.putInt(this._machine);
        bb.putInt(this._inc);
        return b;
    }

    static String _pos(String s, int p) {
        return s.substring(p * 2, (p * 2) + 2);
    }

    @Deprecated
    public static String babbleToMongod(String b) {
        if (!isValid(b)) {
            throw new IllegalArgumentException("invalid object id: " + b);
        }
        StringBuilder buf = new StringBuilder(24);
        for (int i = 7; i >= 0; i--) {
            buf.append(_pos(b, i));
        }
        for (int i2 = 11; i2 >= 8; i2--) {
            buf.append(_pos(b, i2));
        }
        return buf.toString();
    }

    public String toString() {
        return toStringMongod();
    }

    int _compareUnsigned(int i, int j) {
        long li = i & 4294967295L;
        long lj = j & 4294967295L;
        long diff = li - lj;
        if (diff < -2147483648L) {
            return Integer.MIN_VALUE;
        }
        if (diff > 2147483647L) {
            return Integer.MAX_VALUE;
        }
        return (int) diff;
    }

    @Override // java.lang.Comparable
    public int compareTo(ObjectId id) {
        if (id == null) {
            return -1;
        }
        int x = _compareUnsigned(this._time, id._time);
        if (x != 0) {
            return x;
        }
        int x2 = _compareUnsigned(this._machine, id._machine);
        if (x2 != 0) {
            return x2;
        }
        return _compareUnsigned(this._inc, id._inc);
    }

    public int getTimestamp() {
        return this._time;
    }

    public Date getDate() {
        return new Date(this._time * 1000);
    }

    @Deprecated
    public long getTime() {
        return this._time * 1000;
    }

    @Deprecated
    public int getTimeSecond() {
        return this._time;
    }

    @Deprecated
    public int getInc() {
        return this._inc;
    }

    @Deprecated
    public int _time() {
        return this._time;
    }

    @Deprecated
    public int getMachine() {
        return this._machine;
    }

    @Deprecated
    public int _machine() {
        return this._machine;
    }

    @Deprecated
    public int _inc() {
        return this._inc;
    }

    @Deprecated
    public boolean isNew() {
        return this._new;
    }

    @Deprecated
    public void notNew() {
        this._new = false;
    }

    @Deprecated
    public static int getGenMachineId() {
        return _genmachine;
    }

    public static int getCurrentCounter() {
        return _nextInc.get();
    }

    @Deprecated
    public static int getCurrentInc() {
        return _nextInc.get();
    }

    @Deprecated
    public static int _flip(int x) {
        int z = 0 | ((x << 24) & (-16777216));
        return z | ((x << 8) & 16711680) | ((x >> 8) & 65280) | ((x >> 24) & 255);
    }
}
