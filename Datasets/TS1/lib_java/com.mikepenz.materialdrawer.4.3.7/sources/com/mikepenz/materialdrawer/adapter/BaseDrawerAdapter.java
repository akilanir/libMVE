package com.mikepenz.materialdrawer.adapter;

import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.ViewGroup;
import com.mikepenz.materialdrawer.model.AbstractDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.Selectable;
import com.mikepenz.materialdrawer.util.RecyclerViewCacheUtil;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/adapter/BaseDrawerAdapter.class */
public abstract class BaseDrawerAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {
    private ArrayList<IDrawerItem> mHeaderDrawerItems = new ArrayList<>();
    private ArrayList<IDrawerItem> mDrawerItems = new ArrayList<>();
    private ArrayList<IDrawerItem> mFooterDrawerItems = new ArrayList<>();
    private LinkedList<String> mTypeIds = new LinkedList<>();
    private LinkedHashMap<String, IDrawerItem> mTypeInstances = new LinkedHashMap<>();
    private int previousSelection = -1;
    private OnClickListener mOnClickListener;
    private OnLongClickListener mOnLongClickListener;

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnClickListener.class */
    public interface OnClickListener {
        void onClick(View view, int i, IDrawerItem iDrawerItem);
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnLongClickListener.class */
    public interface OnLongClickListener {
        boolean onLongClick(View view, int i, IDrawerItem iDrawerItem);
    }

    public BaseDrawerAdapter() {
    }

    public BaseDrawerAdapter(ArrayList<IDrawerItem> drawerItems) {
        setDrawerItems(drawerItems);
    }

    public void setOnClickListener(OnClickListener mOnClickListener) {
        this.mOnClickListener = mOnClickListener;
    }

    public void setOnLongClickListener(OnLongClickListener mOnLongClickListener) {
        this.mOnLongClickListener = mOnLongClickListener;
    }

    public ArrayList<IDrawerItem> getDrawerItems() {
        return this.mDrawerItems;
    }

    public void setDrawerItems(ArrayList<IDrawerItem> drawerItems) {
        this.mDrawerItems = drawerItems;
        mapPossibleTypes(drawerItems);
        notifyItemRangeChanged(getHeaderItemCount(), getDrawerItemCount());
    }

    public void addDrawerItems(IDrawerItem... drawerItems) {
        int length = this.mDrawerItems.size();
        if (drawerItems != null) {
            Collections.addAll(this.mDrawerItems, drawerItems);
            mapPossibleTypes(this.mDrawerItems);
            notifyItemRangeInserted(length, drawerItems.length);
        }
    }

    public void setDrawerItem(int position, IDrawerItem drawerItem) {
        this.mDrawerItems.set(position - getHeaderItemCount(), drawerItem);
        mapPossibleType(drawerItem);
        notifyItemChanged(position);
    }

    public void addDrawerItem(IDrawerItem drawerItem) {
        this.mDrawerItems.add(drawerItem);
        mapPossibleType(drawerItem);
        notifyItemInserted(this.mDrawerItems.size());
    }

    public void addDrawerItem(int position, IDrawerItem drawerItem) {
        this.mDrawerItems.add(position - getHeaderItemCount(), drawerItem);
        mapPossibleType(drawerItem);
        notifyItemInserted(position);
    }

    public void removeDrawerItem(int position) {
        this.mDrawerItems.remove(position - getHeaderItemCount());
        notifyItemRemoved(position);
    }

    public void clearDrawerItems() {
        int count = this.mDrawerItems.size();
        this.mDrawerItems.clear();
        notifyItemRangeRemoved(getHeaderItemCount(), count);
    }

    public void clearHeaderItems() {
        int size = this.mHeaderDrawerItems.size();
        this.mHeaderDrawerItems.clear();
        if (size > 0) {
            notifyItemRemoved(0);
        }
    }

    public void clearFooterItems() {
        int count = this.mFooterDrawerItems.size();
        this.mFooterDrawerItems.clear();
        notifyItemRangeRemoved(getHeaderItemCount() + getDrawerItemCount(), count);
    }

    public ArrayList<IDrawerItem> getHeaderDrawerItems() {
        return this.mHeaderDrawerItems;
    }

    public void setHeaderDrawerItems(ArrayList<IDrawerItem> mHeaderDrawerItems) {
        this.mHeaderDrawerItems = mHeaderDrawerItems;
        notifyItemRangeInserted(0, mHeaderDrawerItems.size());
        mapPossibleTypes(mHeaderDrawerItems);
    }

    public void addHeaderDrawerItems(IDrawerItem... drawerItems) {
        if (drawerItems != null) {
            Collections.addAll(this.mHeaderDrawerItems, drawerItems);
            notifyItemRangeInserted(0, drawerItems.length);
        }
        mapPossibleTypes(this.mHeaderDrawerItems);
    }

    public ArrayList<IDrawerItem> getFooterDrawerItems() {
        return this.mFooterDrawerItems;
    }

    public void setFooterDrawerItems(ArrayList<IDrawerItem> mFooterDrawerItems) {
        this.mFooterDrawerItems = mFooterDrawerItems;
        notifyItemRangeInserted(0, mFooterDrawerItems.size());
        mapPossibleTypes(mFooterDrawerItems);
    }

