package com.mikepenz.fastadapter;

import com.mikepenz.fastadapter.FastAdapter;
import com.mikepenz.fastadapter.IItem;

/* loaded from: com.mikepenz.fastadapter.1.4.1.jar:com/mikepenz/fastadapter/IClickable.class */
public interface IClickable<Item extends IItem> {
    Item withOnItemPreClickListener(FastAdapter.OnClickListener<Item> onClickListener);

    FastAdapter.OnClickListener<Item> getOnPreItemClickListener();

    Item withOnItemClickListener(FastAdapter.OnClickListener<Item> onClickListener);

    FastAdapter.OnClickListener<Item> getOnItemClickListener();
}
