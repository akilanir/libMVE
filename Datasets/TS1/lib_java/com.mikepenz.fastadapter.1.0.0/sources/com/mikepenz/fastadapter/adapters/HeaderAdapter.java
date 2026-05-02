package com.mikepenz.fastadapter.adapters;

import com.mikepenz.fastadapter.IItem;

/* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/adapters/HeaderAdapter.class */
public class HeaderAdapter<Item extends IItem> extends ItemAdapter<Item> {
    @Override // com.mikepenz.fastadapter.adapters.ItemAdapter, com.mikepenz.fastadapter.IAdapter
    public int getOrder() {
        return 100;
    }
}
