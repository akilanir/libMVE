package org.bson;

import com.mongodb.util.JSON;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.logging.Logger;
import java.util.regex.Pattern;
import org.bson.io.BSONByteBuffer;
import org.bson.types.BSONTimestamp;
import org.bson.types.Code;
import org.bson.types.CodeWScope;
import org.bson.types.MaxKey;
import org.bson.types.MinKey;
import org.bson.types.ObjectId;
import org.bson.types.Symbol;

/* loaded from: mongo-java-driver-2.12.5.jar:org/bson/LazyBSONObject.class */
public class LazyBSONObject implements BSONObject {
    static final int FIRST_ELMT_OFFSET = 4;

    @Deprecated
    protected final int _doc_start_offset;

    @Deprecated
    protected final BSONByteBuffer _input;

    @Deprecated
    protected final LazyBSONCallback _callback;
    private static final Logger log = Logger.getLogger("org.bson.LazyBSONObject");

    public LazyBSONObject(byte[] data, LazyBSONCallback callback) {
        this(BSONByteBuffer.wrap(data), callback);
    }

    public LazyBSONObject(byte[] data, int offset, LazyBSONCallback callback) {
        this(BSONByteBuffer.wrap(data, offset, data.length - offset), offset, callback);
    }

    public LazyBSONObject(BSONByteBuffer buffer, LazyBSONCallback callback) {
        this(buffer, 0, callback);
    }

