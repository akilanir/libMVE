package com.mikepenz.fastadapter;

import com.mikepenz.fastadapter.IItem;
import java.util.List;

/* loaded from: com.mikepenz.fastadapter.1.4.1.jar:com/mikepenz/fastadapter/IExpandable.class */
public interface IExpandable<T, Item extends IItem> {
    boolean isExpanded();

    T withIsExpanded(boolean z);

    T withSubItems(List<Item> list);

    List<Item> getSubItems();
}
