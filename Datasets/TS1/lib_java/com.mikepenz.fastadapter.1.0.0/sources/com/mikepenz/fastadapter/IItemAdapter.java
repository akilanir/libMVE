package com.mikepenz.fastadapter;

import com.mikepenz.fastadapter.IItem;
import java.util.List;

/* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/IItemAdapter.class */
public interface IItemAdapter<Item extends IItem> extends IAdapter<Item> {

    /* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/IItemAdapter$Predicate.class */
    public interface Predicate<Item extends IItem> {
        boolean filter(Item item, CharSequence charSequence);
    }

    <T> T setSubItems(IExpandable<T, Item> iExpandable, List<Item> list);

    void set(List<Item> list);

    void setNewList(List<Item> list);

    void add(Item... itemArr);

    void add(List<Item> list);

    void add(int i, Item... itemArr);

    void add(int i, List<Item> list);

    void set(int i, Item item);

    void remove(int i);

    void removeRange(int i, int i2);

    void clear();
}
