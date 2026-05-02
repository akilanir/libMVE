package com.mongodb;

import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import org.bson.BSON;
import org.bson.BSONObject;
import org.bson.types.ObjectId;

@Deprecated
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/RawDBObject.class */
public class RawDBObject implements DBObject {
    final ByteBuffer _buf;
    final int _offset;
    final int _end;
    private static final byte[] _cStrBuf = new byte[1024];

    RawDBObject(ByteBuffer buf) {
        this(buf, 0);
    }

    RawDBObject(ByteBuffer buf, int offset) {
        this._buf = buf;
        this._offset = offset;
        this._end = this._buf.getInt(this._offset);
    }

    @Override // org.bson.BSONObject
    public Object get(String key) {
        Element e = findElement(key);
        if (e == null) {
            return null;
        }
        return e.getObject();
    }

    @Override // org.bson.BSONObject
    public Map toMap() {
        Map m = new HashMap();
        for (String str : keySet()) {
            m.put(str, get(String.valueOf(str)));
        }
        return m;
    }

    @Override // org.bson.BSONObject
    public Object put(String key, Object v) {
        throw new RuntimeException("read only");
    }

    @Override // org.bson.BSONObject
    public void putAll(BSONObject o) {
        throw new RuntimeException("read only");
    }

    @Override // org.bson.BSONObject
    public void putAll(Map m) {
        throw new RuntimeException("read only");
    }

    @Override // org.bson.BSONObject
    public Object removeField(String key) {
        throw new RuntimeException("read only");
    }

    @Override // org.bson.BSONObject
    @Deprecated
    public boolean containsKey(String key) {
        return containsField(key);
    }

    @Override // org.bson.BSONObject
    public boolean containsField(String field) {
        return findElement(field) != null;
    }

    @Override // org.bson.BSONObject
    public Set<String> keySet() {
        Set<String> keys = new HashSet<>();
        ElementIter i = new ElementIter();
        while (i.hasNext()) {
            Element e = i.next();
            if (e.eoo()) {
                break;
            }
            keys.add(e.fieldName());
        }
        return keys;
    }

    String _readCStr(int start) {
        return _readCStr(start, null);
    }

    String _readCStr(int start, int[] end) {
        String str;
        int y;
        synchronized (_cStrBuf) {
            int pos = 0;
            while (this._buf.get(pos + start) != 0) {
                _cStrBuf[pos] = this._buf.get(pos + start);
                pos++;
                if (pos >= _cStrBuf.length) {
                    throw new IllegalArgumentException("c string too big for RawDBObject.  so far[" + new String(_cStrBuf) + "]");
                }
                if (pos + start >= this._buf.limit()) {
                    StringBuilder sb = new StringBuilder();
                    for (int x = 0; x < 10 && (y = start + x) < this._buf.limit(); x++) {
                        sb.append((char) this._buf.get(y));
                    }
                    throw new IllegalArgumentException("can't find end of cstring.  start:" + start + " pos: " + pos + " [" + ((Object) sb) + "]");
                }
            }
            if (end != null && end.length > 0) {
                end[0] = start + pos;
            }
            str = new String(_cStrBuf, 0, pos);
        }
        return str;
    }

