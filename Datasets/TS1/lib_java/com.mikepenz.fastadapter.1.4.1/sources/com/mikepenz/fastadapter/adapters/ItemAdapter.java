package com.mikepenz.fastadapter.adapters;

import android.widget.Filter;
import com.mikepenz.fastadapter.AbstractAdapter;
import com.mikepenz.fastadapter.IExpandable;
import com.mikepenz.fastadapter.IItem;
import com.mikepenz.fastadapter.IItemAdapter;
import com.mikepenz.fastadapter.utils.IdDistributor;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/* loaded from: com.mikepenz.fastadapter.1.4.1.jar:com/mikepenz/fastadapter/adapters/ItemAdapter.class */
public class ItemAdapter<Item extends IItem> extends AbstractAdapter<Item> implements IItemAdapter<Item> {
    private List<Item> mItems = new ArrayList();
    private boolean mUseIdDistributor = true;
    private final ItemAdapter<Item>.ItemFilter mItemFilter = new ItemFilter();
    private IItemAdapter.Predicate<Item> mFilterPredicate;
    protected ItemFilterListener mItemFilterListener;
    protected Comparator<Item> mComparator;

    /* loaded from: com.mikepenz.fastadapter.1.4.1.jar:com/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilterListener.class */
    public interface ItemFilterListener {
        void itemsFiltered();
    }

    @Override // com.mikepenz.fastadapter.IItemAdapter
    public /* bridge */ /* synthetic */ IItemAdapter set(int i, IItem iItem) {
        return set(i, (int) iItem);
    }

    public ItemAdapter withUseIdDistributor(boolean useIdDistributor) {
        this.mUseIdDistributor = useIdDistributor;
        return this;
    }

    public ItemAdapter<Item>.ItemFilter getItemFilter() {
        return this.mItemFilter;
    }

    public ItemAdapter<Item> withFilterPredicate(IItemAdapter.Predicate<Item> filterPredicate) {
        this.mFilterPredicate = filterPredicate;
        return this;
    }

    public void filter(CharSequence constraint) {
        this.mItemFilter.filter(constraint);
    }

    public ItemAdapter<Item> withItemFilterListener(ItemFilterListener listener) {
        this.mItemFilterListener = listener;
        return this;
    }

    public ItemAdapter<Item> withComparator(Comparator<Item> comparator) {
        return withComparator(comparator, true);
    }

    public ItemAdapter<Item> withComparator(Comparator<Item> comparator, boolean sortNow) {
        this.mComparator = comparator;
        if (this.mItems != null && this.mComparator != null && sortNow) {
            Collections.sort(this.mItems, this.mComparator);
            getFastAdapter().notifyAdapterDataSetChanged();
        }
        return this;
    }

    public Comparator<Item> getComparator() {
        return this.mComparator;
    }

    public int getOrder() {
        return 500;
    }

    @Override // com.mikepenz.fastadapter.IAdapter
    public int getAdapterItemCount() {
        return this.mItems.size();
    }

    @Override // com.mikepenz.fastadapter.IAdapter
    public List<Item> getAdapterItems() {
        return this.mItems;
    }

    @Override // com.mikepenz.fastadapter.IAdapter
    public int getAdapterPosition(Item item) {
        int length = this.mItems.size();
        for (int i = 0; i < length; i++) {
            if (this.mItems.get(i).getIdentifier() == item.getIdentifier()) {
                return i;
            }
        }
        return -1;
    }

    @Override // com.mikepenz.fastadapter.IAdapter
    public int getGlobalPosition(int position) {
        return position + getFastAdapter().getPreItemCountByOrder(getOrder());
    }

    @Override // com.mikepenz.fastadapter.IAdapter
    public Item getAdapterItem(int position) {
        return this.mItems.get(position);
    }

    @Override // com.mikepenz.fastadapter.IItemAdapter
    public <T> T setSubItems(IExpandable<T, Item> collapsible, List<Item> subItems) {
        if (this.mUseIdDistributor) {
            IdDistributor.checkIds(subItems);
        }
        return collapsible.withSubItems(subItems);
    }

    @Override // com.mikepenz.fastadapter.IItemAdapter
    public ItemAdapter<Item> set(List<Item> items) {
        if (this.mUseIdDistributor) {
            IdDistributor.checkIds(items);
        }
        getFastAdapter().collapse(false);
        int newItemsCount = items.size();
        int previousItemsCount = this.mItems.size();
        int itemsBeforeThisAdapter = getFastAdapter().getPreItemCountByOrder(getOrder());
        if (items != this.mItems) {
            if (!this.mItems.isEmpty()) {
                this.mItems.clear();
            }
            this.mItems.addAll(items);
        }
        mapPossibleTypes(items);
        if (this.mComparator != null) {
            Collections.sort(this.mItems, this.mComparator);
        }
        if (newItemsCount > previousItemsCount) {
            if (previousItemsCount > 0) {
                getFastAdapter().notifyAdapterItemRangeChanged(itemsBeforeThisAdapter, previousItemsCount);
            }
            getFastAdapter().notifyAdapterItemRangeInserted(itemsBeforeThisAdapter + previousItemsCount, newItemsCount - previousItemsCount);
        } else if (newItemsCount > 0 && newItemsCount < previousItemsCount) {
            getFastAdapter().notifyAdapterItemRangeChanged(itemsBeforeThisAdapter, newItemsCount);
            getFastAdapter().notifyAdapterItemRangeRemoved(itemsBeforeThisAdapter + newItemsCount, previousItemsCount - newItemsCount);
        } else if (newItemsCount == 0) {
            getFastAdapter().notifyAdapterItemRangeRemoved(itemsBeforeThisAdapter, previousItemsCount);
        } else {
            getFastAdapter().notifyAdapterDataSetChanged();
        }
        return this;
    }

