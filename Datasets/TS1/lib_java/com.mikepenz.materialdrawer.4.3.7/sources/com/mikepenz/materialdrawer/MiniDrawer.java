package com.mikepenz.materialdrawer;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.LinearLayout;
import com.mikepenz.materialdrawer.adapter.BaseDrawerAdapter;
import com.mikepenz.materialdrawer.adapter.DrawerAdapter;
import com.mikepenz.materialdrawer.interfaces.ICrossfader;
import com.mikepenz.materialdrawer.model.MiniDrawerItem;
import com.mikepenz.materialdrawer.model.MiniProfileDrawerItem;
import com.mikepenz.materialdrawer.model.PrimaryDrawerItem;
import com.mikepenz.materialdrawer.model.ProfileDrawerItem;
import com.mikepenz.materialdrawer.model.SecondaryDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.IProfile;
import com.mikepenz.materialize.util.UIUtils;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/MiniDrawer.class */
public class MiniDrawer {
    public static final int PROFILE = 1;
    public static final int ITEM = 2;
    private LinearLayout mContainer;
    private RecyclerView mRecyclerView;
    private DrawerAdapter mDrawerAdapter;
    private Drawer mDrawer;
    private AccountHeader mAccountHeader;
    private ICrossfader mCrossFader;
    private boolean mInnerShadow = false;
    private boolean mInRTL = false;
    private boolean mIncludeSecondaryDrawerItems = false;
    private boolean mEnableSelectedMiniDrawerItemBackground = false;

    public MiniDrawer withDrawer(@NonNull Drawer drawer) {
        this.mDrawer = drawer;
        return this;
    }

    public MiniDrawer withAccountHeader(@NonNull AccountHeader accountHeader) {
        this.mAccountHeader = accountHeader;
        return this;
    }

    public MiniDrawer withCrossFader(@NonNull ICrossfader crossFader) {
        this.mCrossFader = crossFader;
        return this;
    }

    public MiniDrawer withInnerShadow(boolean innerShadow) {
        this.mInnerShadow = innerShadow;
        return this;
    }

    public MiniDrawer withInRTL(boolean inRTL) {
        this.mInRTL = inRTL;
        return this;
    }

    public MiniDrawer withIncludeSecondaryDrawerItems(boolean includeSecondaryDrawerItems) {
        this.mIncludeSecondaryDrawerItems = includeSecondaryDrawerItems;
        return this;
    }

    public MiniDrawer withEnableSelectedMiniDrawerItemBackground(boolean enableSelectedMiniDrawerItemBackground) {
        this.mEnableSelectedMiniDrawerItemBackground = enableSelectedMiniDrawerItemBackground;
        return this;
    }

    public RecyclerView getRecyclerView() {
        return this.mRecyclerView;
    }

    public DrawerAdapter getDrawerAdapter() {
        return this.mDrawerAdapter;
    }

    public Drawer getDrawer() {
        return this.mDrawer;
    }

    public AccountHeader getAccountHeader() {
        return this.mAccountHeader;
    }

    public ICrossfader getCrossFader() {
        return this.mCrossFader;
    }

    public IDrawerItem generateMiniDrawerItem(IDrawerItem drawerItem) {
        if (drawerItem instanceof PrimaryDrawerItem) {
            return new MiniDrawerItem((PrimaryDrawerItem) drawerItem).withEnableSelectedBackground(this.mEnableSelectedMiniDrawerItemBackground);
        }
        if ((drawerItem instanceof SecondaryDrawerItem) && this.mIncludeSecondaryDrawerItems) {
            return new MiniDrawerItem((SecondaryDrawerItem) drawerItem).withEnableSelectedBackground(this.mEnableSelectedMiniDrawerItemBackground);
        }
        return null;
    }

    public int getMiniDrawerType(IDrawerItem drawerItem) {
        if (drawerItem instanceof MiniProfileDrawerItem) {
            return 1;
        }
        if (drawerItem instanceof MiniDrawerItem) {
            return 2;
        }
        return -1;
    }

    public View build(Context ctx) {
        this.mContainer = new LinearLayout(ctx);
        if (this.mInnerShadow) {
            if (!this.mInRTL) {
                this.mContainer.setBackgroundResource(R.drawable.material_drawer_shadow_left);
            } else {
                this.mContainer.setBackgroundResource(R.drawable.material_drawer_shadow_right);
            }
        }
        this.mRecyclerView = new RecyclerView(ctx);
        this.mContainer.addView((View) this.mRecyclerView, -1, -1);
        this.mRecyclerView.setItemAnimator(new DefaultItemAnimator());
        this.mRecyclerView.setFadingEdgeLength(0);
        this.mRecyclerView.setClipToPadding(false);
        this.mRecyclerView.setLayoutManager(new LinearLayoutManager(ctx));
        this.mDrawerAdapter = new DrawerAdapter();
        this.mRecyclerView.setAdapter(this.mDrawerAdapter);
        if (this.mDrawer != null && this.mDrawer.mDrawerBuilder != null && (this.mDrawer.mDrawerBuilder.mFullscreen || this.mDrawer.mDrawerBuilder.mTranslucentStatusBar)) {
            this.mRecyclerView.setPadding(this.mRecyclerView.getPaddingLeft(), UIUtils.getStatusBarHeight(ctx), this.mRecyclerView.getPaddingRight(), this.mRecyclerView.getPaddingBottom());
        }
        if (this.mDrawer != null && this.mDrawer.mDrawerBuilder != null && (this.mDrawer.mDrawerBuilder.mFullscreen || this.mDrawer.mDrawerBuilder.mTranslucentNavigationBar)) {
            this.mRecyclerView.setPadding(this.mRecyclerView.getPaddingLeft(), this.mRecyclerView.getPaddingTop(), this.mRecyclerView.getPaddingRight(), UIUtils.getNavigationBarHeight(ctx));
        }
        createItems();
        return this.mContainer;
    }

