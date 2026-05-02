package com.mikepenz.fastadapter;

import android.os.Bundle;
import android.support.v4.util.ArrayMap;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.util.SparseIntArray;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import com.mikepenz.fastadapter.IItem;
import com.mikepenz.fastadapter.utils.AdapterUtil;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.NavigableMap;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeMap;
import java.util.TreeSet;

/* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/FastAdapter.class */
public class FastAdapter<Item extends IItem> extends RecyclerView.Adapter<RecyclerView.ViewHolder> {
    protected static final String BUNDLE_SELECTIONS = "bundle_selections";
    protected static final String BUNDLE_EXPANDED = "bundle_expanded";
    private OnClickListener<Item> mOnPreClickListener;
    private OnClickListener<Item> mOnClickListener;
    private OnLongClickListener<Item> mOnPreLongClickListener;
    private OnLongClickListener<Item> mOnLongClickListener;
    private OnTouchListener<Item> mOnTouchListener;
    private ArrayMap<Integer, IAdapter<Item>> mAdapters = new ArrayMap<>();
    private ArrayMap<Integer, Item> mTypeInstances = new ArrayMap<>();
    private NavigableMap<Integer, IAdapter<Item>> mAdapterSizes = new TreeMap();
    private int mGlobalSize = 0;
    private boolean mSelectWithItemUpdate = false;
    private boolean mMultiSelect = false;
    private boolean mSelectOnLongClick = false;
    private boolean mAllowDeselection = true;
    private SortedSet<Integer> mSelections = new TreeSet();
    private SparseIntArray mExpanded = new SparseIntArray();
    private OnCreateViewHolderListener mOnCreateViewHolderListener = new OnCreateViewHolderListenerImpl();
    private OnBindViewHolderListener mOnBindViewHolderListener = new OnBindViewHolderListenerImpl();

