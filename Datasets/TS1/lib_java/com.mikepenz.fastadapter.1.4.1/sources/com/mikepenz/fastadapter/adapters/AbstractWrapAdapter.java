package com.mikepenz.fastadapter.adapters;

import android.support.v7.widget.RecyclerView;
import android.view.ViewGroup;
import com.mikepenz.fastadapter.IItem;
import java.util.ArrayList;
import java.util.List;

/* loaded from: com.mikepenz.fastadapter.1.4.1.jar:com/mikepenz/fastadapter/adapters/AbstractWrapAdapter.class */
public abstract class AbstractWrapAdapter<Item extends IItem> extends RecyclerView.Adapter {
    private List<Item> mItems;
    private RecyclerView.Adapter mAdapter;

    public abstract boolean shouldInsertItemAtPosition(int i);

    public abstract int itemInsertedBeforeCount(int i);

    public AbstractWrapAdapter(List<Item> items) {
        this.mItems = new ArrayList();
        this.mItems = items;
    }

    public List<Item> getItems() {
        return this.mItems;
    }

    public void setItems(List<Item> items) {
        this.mItems = items;
    }

    public AbstractWrapAdapter wrap(RecyclerView.Adapter adapter) {
        this.mAdapter = adapter;
        return this;
    }

    public void registerAdapterDataObserver(RecyclerView.AdapterDataObserver observer) {
        super.registerAdapterDataObserver(observer);
        if (this.mAdapter != null) {
            this.mAdapter.registerAdapterDataObserver(observer);
        }
    }

    public void unregisterAdapterDataObserver(RecyclerView.AdapterDataObserver observer) {
        super.unregisterAdapterDataObserver(observer);
        if (this.mAdapter != null) {
            this.mAdapter.unregisterAdapterDataObserver(observer);
        }
    }

    public int getItemViewType(int position) {
        if (shouldInsertItemAtPosition(position)) {
            return getItem(position).getType();
        }
        return this.mAdapter.getItemViewType(position - itemInsertedBeforeCount(position));
    }

    public long getItemId(int position) {
        if (shouldInsertItemAtPosition(position)) {
            return getItem(position).getIdentifier();
        }
        return this.mAdapter.getItemId(position - itemInsertedBeforeCount(position));
    }

    public RecyclerView.Adapter getAdapter() {
        return this.mAdapter;
    }

    public Item getItem(int position) {
        if (shouldInsertItemAtPosition(position)) {
            return this.mItems.get(itemInsertedBeforeCount(position - 1));
        }
        return null;
    }

    public int getItemCount() {
        int itemCount = this.mAdapter.getItemCount();
        return itemCount + itemInsertedBeforeCount(itemCount);
    }

    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        for (Item item : this.mItems) {
            if (item.getType() == viewType) {
                return item.getViewHolder(parent);
            }
        }
        return this.mAdapter.onCreateViewHolder(parent, viewType);
    }

    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
        if (shouldInsertItemAtPosition(position)) {
            getItem(position).bindView(holder);
        } else {
            this.mAdapter.onBindViewHolder(holder, position - itemInsertedBeforeCount(position));
        }
    }

    public void setHasStableIds(boolean hasStableIds) {
        this.mAdapter.setHasStableIds(hasStableIds);
    }

    public void onViewRecycled(RecyclerView.ViewHolder holder) {
        this.mAdapter.onViewRecycled(holder);
    }

    public boolean onFailedToRecycleView(RecyclerView.ViewHolder holder) {
        return this.mAdapter.onFailedToRecycleView(holder);
    }

    public void onViewDetachedFromWindow(RecyclerView.ViewHolder holder) {
        this.mAdapter.onViewDetachedFromWindow(holder);
    }

    public void onViewAttachedToWindow(RecyclerView.ViewHolder holder) {
        this.mAdapter.onViewAttachedToWindow(holder);
    }

    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        this.mAdapter.onAttachedToRecyclerView(recyclerView);
    }

    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        this.mAdapter.onDetachedFromRecyclerView(recyclerView);
    }
}
