package com.mobeta.android.dslv;

import android.content.Context;
import android.database.Cursor;
import android.support.v4.widget.CursorAdapter;
import android.util.SparseIntArray;
import android.view.View;
import android.view.ViewGroup;
import com.mobeta.android.dslv.DragSortListView;
import java.util.ArrayList;

/* loaded from: com.dougkeen.bart_33_src.tar.gz.drag-sort-listview-gradle.unspecified.jar:com/mobeta/android/dslv/DragSortCursorAdapter.class */
public abstract class DragSortCursorAdapter extends CursorAdapter implements DragSortListView.DragSortListener {
    public static final int REMOVED = -1;
    private SparseIntArray mListMapping;
    private ArrayList<Integer> mRemovedCursorPositions;

    public DragSortCursorAdapter(Context context, Cursor c) {
        super(context, c);
        this.mListMapping = new SparseIntArray();
        this.mRemovedCursorPositions = new ArrayList<>();
    }

    public DragSortCursorAdapter(Context context, Cursor c, boolean autoRequery) {
        super(context, c, autoRequery);
        this.mListMapping = new SparseIntArray();
        this.mRemovedCursorPositions = new ArrayList<>();
    }

    public DragSortCursorAdapter(Context context, Cursor c, int flags) {
        super(context, c, flags);
        this.mListMapping = new SparseIntArray();
        this.mRemovedCursorPositions = new ArrayList<>();
    }

    public Cursor swapCursor(Cursor newCursor) {
        Cursor old = super.swapCursor(newCursor);
        resetMappings();
        return old;
    }

    public void changeCursor(Cursor cursor) {
        super.changeCursor(cursor);
        resetMappings();
    }

    public void reset() {
        resetMappings();
        notifyDataSetChanged();
    }

    private void resetMappings() {
        this.mListMapping.clear();
        this.mRemovedCursorPositions.clear();
    }

    public Object getItem(int position) {
        return super.getItem(this.mListMapping.get(position, position));
    }

    public long getItemId(int position) {
        return super.getItemId(this.mListMapping.get(position, position));
    }

    public View getDropDownView(int position, View convertView, ViewGroup parent) {
        return super.getDropDownView(this.mListMapping.get(position, position), convertView, parent);
    }

    public View getView(int position, View convertView, ViewGroup parent) {
        return super.getView(this.mListMapping.get(position, position), convertView, parent);
    }

    @Override // com.mobeta.android.dslv.DragSortListView.DropListener
    public void drop(int from, int to) {
        if (from != to) {
            int cursorFrom = this.mListMapping.get(from, from);
            if (from > to) {
                for (int i = from; i > to; i--) {
                    this.mListMapping.put(i, this.mListMapping.get(i - 1, i - 1));
                }
            } else {
                for (int i2 = from; i2 < to; i2++) {
                    this.mListMapping.put(i2, this.mListMapping.get(i2 + 1, i2 + 1));
                }
            }
            this.mListMapping.put(to, cursorFrom);
            cleanMapping();
            notifyDataSetChanged();
        }
    }

    @Override // com.mobeta.android.dslv.DragSortListView.RemoveListener
    public void remove(int which) {
        int cursorPos = this.mListMapping.get(which, which);
        if (!this.mRemovedCursorPositions.contains(Integer.valueOf(cursorPos))) {
            this.mRemovedCursorPositions.add(Integer.valueOf(cursorPos));
        }
        int newCount = getCount();
        for (int i = which; i < newCount; i++) {
            this.mListMapping.put(i, this.mListMapping.get(i + 1, i + 1));
        }
        this.mListMapping.delete(newCount);
        cleanMapping();
        notifyDataSetChanged();
    }

    @Override // com.mobeta.android.dslv.DragSortListView.DragListener
    public void drag(int from, int to) {
    }

    private void cleanMapping() {
        ArrayList<Integer> toRemove = new ArrayList<>();
        int size = this.mListMapping.size();
        for (int i = 0; i < size; i++) {
            if (this.mListMapping.keyAt(i) == this.mListMapping.valueAt(i)) {
                toRemove.add(Integer.valueOf(this.mListMapping.keyAt(i)));
            }
        }
        int size2 = toRemove.size();
        for (int i2 = 0; i2 < size2; i2++) {
            this.mListMapping.delete(toRemove.get(i2).intValue());
        }
    }

    public int getCount() {
        return super.getCount() - this.mRemovedCursorPositions.size();
    }

    public int getCursorPosition(int position) {
        return this.mListMapping.get(position, position);
    }

    public ArrayList<Integer> getCursorPositions() {
        ArrayList<Integer> result = new ArrayList<>();
        for (int i = 0; i < getCount(); i++) {
            result.add(Integer.valueOf(this.mListMapping.get(i, i)));
        }
        return result;
    }

    public int getListPosition(int cursorPosition) {
        if (this.mRemovedCursorPositions.contains(Integer.valueOf(cursorPosition))) {
            return -1;
        }
        int index = this.mListMapping.indexOfValue(cursorPosition);
        if (index < 0) {
            return cursorPosition;
        }
        return this.mListMapping.keyAt(index);
    }
}
