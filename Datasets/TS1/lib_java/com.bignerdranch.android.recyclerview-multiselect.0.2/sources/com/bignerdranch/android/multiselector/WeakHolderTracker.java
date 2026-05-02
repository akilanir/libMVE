package com.bignerdranch.android.multiselector;

import android.util.SparseArray;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

/* loaded from: com.bignerdranch.android.recyclerview-multiselect.0.2.jar:com/bignerdranch/android/multiselector/WeakHolderTracker.class */
class WeakHolderTracker {
    private SparseArray<WeakReference<SelectableHolder>> mHoldersByPosition = new SparseArray<>();

    WeakHolderTracker() {
    }

    public SelectableHolder getHolder(int position) {
        WeakReference<SelectableHolder> holderRef = this.mHoldersByPosition.get(position);
        if (holderRef == null) {
            return null;
        }
        SelectableHolder holder = holderRef.get();
        if (holder == null || holder.getAdapterPosition() != position) {
            this.mHoldersByPosition.remove(position);
            return null;
        }
        return holder;
    }

    public void bindHolder(SelectableHolder holder, int position) {
        this.mHoldersByPosition.put(position, new WeakReference<>(holder));
    }

    public List<SelectableHolder> getTrackedHolders() {
        List<SelectableHolder> holders = new ArrayList<>();
        for (int i = 0; i < this.mHoldersByPosition.size(); i++) {
            int key = this.mHoldersByPosition.keyAt(i);
            SelectableHolder holder = getHolder(key);
            if (holder != null) {
                holders.add(holder);
            }
        }
        return holders;
    }
}