    public void onProfileClick() {
        if (this.mCrossFader != null && this.mCrossFader.isCrossfaded()) {
            this.mCrossFader.crossfade();
        }
        if (this.mAccountHeader != null) {
            IProfile profile = this.mAccountHeader.getActiveProfile();
            if (profile instanceof ProfileDrawerItem) {
                this.mDrawerAdapter.setDrawerItem(0, new MiniProfileDrawerItem((ProfileDrawerItem) profile));
            }
        }
    }

    public boolean onItemClick(IDrawerItem selectedDrawerItem) {
        if (selectedDrawerItem.isSelectable()) {
            if (this.mCrossFader != null && this.mCrossFader.isCrossfaded()) {
                this.mCrossFader.crossfade();
            }
            int identifier = selectedDrawerItem.getIdentifier();
            setSelection(identifier);
            return false;
        }
        return true;
    }

    public void setSelection(int identifier) {
        Iterator<IDrawerItem> it = this.mDrawerAdapter.getDrawerItems().iterator();
        while (it.hasNext()) {
            IDrawerItem drawerItem = it.next();
            drawerItem.withSetSelected(drawerItem.getIdentifier() == identifier);
        }
        this.mDrawerAdapter.notifyDataSetChanged();
    }

    public void updateItem(int identifier) {
        IDrawerItem miniDrawerItem;
        if (this.mDrawer != null && this.mDrawerAdapter != null && this.mDrawerAdapter.getDrawerItems() != null && identifier != -1) {
            IDrawerItem drawerItem = this.mDrawer.getDrawerItem(identifier);
            for (int i = 0; i < this.mDrawerAdapter.getDrawerItems().size(); i++) {
                if (this.mDrawerAdapter.getDrawerItems().get(i).getIdentifier() == drawerItem.getIdentifier() && (miniDrawerItem = generateMiniDrawerItem(drawerItem)) != null) {
                    this.mDrawerAdapter.setDrawerItem(i, miniDrawerItem);
                }
            }
        }
    }

    public void createItems() {
        this.mDrawerAdapter.clearDrawerItems();
        if (this.mAccountHeader != null) {
            IProfile profile = this.mAccountHeader.getActiveProfile();
            if (profile instanceof ProfileDrawerItem) {
                this.mDrawerAdapter.addDrawerItem(new MiniProfileDrawerItem((ProfileDrawerItem) profile));
            }
        }
        if (this.mDrawer != null && this.mDrawer.getDrawerItems() != null) {
            ArrayList<IDrawerItem> drawerItems = this.mDrawer.getDrawerItems();
            if (this.mDrawer.switchedDrawerContent()) {
                drawerItems = this.mDrawer.getOriginalDrawerItems();
            }
            Iterator<IDrawerItem> it = drawerItems.iterator();
            while (it.hasNext()) {
                IDrawerItem drawerItem = it.next();
                IDrawerItem miniDrawerItem = generateMiniDrawerItem(drawerItem);
                if (miniDrawerItem != null) {
                    this.mDrawerAdapter.addDrawerItem(miniDrawerItem);
                }
            }
        }
        this.mDrawerAdapter.setOnClickListener(new BaseDrawerAdapter.OnClickListener() { // from class: com.mikepenz.materialdrawer.MiniDrawer.1
            @Override // com.mikepenz.materialdrawer.adapter.BaseDrawerAdapter.OnClickListener
            public void onClick(View v, int position, IDrawerItem item) {
                int type = MiniDrawer.this.getMiniDrawerType(item);
                if (type == 2) {
                    if (item.isSelectable()) {
                        MiniDrawer.this.mDrawer.setSelection(item, true);
                        return;
                    } else {
                        if (MiniDrawer.this.mDrawer.getOnDrawerItemClickListener() != null) {
                            MiniDrawer.this.mDrawer.getOnDrawerItemClickListener().onItemClick(v, position, MiniDrawer.this.mDrawer.getDrawerItem(item.getIdentifier()));
                            return;
                        }
                        return;
                    }
                }
                if (type == 1) {
                    if (MiniDrawer.this.mAccountHeader != null && !MiniDrawer.this.mAccountHeader.isSelectionListShown()) {
                        MiniDrawer.this.mAccountHeader.toggleSelectionList(v.getContext());
                    }
                    if (MiniDrawer.this.mCrossFader != null) {
                        MiniDrawer.this.mCrossFader.crossfade();
                    }
                }
            }
        });
        this.mRecyclerView.scrollToPosition(0);
    }
}
