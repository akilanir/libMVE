package com.mikepenz.fastadapter;

import com.mikepenz.fastadapter.IItem;
import java.util.List;

/* loaded from: com.mikepenz.fastadapter.1.4.1.jar:com/mikepenz/fastadapter/IItemAdapter.class */
public interface IItemAdapter<Item extends IItem> extends IAdapter<Item> {

    /* loaded from: com.mikepenz.fastadapter.1.4.1.jar:com/mikepenz/fastadapter/IItemAdapter$Predicate.class */
    public interface Predicate<Item extends IItem> {
        boolean filter(Item item, CharSequence charSequence);
    }

    <T> T setSubItems(IExpandable<T, Item> iExpandable, List<Item> list);

    IItemAdapter<Item> set(List<Item> list);

    IItemAdapter<Item> setNewList(List<Item> list);

    IItemAdapter<Item> add(Item... itemArr);

    IItemAdapter<Item> add(List<Item> list);

    IItemAdapter<Item> add(int i, Item... itemArr);

    IItemAdapter<Item> add(int i, List<Item> list);

    IItemAdapter<Item> set(int i, Item item);

    IItemAdapter<Item> remove(int i);

    IItemAdapter<Item> removeRange(int i, int i2);

    IItemAdapter<Item> clear();
}