    public void addFooterDrawerItems(IDrawerItem... drawerItems) {
        if (drawerItems != null) {
            Collections.addAll(this.mFooterDrawerItems, drawerItems);
            notifyItemRangeInserted(0, drawerItems.length);
        }
        mapPossibleTypes(this.mFooterDrawerItems);
    }

    private void mapPossibleTypes(List<IDrawerItem> drawerItemList) {
        if (drawerItemList != null) {
            for (IDrawerItem drawerItem : drawerItemList) {
                mapPossibleType(drawerItem);
            }
        }
    }

    private void mapPossibleType(IDrawerItem drawerItem) {
        if (!this.mTypeInstances.containsKey(drawerItem.getType())) {
            this.mTypeIds.add(drawerItem.getType());
            this.mTypeInstances.put(drawerItem.getType(), drawerItem);
        }
    }

    public int getItemViewType(int position) {
        return this.mTypeIds.indexOf(getItem(position).getType());
    }

    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        RecyclerView.ViewHolder vh = RecyclerViewCacheUtil.getInstance().obtain(this.mTypeIds.get(viewType));
        if (vh == null) {
            return this.mTypeInstances.get(this.mTypeIds.get(viewType)).getViewHolder(parent);
        }
        return vh;
    }

    public void onBindViewHolder(final RecyclerView.ViewHolder holder, int position) {
        getItem(position).bindView(holder);
        holder.itemView.setOnClickListener(new View.OnClickListener() { // from class: com.mikepenz.materialdrawer.adapter.BaseDrawerAdapter.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                int pos = holder.getAdapterPosition();
                IDrawerItem drawerItem = BaseDrawerAdapter.this.getItem(pos);
                if (drawerItem != null && drawerItem.isEnabled()) {
                    if ((drawerItem instanceof Selectable) && drawerItem.isSelectable()) {
                        BaseDrawerAdapter.this.handleSelection(v, pos);
                    }
                    if (BaseDrawerAdapter.this.mOnClickListener != null) {
                        BaseDrawerAdapter.this.mOnClickListener.onClick(v, pos, drawerItem);
                    }
                    if (drawerItem instanceof AbstractDrawerItem) {
                        AbstractDrawerItem adi = (AbstractDrawerItem) drawerItem;
                        if (adi.getOnDrawerItemClickListener() != null) {
                            adi.getOnDrawerItemClickListener().onItemClick(v, pos, drawerItem);
                        }
                    }
                }
            }
        });
        holder.itemView.setOnLongClickListener(new View.OnLongClickListener() { // from class: com.mikepenz.materialdrawer.adapter.BaseDrawerAdapter.2
            @Override // android.view.View.OnLongClickListener
            public boolean onLongClick(View v) {
                if (BaseDrawerAdapter.this.mOnLongClickListener != null) {
                    int pos = holder.getAdapterPosition();
                    return BaseDrawerAdapter.this.mOnLongClickListener.onLongClick(v, pos, BaseDrawerAdapter.this.getItem(pos));
                }
                return false;
            }
        });
    }

    public void handleSelection(View v, int pos) {
        if (this.previousSelection > -1) {
            IDrawerItem prev = getItem(this.previousSelection);
            if (prev != null) {
                prev.withSetSelected(false);
            }
            notifyItemChanged(this.previousSelection);
        }
        if (pos > -1) {
            IDrawerItem cur = getItem(pos);
            if (cur != null) {
                cur.withSetSelected(true);
            }
            notifyItemChanged(pos);
            if (v != null) {
                v.setSelected(true);
                v.invalidate();
            }
        }
        this.previousSelection = pos;
    }

    public boolean isEnabled(int position) {
        IDrawerItem item = getItem(position);
        return item != null && item.isEnabled();
    }

    public boolean isSelected(int position) {
        IDrawerItem item = getItem(position);
        return item != null && item.isSelected();
    }

    public IDrawerItem getItem(int position) {
        if (position < 0 || position >= getItemCount()) {
            return null;
        }
        if (position < getHeaderItemCount()) {
            return this.mHeaderDrawerItems.get(position);
        }
        if (position < getHeaderItemCount() + getDrawerItemCount()) {
            return this.mDrawerItems.get(position - getHeaderItemCount());
        }
        return this.mFooterDrawerItems.get((position - getHeaderItemCount()) - getDrawerItemCount());
    }

    public long getItemId(int position) {
        IDrawerItem item = getItem(position);
        if (item != null && item.getIdentifier() != -1) {
            return item.getIdentifier();
        }
        return super.getItemId(position);
    }

    public int getItemCount() {
        int itemCount = 0 + getHeaderItemCount();
        return itemCount + getDrawerItemCount() + getFooterItemCount();
    }

    public int getHeaderOffset() {
        return getHeaderItemCount();
    }

    protected int getHeaderItemCount() {
        if (this.mHeaderDrawerItems == null) {
            return 0;
        }
        return this.mHeaderDrawerItems.size();
    }

    protected int getDrawerItemCount() {
        if (this.mDrawerItems == null) {
            return 0;
        }
        return this.mDrawerItems.size();
    }

    protected int getFooterItemCount() {
        if (this.mFooterDrawerItems == null) {
            return 0;
        }
        return this.mFooterDrawerItems.size();
    }
}
