package org.mozilla.javascript.typedarrays;

import org.mozilla.javascript.Context;
import org.mozilla.javascript.IdFunctionObject;
import org.mozilla.javascript.Scriptable;
import org.mozilla.javascript.Undefined;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/typedarrays/NativeInt8Array.class */
public class NativeInt8Array extends NativeTypedArrayView<Byte> {
    private static final long serialVersionUID = -3349419704390398895L;
    private static final String CLASS_NAME = "Int8Array";

    public NativeInt8Array() {
    }

    public NativeInt8Array(NativeArrayBuffer ab, int off, int len) {
        super(ab, off, len, len);
    }

    public NativeInt8Array(int len) {
        this(new NativeArrayBuffer(len), 0, len);
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public String getClassName() {
        return CLASS_NAME;
    }

    public static void init(Context cx, Scriptable scope, boolean sealed) {
        NativeInt8Array a = new NativeInt8Array();
        a.exportAsJSClass(4, scope, sealed);
    }

    @Override // org.mozilla.javascript.typedarrays.NativeTypedArrayView
    protected NativeTypedArrayView construct(NativeArrayBuffer ab, int off, int len) {
        return new NativeInt8Array(ab, off, len);
    }

    @Override // org.mozilla.javascript.typedarrays.NativeTypedArrayView
    public int getBytesPerElement() {
        return 1;
    }

    @Override // org.mozilla.javascript.typedarrays.NativeTypedArrayView
    protected NativeTypedArrayView realThis(Scriptable thisObj, IdFunctionObject f) {
        if (!(thisObj instanceof NativeInt8Array)) {
            throw incompatibleCallError(f);
        }
        return (NativeInt8Array) thisObj;
    }

    @Override // org.mozilla.javascript.typedarrays.NativeTypedArrayView
    protected Object js_get(int index) {
        if (checkIndex(index)) {
            return Undefined.instance;
        }
        return ByteIo.readInt8(this.arrayBuffer.buffer, index + this.offset);
    }

    @Override // org.mozilla.javascript.typedarrays.NativeTypedArrayView
    protected Object js_set(int index, Object c) {
        if (checkIndex(index)) {
            return Undefined.instance;
        }
        int val = Conversions.toInt8(c);
        ByteIo.writeInt8(this.arrayBuffer.buffer, index + this.offset, val);
        return null;
    }

    @Override // java.util.List
    public Byte get(int i) {
        if (checkIndex(i)) {
            throw new IndexOutOfBoundsException();
        }
        return (Byte) js_get(i);
    }

    @Override // java.util.List
    public Byte set(int i, Byte aByte) {
        if (checkIndex(i)) {
            throw new IndexOutOfBoundsException();
        }
        return (Byte) js_set(i, aByte);
    }
}
