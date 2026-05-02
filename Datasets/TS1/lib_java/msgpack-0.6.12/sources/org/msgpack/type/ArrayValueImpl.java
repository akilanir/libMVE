package org.msgpack.type;

import java.io.IOException;
import java.util.ListIterator;
import org.msgpack.packer.Packer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/ArrayValueImpl.class */
class ArrayValueImpl extends AbstractArrayValue {
    private static ArrayValueImpl emptyInstance = new ArrayValueImpl(new Value[0], true);
    private Value[] array;

    public static ArrayValue getEmptyInstance() {
        return emptyInstance;
    }

    @Override // org.msgpack.type.ArrayValue
    public Value[] getElementArray() {
        return this.array;
    }

    ArrayValueImpl(Value[] array, boolean gift) {
        if (gift) {
            this.array = array;
        } else {
            this.array = new Value[array.length];
            System.arraycopy(array, 0, this.array, 0, array.length);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public int size() {
        return this.array.length;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public boolean isEmpty() {
        return this.array.length == 0;
    }

    @Override // java.util.AbstractList, java.util.List
    public Value get(int index) {
        if (index < 0 || this.array.length <= index) {
            throw new IndexOutOfBoundsException();
        }
        return this.array[index];
    }

    @Override // java.util.AbstractList, java.util.List
    public int indexOf(Object o) {
        if (o == null) {
            return -1;
        }
        for (int i = 0; i < this.array.length; i++) {
            if (this.array[i].equals(o)) {
                return i;
            }
        }
        return -1;
    }

    @Override // java.util.AbstractList, java.util.List
    public int lastIndexOf(Object o) {
        if (o == null) {
            return -1;
        }
        for (int i = this.array.length - 1; i >= 0; i--) {
            if (this.array[i].equals(o)) {
                return i;
            }
        }
        return -1;
    }

    @Override // org.msgpack.type.Value
    public void writeTo(Packer pk) throws IOException {
        pk.writeArrayBegin(this.array.length);
        for (int i = 0; i < this.array.length; i++) {
            this.array[i].writeTo(pk);
        }
        pk.writeArrayEnd();
    }

    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof Value)) {
            return false;
        }
        Value v = (Value) o;
        if (!v.isArrayValue()) {
            return false;
        }
        if (v.getClass() == ArrayValueImpl.class) {
            return equals((ArrayValueImpl) v);
        }
        ListIterator<Value> oi = v.asArrayValue().listIterator();
        for (int i = 0; i < this.array.length; i++) {
            if (!oi.hasNext() || !this.array[i].equals(oi.next())) {
                return false;
            }
        }
        return !oi.hasNext();
    }

    private boolean equals(ArrayValueImpl o) {
        if (this.array.length != o.array.length) {
            return false;
        }
        for (int i = 0; i < this.array.length; i++) {
            if (!this.array[i].equals(o.array[i])) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    public int hashCode() {
        int h = 1;
        for (int i = 0; i < this.array.length; i++) {
            Value obj = this.array[i];
            h = (31 * h) + obj.hashCode();
        }
        return h;
    }

    @Override // java.util.AbstractCollection
    public String toString() {
        return toString(new StringBuilder()).toString();
    }

    @Override // org.msgpack.type.Value
    public StringBuilder toString(StringBuilder sb) {
        if (this.array.length == 0) {
            return sb.append("[]");
        }
        sb.append("[");
        sb.append(this.array[0]);
        for (int i = 1; i < this.array.length; i++) {
            sb.append(",");
            this.array[i].toString(sb);
        }
        sb.append("]");
        return sb;
    }
}
