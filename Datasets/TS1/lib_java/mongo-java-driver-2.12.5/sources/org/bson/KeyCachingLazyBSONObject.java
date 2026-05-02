package org.bson;

import java.util.HashMap;
import org.bson.LazyBSONObject;
import org.bson.io.BSONByteBuffer;

@Deprecated
/* loaded from: mongo-java-driver-2.12.5.jar:org/bson/KeyCachingLazyBSONObject.class */
public class KeyCachingLazyBSONObject extends LazyBSONObject {
    private HashMap<String, LazyBSONObject.ElementRecord> fieldIndex;

    public KeyCachingLazyBSONObject(byte[] data, LazyBSONCallback cbk) {
        super(data, cbk);
        this.fieldIndex = new HashMap<>();
    }

    public KeyCachingLazyBSONObject(byte[] data, int offset, LazyBSONCallback cbk) {
        super(data, offset, cbk);
        this.fieldIndex = new HashMap<>();
    }

    public KeyCachingLazyBSONObject(BSONByteBuffer buffer, LazyBSONCallback callback) {
        super(buffer, callback);
        this.fieldIndex = new HashMap<>();
    }

    public KeyCachingLazyBSONObject(BSONByteBuffer buffer, int offset, LazyBSONCallback callback) {
        super(buffer, offset, callback);
        this.fieldIndex = new HashMap<>();
    }

    @Override // org.bson.LazyBSONObject, org.bson.BSONObject
    public Object get(String key) {
        ensureFieldList();
        return super.get(key);
    }

    @Override // org.bson.LazyBSONObject, org.bson.BSONObject
    public boolean containsField(String s) {
        ensureFieldList();
        if (!this.fieldIndex.containsKey(s)) {
            return false;
        }
        return super.containsField(s);
    }

    private synchronized void ensureFieldList() {
        if (this.fieldIndex == null) {
            return;
        }
        try {
            int offset = this._doc_start_offset + 4;
            while (!isElementEmpty(offset)) {
                int fieldSize = sizeCString(offset);
                int i = offset;
                int offset2 = offset + 1;
                int elementSize = getElementBSONSize(i);
                String name = this._input.getCString(offset2);
                LazyBSONObject.ElementRecord _t_record = new LazyBSONObject.ElementRecord(name, offset2);
                this.fieldIndex.put(name, _t_record);
                offset = offset2 + fieldSize + elementSize;
            }
        } catch (Exception e) {
            this.fieldIndex = new HashMap<>();
        }
    }
}
