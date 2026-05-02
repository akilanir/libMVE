package com.mikepenz.fastadapter;

import com.mikepenz.fastadapter.IItem;
import java.util.List;

/* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/IAdapter.class */
public interface IAdapter<Item extends IItem> {
    FastAdapter getFastAdapter();

    int getOrder();

    int getAdapterItemCount();

    List<Item> getAdapterItems();

    Item getAdapterItem(int i);

    int getAdapterPosition(Item item);

    int getGlobalPosition(int i);

    int getItemCount();

    <Item extends IItem> Item getItem(int i);
}
