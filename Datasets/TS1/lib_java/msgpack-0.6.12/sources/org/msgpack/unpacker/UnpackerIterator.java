package org.msgpack.unpacker;

import java.io.EOFException;
import java.io.IOException;
import java.util.Iterator;
import java.util.NoSuchElementException;
import org.msgpack.packer.Unconverter;
import org.msgpack.type.Value;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/unpacker/UnpackerIterator.class */
public class UnpackerIterator implements Iterator<Value> {
    private final AbstractUnpacker u;
    private final Unconverter uc;
    private IOException exception;

    public UnpackerIterator(AbstractUnpacker u) {
        this.u = u;
        this.uc = new Unconverter(u.msgpack);
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        if (this.uc.getResult() != null) {
            return true;
        }
        try {
            this.u.readValue(this.uc);
            return this.uc.getResult() != null;
        } catch (EOFException e) {
            return false;
        } catch (IOException ex) {
            this.exception = ex;
            return false;
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // java.util.Iterator
    public Value next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        Value v = this.uc.getResult();
        this.uc.resetResult();
        return v;
    }

    @Override // java.util.Iterator
    public void remove() {
        throw new UnsupportedOperationException();
    }

    public IOException getException() {
        return this.exception;
    }
}
