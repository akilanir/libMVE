package org.dmfs.rfc5545.recur;

import java.util.Arrays;
import java.util.List;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/StaticUtils.class */
public abstract class StaticUtils {
    public static int[] ListToSortedArray(List<Integer> list) {
        if (list == null) {
            return null;
        }
        int size = list.size();
        int[] iArr = new int[size];
        int i = Integer.MIN_VALUE;
        boolean z = false;
        for (int i2 = 0; i2 < size; i2++) {
            int intValue = list.get(i2).intValue();
            iArr[i2] = intValue;
            z |= i > intValue;
            i = intValue;
        }
        if (z) {
            Arrays.sort(iArr);
        }
        return iArr;
    }

    public static int[] ListToArray(List<Integer> list) {
        if (list == null) {
            return null;
        }
        int size = list.size();
        int[] iArr = new int[size];
        for (int i = 0; i < size; i++) {
            iArr[i] = list.get(i).intValue();
        }
        return iArr;
    }

    public static int linearSearch(int[] iArr, int i) {
        int length = iArr.length;
        for (int i2 = 0; i2 < length; i2++) {
            if (iArr[i2] == i) {
                return i2;
            }
        }
        return -1;
    }

    public static int linearSearch(long[] jArr, long j) {
        return linearSearch(jArr, 0, jArr.length, j);
    }

    public static int linearSearch(long[] jArr, int i, int i2, long j) {
        for (int i3 = i; i3 < i2; i3++) {
            if (jArr[i3] == j) {
                return i3;
            }
        }
        return -1;
    }
}
