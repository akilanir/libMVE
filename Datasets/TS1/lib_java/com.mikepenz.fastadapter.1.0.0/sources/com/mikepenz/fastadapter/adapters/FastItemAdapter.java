package com.mikepenz.fastadapter.adapters;

import com.mikepenz.fastadapter.FastAdapter;
import com.mikepenz.fastadapter.IExpandable;
import com.mikepenz.fastadapter.IItem;
import com.mikepenz.fastadapter.IItemAdapter;
import com.mikepenz.fastadapter.adapters.ItemAdapter;
import java.util.List;

/* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/adapters/FastItemAdapter.class */
public class FastItemAdapter<Item extends IItem> extends FastAdapter<Item> {
    ItemAdapter<Item> mItemAdapter = new ItemAdapter<>();

    public FastItemAdapter() {
        this.mItemAdapter.wrap(this);
    }

    public ItemAdapter<Item> getItemAdapter() {
        return this.mItemAdapter;
    }

    public FastItemAdapter<Item> withUseIdDistributor(boolean useIdDistributor) {
        this.mItemAdapter.withUseIdDistributor(useIdDistributor);
        return this;
    }

    public ItemAdapter.ItemFilter getItemFilter() {
        return this.mItemAdapter.getItemFilter();
    }

    public FastItemAdapter<Item> withFilterPredicate(IItemAdapter.Predicate<Item> filterPredicate) {
        this.mItemAdapter.withFilterPredicate(filterPredicate);
        return this;
    }

    public void filter(CharSequence constraint) {
        this.mItemAdapter.filter(constraint);
    }

    public int getOrder() {
        return this.mItemAdapter.getOrder();
    }

    public int getAdapterItemCount() {
        return this.mItemAdapter.getAdapterItemCount();
    }

    public List<Item> getAdapterItems() {
        return this.mItemAdapter.getAdapterItems();
    }

    public int getAdapterPosition(Item item) {
        return this.mItemAdapter.getAdapterPosition(item);
    }

    public int getGlobalPosition(int position) {
        return this.mItemAdapter.getGlobalPosition(position);
    }

    public Item getAdapterItem(int i) {
        return (Item) this.mItemAdapter.getAdapterItem(i);
    }

    public <T> T setSubItems(IExpandable<T, Item> iExpandable, List<Item> list) {
        return (T) this.mItemAdapter.setSubItems(iExpandable, list);
    }

    public void set(List<Item> items) {
        this.mItemAdapter.set(items);
    }

    public void setNewList(List<Item> items) {
        this.mItemAdapter.setNewList(items);
    }

    @SafeVarargs
    public final void add(Item... items) {
        this.mItemAdapter.add(items);
    }

    public void add(List<Item> items) {
        this.mItemAdapter.add(items);
    }

    @SafeVarargs
    public final void add(int position, Item... items) {
        this.mItemAdapter.add(position, items);
    }

    public void add(int position, List<Item> items) {
        this.mItemAdapter.add(position, items);
    }

    public void set(int position, Item item) {
        this.mItemAdapter.set(position, item);
    }

    public void add(Item item) {
        this.mItemAdapter.add(item);
    }

    public void add(int position, Item item) {
        this.mItemAdapter.add(position, item);
    }

    public void remove(int position) {
        this.mItemAdapter.remove(position);
    }

    public void removeItemRange(int position, int itemCount) {
        this.mItemAdapter.removeRange(position, itemCount);
    }

    public void clear() {
        this.mItemAdapter.clear();
    }
}
