package org.ligi.axt.extensions;

import java.lang.reflect.Array;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/extensions/ArrayAXT.class */
public class ArrayAXT<T> {
    private final T[] arr;

    public ArrayAXT(T[] arr) {
        this.arr = arr;
    }

    public T[] combineWith(T[] tArr) {
        int length = this.arr.length;
        int length2 = tArr.length;
        T[] tArr2 = (T[]) ((Object[]) Array.newInstance(this.arr.getClass().getComponentType(), length + length2));
        System.arraycopy(this.arr, 0, tArr2, 0, length);
        System.arraycopy(tArr, 0, tArr2, length, length2);
        return tArr2;
    }

    public T last() {
        return this.arr[this.arr.length - 1];
    }
}
