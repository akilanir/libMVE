package com.mikepenz.materialdrawer.model;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.mikepenz.materialdrawer.Drawer;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.OnPostBindViewListener;
import com.mikepenz.materialdrawer.model.interfaces.Selectable;
import com.mikepenz.materialdrawer.model.interfaces.Tagable;
import com.mikepenz.materialdrawer.model.utils.ViewHolderFactory;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/AbstractDrawerItem.class */
public abstract class AbstractDrawerItem<T> implements IDrawerItem<T>, Selectable<T>, Tagable<T> {
    protected Object mTag;
    protected int mIdentifier = -1;
    protected boolean mEnabled = true;
    protected boolean mSelected = false;
    protected boolean mSelectable = true;
    public Drawer.OnDrawerItemClickListener mOnDrawerItemClickListener = null;
    protected OnPostBindViewListener mOnPostBindViewListener = null;

    public abstract ViewHolderFactory getFactory();

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Identifyable
    public T withIdentifier(int identifier) {
        this.mIdentifier = identifier;
        return this;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Identifyable
    public int getIdentifier() {
        return this.mIdentifier;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Tagable
    public T withTag(Object object) {
        this.mTag = object;
        return this;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem, com.mikepenz.materialdrawer.model.interfaces.Tagable
    public Object getTag() {
        return this.mTag;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withEnabled(boolean enabled) {
        this.mEnabled = enabled;
        return this;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public boolean isEnabled() {
        return this.mEnabled;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public T withSetSelected(boolean selected) {
        this.mSelected = selected;
        return this;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public boolean isSelected() {
        return this.mSelected;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem, com.mikepenz.materialdrawer.model.interfaces.Selectable
    public T withSelectable(boolean selectable) {
        this.mSelectable = selectable;
        return this;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem, com.mikepenz.materialdrawer.model.interfaces.Selectable
    public boolean isSelectable() {
        return this.mSelectable;
    }

    public Drawer.OnDrawerItemClickListener getOnDrawerItemClickListener() {
        return this.mOnDrawerItemClickListener;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withOnDrawerItemClickListener(Drawer.OnDrawerItemClickListener onDrawerItemClickListener) {
        this.mOnDrawerItemClickListener = onDrawerItemClickListener;
        return this;
    }

    public OnPostBindViewListener getOnPostBindViewListener() {
        return this.mOnPostBindViewListener;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withPostOnBindViewListener(OnPostBindViewListener onPostBindViewListener) {
        this.mOnPostBindViewListener = onPostBindViewListener;
        return this;
    }

    public void onPostBindView(IDrawerItem drawerItem, View view) {
        if (this.mOnPostBindViewListener != null) {
            this.mOnPostBindViewListener.onBindView(drawerItem, view);
        }
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public View generateView(Context ctx) {
        RecyclerView.ViewHolder viewHolder = getFactory().factory(LayoutInflater.from(ctx).inflate(getLayoutRes(), (ViewGroup) null, false));
        bindView(viewHolder);
        return viewHolder.itemView;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public View generateView(Context ctx, ViewGroup parent) {
        RecyclerView.ViewHolder viewHolder = getFactory().factory(LayoutInflater.from(ctx).inflate(getLayoutRes(), parent, false));
        bindView(viewHolder);
        return viewHolder.itemView;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public RecyclerView.ViewHolder getViewHolder(ViewGroup parent) {
        return getFactory().factory(LayoutInflater.from(parent.getContext()).inflate(getLayoutRes(), parent, false));
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public boolean equals(Integer id) {
        return id != null && id.intValue() == this.mIdentifier;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AbstractDrawerItem<?> that = (AbstractDrawerItem) o;
        return this.mIdentifier == that.mIdentifier;
    }

    public int hashCode() {
        return this.mIdentifier;
    }
}
