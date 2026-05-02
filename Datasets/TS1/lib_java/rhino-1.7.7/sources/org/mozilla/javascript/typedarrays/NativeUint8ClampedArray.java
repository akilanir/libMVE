package org.mozilla.javascript.typedarrays;

import org.mozilla.javascript.Context;
import org.mozilla.javascript.IdFunctionObject;
import org.mozilla.javascript.Scriptable;
import org.mozilla.javascript.Undefined;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/typedarrays/NativeUint8ClampedArray.class */
public class NativeUint8ClampedArray extends NativeTypedArrayView<Integer> {
    private static final long serialVersionUID = -3349419704390398895L;
    private static final String CLASS_NAME = "Uint8ClampedArray";

    public NativeUint8ClampedArray() {
    }

    public NativeUint8ClampedArray(NativeArrayBuffer ab, int off, int len) {
        super(ab, off, len, len);
    }

    public NativeUint8ClampedArray(int len) {
        this(new NativeArrayBuffer(len), 0, len);
    }

    @Override // org.mozilla.javascript.ScriptableObject, org.mozilla.javascript.Scriptable
    public String getClassName() {
        return CLASS_NAME;
    }

    public static void init(Context cx, Scriptable scope, boolean sealed) {
        NativeUint8ClampedArray a = new NativeUint8ClampedArray();
        a.exportAsJSClass(4, scope, sealed);
    }

    @Override // org.mozilla.javascript.typedarrays.NativeTypedArrayView
    protected NativeTypedArrayView construct(NativeArrayBuffer ab, int off, int len) {
        return new NativeUint8ClampedArray(ab, off, len);
    }

    @Override // org.mozilla.javascript.typedarrays.NativeTypedArrayView
    public int getBytesPerElement() {
        return 1;
    }

    @Override // org.mozilla.javascript.typedarrays.NativeTypedArrayView
    protected NativeTypedArrayView realThis(Scriptable thisObj, IdFunctionObject f) {
        if (!(thisObj instanceof NativeUint8ClampedArray)) {
            throw incompatibleCallError(f);
        }
        return (NativeUint8ClampedArray) thisObj;
    }

    @Override // org.mozilla.javascript.typedarrays.NativeTypedArrayView
    protected Object js_get(int index) {
        if (checkIndex(index)) {
            return Undefined.instance;
        }
        return ByteIo.readUint8(this.arrayBuffer.buffer, index + this.offset);
    }

    @Override // org.mozilla.javascript.typedarrays.NativeTypedArrayView
    protected Object js_set(int index, Object c) {
        if (checkIndex(index)) {
            return Undefined.instance;
        }
        int val = Conversions.toUint8Clamp(c);
        ByteIo.writeUint8(this.arrayBuffer.buffer, index + this.offset, val);
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
