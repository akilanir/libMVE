package com.nhaarman.listviewanimations;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.widget.BaseAdapter;
import com.nhaarman.listviewanimations.util.Insertable;
import com.nhaarman.listviewanimations.util.Swappable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/* loaded from: com.nhaarman.listviewanimations.lib-core.3.1.0.jar:com/nhaarman/listviewanimations/ArrayAdapter.class */
public abstract class ArrayAdapter<T> extends BaseAdapter implements Swappable, Insertable<T> {

    @NonNull
    private final List<T> mItems;
    private BaseAdapter mDataSetChangedSlavedAdapter;

    protected ArrayAdapter() {
        this(null);
    }

    protected ArrayAdapter(@Nullable List<T> objects) {
        if (objects != null) {
            this.mItems = objects;
        } else {
            this.mItems = new ArrayList();
        }
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return this.mItems.size();
    }

    @Override // android.widget.Adapter
    public long getItemId(int position) {
        return position;
    }

    @Override // android.widget.Adapter
    @NonNull
    public T getItem(int position) {
        return this.mItems.get(position);
    }

    @NonNull
    public List<T> getItems() {
        return this.mItems;
    }

    public boolean add(@NonNull T object) {
        boolean result = this.mItems.add(object);
        notifyDataSetChanged();
        return result;
    }

    @Override // com.nhaarman.listviewanimations.util.Insertable
    public void add(int index, @NonNull T item) {
        this.mItems.add(index, item);
        notifyDataSetChanged();
    }

    public boolean addAll(@NonNull Collection<? extends T> collection) {
        boolean result = this.mItems.addAll(collection);
        notifyDataSetChanged();
        return result;
    }

    public boolean contains(T object) {
        return this.mItems.contains(object);
    }

    public void clear() {
        this.mItems.clear();
        notifyDataSetChanged();
    }

    public boolean remove(@NonNull Object object) {
        boolean result = this.mItems.remove(object);
        notifyDataSetChanged();
        return result;
    }

    @NonNull
    public T remove(int location) {
        T result = this.mItems.remove(location);
        notifyDataSetChanged();
        return result;
    }

    @Override // com.nhaarman.listviewanimations.util.Swappable
    public void swapItems(int positionOne, int positionTwo) {
        T firstItem = this.mItems.set(positionOne, getItem(positionTwo));
        notifyDataSetChanged();
        this.mItems.set(positionTwo, firstItem);
    }

    public void propagateNotifyDataSetChanged(@NonNull BaseAdapter slavedAdapter) {
        this.mDataSetChangedSlavedAdapter = slavedAdapter;
    }

    @Override // android.widget.BaseAdapter
    public void notifyDataSetChanged() {
        super.notifyDataSetChanged();
        if (this.mDataSetChangedSlavedAdapter != null) {
            this.mDataSetChangedSlavedAdapter.notifyDataSetChanged();
        }
    }
}
