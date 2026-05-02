package ch.qos.logback.core.encoder;

import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import java.util.List;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/encoder/EventObjectInputStream.class */
public class EventObjectInputStream<E> extends InputStream {
    NonClosableInputStream ncis;
    List<E> buffer = new ArrayList();
    int index = 0;

    EventObjectInputStream(InputStream inputStream) throws IOException {
        this.ncis = new NonClosableInputStream(inputStream);
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        throw new UnsupportedOperationException("Only the readEvent method is supported.");
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        return this.ncis.available();
    }

    public E readEvent() throws IOException {
        E fromBuffer = getFromBuffer();
        if (fromBuffer != null) {
            return fromBuffer;
        }
        internalReset();
        int readHeader = readHeader();
        if (readHeader == -1) {
            return null;
        }
        readPayload(readHeader);
        readFooter(readHeader);
        return getFromBuffer();
    }

    private void internalReset() {
        this.index = 0;
        this.buffer.clear();
    }

    E getFromBuffer() {
        if (this.index >= this.buffer.size()) {
            return null;
        }
        List<E> list = this.buffer;
        int i = this.index;
        this.index = i + 1;
        return list.get(i);
    }

    int readHeader() throws IOException {
        byte[] bArr = new byte[16];
        if (this.ncis.read(bArr) == -1) {
            return -1;
        }
        if (ByteArrayUtil.readInt(bArr, 0) != 1853421169) {
            throw new IllegalStateException("Does not look like data created by ObjectStreamEncoder");
        }
        int i = 0 + 4;
        int readInt = ByteArrayUtil.readInt(bArr, i);
        if (ByteArrayUtil.readInt(bArr, i + 4 + 4) != (1853421169 ^ readInt)) {
            throw new IllegalStateException("Invalid checksum");
        }
        return readInt;
    }

    /* JADX WARN: Multi-variable type inference failed */
    E readEvents(ObjectInputStream objectInputStream) throws IOException {
        Object obj = null;
        try {
            obj = objectInputStream.readObject();
            this.buffer.add(obj);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return (E) obj;
    }

    void readFooter(int i) throws IOException {
        byte[] bArr = new byte[8];
        if (this.ncis.read(bArr) == -1) {
            throw new IllegalStateException("Looks like a corrupt stream");
        }
        if (ByteArrayUtil.readInt(bArr, 0) != 640373619) {
            throw new IllegalStateException("Looks like a corrupt stream");
        }
        if (ByteArrayUtil.readInt(bArr, 0 + 4) != (640373619 ^ i)) {
            throw new IllegalStateException("Invalid checksum");
        }
    }

    void readPayload(int i) throws IOException {
        ArrayList arrayList = new ArrayList(i);
        ObjectInputStream objectInputStream = new ObjectInputStream(this.ncis);
        for (int i2 = 0; i2 < i; i2++) {
            arrayList.add(readEvents(objectInputStream));
        }
        objectInputStream.close();
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.ncis.realClose();
    }
}
