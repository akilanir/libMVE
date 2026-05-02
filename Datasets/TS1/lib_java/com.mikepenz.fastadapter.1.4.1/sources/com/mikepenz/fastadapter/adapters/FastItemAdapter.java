package com.mikepenz.fastadapter.adapters;

import com.mikepenz.fastadapter.FastAdapter;
import com.mikepenz.fastadapter.IExpandable;
import com.mikepenz.fastadapter.IItem;
import com.mikepenz.fastadapter.IItemAdapter;
import com.mikepenz.fastadapter.adapters.ItemAdapter;
import java.util.List;

/* loaded from: com.mikepenz.fastadapter.1.4.1.jar:com/mikepenz/fastadapter/adapters/FastItemAdapter.class */
public class FastItemAdapter<Item extends IItem> extends FastAdapter<Item> {
    private final ItemAdapter<Item> mItemAdapter = new ItemAdapter<>();

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

    public FastItemAdapter<Item> set(List<Item> items) {
        this.mItemAdapter.set((List) items);
        return this;
    }

    public FastItemAdapter<Item> setNewList(List<Item> items) {
        this.mItemAdapter.setNewList((List) items);
        return this;
    }

    @SafeVarargs
    public final FastItemAdapter<Item> add(Item... items) {
        this.mItemAdapter.add((IItem[]) items);
        return this;
    }

    public FastItemAdapter<Item> add(List<Item> items) {
        this.mItemAdapter.add((List) items);
        return this;
    }

    @SafeVarargs
    public final FastItemAdapter<Item> add(int position, Item... items) {
        this.mItemAdapter.add(position, (IItem[]) items);
        return this;
    }

    public FastItemAdapter<Item> add(int position, List<Item> items) {
        this.mItemAdapter.add(position, (List) items);
        return this;
    }

    public FastItemAdapter<Item> set(int position, Item item) {
        this.mItemAdapter.set(position, (int) item);
        return this;
    }

    public FastItemAdapter<Item> add(Item item) {
        this.mItemAdapter.add(item);
        return this;
    }

    public FastItemAdapter<Item> add(int position, Item item) {
        this.mItemAdapter.add(position, item);
        return this;
    }

    public FastItemAdapter<Item> move(int fromPosition, int toPosition) {
        this.mItemAdapter.move(fromPosition, toPosition);
        return this;
    }

    public FastItemAdapter<Item> remove(int position) {
        this.mItemAdapter.remove(position);
        return this;
    }

    public FastItemAdapter<Item> removeItemRange(int position, int itemCount) {
        this.mItemAdapter.removeRange(position, itemCount);
        return this;
    }

    public FastItemAdapter<Item> clear() {
        this.mItemAdapter.clear();
        return this;
    }
}
