package com.mikepenz.fastadapter.utils;

import android.util.SparseIntArray;
import com.mikepenz.fastadapter.FastAdapter;
import com.mikepenz.fastadapter.IExpandable;
import com.mikepenz.fastadapter.IItem;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

/* loaded from: com.mikepenz.fastadapter.1.4.1.jar:com/mikepenz/fastadapter/utils/AdapterUtil.class */
public class AdapterUtil {
    public static void handleStates(FastAdapter fastAdapter, int startPosition, int endPosition) {
        for (int i = endPosition; i >= startPosition; i--) {
            IItem updateItem = fastAdapter.getItem(i);
            if (updateItem.isSelected()) {
                fastAdapter.getSelections().add(Integer.valueOf(i));
            } else if (fastAdapter.getSelections().contains(Integer.valueOf(i))) {
                fastAdapter.getSelections().remove(Integer.valueOf(i));
            }
            if ((updateItem instanceof IExpandable) && ((IExpandable) updateItem).isExpanded() && fastAdapter.getExpanded().indexOfKey(i) < 0) {
                fastAdapter.expand(i);
            }
        }
    }

    public static SortedSet<Integer> adjustPosition(Set<Integer> positions, int startPosition, int endPosition, int adjustBy) {
        SortedSet<Integer> newPositions = new TreeSet<>();
        for (Integer entry : positions) {
            int position = entry.intValue();
            if (position < startPosition || position > endPosition) {
                newPositions.add(Integer.valueOf(position));
            } else if (adjustBy > 0) {
                newPositions.add(Integer.valueOf(position + adjustBy));
            } else if (adjustBy < 0 && (position <= startPosition + adjustBy || position > startPosition)) {
                newPositions.add(Integer.valueOf(position + adjustBy));
            }
        }
        return newPositions;
    }

    public static SparseIntArray adjustPosition(SparseIntArray positions, int startPosition, int endPosition, int adjustBy) {
        SparseIntArray newPositions = new SparseIntArray();
        int length = positions.size();
        for (int i = 0; i < length; i++) {
            int position = positions.keyAt(i);
            if (position < startPosition || position > endPosition) {
                newPositions.put(position, positions.valueAt(i));
            } else if (adjustBy > 0) {
                newPositions.put(position + adjustBy, positions.valueAt(i));
            } else if (adjustBy < 0 && (position <= startPosition + adjustBy || position > startPosition)) {
                newPositions.put(position + adjustBy, positions.valueAt(i));
            }
        }
        return newPositions;
    }
}