    public LazyBSONObject(BSONByteBuffer buffer, int offset, LazyBSONCallback callback) {
        this._callback = callback;
        this._input = buffer;
        this._doc_start_offset = offset;
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:org/bson/LazyBSONObject$ElementRecord.class */
    class ElementRecord {
        final String name;
        final byte type;
        final int fieldNameSize;
        final int valueOffset;
        final int offset;

        ElementRecord(String name, int offset) {
            this.name = name;
            this.offset = offset;
            this.type = LazyBSONObject.this.getElementType(offset - 1);
            this.fieldNameSize = LazyBSONObject.this.sizeCString(offset);
            this.valueOffset = offset + this.fieldNameSize;
        }
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:org/bson/LazyBSONObject$LazyBSONKeyIterator.class */
    class LazyBSONKeyIterator implements Iterator<String> {
        int offset;

        LazyBSONKeyIterator() {
            this.offset = LazyBSONObject.this._doc_start_offset + 4;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return !LazyBSONObject.this.isElementEmpty(this.offset);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.Iterator
        public String next() {
            int fieldSize = LazyBSONObject.this.sizeCString(this.offset + 1);
            int elementSize = LazyBSONObject.this.getElementBSONSize(this.offset);
            String key = LazyBSONObject.this._input.getCString(this.offset + 1);
            this.offset += fieldSize + elementSize + 1;
            return key;
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new UnsupportedOperationException("Read only");
        }
    }

    @Deprecated
    /* loaded from: mongo-java-driver-2.12.5.jar:org/bson/LazyBSONObject$LazyBSONKeySet.class */
    public class LazyBSONKeySet extends ReadOnlySet<String> {
        @Override // org.bson.LazyBSONObject.ReadOnlySet, java.util.Set, java.util.Collection
        public /* bridge */ /* synthetic */ void clear() {
            super.clear();
        }

        @Override // org.bson.LazyBSONObject.ReadOnlySet, java.util.Set, java.util.Collection
        public /* bridge */ /* synthetic */ boolean removeAll(Collection x0) {
            return super.removeAll(x0);
        }

        @Override // org.bson.LazyBSONObject.ReadOnlySet, java.util.Set, java.util.Collection
        public /* bridge */ /* synthetic */ boolean retainAll(Collection x0) {
            return super.retainAll(x0);
        }

        @Override // org.bson.LazyBSONObject.ReadOnlySet, java.util.Set, java.util.Collection
        public /* bridge */ /* synthetic */ boolean addAll(Collection x0) {
            return super.addAll(x0);
        }

        public LazyBSONKeySet() {
            super();
        }

        @Override // java.util.Set, java.util.Collection
        public int size() {
            int size = 0;
            Iterator<String> iter = iterator();
            while (iter.hasNext()) {
                iter.next();
                size++;
            }
            return size;
        }

        @Override // java.util.Set, java.util.Collection
        public boolean isEmpty() {
            return LazyBSONObject.this.isEmpty();
        }

        @Override // java.util.Set, java.util.Collection
        public boolean contains(Object o) {
            Iterator i$ = iterator();
            while (i$.hasNext()) {
                String key = i$.next();
                if (key.equals(o)) {
                    return true;
                }
            }
            return false;
        }

        @Override // java.util.Set, java.util.Collection, java.lang.Iterable
        public Iterator<String> iterator() {
            return LazyBSONObject.this.new LazyBSONKeyIterator();
        }

        @Override // java.util.Set, java.util.Collection
        public String[] toArray() {
            String[] a = new String[size()];
            return (String[]) toArray(a);
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Set, java.util.Collection
        public <T> T[] toArray(T[] tArr) {
            int size = size();
            T[] tArr2 = (T[]) (tArr.length >= size ? tArr : (Object[]) Array.newInstance(tArr.getClass().getComponentType(), size));
            int i = 0;
            Iterator<String> it = iterator();
            while (it.hasNext()) {
                int i2 = i;
                i++;
                tArr2[i2] = it.next();
            }
            if (tArr2.length > i) {
                tArr2[i] = 0;
            }
            return tArr2;
        }

        @Override // org.bson.LazyBSONObject.ReadOnlySet, java.util.Set, java.util.Collection
        public boolean add(String e) {
            throw new UnsupportedOperationException("Not supported yet.");
        }

        @Override // org.bson.LazyBSONObject.ReadOnlySet, java.util.Set, java.util.Collection
        public boolean remove(Object o) {
            throw new UnsupportedOperationException("Not supported yet.");
        }

        @Override // java.util.Set, java.util.Collection
        public boolean containsAll(Collection<?> collection) {
            for (Object item : collection) {
                if (!contains(item)) {
                    return false;
                }
            }
            return true;
        }
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:org/bson/LazyBSONObject$LazyBSONEntryIterator.class */
    class LazyBSONEntryIterator implements Iterator<Map.Entry<String, Object>> {
        int offset;

        LazyBSONEntryIterator() {
            this.offset = LazyBSONObject.this._doc_start_offset + 4;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return !LazyBSONObject.this.isElementEmpty(this.offset);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.Iterator
        public Map.Entry<String, Object> next() {
            int fieldSize = LazyBSONObject.this.sizeCString(this.offset + 1);
            int elementSize = LazyBSONObject.this.getElementBSONSize(this.offset);
            String key = LazyBSONObject.this._input.getCString(this.offset + 1);
            LazyBSONObject lazyBSONObject = LazyBSONObject.this;
            int i = this.offset + 1;
            this.offset = i;
            final ElementRecord nextElementRecord = lazyBSONObject.new ElementRecord(key, i);
            this.offset += fieldSize + elementSize;
            return new Map.Entry<String, Object>() { // from class: org.bson.LazyBSONObject.LazyBSONEntryIterator.1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // java.util.Map.Entry
                public String getKey() {
                    return nextElementRecord.name;
                }

                @Override // java.util.Map.Entry
                public Object getValue() {
                    return LazyBSONObject.this.getElementValue(nextElementRecord);
                }

                @Override // java.util.Map.Entry
                public Object setValue(Object value) {
                    throw new UnsupportedOperationException("Read only");
                }

                @Override // java.util.Map.Entry
                public boolean equals(Object o) {
                    if (!(o instanceof Map.Entry)) {
                        return false;
                    }
                    Map.Entry e = (Map.Entry) o;
                    return getKey().equals(e.getKey()) && getValue().equals(e.getValue());
                }

                @Override // java.util.Map.Entry
                public int hashCode() {
                    return getKey().hashCode() ^ getValue().hashCode();
                }

                public String toString() {
                    return getKey() + "=" + getValue();
                }
            };
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new UnsupportedOperationException("Read only");
        }
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:org/bson/LazyBSONObject$LazyBSONEntrySet.class */
    class LazyBSONEntrySet extends ReadOnlySet<Map.Entry<String, Object>> {
        LazyBSONEntrySet() {
            super();
        }

        @Override // java.util.Set, java.util.Collection
        public int size() {
            return LazyBSONObject.this.keySet().size();
        }

        @Override // java.util.Set, java.util.Collection
        public boolean isEmpty() {
            return LazyBSONObject.this.isEmpty();
        }

        @Override // java.util.Set, java.util.Collection
        public boolean contains(Object o) {
            Iterator<Map.Entry<String, Object>> iter = iterator();
            while (iter.hasNext()) {
                if (iter.next().equals(o)) {
                    return true;
                }
            }
            return false;
        }

        @Override // java.util.Set, java.util.Collection
        public boolean containsAll(Collection<?> c) {
            for (Object cur : c) {
                if (!contains(cur)) {
                    return false;
                }
            }
            return true;
        }

        @Override // java.util.Set, java.util.Collection, java.lang.Iterable
        public Iterator<Map.Entry<String, Object>> iterator() {
            return LazyBSONObject.this.new LazyBSONEntryIterator();
        }

        @Override // java.util.Set, java.util.Collection
        public Object[] toArray() {
            Map.Entry[] array = new Map.Entry[size()];
            return toArray(array);
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Set, java.util.Collection
        public <T> T[] toArray(T[] tArr) {
            int size = size();
            T[] tArr2 = (T[]) (tArr.length >= size ? tArr : (Object[]) Array.newInstance(tArr.getClass().getComponentType(), size));
            Iterator<Map.Entry<String, Object>> it = iterator();
            int i = 0;
            while (it.hasNext()) {
                int i2 = i;
                i++;
                tArr2[i2] = it.next();
            }
            if (tArr2.length > i) {
                tArr2[i] = 0;
            }
            return tArr2;
        }
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:org/bson/LazyBSONObject$ReadOnlySet.class */
    abstract class ReadOnlySet<E> implements Set<E> {
        ReadOnlySet() {
        }

        @Override // java.util.Set, java.util.Collection
        public boolean add(E e) {
            throw new UnsupportedOperationException("Read-only Set");
        }

        @Override // java.util.Set, java.util.Collection
        public boolean remove(Object o) {
            throw new UnsupportedOperationException("Read-only Set");
        }

        @Override // java.util.Set, java.util.Collection
        public boolean addAll(Collection<? extends E> c) {
            throw new UnsupportedOperationException("Read-only Set");
        }

        @Override // java.util.Set, java.util.Collection
        public boolean retainAll(Collection<?> c) {
            throw new UnsupportedOperationException("Read-only Set");
        }

        @Override // java.util.Set, java.util.Collection
        public boolean removeAll(Collection<?> c) {
            throw new UnsupportedOperationException("Read-only Set");
        }

        @Override // java.util.Set, java.util.Collection
        public void clear() {
            throw new UnsupportedOperationException("Read-only Set");
        }
    }

    @Override // org.bson.BSONObject
    public Object put(String key, Object v) {
        throw new UnsupportedOperationException("Object is read only");
    }

    @Override // org.bson.BSONObject
    public void putAll(BSONObject o) {
        throw new UnsupportedOperationException("Object is read only");
    }

    @Override // org.bson.BSONObject
    public void putAll(Map m) {
        throw new UnsupportedOperationException("Object is read only");
    }

    @Override // org.bson.BSONObject
    public Object get(String key) {
        ElementRecord element = getElement(key);
        if (element == null) {
            return null;
        }
        return getElementValue(element);
    }

    ElementRecord getElement(String key) {
        int i = this._doc_start_offset;
        int i2 = 4;
        while (true) {
            int offset = i + i2;
            if (!isElementEmpty(offset)) {
                int fieldSize = sizeCString(offset + 1);
                int elementSize = getElementBSONSize(offset);
                int offset2 = offset + 1;
                String name = this._input.getCString(offset2);
                if (name.equals(key)) {
                    return new ElementRecord(name, offset2);
                }
                i = offset2;
                i2 = fieldSize + elementSize;
            } else {
                return null;
            }
        }
    }

    List<ElementRecord> getElements() {
        int offset = this._doc_start_offset + 4;
        ArrayList<ElementRecord> elements = new ArrayList<>();
        while (!isElementEmpty(offset)) {
            int fieldSize = sizeCString(offset + 1);
            int elementSize = getElementBSONSize(offset);
            int offset2 = offset + 1;
            String name = this._input.getCString(offset2);
            ElementRecord rec = new ElementRecord(name, offset2);
            elements.add(rec);
            offset = offset2 + fieldSize + elementSize;
        }
        return elements;
    }

    @Override // org.bson.BSONObject
    public Map toMap() {
        throw new UnsupportedOperationException("Not Supported");
    }

    @Override // org.bson.BSONObject
    public Object removeField(String key) {
        throw new UnsupportedOperationException("Object is read only");
    }

    @Override // org.bson.BSONObject
    @Deprecated
    public boolean containsKey(String s) {
        return containsField(s);
    }

    @Override // org.bson.BSONObject
    public boolean containsField(String s) {
        return keySet().contains(s);
    }

    @Override // org.bson.BSONObject
    public Set<String> keySet() {
        return new LazyBSONKeySet();
    }

    public Set<Map.Entry<String, Object>> entrySet() {
        return new LazyBSONEntrySet();
    }

    @Deprecated
    protected boolean isElementEmpty(int offset) {
        return getElementType(offset) == 0;
    }

    public boolean isEmpty() {
        return isElementEmpty(this._doc_start_offset + 4);
    }

    private int getBSONSize(int offset) {
        return this._input.getInt(offset);
    }

    public int getBSONSize() {
        return getBSONSize(this._doc_start_offset);
    }

    public int pipe(OutputStream os) throws IOException {
        os.write(this._input.array(), this._doc_start_offset, getBSONSize());
        return getBSONSize();
    }

    private String getElementFieldName(int offset) {
        return this._input.getCString(offset);
    }

    @Deprecated
    protected byte getElementType(int offset) {
        return this._input.get(offset);
    }

    @Deprecated
    protected int getElementBSONSize(int offset) {
        int x = 0;
        int offset2 = offset + 1;
        byte type = getElementType(offset);
        int n = sizeCString(offset2);
        int valueOffset = offset2 + n;
        switch (type) {
            case BSON.MINKEY /* -1 */:
            case 0:
            case BSON.UNDEFINED /* 6 */:
            case BSON.NULL /* 10 */:
            case BSON.MAXKEY /* 127 */:
                break;
            case 1:
            case BSON.DATE /* 9 */:
            case BSON.TIMESTAMP /* 17 */:
            case BSON.NUMBER_LONG /* 18 */:
                x = 8;
                break;
            case 2:
            case BSON.CODE /* 13 */:
            case BSON.SYMBOL /* 14 */:
                x = this._input.getInt(valueOffset) + 4;
                break;
            case 3:
            case 4:
                x = this._input.getInt(valueOffset);
                break;
            case BSON.BINARY /* 5 */:
                x = this._input.getInt(valueOffset) + 4 + 1;
                break;
            case BSON.OID /* 7 */:
                x = 12;
                break;
            case 8:
                x = 1;
                break;
            case BSON.REGEX /* 11 */:
                int part1 = sizeCString(valueOffset);
                int part2 = sizeCString(valueOffset + part1);
                x = part1 + part2;
                break;
            case 12:
                x = this._input.getInt(valueOffset) + 4 + 12;
                break;
            case BSON.CODE_W_SCOPE /* 15 */:
                x = this._input.getInt(valueOffset);
                break;
            case 16:
                x = 4;
                break;
            default:
                throw new BSONException("Invalid type " + ((int) type) + " for field " + getElementFieldName(offset2));
        }
        return x;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x000c */
    @java.lang.Deprecated
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected int sizeCString(int r4) {
        /*
            r3 = this;
            r0 = r4
            r5 = r0
        L2:
            r0 = r3
            org.bson.io.BSONByteBuffer r0 = r0._input
            r1 = r5
            byte r0 = r0.get(r1)
            r6 = r0
            r0 = r6
            if (r0 != 0) goto L12
            goto L18
        L12:
            int r5 = r5 + 1
            goto L2
        L18:
            r0 = r5
            r1 = r4
            int r0 = r0 - r1
            r1 = 1
            int r0 = r0 + r1
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: org.bson.LazyBSONObject.sizeCString(int):int");
    }

    @Deprecated
    protected Object getElementValue(ElementRecord record) {
        switch (record.type) {
            case BSON.MINKEY /* -1 */:
                return new MinKey();
            case 0:
            case BSON.UNDEFINED /* 6 */:
            case BSON.NULL /* 10 */:
                return null;
            case 1:
                return Double.valueOf(Double.longBitsToDouble(this._input.getLong(record.valueOffset)));
            case 2:
                return this._input.getUTF8String(record.valueOffset);
            case 3:
                return this._callback.createObject(this._input.array(), record.valueOffset);
            case 4:
                return this._callback.createArray(this._input.array(), record.valueOffset);
            case BSON.BINARY /* 5 */:
                return readBinary(record.valueOffset);
            case BSON.OID /* 7 */:
                return new ObjectId(this._input.getIntBE(record.valueOffset), this._input.getIntBE(record.valueOffset + 4), this._input.getIntBE(record.valueOffset + 8));
            case 8:
                return Boolean.valueOf(this._input.get(record.valueOffset) != 0);
            case BSON.DATE /* 9 */:
                return new Date(this._input.getLong(record.valueOffset));
            case BSON.REGEX /* 11 */:
                int patternCStringSize = sizeCString(record.valueOffset);
                String pattern = this._input.getCString(record.valueOffset);
                String flags = this._input.getCString(record.valueOffset + patternCStringSize);
                return Pattern.compile(pattern, BSON.regexFlags(flags));
            case 12:
                int csize = this._input.getInt(record.valueOffset);
                String ns = this._input.getCString(record.valueOffset + 4);
                int oidOffset = record.valueOffset + csize + 4;
                ObjectId oid = new ObjectId(this._input.getIntBE(oidOffset), this._input.getIntBE(oidOffset + 4), this._input.getIntBE(oidOffset + 8));
                return this._callback.createDBRef(ns, oid);
            case BSON.CODE /* 13 */:
                return new Code(this._input.getUTF8String(record.valueOffset));
            case BSON.SYMBOL /* 14 */:
                return new Symbol(this._input.getUTF8String(record.valueOffset));
            case BSON.CODE_W_SCOPE /* 15 */:
                int strsize = this._input.getInt(record.valueOffset + 4);
                String code = this._input.getUTF8String(record.valueOffset + 4);
                BSONObject scope = (BSONObject) this._callback.createObject(this._input.array(), record.valueOffset + 4 + 4 + strsize);
                return new CodeWScope(code, scope);
            case 16:
                return Integer.valueOf(this._input.getInt(record.valueOffset));
            case BSON.TIMESTAMP /* 17 */:
                int inc = this._input.getInt(record.valueOffset);
                int time = this._input.getInt(record.valueOffset + 4);
                return new BSONTimestamp(time, inc);
            case BSON.NUMBER_LONG /* 18 */:
                return Long.valueOf(this._input.getLong(record.valueOffset));
            case BSON.MAXKEY /* 127 */:
                return new MaxKey();
            default:
                throw new BSONException("Invalid type " + ((int) record.type) + " for field " + getElementFieldName(record.offset));
        }
    }

    private Object readBinary(int valueOffset) {
        int totalLen = this._input.getInt(valueOffset);
        int valueOffset2 = valueOffset + 4;
        byte bType = this._input.get(valueOffset2);
        int valueOffset3 = valueOffset2 + 1;
        switch (bType) {
            case 0:
                byte[] bin = new byte[totalLen];
                for (int n = 0; n < totalLen; n++) {
                    bin[n] = this._input.get(valueOffset3 + n);
                }
                return bin;
            case 1:
            default:
                byte[] bin2 = new byte[totalLen];
                for (int n2 = 0; n2 < totalLen; n2++) {
                    bin2[n2] = this._input.get(valueOffset3 + n2);
                }
                return bin2;
            case 2:
                int len = this._input.getInt(valueOffset3);
                if (len + 4 != totalLen) {
                    throw new IllegalArgumentException("Bad Data Size; Binary Subtype 2.  { actual len: " + len + " expected totalLen: " + totalLen + "}");
                }
                int valueOffset4 = valueOffset3 + 4;
                byte[] bin3 = new byte[len];
                for (int n3 = 0; n3 < len; n3++) {
                    bin3[n3] = this._input.get(valueOffset4 + n3);
                }
                return bin3;
            case 3:
                if (totalLen != 16) {
                    throw new IllegalArgumentException("Bad Data Size; Binary Subtype 3 (UUID). { total length: " + totalLen + " != 16");
                }
                long part1 = this._input.getLong(valueOffset3);
                long part2 = this._input.getLong(valueOffset3 + 8);
                return new UUID(part1, part2);
        }
    }

    protected int getOffset() {
        return this._doc_start_offset;
    }

    protected byte[] getBytes() {
        return this._input.array();
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        LazyBSONObject that = (LazyBSONObject) o;
        return Arrays.equals(this._input.array(), that._input.array());
    }

    public int hashCode() {
        return Arrays.hashCode(this._input.array());
    }

    public String toString() {
        return JSON.serialize(this);
    }
}
