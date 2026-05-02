package com.mikepenz.fastadapter.utils;

import android.support.v7.widget.RecyclerView;
import com.mikepenz.fastadapter.IItem;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Stack;

/* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/utils/RecyclerViewCacheUtil.class */
public class RecyclerViewCacheUtil<Item extends IItem> {
    private int mCacheSize = 2;

    public RecyclerViewCacheUtil withCacheSize(int cacheSize) {
        this.mCacheSize = cacheSize;
        return this;
    }

    public void apply(RecyclerView recyclerView, Iterable<Item> items) {
        if (items != null) {
            HashMap<Integer, Stack<RecyclerView.ViewHolder>> cache = new HashMap<>();
            for (Item d : items) {
                if (!cache.containsKey(Integer.valueOf(d.getType()))) {
                    cache.put(Integer.valueOf(d.getType()), new Stack<>());
                }
                if (this.mCacheSize == -1 || cache.get(Integer.valueOf(d.getType())).size() <= this.mCacheSize) {
                    cache.get(Integer.valueOf(d.getType())).push(d.getViewHolder(recyclerView));
                }
                RecyclerView.RecycledViewPool recyclerViewPool = new RecyclerView.RecycledViewPool();
                for (Map.Entry<Integer, Stack<RecyclerView.ViewHolder>> entry : cache.entrySet()) {
                    recyclerViewPool.setMaxRecycledViews(entry.getKey().intValue(), this.mCacheSize);
                    Iterator<RecyclerView.ViewHolder> it = entry.getValue().iterator();
                    while (it.hasNext()) {
                        RecyclerView.ViewHolder holder = it.next();
                        recyclerViewPool.putRecycledView(holder);
                    }
                    entry.getValue().clear();
                }
                cache.clear();
                recyclerView.setRecycledViewPool(recyclerViewPool);
            }
        }
    }
}
