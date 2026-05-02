package com.mikepenz.fastadapter.items;

import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ViewHolder;
import com.mikepenz.fastadapter.items.GenericAbstractItem;
import java.lang.reflect.ParameterizedType;

/* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/items/GenericAbstractItem.class */
public abstract class GenericAbstractItem<Model, Item extends GenericAbstractItem<?, ?, ?>, VH extends RecyclerView.ViewHolder> extends AbstractItem<Item, VH> {
    private Model mModel;

    public GenericAbstractItem(Model model) {
        this.mModel = model;
    }

    public Model getModel() {
        return this.mModel;
    }

    public void setModel(Model model) {
        this.mModel = model;
    }

    @Override // com.mikepenz.fastadapter.items.AbstractItem
    protected Class<? extends VH> viewHolderType() {
        return (Class) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[2];
    }
}
