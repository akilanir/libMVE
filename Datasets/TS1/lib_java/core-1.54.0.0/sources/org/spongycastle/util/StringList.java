package org.spongycastle.util;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/util/StringList.class */
public interface StringList extends Iterable<String> {
    boolean add(String str);

    String get(int i);

    int size();

    String[] toStringArray();

    String[] toStringArray(int i, int i2);
}
