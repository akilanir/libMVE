package org.msgpack.io;

import java.io.EOFException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.NoSuchElementException;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/io/LinkedBufferInput.class */
public class LinkedBufferInput extends AbstractInput {
    private int nextAdvance;
    private final int bufferSize;
    LinkedList<ByteBuffer> link = new LinkedList<>();
    int writable = -1;
    private byte[] tmpBuffer = new byte[8];
    private ByteBuffer tmpByteBuffer = ByteBuffer.wrap(this.tmpBuffer);

    @Override // org.msgpack.io.AbstractInput, org.msgpack.io.Input
    public /* bridge */ /* synthetic */ void resetReadByteCount() {
        super.resetReadByteCount();
    }

    @Override // org.msgpack.io.AbstractInput, org.msgpack.io.Input
    public /* bridge */ /* synthetic */ int getReadByteCount() {
        return super.getReadByteCount();
    }

    public LinkedBufferInput(int bufferSize) {
        this.bufferSize = bufferSize;
    }

    @Override // org.msgpack.io.Input
    public int read(byte[] b, int off, int len) throws EOFException {
        ByteBuffer bb;
        if (this.link.isEmpty()) {
            return 0;
        }
        do {
            bb = this.link.getFirst();
            if (len < bb.remaining()) {
                bb.get(b, off, len);
                incrReadByteCount(len);
                return len;
            }
            int rem = bb.remaining();
            bb.get(b, off, rem);
            incrReadByteCount(rem);
            len -= rem;
            off += rem;
        } while (removeFirstLink(bb));
        return len - len;
    }

    @Override // org.msgpack.io.Input
    public boolean tryRefer(BufferReferer ref, int len) throws IOException {
        ByteBuffer bb = null;
        try {
            bb = this.link.getFirst();
        } catch (NoSuchElementException e) {
        }
        if (bb == null) {
            throw new EndOfBufferException();
        }
        if (bb.remaining() < len) {
            return false;
        }
        boolean success = false;
        int pos = bb.position();
        int lim = bb.limit();
        try {
            bb.limit(pos + len);
            ref.refer(bb, true);
            incrReadByteCount(len);
            success = true;
            bb.limit(lim);
            if (1 != 0) {
                bb.position(pos + len);
            } else {
                bb.position(pos);
            }
            if (bb.remaining() == 0) {
                removeFirstLink(bb);
                return true;
            }
            return true;
        } catch (Throwable th) {
            bb.limit(lim);
            if (success) {
                bb.position(pos + len);
            } else {
                bb.position(pos);
            }
            if (bb.remaining() == 0) {
                removeFirstLink(bb);
            }
            throw th;
        }
    }

    @Override // org.msgpack.io.Input
    public byte readByte() throws EOFException {
        ByteBuffer bb = null;
        try {
            bb = this.link.getFirst();
        } catch (NoSuchElementException e) {
        }
        if (bb == null || bb.remaining() == 0) {
            throw new EndOfBufferException();
        }
        byte result = bb.get();
        incrReadOneByteCount();
        if (bb.remaining() == 0) {
            removeFirstLink(bb);
        }
        return result;
    }

    @Override // org.msgpack.io.Input
    public void advance() {
        if (this.link.isEmpty()) {
            return;
        }
        int len = this.nextAdvance;
        while (true) {
            ByteBuffer bb = this.link.getFirst();
            if (len < bb.remaining()) {
                bb.position(bb.position() + len);
                break;
            }
            len -= bb.remaining();
            bb.position(bb.position() + bb.remaining());
            if (!removeFirstLink(bb)) {
                break;
            }
        }
        incrReadByteCount(this.nextAdvance);
        this.nextAdvance = 0;
    }

    private boolean removeFirstLink(ByteBuffer first) {
        if (this.link.size() == 1) {
            if (this.writable >= 0) {
                first.position(0);
                first.limit(0);
                this.writable = first.capacity();
                return false;
            }
            this.link.removeFirst();
            return false;
        }
        this.link.removeFirst();
        return true;
    }

    private void requireMore(int n) throws EOFException {
        int off = 0;
        Iterator i$ = this.link.iterator();
        while (i$.hasNext()) {
            ByteBuffer bb = i$.next();
            if (n <= bb.remaining()) {
                int pos = bb.position();
                bb.get(this.tmpBuffer, off, n);
                bb.position(pos);
                return;
            } else {
                int rem = bb.remaining();
                int pos2 = bb.position();
                bb.get(this.tmpBuffer, off, rem);
                bb.position(pos2);
                n -= rem;
                off += rem;
            }
        }
        throw new EndOfBufferException();
    }

    private ByteBuffer require(int n) throws EOFException {
        ByteBuffer bb = null;
        try {
            bb = this.link.getFirst();
        } catch (NoSuchElementException e) {
        }
        if (bb == null) {
            throw new EndOfBufferException();
        }
        if (n <= bb.remaining()) {
            this.nextAdvance = n;
            return bb;
        }
        requireMore(n);
        this.nextAdvance = n;
        return this.tmpByteBuffer;
    }

    @Override // org.msgpack.io.Input
    public byte getByte() throws EOFException {
        ByteBuffer bb = require(1);
        return bb.get(bb.position());
    }

    @Override // org.msgpack.io.Input
    public short getShort() throws EOFException {
        ByteBuffer bb = require(2);
        return bb.getShort(bb.position());
    }