    String _readJavaString(int start) {
        int size = this._buf.getInt(start) - 1;
        byte[] b = new byte[size];
        int old = this._buf.position();
        this._buf.position(start + 4);
        this._buf.get(b, 0, b.length);
        this._buf.position(old);
        try {
            return new String(b, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            return new String(b);
        }
    }

    int _cStrLength(int start) {
        int end = start;
        while (this._buf.get(end) != 0) {
            end++;
        }
        return 1 + (end - start);
    }

    Element findElement(String name) {
        ElementIter i = new ElementIter();
        while (i.hasNext()) {
            Element e = i.next();
            if (e.fieldName().equals(name)) {
                return e;
            }
        }
        return null;
    }

    @Override // com.mongodb.DBObject
    public boolean isPartialObject() {
        return false;
    }

    @Override // com.mongodb.DBObject
    public void markAsPartialObject() {
        throw new RuntimeException("RawDBObject can't be a partial object");
    }

    public String toString() {
        return "Object";
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/RawDBObject$Element.class */
    class Element {
        final int _start;
        final byte _type;
        final String _name;
        final int _dataStart;
        final int _size;
        Object _cached;

        Element(int start) {
            this._start = start;
            this._type = RawDBObject.this._buf.get(this._start);
            int[] end = new int[1];
            this._name = eoo() ? "" : RawDBObject.this._readCStr(this._start + 1, end);
            int size = 1 + (end[0] - this._start);
            this._dataStart = this._start + size;
            switch (this._type) {
                case BSON.MINKEY /* -1 */:
                case 0:
                case BSON.UNDEFINED /* 6 */:
                case BSON.NULL /* 10 */:
                case BSON.MAXKEY /* 127 */:
                    break;
                case 1:
                case BSON.DATE /* 9 */:
                case BSON.NUMBER_LONG /* 18 */:
                    size += 8;
                    break;
                case 2:
                case BSON.CODE /* 13 */:
                case BSON.SYMBOL /* 14 */:
                    size += 4 + RawDBObject.this._buf.getInt(this._dataStart);
                    break;
                case 3:
                case 4:
                case BSON.CODE_W_SCOPE /* 15 */:
                    size += RawDBObject.this._buf.getInt(this._dataStart);
                    break;
                case BSON.BINARY /* 5 */:
                    size += 4 + RawDBObject.this._buf.getInt(this._dataStart) + 1;
                    break;
                case BSON.OID /* 7 */:
                    size += 12;
                    break;
                case 8:
                    size++;
                    break;
                case BSON.REGEX /* 11 */:
                    int first = RawDBObject.this._cStrLength(this._dataStart);
                    int second = RawDBObject.this._cStrLength(this._dataStart + first);
                    size += first + second;
                    break;
                case 12:
                    size = size + 12 + 4 + RawDBObject.this._buf.getInt(this._dataStart);
                    break;
                case 16:
                    size += 4;
                    break;
                case BSON.TIMESTAMP /* 17 */:
                    size += 8;
                    break;
                default:
                    throw new RuntimeException("RawDBObject can't size type " + ((int) this._type));
            }
            this._size = size;
        }

        String fieldName() {
            return this._name;
        }

        boolean eoo() {
            return this._type == 0 || this._type == Byte.MAX_VALUE;
        }

        int size() {
            return this._size;
        }

        Object getObject() {
            if (this._cached != null) {
                return this._cached;
            }
            switch (this._type) {
                case BSON.MINKEY /* -1 */:
                case 0:
                case BSON.UNDEFINED /* 6 */:
                case BSON.NULL /* 10 */:
                case BSON.MAXKEY /* 127 */:
                    return null;
                case 1:
                    return Double.valueOf(RawDBObject.this._buf.getDouble(this._dataStart));
                case 2:
                case BSON.SYMBOL /* 14 */:
                    return RawDBObject.this._readJavaString(this._dataStart);
                case 3:
                case 4:
                    throw new RuntimeException("can't handle emebdded objects");
                case BSON.BINARY /* 5 */:
                    throw new RuntimeException("can't inspect binary in db");
                case BSON.OID /* 7 */:
                    return new ObjectId(RawDBObject.this._buf.getInt(this._dataStart), RawDBObject.this._buf.getInt(this._dataStart + 4), RawDBObject.this._buf.getInt(this._dataStart + 8));
                case 8:
                    return Boolean.valueOf(RawDBObject.this._buf.get(this._dataStart) > 0);
                case BSON.DATE /* 9 */:
                    return new Date(RawDBObject.this._buf.getLong(this._dataStart));
                case BSON.REGEX /* 11 */:
                    throw new RuntimeException("can't handle regex");
                case BSON.CODE /* 13 */:
                case BSON.CODE_W_SCOPE /* 15 */:
                    throw new RuntimeException("can't handle code");
                case 16:
                    return Integer.valueOf(RawDBObject.this._buf.getInt(this._dataStart));
                default:
                    throw new RuntimeException("can't decode type " + ((int) this._type));
            }
        }
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/RawDBObject$ElementIter.class */
    class ElementIter {
        int _pos;
        boolean _done = false;

        ElementIter() {
            this._pos = RawDBObject.this._offset + 4;
        }

        boolean hasNext() {
            return !this._done && this._pos < RawDBObject.this._buf.limit();
        }

        Element next() {
            Element e = RawDBObject.this.new Element(this._pos);
            this._done = e.eoo();
            this._pos += e.size();
            return e;
        }
    }
}
