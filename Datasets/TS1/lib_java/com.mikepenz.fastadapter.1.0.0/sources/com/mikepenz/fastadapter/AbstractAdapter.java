package com.mikepenz.fastadapter;

import android.support.v7.widget.RecyclerView;
import android.view.ViewGroup;
import com.mikepenz.fastadapter.IItem;
import java.util.List;

/* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/AbstractAdapter.class */
public abstract class AbstractAdapter<Item extends IItem> extends RecyclerView.Adapter implements IAdapter<Item> {
    private FastAdapter<Item> mFastAdapter;

    public AbstractAdapter wrap(FastAdapter fastAdapter) {
        this.mFastAdapter = fastAdapter;
        this.mFastAdapter.registerAdapter(this);
        return this;
    }

    public AbstractAdapter wrap(AbstractAdapter abstractAdapter) {
        this.mFastAdapter = abstractAdapter.getFastAdapter();
        this.mFastAdapter.registerAdapter(this);
        return this;
    }

    public void registerAdapterDataObserver(RecyclerView.AdapterDataObserver observer) {
        super.registerAdapterDataObserver(observer);
        if (this.mFastAdapter != null) {
            this.mFastAdapter.registerAdapterDataObserver(observer);
        }
    }

    public void unregisterAdapterDataObserver(RecyclerView.AdapterDataObserver observer) {
        super.unregisterAdapterDataObserver(observer);
        if (this.mFastAdapter != null) {
            this.mFastAdapter.unregisterAdapterDataObserver(observer);
        }
    }

    public int getItemViewType(int position) {
        return this.mFastAdapter.getItemViewType(position);
    }

    public long getItemId(int position) {
        return this.mFastAdapter.getItemId(position);
    }

    @Override // com.mikepenz.fastadapter.IAdapter
    public FastAdapter<Item> getFastAdapter() {
        return this.mFastAdapter;
    }

    @Override // com.mikepenz.fastadapter.IAdapter
    public Item getItem(int i) {
        return (Item) this.mFastAdapter.getItem(i);
    }

    @Override // com.mikepenz.fastadapter.IAdapter
    public int getItemCount() {
        return this.mFastAdapter.getItemCount();
    }

    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        return this.mFastAdapter.onCreateViewHolder(parent, viewType);
    }

    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
        this.mFastAdapter.onBindViewHolder(holder, position);
    }

    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position, List payloads) {
        this.mFastAdapter.onBindViewHolder(holder, position, payloads);
    }

    public void setHasStableIds(boolean hasStableIds) {
        this.mFastAdapter.setHasStableIds(hasStableIds);
    }

    public void onViewRecycled(RecyclerView.ViewHolder holder) {
        this.mFastAdapter.onViewRecycled(holder);
    }

    public boolean onFailedToRecycleView(RecyclerView.ViewHolder holder) {
        return this.mFastAdapter.onFailedToRecycleView(holder);
    }

    public void onViewDetachedFromWindow(RecyclerView.ViewHolder holder) {
        this.mFastAdapter.onViewDetachedFromWindow(holder);
    }

    public void onViewAttachedToWindow(RecyclerView.ViewHolder holder) {
        this.mFastAdapter.onViewAttachedToWindow(holder);
    }

    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        this.mFastAdapter.onAttachedToRecyclerView(recyclerView);
    }

    public void onDetachedFromRecyclerView(RecyclerView recyclerView) {
        this.mFastAdapter.onDetachedFromRecyclerView(recyclerView);
    }

    public void mapPossibleTypes(Iterable<Item> items) {
        if (items != null) {
            for (Item item : items) {
                mapPossibleType(item);
            }
        }
    }

    public void mapPossibleType(Item item) {
        this.mFastAdapter.registerTypeInstance(item);
    }
}