    @Override // org.msgpack.io.Input
    public int getInt() throws EOFException {
        ByteBuffer bb = require(4);
        return bb.getInt(bb.position());
    }

    @Override // org.msgpack.io.Input
    public long getLong() throws EOFException {
        ByteBuffer bb = require(8);
        return bb.getLong(bb.position());
    }

    @Override // org.msgpack.io.Input
    public float getFloat() throws EOFException {
        ByteBuffer bb = require(4);
        return bb.getFloat(bb.position());
    }

    @Override // org.msgpack.io.Input
    public double getDouble() throws EOFException {
        ByteBuffer bb = require(8);
        return bb.getDouble(bb.position());
    }

    public void feed(byte[] b) {
        feed(b, 0, b.length, false);
    }

    public void feed(byte[] b, boolean reference) {
        feed(b, 0, b.length, reference);
    }

    public void feed(byte[] b, int off, int len) {
        feed(b, off, len, false);
    }

    public void feed(byte[] b, int off, int len, boolean reference) {
        if (reference) {
            if (this.writable > 0 && this.link.getLast().remaining() == 0) {
                this.link.add(this.link.size() - 1, ByteBuffer.wrap(b, off, len));
                return;
            } else {
                this.link.addLast(ByteBuffer.wrap(b, off, len));
                this.writable = -1;
                return;
            }
        }
        ByteBuffer bb = null;
        try {
            bb = this.link.getLast();
        } catch (NoSuchElementException e) {
        }
        if (len <= this.writable) {
            int pos = bb.position();
            bb.position(bb.limit());
            bb.limit(bb.limit() + len);
            bb.put(b, off, len);
            bb.position(pos);
            this.writable = bb.capacity() - bb.limit();
            return;
        }
        if (this.writable > 0) {
            int pos2 = bb.position();
            bb.position(bb.limit());
            bb.limit(bb.limit() + this.writable);
            bb.put(b, off, this.writable);
            bb.position(pos2);
            off += this.writable;
            len -= this.writable;
            this.writable = 0;
        }
        int sz = Math.max(len, this.bufferSize);
        ByteBuffer nb = ByteBuffer.allocate(sz);
        nb.put(b, off, len);
        nb.limit(len);
        nb.position(0);
        this.link.addLast(nb);
        this.writable = sz - len;
    }

    public void feed(ByteBuffer b) {
        feed(b, false);
    }

    public void feed(ByteBuffer buf, boolean reference) {
        if (reference) {
            if (this.writable > 0 && this.link.getLast().remaining() == 0) {
                this.link.add(this.link.size() - 1, buf);
                return;
            } else {
                this.link.addLast(buf);
                this.writable = -1;
                return;
            }
        }
        int rem = buf.remaining();
        ByteBuffer bb = null;
        try {
            bb = this.link.getLast();
        } catch (NoSuchElementException e) {
        }
        if (rem <= this.writable) {
            int pos = bb.position();
            bb.position(bb.limit());
            bb.limit(bb.limit() + rem);
            bb.put(buf);
            bb.position(pos);
            this.writable = bb.capacity() - bb.limit();
            return;
        }
        if (this.writable > 0) {
            int pos2 = bb.position();
            bb.position(bb.limit());
            bb.limit(bb.limit() + this.writable);
            buf.limit(this.writable);
            bb.put(buf);
            bb.position(pos2);
            rem -= this.writable;
            buf.limit(buf.limit() + rem);
            this.writable = 0;
        }
        int sz = Math.max(rem, this.bufferSize);
        ByteBuffer nb = ByteBuffer.allocate(sz);
        nb.put(buf);
        nb.limit(rem);
        nb.position(0);
        this.link.addLast(nb);
        this.writable = sz - rem;
    }

    public void clear() {
        if (this.writable >= 0) {
            ByteBuffer bb = this.link.getLast();
            this.link.clear();
            bb.position(0);
            bb.limit(0);
            this.link.addLast(bb);
            this.writable = bb.capacity();
            return;
        }
        this.link.clear();
        this.writable = -1;
    }

    public void copyReferencedBuffer() {
        if (this.link.isEmpty()) {
            return;
        }
        int size = 0;
        Iterator i$ = this.link.iterator();
        while (i$.hasNext()) {
            size += i$.next().remaining();
        }
        if (size == 0) {
            return;
        }
        if (this.writable >= 0) {
            ByteBuffer last = this.link.removeLast();
            byte[] copy = new byte[size - last.remaining()];
            int off = 0;
            Iterator i$2 = this.link.iterator();
            while (i$2.hasNext()) {
                ByteBuffer bb = i$2.next();
                int len = bb.remaining();
                bb.get(copy, off, len);
                off += len;
            }
            this.link.clear();
            this.link.add(ByteBuffer.wrap(copy));
            this.link.add(last);
            return;
        }
        byte[] copy2 = new byte[size];
        int off2 = 0;
        Iterator i$3 = this.link.iterator();
        while (i$3.hasNext()) {
            ByteBuffer bb2 = i$3.next();
            int len2 = bb2.remaining();
            bb2.get(copy2, off2, len2);
            off2 += len2;
        }
        this.link.clear();
        this.link.add(ByteBuffer.wrap(copy2));
        this.writable = 0;
    }

    public int getSize() {
        int size = 0;
        Iterator i$ = this.link.iterator();
        while (i$.hasNext()) {
            ByteBuffer bb = i$.next();
            size += bb.remaining();
        }
        return size;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
    }
}
