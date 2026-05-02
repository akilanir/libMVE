package org.mozilla.javascript.typedarrays;

import org.mozilla.javascript.Context;
import org.mozilla.javascript.IdFunctionObject;
import org.mozilla.javascript.Scriptable;
import org.mozilla.javascript.Undefined;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/typedarrays/NativeUint16Array.class */
public class NativeUint16Array extends NativeTypedArrayView<Integer> {
    private static final long serialVersionUID = 7700018949434240321L;
    private static final String CLASS_NAME = "Uint16Array";
    private static final int BYTES_PER_ELEMENT = 2;

    public NativeUint16Array() {
    }

    public NativeUint16Array(NativeArrayBuffer ab, int off, int len) {
        super(ab, off, len, len * 2);
    }

    public NativeUint16Array(int len) {
        this(new NativeArrayBuffer(len * 2), 0, len);
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public String getClassName() {
        return CLASS_NAME;
    }

    public static void init(Context cx, Scriptable scope, boolean sealed) {
        NativeUint16Array a = new NativeUint16Array();
        a.exportAsJSClass(4, scope, sealed);
    }

    @Override // org.mozilla.javascript.typedarrays.NativeTypedArrayView
    protected NativeTypedArrayView construct(NativeArrayBuffer ab, int off, int len) {
        return new NativeUint16Array(ab, off, len);
    }

    @Override // org.mozilla.javascript.typedarrays.NativeTypedArrayView
    public int getBytesPerElement() {
        return 2;
    }

    @Override // org.mozilla.javascript.typedarrays.NativeTypedArrayView
    protected NativeTypedArrayView realThis(Scriptable thisObj, IdFunctionObject f) {
        if (!(thisObj instanceof NativeUint16Array)) {
            throw incompatibleCallError(f);
        }
        return (NativeUint16Array) thisObj;
    }

    @Override // org.mozilla.javascript.typedarrays.NativeTypedArrayView
    protected Object js_get(int index) {
        if (checkIndex(index)) {
            return Undefined.instance;
        }
        return ByteIo.readUint16(this.arrayBuffer.buffer, (index * 2) + this.offset, false);
    }

    @Override // org.mozilla.javascript.typedarrays.NativeTypedArrayView
    protected Object js_set(int index, Object c) {
        if (checkIndex(index)) {
            return Undefined.instance;
        }
        int val = Conversions.toUint16(c);
        ByteIo.writeUint16(this.arrayBuffer.buffer, (index * 2) + this.offset, val, false);
        return null;
    }

    @Override // java.util.List
    public Integer get(int i) {
        if (checkIndex(i)) {
            throw new IndexOutOfBoundsException();
        }
        return (Integer) js_get(i);
    }

    @Override // java.util.List
    public Integer set(int i, Integer aByte) {
        if (checkIndex(i)) {
            throw new IndexOutOfBoundsException();
        }
        return (Integer) js_set(i, aByte);
    }
}
