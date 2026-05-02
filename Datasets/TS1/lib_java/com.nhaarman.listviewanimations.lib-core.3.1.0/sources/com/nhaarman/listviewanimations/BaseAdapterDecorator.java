package com.nhaarman.listviewanimations;

import android.database.DataSetObserver;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.BaseAdapter;
import android.widget.SectionIndexer;
import com.nhaarman.listviewanimations.util.AbsListViewWrapper;
import com.nhaarman.listviewanimations.util.Insertable;
import com.nhaarman.listviewanimations.util.ListViewWrapper;
import com.nhaarman.listviewanimations.util.ListViewWrapperSetter;
import com.nhaarman.listviewanimations.util.Swappable;

/* loaded from: com.nhaarman.listviewanimations.lib-core.3.1.0.jar:com/nhaarman/listviewanimations/BaseAdapterDecorator.class */
public abstract class BaseAdapterDecorator extends BaseAdapter implements SectionIndexer, Swappable, Insertable, ListViewWrapperSetter {

    @NonNull
    private final BaseAdapter mDecoratedBaseAdapter;

    @Nullable
    private ListViewWrapper mListViewWrapper;

    protected BaseAdapterDecorator(@NonNull BaseAdapter baseAdapter) {
        this.mDecoratedBaseAdapter = baseAdapter;
    }

    @NonNull
    public BaseAdapter getDecoratedBaseAdapter() {
        return this.mDecoratedBaseAdapter;
    }

    @NonNull
    protected BaseAdapter getRootAdapter() {
        BaseAdapter baseAdapter = this.mDecoratedBaseAdapter;
        while (true) {
            BaseAdapter adapter = baseAdapter;
            if (adapter instanceof BaseAdapterDecorator) {
                baseAdapter = ((BaseAdapterDecorator) adapter).getDecoratedBaseAdapter();
            } else {
                return adapter;
            }
        }
    }

    public void setAbsListView(@NonNull AbsListView absListView) {
        setListViewWrapper(new AbsListViewWrapper(absListView));
    }

    @Nullable
    public ListViewWrapper getListViewWrapper() {
        return this.mListViewWrapper;
    }

    @Override // com.nhaarman.listviewanimations.util.ListViewWrapperSetter
    public void setListViewWrapper(@NonNull ListViewWrapper listViewWrapper) {
        this.mListViewWrapper = listViewWrapper;
        if (this.mDecoratedBaseAdapter instanceof ListViewWrapperSetter) {
            ((ListViewWrapperSetter) this.mDecoratedBaseAdapter).setListViewWrapper(listViewWrapper);
        }
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return this.mDecoratedBaseAdapter.getCount();
    }

    @Override // android.widget.Adapter
    public Object getItem(int position) {
        return this.mDecoratedBaseAdapter.getItem(position);
    }

    @Override // android.widget.Adapter
    public long getItemId(int position) {
        return this.mDecoratedBaseAdapter.getItemId(position);
    }

    @Override // android.widget.Adapter
    @NonNull
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        return this.mDecoratedBaseAdapter.getView(position, convertView, parent);
    }

    @Override // android.widget.BaseAdapter, android.widget.ListAdapter
    public boolean areAllItemsEnabled() {
        return this.mDecoratedBaseAdapter.areAllItemsEnabled();
    }

    @Override // android.widget.BaseAdapter, android.widget.SpinnerAdapter
    @NonNull
    public View getDropDownView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        return this.mDecoratedBaseAdapter.getDropDownView(position, convertView, parent);
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public int getItemViewType(int position) {
        return this.mDecoratedBaseAdapter.getItemViewType(position);
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public int getViewTypeCount() {
        return this.mDecoratedBaseAdapter.getViewTypeCount();
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public boolean hasStableIds() {
        return this.mDecoratedBaseAdapter.hasStableIds();
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public boolean isEmpty() {
        return this.mDecoratedBaseAdapter.isEmpty();
    }

    @Override // android.widget.BaseAdapter, android.widget.ListAdapter
    public boolean isEnabled(int position) {
        return this.mDecoratedBaseAdapter.isEnabled(position);
    }

    @Override // android.widget.BaseAdapter
    public void notifyDataSetChanged() {
        if (!(this.mDecoratedBaseAdapter instanceof ArrayAdapter)) {
            this.mDecoratedBaseAdapter.notifyDataSetChanged();
        }
    }

    public void notifyDataSetChanged(boolean force) {
        if (force || !(this.mDecoratedBaseAdapter instanceof ArrayAdapter)) {
            this.mDecoratedBaseAdapter.notifyDataSetChanged();
        }
    }

    @Override // android.widget.BaseAdapter
    public void notifyDataSetInvalidated() {
        this.mDecoratedBaseAdapter.notifyDataSetInvalidated();
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public void registerDataSetObserver(@NonNull DataSetObserver observer) {
        this.mDecoratedBaseAdapter.registerDataSetObserver(observer);
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public void unregisterDataSetObserver(@NonNull DataSetObserver observer) {
        this.mDecoratedBaseAdapter.unregisterDataSetObserver(observer);
    }

    @Override // android.widget.SectionIndexer
    public int getPositionForSection(int sectionIndex) {
        int result = 0;
        if (this.mDecoratedBaseAdapter instanceof SectionIndexer) {
            result = ((SectionIndexer) this.mDecoratedBaseAdapter).getPositionForSection(sectionIndex);
        }
        return result;
    }

    @Override // android.widget.SectionIndexer
    public int getSectionForPosition(int position) {
        int result = 0;
        if (this.mDecoratedBaseAdapter instanceof SectionIndexer) {
            result = ((SectionIndexer) this.mDecoratedBaseAdapter).getSectionForPosition(position);
        }
        return result;
    }

    @Override // android.widget.SectionIndexer
    @NonNull
    public Object[] getSections() {
        Object[] result = new Object[0];
        if (this.mDecoratedBaseAdapter instanceof SectionIndexer) {
            result = ((SectionIndexer) this.mDecoratedBaseAdapter).getSections();
        }
        return result;
    }

    @Override // com.nhaarman.listviewanimations.util.Swappable
    public void swapItems(int positionOne, int positionTwo) {
        if (this.mDecoratedBaseAdapter instanceof Swappable) {
            ((Swappable) this.mDecoratedBaseAdapter).swapItems(positionOne, positionTwo);
        } else {
            Log.w("ListViewAnimations", "Warning: swapItems called on an adapter that does not implement Swappable!");
        }
    }

    @Override // com.nhaarman.listviewanimations.util.Insertable
    public void add(int index, @NonNull Object item) {
        if (this.mDecoratedBaseAdapter instanceof Insertable) {
            ((Insertable) this.mDecoratedBaseAdapter).add(index, item);
        } else {
            Log.w("ListViewAnimations", "Warning: add called on an adapter that does not implement Insertable!");
        }
    }
}