    @Override // com.mikepenz.fastadapter.IItemAdapter
    public ItemAdapter<Item> setNewList(List<Item> items) {
        if (this.mUseIdDistributor) {
            IdDistributor.checkIds(items);
        }
        this.mItems = new ArrayList(items);
        mapPossibleTypes(this.mItems);
        if (this.mComparator != null) {
            Collections.sort(this.mItems, this.mComparator);
        }
        getFastAdapter().notifyAdapterDataSetChanged();
        return this;
    }

    @Override // com.mikepenz.fastadapter.IItemAdapter
    @SafeVarargs
    public final ItemAdapter<Item> add(Item... items) {
        return add((List) Arrays.asList(items));
    }

    @Override // com.mikepenz.fastadapter.IItemAdapter
    public ItemAdapter<Item> add(List<Item> items) {
        if (this.mUseIdDistributor) {
            IdDistributor.checkIds(items);
        }
        int countBefore = this.mItems.size();
        this.mItems.addAll(items);
        mapPossibleTypes(items);
        if (this.mComparator == null) {
            getFastAdapter().notifyAdapterItemRangeInserted(getFastAdapter().getPreItemCountByOrder(getOrder()) + countBefore, items.size());
        } else {
            Collections.sort(this.mItems, this.mComparator);
            getFastAdapter().notifyAdapterDataSetChanged();
        }
        return this;
    }

    @Override // com.mikepenz.fastadapter.IItemAdapter
    @SafeVarargs
    public final ItemAdapter<Item> add(int position, Item... items) {
        return add(position, (List) Arrays.asList(items));
    }

    @Override // com.mikepenz.fastadapter.IItemAdapter
    public ItemAdapter<Item> add(int position, List<Item> items) {
        if (this.mUseIdDistributor) {
            IdDistributor.checkIds(items);
        }
        if (items != null) {
            this.mItems.addAll(position - getFastAdapter().getPreItemCount(position), items);
            mapPossibleTypes(items);
            getFastAdapter().notifyAdapterItemRangeInserted(position, items.size());
        }
        return this;
    }

    @Override // com.mikepenz.fastadapter.IItemAdapter
    public ItemAdapter<Item> set(int position, Item item) {
        if (this.mUseIdDistributor) {
            IdDistributor.checkId(item);
        }
        this.mItems.set(position - getFastAdapter().getPreItemCount(position), item);
        mapPossibleType(item);
        getFastAdapter().notifyAdapterItemChanged(position);
        return this;
    }

    public ItemAdapter<Item> move(int fromPosition, int toPosition) {
        int preItemCount = getFastAdapter().getPreItemCount(fromPosition);
        Item item = this.mItems.get(fromPosition - preItemCount);
        this.mItems.remove(fromPosition - preItemCount);
        this.mItems.add(toPosition - preItemCount, item);
        getFastAdapter().notifyAdapterItemMoved(fromPosition, toPosition);
        return this;
    }

    @Override // com.mikepenz.fastadapter.IItemAdapter
    public ItemAdapter<Item> remove(int position) {
        this.mItems.remove(position - getFastAdapter().getPreItemCount(position));
        getFastAdapter().notifyAdapterItemRemoved(position);
        return this;
    }

    @Override // com.mikepenz.fastadapter.IItemAdapter
    public ItemAdapter<Item> removeRange(int position, int itemCount) {
        int length = this.mItems.size();
        int preItemCount = getFastAdapter().getPreItemCount(position);
        int saveItemCount = Math.min(itemCount, (length - position) + preItemCount);
        for (int i = 0; i < saveItemCount; i++) {
            this.mItems.remove(position - preItemCount);
        }
        getFastAdapter().notifyAdapterItemRangeRemoved(position, saveItemCount);
        return this;
    }

    @Override // com.mikepenz.fastadapter.IItemAdapter
    public ItemAdapter<Item> clear() {
        int count = this.mItems.size();
        this.mItems.clear();
        getFastAdapter().notifyAdapterItemRangeRemoved(getFastAdapter().getPreItemCountByOrder(getOrder()), count);
        return this;
    }

    /* loaded from: com.mikepenz.fastadapter.1.4.1.jar:com/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter.class */
    public class ItemFilter extends Filter {
        private List<Item> mOriginalItems;

        public ItemFilter() {
        }

        @Override // android.widget.Filter
        protected Filter.FilterResults performFiltering(CharSequence constraint) {
            ItemAdapter.this.getFastAdapter().deselect();
            ItemAdapter.this.getFastAdapter().collapse(false);
            if (this.mOriginalItems == null) {
                this.mOriginalItems = new ArrayList(ItemAdapter.this.mItems);
            }
            Filter.FilterResults results = new Filter.FilterResults();
            if (constraint == null || constraint.length() == 0) {
                results.values = this.mOriginalItems;
                results.count = this.mOriginalItems.size();
            } else {
                List<Item> filteredItems = new ArrayList<>();
                if (ItemAdapter.this.mFilterPredicate == null) {
                    filteredItems = ItemAdapter.this.mItems;
                } else {
                    for (Item item : this.mOriginalItems) {
                        if (!ItemAdapter.this.mFilterPredicate.filter(item, constraint)) {
                            filteredItems.add(item);
                        }
                    }
                }
                results.values = filteredItems;
                results.count = filteredItems.size();
            }
            return results;
        }

        @Override // android.widget.Filter
        protected void publishResults(CharSequence constraint, Filter.FilterResults results) {
            ItemAdapter.this.set((List) results.values);
            if (ItemAdapter.this.mItemFilterListener != null) {
                ItemAdapter.this.mItemFilterListener.itemsFiltered();
            }
        }
    }
}
