package com.mikepenz.fastadapter.items;

import android.content.Context;
import android.support.annotation.CallSuper;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.mikepenz.fastadapter.FastAdapter;
import com.mikepenz.fastadapter.IClickable;
import com.mikepenz.fastadapter.IItem;
import com.mikepenz.fastadapter.items.AbstractItem;
import com.mikepenz.fastadapter.utils.ViewHolderFactory;
import java.lang.reflect.Constructor;
import java.lang.reflect.ParameterizedType;

/* loaded from: com.mikepenz.fastadapter.1.4.1.jar:com/mikepenz/fastadapter/items/AbstractItem.class */
public abstract class AbstractItem<Item extends AbstractItem<?, ?>, VH extends RecyclerView.ViewHolder> implements IItem<Item, VH>, IClickable<Item> {
    protected Object mTag;
    protected FastAdapter.OnClickListener<Item> mOnItemPreClickListener;
    protected FastAdapter.OnClickListener<Item> mOnItemClickListener;
    protected ViewHolderFactory<? extends VH> mFactory;
    protected long mIdentifier = -1;
    protected boolean mEnabled = true;
    protected boolean mSelected = false;
    protected boolean mSelectable = true;

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.fastadapter.IIdentifyable
    public Item withIdentifier(long identifier) {
        this.mIdentifier = identifier;
        return this;
    }

    @Override // com.mikepenz.fastadapter.IIdentifyable
    public long getIdentifier() {
        return this.mIdentifier;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.fastadapter.IItem
    public Item withTag(Object object) {
        this.mTag = object;
        return this;
    }

    @Override // com.mikepenz.fastadapter.IItem
    public Object getTag() {
        return this.mTag;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.fastadapter.IItem
    public Item withEnabled(boolean enabled) {
        this.mEnabled = enabled;
        return this;
    }

    @Override // com.mikepenz.fastadapter.IItem
    public boolean isEnabled() {
        return this.mEnabled;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.fastadapter.IItem
    public Item withSetSelected(boolean selected) {
        this.mSelected = selected;
        return this;
    }

    @Override // com.mikepenz.fastadapter.IItem
    public boolean isSelected() {
        return this.mSelected;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.fastadapter.IItem
    public Item withSelectable(boolean selectable) {
        this.mSelectable = selectable;
        return this;
    }

    @Override // com.mikepenz.fastadapter.IItem
    public boolean isSelectable() {
        return this.mSelectable;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.fastadapter.IClickable
    public Item withOnItemPreClickListener(FastAdapter.OnClickListener<Item> onItemPreClickListener) {
        this.mOnItemPreClickListener = onItemPreClickListener;
        return this;
    }

    @Override // com.mikepenz.fastadapter.IClickable
    public FastAdapter.OnClickListener<Item> getOnPreItemClickListener() {
        return this.mOnItemPreClickListener;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.fastadapter.IClickable
    public Item withOnItemClickListener(FastAdapter.OnClickListener<Item> onItemClickListener) {
        this.mOnItemClickListener = onItemClickListener;
        return this;
    }

    @Override // com.mikepenz.fastadapter.IClickable
    public FastAdapter.OnClickListener<Item> getOnItemClickListener() {
        return this.mOnItemClickListener;
    }

    @Override // com.mikepenz.fastadapter.IItem
    @CallSuper
    public void bindView(VH holder) {
        ((RecyclerView.ViewHolder) holder).itemView.setSelected(isSelected());
        ((RecyclerView.ViewHolder) holder).itemView.setTag(this);
    }

    @Override // com.mikepenz.fastadapter.IItem
    public View generateView(Context ctx) {
        RecyclerView.ViewHolder viewHolder = getViewHolder(LayoutInflater.from(ctx).inflate(getLayoutRes(), (ViewGroup) null, false));
        bindView(viewHolder);
        return viewHolder.itemView;
    }

    @Override // com.mikepenz.fastadapter.IItem
    public View generateView(Context ctx, ViewGroup parent) {
        RecyclerView.ViewHolder viewHolder = getViewHolder(LayoutInflater.from(ctx).inflate(getLayoutRes(), parent, false));
        bindView(viewHolder);
        return viewHolder.itemView;
    }

    @Override // com.mikepenz.fastadapter.IItem
    public VH getViewHolder(ViewGroup viewGroup) {
        return (VH) getViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(getLayoutRes(), viewGroup, false));
    }

    /* JADX WARN: Multi-variable type inference failed */
    public Item withFactory(ViewHolderFactory<? extends VH> factory) {
        this.mFactory = factory;
        return this;
    }

    public ViewHolderFactory<? extends VH> getFactory() {
        if (this.mFactory == null) {
            try {
                this.mFactory = new ReflectionBasedViewHolderFactory(viewHolderType());
            } catch (Exception e) {
                throw new RuntimeException("please set a ViewHolderFactory");
            }
        }
        return this.mFactory;
    }

    protected Class<? extends VH> viewHolderType() {
        return (Class) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[1];
    }

    public VH getViewHolder(View view) {
        return (VH) getFactory().create(view);
    }

    @Override // com.mikepenz.fastadapter.IItem
    public boolean equals(int id) {
        return ((long) id) == this.mIdentifier;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AbstractItem<?, ?> that = (AbstractItem) o;
        return this.mIdentifier == that.mIdentifier;
    }

    public int hashCode() {
        return Long.valueOf(this.mIdentifier).hashCode();
    }

    /* loaded from: com.mikepenz.fastadapter.1.4.1.jar:com/mikepenz/fastadapter/items/AbstractItem$ReflectionBasedViewHolderFactory.class */
    protected static class ReflectionBasedViewHolderFactory<VH extends RecyclerView.ViewHolder> implements ViewHolderFactory<VH> {
        private final Class<? extends VH> clazz;

        public ReflectionBasedViewHolderFactory(Class<? extends VH> clazz) {
            this.clazz = clazz;
        }

        @Override // com.mikepenz.fastadapter.utils.ViewHolderFactory
        public VH create(View v) {
            try {
                try {
                    Constructor<? extends VH> constructor = this.clazz.getDeclaredConstructor(View.class);
                    constructor.setAccessible(true);
                    return constructor.newInstance(v);
                } catch (NoSuchMethodException e) {
                    return this.clazz.newInstance();
                }
            } catch (Exception e2) {
                throw new RuntimeException("You have to provide a ViewHolder with a constructor which takes a view!");
            }
        }
    }
}
