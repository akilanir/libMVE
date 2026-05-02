package com.github.mikephil.charting.utils;

import com.github.mikephil.charting.data.Entry;
import java.util.Comparator;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/utils/EntryXIndexComparator.class */
public class EntryXIndexComparator implements Comparator<Entry> {
    @Override // java.util.Comparator
    public int compare(Entry entry1, Entry entry2) {
        return entry1.getXIndex() - entry2.getXIndex();
    }
}
