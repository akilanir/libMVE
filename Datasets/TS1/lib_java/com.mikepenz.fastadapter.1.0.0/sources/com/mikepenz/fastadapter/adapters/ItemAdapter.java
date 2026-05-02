package com.mikepenz.fastadapter.adapters;

import android.widget.Filter;
import com.mikepenz.fastadapter.AbstractAdapter;
import com.mikepenz.fastadapter.IExpandable;
import com.mikepenz.fastadapter.IItem;
import com.mikepenz.fastadapter.IItemAdapter;
import com.mikepenz.fastadapter.utils.IdDistributor;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/adapters/ItemAdapter.class */
public class ItemAdapter<Item extends IItem> extends AbstractAdapter<Item> implements IItemAdapter<Item> {
    private List<Item> mItems = new ArrayList();
    private boolean mUseIdDistributor = true;
    private ItemAdapter<Item>.ItemFilter mItemFilter = new ItemFilter();
    private IItemAdapter.Predicate<Item> mFilterPredicate;

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
        for (int i = 0; i < this.mItems.size(); i++) {
            if (this.mItems.get(i).getIdentifier() == item.getIdentifier()) {
                return i;
            }
        }
        return -1;
    }

    @Override // com.mikepenz.fastadapter.IAdapter
    public int getGlobalPosition(int position) {
        return position + getFastAdapter().getItemCount(getOrder());
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
    public void set(List<Item> items) {
        if (this.mUseIdDistributor) {
            IdDistributor.checkIds(items);
        }
        getFastAdapter().collapse();
        int newItemsCount = items.size();
        int previousItemsCount = this.mItems.size();
        int itemsBeforeThisAdapter = getFastAdapter().getItemCount(getOrder());
        if (items != this.mItems) {
            if (!this.mItems.isEmpty()) {
                this.mItems.clear();
            }
            this.mItems.addAll(items);
        }
        mapPossibleTypes(items);
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
    }

    @Override // com.mikepenz.fastadapter.IItemAdapter
    public void setNewList(List<Item> items) {
        if (this.mUseIdDistributor) {
            IdDistributor.checkIds(items);
        }
        this.mItems = items;
        mapPossibleTypes(items);
        getFastAdapter().notifyAdapterDataSetChanged();
    }

    @Override // com.mikepenz.fastadapter.IItemAdapter
    @SafeVarargs
    public final void add(Item... items) {
        add(Arrays.asList(items));
    }

    @Override // com.mikepenz.fastadapter.IItemAdapter
    public void add(List<Item> items) {
        if (this.mUseIdDistributor) {
            IdDistributor.checkIds(items);
        }
        this.mItems.addAll(items);
        mapPossibleTypes(items);
        getFastAdapter().notifyAdapterItemRangeInserted(getFastAdapter().getItemCount(getOrder()), items.size());
    }

    @Override // com.mikepenz.fastadapter.IItemAdapter
    @SafeVarargs
    public final void add(int position, Item... items) {
        add(position, Arrays.asList(items));
    }

    @Override // com.mikepenz.fastadapter.IItemAdapter
    public void add(int position, List<Item> items) {
        if (this.mUseIdDistributor) {
            IdDistributor.checkIds(items);
        }
        if (items != null) {
            this.mItems.addAll(position - getFastAdapter().getItemCount(getOrder()), items);
            mapPossibleTypes(items);
            getFastAdapter().notifyAdapterItemRangeInserted(position, items.size());
        }
    }

    @Override // com.mikepenz.fastadapter.IItemAdapter
    public void set(int position, Item item) {
        if (this.mUseIdDistributor) {
            IdDistributor.checkId(item);
        }
        this.mItems.set(position - getFastAdapter().getItemCount(getOrder()), item);
        mapPossibleType(item);
        getFastAdapter().notifyAdapterItemChanged(position);
    }

    @Override // com.mikepenz.fastadapter.IItemAdapter
    public void remove(int position) {
        this.mItems.remove(position - getFastAdapter().getItemCount(getOrder()));
        getFastAdapter().notifyAdapterItemRemoved(position);
    }

    @Override // com.mikepenz.fastadapter.IItemAdapter
    public void removeRange(int position, int itemCount) {
        int length = this.mItems.size();
        int saveItemCount = Math.min(itemCount, (length - position) + getFastAdapter().getItemCount(getOrder()));
        for (int i = 0; i < saveItemCount; i++) {
            this.mItems.remove(position - getFastAdapter().getItemCount(getOrder()));
        }
        getFastAdapter().notifyAdapterItemRangeRemoved(position, saveItemCount);
    }

    @Override // com.mikepenz.fastadapter.IItemAdapter
    public void clear() {
        int count = this.mItems.size();
        this.mItems.clear();
        getFastAdapter().notifyAdapterItemRangeRemoved(getFastAdapter().getItemCount(getOrder()), count);
    }

    /* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter.class */
    public class ItemFilter extends Filter {
        private List<Item> mOriginalItems;

        public ItemFilter() {
        }

        @Override // android.widget.Filter
        protected Filter.FilterResults performFiltering(CharSequence constraint) {
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
        }
    }
}