    /* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/FastAdapter$OnBindViewHolderListener.class */
    public interface OnBindViewHolderListener {
        void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int i);
    }

    /* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/FastAdapter$OnClickListener.class */
    public interface OnClickListener<Item extends IItem> {
        boolean onClick(View view, IAdapter<Item> iAdapter, Item item, int i);
    }

    /* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListener.class */
    public interface OnCreateViewHolderListener {
        RecyclerView.ViewHolder onPreCreateViewHolder(ViewGroup viewGroup, int i);

        RecyclerView.ViewHolder onPostCreateViewHolder(RecyclerView.ViewHolder viewHolder);
    }

    /* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/FastAdapter$OnLongClickListener.class */
    public interface OnLongClickListener<Item extends IItem> {
        boolean onLongClick(View view, IAdapter<Item> iAdapter, Item item, int i);
    }

    /* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/FastAdapter$OnTouchListener.class */
    public interface OnTouchListener<Item extends IItem> {
        boolean onTouch(View view, MotionEvent motionEvent, IAdapter<Item> iAdapter, Item item, int i);
    }

    /* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/FastAdapter$RelativeInfo.class */
    public static class RelativeInfo<Item extends IItem> {
        public IAdapter<Item> adapter = null;
        public Item item = null;
    }

    public FastAdapter() {
        setHasStableIds(true);
    }

    public FastAdapter<Item> withOnClickListener(OnClickListener<Item> onClickListener) {
        this.mOnClickListener = onClickListener;
        return this;
    }

    public FastAdapter<Item> withOnPreClickListener(OnClickListener<Item> OnPreClickListener) {
        this.mOnPreClickListener = OnPreClickListener;
        return this;
    }

    public FastAdapter<Item> withOnLongClickListener(OnLongClickListener<Item> onLongClickListener) {
        this.mOnLongClickListener = onLongClickListener;
        return this;
    }

    public FastAdapter<Item> withOnPreLongClickListener(OnLongClickListener<Item> OnPreLongClickListener) {
        this.mOnPreLongClickListener = OnPreLongClickListener;
        return this;
    }

    public FastAdapter<Item> withOnTouchListener(OnTouchListener<Item> onTouchListener) {
        this.mOnTouchListener = onTouchListener;
        return this;
    }

    public FastAdapter<Item> withOnCreateViewHolderListener(OnCreateViewHolderListener onCreateViewHolderListener) {
        this.mOnCreateViewHolderListener = onCreateViewHolderListener;
        return this;
    }

    public FastAdapter<Item> withOnBindViewHolderListener(OnBindViewHolderListener onBindViewHolderListener) {
        this.mOnBindViewHolderListener = onBindViewHolderListener;
        return this;
    }

    public FastAdapter<Item> withSelectWithItemUpdate(boolean selectWithItemUpdate) {
        this.mSelectWithItemUpdate = selectWithItemUpdate;
        return this;
    }

    public FastAdapter<Item> withMultiSelect(boolean multiSelect) {
        this.mMultiSelect = multiSelect;
        return this;
    }

    public FastAdapter<Item> withSelectOnLongClick(boolean selectOnLongClick) {
        this.mSelectOnLongClick = selectOnLongClick;
        return this;
    }

    public FastAdapter<Item> withAllowDeselection(boolean allowDeselection) {
        this.mAllowDeselection = allowDeselection;
        return this;
    }

    public FastAdapter<Item> withSavedInstanceState(Bundle savedInstanceState) {
        return withSavedInstanceState(savedInstanceState, BuildConfig.FLAVOR);
    }

    public FastAdapter<Item> withSavedInstanceState(Bundle savedInstanceState, String prefix) {
        if (savedInstanceState != null) {
            deselect();
            int[] expandedItems = savedInstanceState.getIntArray(BUNDLE_EXPANDED + prefix);
            if (expandedItems != null) {
                for (int i : expandedItems) {
                    Integer expandedItem = Integer.valueOf(i);
                    expand(expandedItem.intValue());
                }
            }
            int[] selections = savedInstanceState.getIntArray(BUNDLE_SELECTIONS + prefix);
            if (selections != null) {
                for (int i2 : selections) {
                    Integer selection = Integer.valueOf(i2);
                    select(selection.intValue());
                }
            }
        }
        return this;
    }

    public <A extends AbstractAdapter<Item>> void registerAdapter(A adapter) {
        if (!this.mAdapters.containsKey(Integer.valueOf(adapter.getOrder()))) {
            this.mAdapters.put(Integer.valueOf(adapter.getOrder()), adapter);
            cacheSizes();
        }
    }

    public void registerTypeInstance(Item item) {
        if (!this.mTypeInstances.containsKey(Integer.valueOf(item.getType()))) {
            this.mTypeInstances.put(Integer.valueOf(item.getType()), item);
        }
    }

    public Map<Integer, Item> getTypeInstances() {
        return this.mTypeInstances;
    }

    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        final RecyclerView.ViewHolder holder = this.mOnCreateViewHolderListener.onPreCreateViewHolder(parent, viewType);
        holder.itemView.setOnClickListener(new View.OnClickListener() { // from class: com.mikepenz.fastadapter.FastAdapter.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                int pos = holder.getAdapterPosition();
                if (pos != -1) {
                    boolean consumed = false;
                    RelativeInfo<Item> relativeInfo = FastAdapter.this.getRelativeInfo(pos);
                    if (relativeInfo.item != null && relativeInfo.item.isEnabled()) {
                        if (FastAdapter.this.mOnPreClickListener != null) {
                            consumed = FastAdapter.this.mOnPreClickListener.onClick(v, relativeInfo.adapter, relativeInfo.item, pos);
                        }
                        if (!consumed && !FastAdapter.this.mSelectOnLongClick) {
                            FastAdapter.this.handleSelection(v, relativeInfo.item, pos);
                        }
                        if (FastAdapter.this.mOnClickListener != null) {
                            FastAdapter.this.mOnClickListener.onClick(v, relativeInfo.adapter, relativeInfo.item, pos);
                        }
                    }
                }
            }
        });
        holder.itemView.setOnLongClickListener(new View.OnLongClickListener() { // from class: com.mikepenz.fastadapter.FastAdapter.2
            @Override // android.view.View.OnLongClickListener
            public boolean onLongClick(View v) {
                int pos = holder.getAdapterPosition();
                if (pos != -1) {
                    boolean consumed = false;
                    RelativeInfo<Item> relativeInfo = FastAdapter.this.getRelativeInfo(pos);
                    if (relativeInfo.item != null && relativeInfo.item.isEnabled()) {
                        if (FastAdapter.this.mOnPreLongClickListener != null) {
                            consumed = FastAdapter.this.mOnPreLongClickListener.onLongClick(v, relativeInfo.adapter, relativeInfo.item, pos);
                        }
                        if (!consumed && FastAdapter.this.mSelectOnLongClick) {
                            FastAdapter.this.handleSelection(v, relativeInfo.item, pos);
                        }
                        if (FastAdapter.this.mOnLongClickListener != null) {
                            consumed = FastAdapter.this.mOnLongClickListener.onLongClick(v, relativeInfo.adapter, relativeInfo.item, pos);
                        }
                    }
                    return consumed;
                }
                return false;
            }
        });
        holder.itemView.setOnTouchListener(new View.OnTouchListener() { // from class: com.mikepenz.fastadapter.FastAdapter.3
            @Override // android.view.View.OnTouchListener
            public boolean onTouch(View v, MotionEvent event) {
                int pos;
                if (FastAdapter.this.mOnTouchListener != null && (pos = holder.getAdapterPosition()) != -1) {
                    RelativeInfo<Item> relativeInfo = FastAdapter.this.getRelativeInfo(pos);
                    return FastAdapter.this.mOnTouchListener.onTouch(v, event, relativeInfo.adapter, relativeInfo.item, pos);
                }
                return false;
            }
        });
        return this.mOnCreateViewHolderListener.onPostCreateViewHolder(holder);
    }

    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
        this.mOnBindViewHolderListener.onBindViewHolder(holder, position);
    }

    public int getPosition(Item item) {
        if (item.getIdentifier() == -1) {
            Log.e("FastAdapter", "You have to define an identifier for your item to retrieve the position via this method");
            return -1;
        }
        int position = 0;
        int length = this.mAdapters.size();
        for (int i = 0; i < length; i++) {
            IAdapter<Item> adapter = (IAdapter) this.mAdapters.valueAt(i);
            if (adapter.getOrder() >= 0) {
                int relativePosition = adapter.getAdapterPosition(item);
                if (relativePosition != -1) {
                    return position + relativePosition;
                }
                position = adapter.getAdapterItemCount();
            }
        }
        return -1;
    }

    public Item getItem(int i) {
        if (i < 0 || i >= this.mGlobalSize) {
            return null;
        }
        Map.Entry<Integer, IAdapter<Item>> floorEntry = this.mAdapterSizes.floorEntry(Integer.valueOf(i));
        return (Item) floorEntry.getValue().getAdapterItem(i - floorEntry.getKey().intValue());
    }

    public RelativeInfo<Item> getRelativeInfo(int i) {
        if (i < 0) {
            return new RelativeInfo<>();
        }
        RelativeInfo<Item> relativeInfo = new RelativeInfo<>();
        Map.Entry<Integer, IAdapter<Item>> floorEntry = this.mAdapterSizes.floorEntry(Integer.valueOf(i));
        if (floorEntry != null) {
            relativeInfo.item = (Item) floorEntry.getValue().getAdapterItem(i - floorEntry.getKey().intValue());
            relativeInfo.adapter = floorEntry.getValue();
        }
        return relativeInfo;
    }

    public IAdapter<Item> getAdapter(int position) {
        if (position < 0 || position >= this.mGlobalSize) {
            return null;
        }
        return this.mAdapterSizes.floorEntry(Integer.valueOf(position)).getValue();
    }

    public int getItemViewType(int position) {
        return getItem(position).getType();
    }

    public long getItemId(int position) {
        return getItem(position).getIdentifier();
    }

    public int getItemCount() {
        return this.mGlobalSize;
    }

    public int getItemCount(int order) {
        if (this.mGlobalSize == 0) {
            return 0;
        }
        return this.mAdapterSizes.floorKey(Integer.valueOf(order)).intValue();
    }

    public Bundle saveInstanceState(Bundle savedInstanceState) {
        return saveInstanceState(savedInstanceState, BuildConfig.FLAVOR);
    }

    public Bundle saveInstanceState(Bundle savedInstanceState, String prefix) {
        if (savedInstanceState != null) {
            int[] selections = new int[this.mSelections.size()];
            int index = 0;
            for (Integer selection : this.mSelections) {
                selections[index] = selection.intValue();
                index++;
            }
            savedInstanceState.putIntArray(BUNDLE_SELECTIONS + prefix, selections);
            savedInstanceState.putIntArray(BUNDLE_EXPANDED + prefix, getExpandedItems());
        }
        return savedInstanceState;
    }

    private void cacheSizes() {
        this.mAdapterSizes.clear();
        int size = 0;
        for (IAdapter<Item> adapter : this.mAdapters.values()) {
            if (adapter.getAdapterItemCount() > 0) {
                this.mAdapterSizes.put(Integer.valueOf(size), adapter);
                size += adapter.getAdapterItemCount();
            }
        }
        this.mGlobalSize = size;
    }

    public Set<Integer> getSelections() {
        return this.mSelections;
    }

    public Set<Item> getSelectedItems() {
        HashSet hashSet = new HashSet();
        for (Integer position : getSelections()) {
            hashSet.add(getItem(position.intValue()));
        }
        return hashSet;
    }

    public void toggleSelection(int position) {
        if (this.mSelections.contains(Integer.valueOf(position))) {
            deselect(position);
        } else {
            select(position);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleSelection(View view, Item item, int position) {
        if (!item.isSelectable()) {
            return;
        }
        if (item.isSelected() && !this.mAllowDeselection) {
            return;
        }
        boolean selected = this.mSelections.contains(Integer.valueOf(position));
        if (this.mSelectWithItemUpdate || view == null) {
            if (!this.mMultiSelect) {
                deselect();
            }
            if (selected) {
                deselect(position);
                return;
            } else {
                select(position);
                return;
            }
        }
        if (!this.mMultiSelect) {
            Iterator<Integer> entries = this.mSelections.iterator();
            while (entries.hasNext()) {
                Integer pos = entries.next();
                if (pos.intValue() != position) {
                    deselect(pos.intValue(), entries);
                }
            }
        }
        item.withSetSelected(!selected);
        view.setSelected(!selected);
        if (selected) {
            if (this.mSelections.contains(Integer.valueOf(position))) {
                this.mSelections.remove(Integer.valueOf(position));
                return;
            }
            return;
        }
        this.mSelections.add(Integer.valueOf(position));
    }

    public void select(Iterable<Integer> positions) {
        for (Integer position : positions) {
            select(position.intValue());
        }
    }

    public void select(int position) {
        select(position, false);
    }

    public void select(int position, boolean fireEvent) {
        IItem item = getItem(position);
        if (item != null) {
            item.withSetSelected(true);
            this.mSelections.add(Integer.valueOf(position));
        }
        notifyItemChanged(position);
        if (this.mOnClickListener != null && fireEvent) {
            this.mOnClickListener.onClick(null, getAdapter(position), item, position);
        }
    }

    public void deselect() {
        deselect(this.mSelections);
    }

    public void deselect(Iterable<Integer> positions) {
        Iterator<Integer> entries = positions.iterator();
        while (entries.hasNext()) {
            deselect(entries.next().intValue(), entries);
        }
    }

    public void deselect(int position) {
        deselect(position, null);
    }

    private void deselect(int position, Iterator<Integer> entries) {
        IItem item = getItem(position);
        if (item != null) {
            item.withSetSelected(false);
        }
        if (entries == null) {
            if (this.mSelections.contains(Integer.valueOf(position))) {
                this.mSelections.remove(Integer.valueOf(position));
            }
        } else {
            entries.remove();
        }
        notifyItemChanged(position);
    }

    public List<Item> deleteAllSelectedItems() {
        LinkedList linkedList = new LinkedList();
        Set<Integer> selections = getSelections();
        while (true) {
            Set<Integer> selections2 = selections;
            if (selections2.size() > 0) {
                Iterator<Integer> iterator = selections2.iterator();
                int position = iterator.next().intValue();
                IAdapter adapter = getAdapter(position);
                if (adapter != null && (adapter instanceof IItemAdapter)) {
                    linkedList.add(getItem(position));
                    ((IItemAdapter) adapter).remove(position);
                } else {
                    iterator.remove();
                }
                selections = getSelections();
            } else {
                return linkedList;
            }
        }
    }

    public int[] getExpandedItems() {
        int[] expandedItems = new int[this.mExpanded.size()];
        int length = this.mExpanded.size();
        for (int i = 0; i < length; i++) {
            expandedItems[i] = this.mExpanded.keyAt(i);
        }
        return expandedItems;
    }

    public void toggleExpandable(int position) {
        if (this.mExpanded.indexOfKey(position) >= 0) {
            collapse(position);
        } else {
            expand(position);
        }
    }

    public void collapse() {
        for (int expandedItem : getExpandedItems()) {
            collapse(expandedItem);
        }
    }

    public void collapse(int position) {
        IItem item = getItem(position);
        if (item != null && (item instanceof IExpandable)) {
            IExpandable expandable = (IExpandable) item;
            if (expandable.isExpanded() && expandable.getSubItems() != null && expandable.getSubItems().size() > 0) {
                int totalAddedItems = expandable.getSubItems().size();
                int length = this.mExpanded.size();
                for (int i = 0; i < length; i++) {
                    if (this.mExpanded.keyAt(i) > position && this.mExpanded.keyAt(i) <= position + totalAddedItems) {
                        totalAddedItems += this.mExpanded.get(this.mExpanded.keyAt(i));
                    }
                }
                for (Integer value : this.mSelections) {
                    if (value.intValue() > position && value.intValue() <= position + totalAddedItems) {
                        deselect(value.intValue());
                    }
                }
                for (int i2 = length - 1; i2 >= 0; i2--) {
                    if (this.mExpanded.keyAt(i2) > position && this.mExpanded.keyAt(i2) <= position + totalAddedItems) {
                        totalAddedItems -= this.mExpanded.get(this.mExpanded.keyAt(i2));
                        internalCollapse(this.mExpanded.keyAt(i2));
                    }
                }
                internalCollapse(expandable, position);
            }
        }
    }

    private void internalCollapse(int position) {
        IItem item = getItem(position);
        if (item != null && (item instanceof IExpandable)) {
            IExpandable expandable = (IExpandable) item;
            if (expandable.isExpanded() && expandable.getSubItems() != null && expandable.getSubItems().size() > 0) {
                internalCollapse(expandable, position);
            }
        }
    }

    private void internalCollapse(IExpandable expandable, int position) {
        IAdapter adapter = getAdapter(position);
        if (adapter != null && (adapter instanceof IItemAdapter)) {
            ((IItemAdapter) adapter).removeRange(position + 1, expandable.getSubItems().size());
        }
        expandable.withIsExpanded(false);
        int indexOfKey = this.mExpanded.indexOfKey(position);
        if (indexOfKey >= 0) {
            this.mExpanded.removeAt(indexOfKey);
        }
    }

    public void expand(int position) {
        IItem item = getItem(position);
        if (item != null && (item instanceof IExpandable)) {
            IExpandable<?, Item> expandable = (IExpandable) item;
            if (!expandable.isExpanded() && expandable.getSubItems() != null && expandable.getSubItems().size() > 0) {
                IAdapter<Item> adapter = getAdapter(position);
                if (adapter != null && (adapter instanceof IItemAdapter)) {
                    ((IItemAdapter) adapter).add(position + 1, expandable.getSubItems());
                }
                expandable.withIsExpanded(true);
                this.mExpanded.put(position, expandable.getSubItems() != null ? expandable.getSubItems().size() : 0);
            }
        }
    }

    public void notifyAdapterDataSetChanged() {
        this.mSelections.clear();
        this.mExpanded.clear();
        cacheSizes();
        notifyDataSetChanged();
    }

    public void notifyAdapterItemInserted(int position) {
        this.mSelections = AdapterUtil.adjustPosition(this.mSelections, position, Integer.MAX_VALUE, 1);
        this.mExpanded = AdapterUtil.adjustPosition(this.mExpanded, position, Integer.MAX_VALUE, 1);
        cacheSizes();
        notifyItemInserted(position);
    }

    public void notifyAdapterItemRangeInserted(int position, int itemCount) {
        this.mSelections = AdapterUtil.adjustPosition(this.mSelections, position, Integer.MAX_VALUE, itemCount);
        this.mExpanded = AdapterUtil.adjustPosition(this.mExpanded, position, Integer.MAX_VALUE, itemCount);
        cacheSizes();
        notifyItemRangeInserted(position, itemCount);
    }

    public void notifyAdapterItemRemoved(int position) {
        this.mSelections = AdapterUtil.adjustPosition(this.mSelections, position, Integer.MAX_VALUE, -1);
        this.mExpanded = AdapterUtil.adjustPosition(this.mExpanded, position, Integer.MAX_VALUE, -1);
        cacheSizes();
        notifyItemRemoved(position);
    }

    public void notifyAdapterItemRangeRemoved(int position, int itemCount) {
        this.mSelections = AdapterUtil.adjustPosition(this.mSelections, position, Integer.MAX_VALUE, itemCount * (-1));
        this.mExpanded = AdapterUtil.adjustPosition(this.mExpanded, position, Integer.MAX_VALUE, itemCount * (-1));
        cacheSizes();
        notifyItemRangeRemoved(position, itemCount);
    }

    public void notifyAdapterItemMoved(int fromPosition, int toPosition) {
        collapse(fromPosition);
        collapse(toPosition);
        if (!this.mSelections.contains(Integer.valueOf(fromPosition)) && this.mSelections.contains(Integer.valueOf(toPosition))) {
            this.mSelections.remove(Integer.valueOf(toPosition));
            this.mSelections.add(Integer.valueOf(fromPosition));
        } else if (this.mSelections.contains(Integer.valueOf(fromPosition)) && !this.mSelections.contains(Integer.valueOf(toPosition))) {
            this.mSelections.remove(Integer.valueOf(fromPosition));
            this.mSelections.add(Integer.valueOf(toPosition));
        }
        notifyItemMoved(fromPosition, toPosition);
    }

    public void notifyAdapterItemChanged(int position) {
        notifyAdapterItemChanged(position, null);
    }

    public void notifyAdapterItemChanged(int position, Object payload) {
        IItem item = getItem(position);
        if (this.mExpanded.indexOfKey(position) >= 0) {
            collapse(position);
        }
        if (item.isSelected()) {
            this.mSelections.add(Integer.valueOf(position));
        } else if (this.mSelections.contains(Integer.valueOf(position))) {
            this.mSelections.remove(Integer.valueOf(position));
        }
        if (payload == null) {
            notifyItemChanged(position);
        } else {
            notifyItemChanged(position, payload);
        }
    }

    public void notifyAdapterItemRangeChanged(int position, int itemCount) {
        notifyAdapterItemRangeChanged(position, itemCount, null);
    }

    public void notifyAdapterItemRangeChanged(int position, int itemCount, Object payload) {
        for (int i = position; i < position + itemCount; i++) {
            if (this.mExpanded.indexOfKey(i) >= 0) {
                collapse(i);
            }
            if (getItem(i).isSelected()) {
                this.mSelections.add(Integer.valueOf(i));
            } else if (this.mSelections.contains(Integer.valueOf(i))) {
                this.mSelections.remove(Integer.valueOf(i));
            }
        }
        if (payload == null) {
            notifyItemRangeChanged(position, itemCount);
        } else {
            notifyItemRangeChanged(position, itemCount, payload);
        }
    }

    /* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/FastAdapter$OnCreateViewHolderListenerImpl.class */
    public class OnCreateViewHolderListenerImpl implements OnCreateViewHolderListener {
        public OnCreateViewHolderListenerImpl() {
        }

        @Override // com.mikepenz.fastadapter.FastAdapter.OnCreateViewHolderListener
        public RecyclerView.ViewHolder onPreCreateViewHolder(ViewGroup parent, int viewType) {
            return ((IItem) FastAdapter.this.mTypeInstances.get(Integer.valueOf(viewType))).getViewHolder(parent);
        }

        @Override // com.mikepenz.fastadapter.FastAdapter.OnCreateViewHolderListener
        public RecyclerView.ViewHolder onPostCreateViewHolder(RecyclerView.ViewHolder viewHolder) {
            return viewHolder;
        }
    }

    /* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/FastAdapter$OnBindViewHolderListenerImpl.class */
    public class OnBindViewHolderListenerImpl implements OnBindViewHolderListener {
        public OnBindViewHolderListenerImpl() {
        }

        @Override // com.mikepenz.fastadapter.FastAdapter.OnBindViewHolderListener
        public void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int position) {
            FastAdapter.this.getItem(position).bindView(viewHolder);
        }
    }
}
