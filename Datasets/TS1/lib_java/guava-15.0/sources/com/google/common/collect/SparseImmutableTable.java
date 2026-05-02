package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Table;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.annotation.concurrent.Immutable;

@GwtCompatible
@Immutable
/* loaded from: guava-15.0.jar:com/google/common/collect/SparseImmutableTable.class */
final class SparseImmutableTable<R, C, V> extends RegularImmutableTable<R, C, V> {
    private final ImmutableMap<R, Map<C, V>> rowMap;
    private final ImmutableMap<C, Map<R, V>> columnMap;
    private final int[] iterationOrderRow;
    private final int[] iterationOrderColumn;

    SparseImmutableTable(ImmutableList<Table.Cell<R, C, V>> cellList, ImmutableSet<R> rowSpace, ImmutableSet<C> columnSpace) {
        HashMap newHashMap = Maps.newHashMap();
        LinkedHashMap newLinkedHashMap = Maps.newLinkedHashMap();
        Iterator i$ = rowSpace.iterator();
        while (i$.hasNext()) {
            Object next = i$.next();
            newHashMap.put(next, Integer.valueOf(newLinkedHashMap.size()));
            newLinkedHashMap.put(next, new LinkedHashMap());
        }
        LinkedHashMap newLinkedHashMap2 = Maps.newLinkedHashMap();
        Iterator i$2 = columnSpace.iterator();
        while (i$2.hasNext()) {
            newLinkedHashMap2.put(i$2.next(), new LinkedHashMap());
        }
        int[] iterationOrderRow = new int[cellList.size()];
        int[] iterationOrderColumn = new int[cellList.size()];
        for (int i = 0; i < cellList.size(); i++) {
            Table.Cell<R, C, V> cell = cellList.get(i);
            R rowKey = cell.getRowKey();
            C columnKey = cell.getColumnKey();
            V value = cell.getValue();
            iterationOrderRow[i] = ((Integer) newHashMap.get(rowKey)).intValue();
            Map<C, V> thisRow = (Map) newLinkedHashMap.get(rowKey);
            iterationOrderColumn[i] = thisRow.size();
            V oldValue = thisRow.put(columnKey, value);
            if (oldValue != null) {
                throw new IllegalArgumentException("Duplicate value for row=" + rowKey + ", column=" + columnKey + ": " + value + ", " + oldValue);
            }
            ((Map) newLinkedHashMap2.get(columnKey)).put(rowKey, value);
        }
        this.iterationOrderRow = iterationOrderRow;
        this.iterationOrderColumn = iterationOrderColumn;
        ImmutableMap.Builder builder = ImmutableMap.builder();
        for (Map.Entry<R, Map<C, V>> row : newLinkedHashMap.entrySet()) {
            builder.put(row.getKey(), ImmutableMap.copyOf((Map) row.getValue()));
        }
        this.rowMap = builder.build();
        ImmutableMap.Builder builder2 = ImmutableMap.builder();
        for (Map.Entry<C, Map<R, V>> col : newLinkedHashMap2.entrySet()) {
            builder2.put(col.getKey(), ImmutableMap.copyOf((Map) col.getValue()));
        }
        this.columnMap = builder2.build();
    }

    @Override // com.google.common.collect.ImmutableTable, com.google.common.collect.Table
    public ImmutableMap<C, Map<R, V>> columnMap() {
        return this.columnMap;
    }

    @Override // com.google.common.collect.ImmutableTable, com.google.common.collect.Table
    public ImmutableMap<R, Map<C, V>> rowMap() {
        return this.rowMap;
    }

    @Override // com.google.common.collect.Table
    public int size() {
        return this.iterationOrderRow.length;
    }

    @Override // com.google.common.collect.RegularImmutableTable
    Table.Cell<R, C, V> getCell(int index) {
        int rowIndex = this.iterationOrderRow[index];
        Map.Entry<R, Map<C, V>> rowEntry = this.rowMap.entrySet().asList().get(rowIndex);
        ImmutableMap<C, V> row = (ImmutableMap) rowEntry.getValue();
        int columnIndex = this.iterationOrderColumn[index];
        Map.Entry<C, V> colEntry = row.entrySet().asList().get(columnIndex);
        return cellOf(rowEntry.getKey(), colEntry.getKey(), colEntry.getValue());
    }

    @Override // com.google.common.collect.RegularImmutableTable
    V getValue(int index) {
        int rowIndex = this.iterationOrderRow[index];
        ImmutableMap<C, V> row = (ImmutableMap) this.rowMap.values().asList().get(rowIndex);
        int columnIndex = this.iterationOrderColumn[index];
        return row.values().asList().get(columnIndex);
    }
}
