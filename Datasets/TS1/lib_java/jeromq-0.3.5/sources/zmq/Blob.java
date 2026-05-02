package zmq;

import java.util.Arrays;

/* loaded from: jeromq-0.3.5.jar:zmq/Blob.class */
public class Blob {
    private final byte[] buf;

    private Blob(byte[] data) {
        this.buf = data;
    }

    public static Blob createBlob(byte[] data, boolean copy) {
        if (copy) {
            byte[] b = new byte[data.length];
            System.arraycopy(data, 0, b, 0, data.length);
            return new Blob(b);
        }
        return new Blob(data);
    }

    public int size() {
        return this.buf.length;
    }

    public byte[] data() {
        return this.buf;
    }

    public boolean equals(Object t) {
        if (t instanceof Blob) {
            return Arrays.equals(this.buf, ((Blob) t).buf);
        }
        return false;
    }

    public int hashCode() {
        return Arrays.hashCode(this.buf);
    }
}
