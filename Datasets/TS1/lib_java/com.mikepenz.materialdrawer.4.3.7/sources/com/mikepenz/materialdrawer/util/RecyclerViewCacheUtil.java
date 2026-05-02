package com.mikepenz.materialdrawer.util;

import android.support.v7.widget.RecyclerView;
import com.mikepenz.materialdrawer.Drawer;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import java.util.HashMap;
import java.util.Stack;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/util/RecyclerViewCacheUtil.class */
public class RecyclerViewCacheUtil {
    private static RecyclerViewCacheUtil SINGLETON = null;
    private int CACHE_SIZE = 3;
    private HashMap<String, Stack<RecyclerView.ViewHolder>> CACHE = new HashMap<>();

    private RecyclerViewCacheUtil() {
    }

    public static RecyclerViewCacheUtil getInstance() {
        if (SINGLETON == null) {
            SINGLETON = new RecyclerViewCacheUtil();
        }
        return SINGLETON;
    }

    public RecyclerViewCacheUtil withCacheSize(int cacheSize) {
        this.CACHE_SIZE = cacheSize;
        return this;
    }

    public void init(Drawer drawer) {
        if (drawer.getDrawerItems() != null) {
            init(drawer.getRecyclerView(), (IDrawerItem[]) drawer.getDrawerItems().toArray(new IDrawerItem[drawer.getDrawerItems().size()]));
        }
    }

    public void clear() {
        this.CACHE.clear();
    }

    public void init(RecyclerView recyclerView, IDrawerItem... drawerItems) {
        if (drawerItems != null) {
            for (IDrawerItem d : drawerItems) {
                if (!this.CACHE.containsKey(d.getType())) {
                    this.CACHE.put(d.getType(), new Stack<>());
                }
                if (this.CACHE_SIZE == -1 || this.CACHE.get(d.getType()).size() <= this.CACHE_SIZE) {
                    this.CACHE.get(d.getType()).push(d.getViewHolder(recyclerView));
                }
            }
        }
    }

    public RecyclerView.ViewHolder obtain(String type) {
        if (this.CACHE.containsKey(type) && this.CACHE.get(type).size() > 0) {
            return this.CACHE.get(type).pop();
        }
        return null;
    }
}
