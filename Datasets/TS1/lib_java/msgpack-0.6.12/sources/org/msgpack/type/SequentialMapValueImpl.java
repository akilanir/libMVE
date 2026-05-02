package org.msgpack.type;

import java.io.IOException;
import java.util.AbstractCollection;
import java.util.AbstractMap;
import java.util.AbstractSet;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
import org.msgpack.packer.Packer;
import org.msgpack.util.android.PortedImmutableEntry;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/SequentialMapValueImpl.class */
class SequentialMapValueImpl extends AbstractMapValue {
    private static SequentialMapValueImpl emptyInstance = new SequentialMapValueImpl(new Value[0], true);
    private Value[] array;

    public static MapValue getEmptyInstance() {
        return emptyInstance;
    }

    @Override // org.msgpack.type.MapValue
    public Value[] getKeyValueArray() {
        return this.array;
    }

    SequentialMapValueImpl(Value[] array, boolean gift) {
        if (array.length % 2 != 0) {
            throw new IllegalArgumentException();
        }
        if (gift) {
            this.array = array;
        } else {
            this.array = new Value[array.length];
            System.arraycopy(array, 0, this.array, 0, array.length);
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // java.util.AbstractMap, java.util.Map
    public Value get(Object key) {
        if (key == null) {
            return null;
        }
        for (int i = this.array.length - 2; i >= 0; i -= 2) {
            if (this.array[i].equals(key)) {
                return this.array[i + 1];
            }
        }
        return null;
    }

    /* loaded from: msgpack-0.6.12.jar:org/msgpack/type/SequentialMapValueImpl$EntrySet.class */
    private static class EntrySet extends AbstractSet<Map.Entry<Value, Value>> {
        private Value[] array;

        EntrySet(Value[] array) {
            this.array = array;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public int size() {
            return this.array.length / 2;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public Iterator<Map.Entry<Value, Value>> iterator() {
            return new EntrySetIterator(this.array);
        }
    }

    /* loaded from: msgpack-0.6.12.jar:org/msgpack/type/SequentialMapValueImpl$EntrySetIterator.class */
    private static class EntrySetIterator implements Iterator<Map.Entry<Value, Value>> {
        private Value[] array;
        private int pos = 0;
        private static final boolean hasDefaultImmutableEntry;

        static {
            try {
                Class.forName("java.util.AbstractMap.SimpleImmutableEntry");
                hasDefaultImmutableEntry = true;
            } catch (ClassNotFoundException e) {
                hasDefaultImmutableEntry = false;
            } catch (Throwable th) {
                hasDefaultImmutableEntry = true;
                throw th;
            }
        }

        EntrySetIterator(Value[] array) {
            this.array = array;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.pos < this.array.length;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.Iterator
        public Map.Entry<Value, Value> next() {
            if (this.pos >= this.array.length) {
                throw new NoSuchElementException();
            }
            Value key = this.array[this.pos];
            Value value = this.array[this.pos + 1];
            Map.Entry<Value, Value> pair = hasDefaultImmutableEntry ? new AbstractMap.SimpleImmutableEntry<>(key, value) : new PortedImmutableEntry<>(key, value);
            this.pos += 2;
            return pair;
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new UnsupportedOperationException();
        }
    }

    /* loaded from: msgpack-0.6.12.jar:org/msgpack/type/SequentialMapValueImpl$KeySet.class */
    private static class KeySet extends AbstractSet<Value> {
        private Value[] array;

        KeySet(Value[] array) {
            this.array = array;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public int size() {
            return this.array.length / 2;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public Iterator<Value> iterator() {
            return new ValueIterator(this.array, 0);
        }
    }

    /* loaded from: msgpack-0.6.12.jar:org/msgpack/type/SequentialMapValueImpl$ValueCollection.class */
    private static class ValueCollection extends AbstractCollection<Value> {
        private Value[] array;

        ValueCollection(Value[] array) {
            this.array = array;
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public int size() {
            return this.array.length / 2;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
        public Iterator<Value> iterator() {
            return new ValueIterator(this.array, 1);
        }
    }

    /* loaded from: msgpack-0.6.12.jar:org/msgpack/type/SequentialMapValueImpl$ValueIterator.class */
    private static class ValueIterator implements Iterator<Value> {
        private Value[] array;
        private int pos;

        ValueIterator(Value[] array, int offset) {
            this.array = array;
            this.pos = offset;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.pos < this.array.length;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.Iterator
        public Value next() {
            if (this.pos >= this.array.length) {
                throw new NoSuchElementException();
            }
            Value v = this.array[this.pos];
            this.pos += 2;
            return v;
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new UnsupportedOperationException();
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Set<Map.Entry<Value, Value>> entrySet() {
        return new EntrySet(this.array);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Set<Value> keySet() {
        return new KeySet(this.array);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Collection<Value> values() {
        return new ValueCollection(this.array);
    }

    @Override // org.msgpack.type.Value
    public void writeTo(Packer pk) throws IOException {
        pk.writeMapBegin(this.array.length / 2);
        for (int i = 0; i < this.array.length; i++) {
            this.array[i].writeTo(pk);
        }
        pk.writeMapEnd();
    }

    @Override // java.util.AbstractMap, java.util.Map
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof Value)) {
            return false;
        }
        Value v = (Value) o;
        if (!v.isMapValue()) {
            return false;
        }
        Map<Value, Value> om = v.asMapValue();
        if (om.size() != this.array.length / 2) {
            return false;
        }
        for (int i = 0; i < this.array.length; i += 2) {
            try {
                Value key = this.array[i];
                Value value = this.array[i + 1];
                if (!value.equals(om.get(key))) {
                    return false;
                }
            } catch (ClassCastException e) {
                return false;
            } catch (NullPointerException e2) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public int hashCode() {
        int h = 0;
        for (int i = 0; i < this.array.length; i += 2) {
            h += this.array[i].hashCode() ^ this.array[i + 1].hashCode();
        }
        return h;
    }

    @Override // java.util.AbstractMap
    public String toString() {
        return toString(new StringBuilder()).toString();
    }

    @Override // org.msgpack.type.Value
    public StringBuilder toString(StringBuilder sb) {
        if (this.array.length == 0) {
            return sb.append("{}");
        }
        sb.append("{");
        sb.append(this.array[0]);
        sb.append(":");
        sb.append(this.array[1]);
        for (int i = 2; i < this.array.length; i += 2) {
            sb.append(",");
            this.array[i].toString(sb);
            sb.append(":");
            this.array[i + 1].toString(sb);
        }
        sb.append("}");
        return sb;
    }
}
