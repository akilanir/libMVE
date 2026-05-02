package org.achartengine.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.TreeMap;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/util/IndexXYMap.class */
public class IndexXYMap<K, V> extends TreeMap<K, V> {
    private final List<K> indexList = new ArrayList();
    private double maxXDifference = 0.0d;

    @Override // java.util.TreeMap, java.util.AbstractMap, java.util.Map
    public V put(K k, V v) {
        this.indexList.add(k);
        updateMaxXDifference();
        return (V) super.put(k, v);
    }

    public V put(int i, K k, V v) {
        this.indexList.add(i, k);
        updateMaxXDifference();
        return (V) super.put(k, v);
    }

    private void updateMaxXDifference() {
        if (this.indexList.size() < 2) {
            this.maxXDifference = 0.0d;
        } else if (Math.abs(((Double) this.indexList.get(this.indexList.size() - 1)).doubleValue() - ((Double) this.indexList.get(this.indexList.size() - 2)).doubleValue()) > this.maxXDifference) {
            this.maxXDifference = Math.abs(((Double) this.indexList.get(this.indexList.size() - 1)).doubleValue() - ((Double) this.indexList.get(this.indexList.size() - 2)).doubleValue());
        }
    }

    public double getMaxXDifference() {
        return this.maxXDifference;
    }

    @Override // java.util.TreeMap, java.util.AbstractMap, java.util.Map
    public void clear() {
        updateMaxXDifference();
        super.clear();
        this.indexList.clear();
    }

    public K getXByIndex(int index) {
        return this.indexList.get(index);
    }

    public V getYByIndex(int index) {
        K key = this.indexList.get(index);
        return get(key);
    }

    public XYEntry<K, V> getByIndex(int index) {
        K key = this.indexList.get(index);
        return new XYEntry<>(key, get(key));
    }

    public XYEntry<K, V> removeByIndex(int index) {
        K key = this.indexList.remove(index);
        return new XYEntry<>(key, remove(key));
    }

    public int getIndexForKey(K key) {
        return Collections.binarySearch(this.indexList, key, null);
    }
}
