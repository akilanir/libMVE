package com.mikepenz.materialdrawer.adapter;

import android.app.Activity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import android.view.animation.ScaleAnimation;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/adapter/DrawerAdapter.class */
public class DrawerAdapter extends BaseDrawerAdapter {
    private ArrayList<IDrawerItem> mDrawerItems;
    private boolean mAnimateDrawerItems;
    private ArrayList<Boolean> mDrawerAnimatedItems;
    private LayoutInflater mInflater;
    private LinkedHashSet<String> mTypeMapper;

    public DrawerAdapter(Activity activity) {
        this(activity, false);
    }

    public DrawerAdapter(Activity activity, boolean animateDrawerItems) {
        this(activity, null, animateDrawerItems);
    }

    public DrawerAdapter(Activity activity, ArrayList<IDrawerItem> drawerItems) {
        this(activity, drawerItems, false);
    }

    public DrawerAdapter(Activity activity, ArrayList<IDrawerItem> drawerItems, boolean animateDrawerItems) {
        this.mAnimateDrawerItems = false;
        this.mInflater = (LayoutInflater) activity.getSystemService("layout_inflater");
        this.mDrawerItems = new ArrayList<>();
        this.mDrawerAnimatedItems = new ArrayList<>();
        this.mAnimateDrawerItems = animateDrawerItems;
        setDrawerItems(drawerItems);
    }

    public void add(IDrawerItem... drawerItems) {
        if (drawerItems != null) {
            Collections.addAll(this.mDrawerItems, drawerItems);
        }
        if (drawerItems != null) {
            for (int i = 0; i < drawerItems.length; i++) {
                this.mDrawerAnimatedItems.add(false);
            }
        }
        mapTypes();
    }

    @Override // android.widget.BaseAdapter, android.widget.ListAdapter
    public boolean areAllItemsEnabled() {
        return false;
    }

    @Override // android.widget.BaseAdapter, android.widget.ListAdapter
    public boolean isEnabled(int position) {
        return position < getCount() && this.mDrawerItems.get(position).isEnabled();
    }

    @Override // android.widget.Adapter
    public int getCount() {
        if (this.mDrawerItems == null) {
            return 0;
        }
        return this.mDrawerItems.size();
    }

    @Override // android.widget.Adapter
    public Object getItem(int position) {
        if (position < getCount()) {
            return this.mDrawerItems.get(position);
        }
        return null;
    }

    public Boolean getAnimatedItem(int position) {
        if (this.mDrawerAnimatedItems != null && position < this.mDrawerAnimatedItems.size()) {
            return this.mDrawerAnimatedItems.get(position);
        }
        return null;
    }

    public void setAnimatedItem(int position, Boolean animated) {
        if (this.mDrawerAnimatedItems != null && position < this.mDrawerAnimatedItems.size()) {
            this.mDrawerAnimatedItems.set(position, animated);
        }
    }

    @Override // android.widget.Adapter
    public long getItemId(int position) {
        return position;
    }

    @Override // com.mikepenz.materialdrawer.adapter.BaseDrawerAdapter
    public ArrayList<IDrawerItem> getDrawerItems() {
        return this.mDrawerItems;
    }

    @Override // com.mikepenz.materialdrawer.adapter.BaseDrawerAdapter
    public void setDrawerItems(ArrayList<IDrawerItem> drawerItems) {
        this.mDrawerItems = drawerItems;
        if (drawerItems != null) {
            this.mDrawerAnimatedItems.clear();
            for (int i = 0; i < drawerItems.size(); i++) {
                this.mDrawerAnimatedItems.add(false);
            }
        }
        mapTypes();
    }

    @Override // com.mikepenz.materialdrawer.adapter.BaseDrawerAdapter
    public LinkedHashSet<String> getTypeMapper() {
        return this.mTypeMapper;
    }

    @Override // com.mikepenz.materialdrawer.adapter.BaseDrawerAdapter
    public void setTypeMapper(LinkedHashSet<String> typeMapper) {
        this.mTypeMapper = typeMapper;
    }

    @Override // com.mikepenz.materialdrawer.adapter.BaseDrawerAdapter
    public void resetAnimation() {
        for (int i = 0; i < this.mDrawerAnimatedItems.size(); i++) {
            this.mDrawerAnimatedItems.set(i, false);
        }
    }

    @Override // android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        IDrawerItem item = (IDrawerItem) getItem(position);
        View view = item.convertView(this.mInflater, convertView, parent);
        if (this.mAnimateDrawerItems && (getAnimatedItem(position) == null || !getAnimatedItem(position).booleanValue())) {
            AnimationSet animationSet = new AnimationSet(false);
            animationSet.setDuration(100L);
            Animation scaleAnimation = new ScaleAnimation(1.0f, 1.0f, 0.0f, 1.0f);
            Animation alphaAnimation = new AlphaAnimation(0.0f, 1.0f);
            animationSet.addAnimation(scaleAnimation);
            animationSet.addAnimation(alphaAnimation);
            view.startAnimation(animationSet);
            setAnimatedItem(position, true);
        }
        return view;
    }
}
