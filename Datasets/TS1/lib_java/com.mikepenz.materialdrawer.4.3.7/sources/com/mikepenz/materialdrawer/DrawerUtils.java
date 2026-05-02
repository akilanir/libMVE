package com.mikepenz.materialdrawer;

import android.content.Context;
import android.os.Build;
import android.support.v4.widget.DrawerLayout;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import com.mikepenz.materialdrawer.adapter.BaseDrawerAdapter;
import com.mikepenz.materialdrawer.holder.ColorHolder;
import com.mikepenz.materialdrawer.model.ContainerDrawerItem;
import com.mikepenz.materialdrawer.model.PrimaryDrawerItem;
import com.mikepenz.materialdrawer.model.SecondaryDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.Selectable;
import com.mikepenz.materialdrawer.util.DrawerUIUtils;
import com.mikepenz.materialize.util.UIUtils;
import java.util.Iterator;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/DrawerUtils.class */
class DrawerUtils {
    DrawerUtils() {
    }

    public static void onFooterDrawerItemClick(DrawerBuilder drawer, IDrawerItem drawerItem, View v, Boolean fireOnClick) {
        boolean checkable = drawerItem == null || !(drawerItem instanceof Selectable) || ((Selectable) drawerItem).isSelectable();
        if (checkable) {
            drawer.resetStickyFooterSelection();
            if (Build.VERSION.SDK_INT >= 11) {
                v.setActivated(true);
            }
            v.setSelected(true);
            drawer.getAdapter().handleSelection(null, -1);
            drawer.mCurrentSelection = -1;
            if (drawer.mStickyFooterView != null && (drawer.mStickyFooterView instanceof LinearLayout)) {
                LinearLayout footer = (LinearLayout) drawer.mStickyFooterView;
                int i = 0;
                while (true) {
                    if (i >= footer.getChildCount()) {
                        break;
                    }
                    if (footer.getChildAt(i) != v) {
                        i++;
                    } else {
                        drawer.mCurrentStickyFooterSelection = i;
                        break;
                    }
                }
            }
        }
        if (fireOnClick != null) {
            boolean consumed = false;
            if (fireOnClick.booleanValue() && drawer.mOnDrawerItemClickListener != null) {
                consumed = drawer.mOnDrawerItemClickListener.onItemClick(v, -1, drawerItem);
            }
            if (!consumed) {
                drawer.closeDrawerDelayed();
            }
        }
    }

    public static boolean setRecyclerViewSelection(DrawerBuilder drawer, int position, boolean fireOnClick) {
        return setRecyclerViewSelection(drawer, position, fireOnClick, null);
    }

    public static boolean setRecyclerViewSelection(DrawerBuilder drawer, int position, boolean fireOnClick, IDrawerItem drawerItem) {
        if (position >= -1) {
            if (drawer.mAdapter != null) {
                drawer.resetStickyFooterSelection();
                drawer.mAdapter.handleSelection(null, position);
                drawer.mCurrentSelection = position;
                drawer.mCurrentStickyFooterSelection = -1;
            }
            if (fireOnClick && drawer.mOnDrawerItemClickListener != null) {
                return drawer.mOnDrawerItemClickListener.onItemClick(null, position, drawerItem);
            }
            return false;
        }
        return false;
    }

    public static void setStickyFooterSelection(DrawerBuilder drawer, int position, Boolean fireOnClick) {
        if (position > -1 && drawer.mStickyFooterView != null && (drawer.mStickyFooterView instanceof LinearLayout)) {
            LinearLayout footer = (LinearLayout) drawer.mStickyFooterView;
            if (footer.getChildCount() > position && position >= 0) {
                IDrawerItem drawerItem = (IDrawerItem) footer.getChildAt(position).getTag();
                onFooterDrawerItemClick(drawer, drawerItem, footer.getChildAt(position), fireOnClick);
            }
        }
    }

    public static int getPositionByIdentifier(DrawerBuilder drawer, int identifier) {
        if (identifier >= 0) {
            BaseDrawerAdapter adapter = drawer.getAdapter();
            for (int i = 0; i < adapter.getItemCount(); i++) {
                if (adapter.getItem(i).getIdentifier() == identifier) {
                    return i;
                }
            }
            return -1;
        }
        return -1;
    }

    public static int getStickyFooterPositionByIdentifier(DrawerBuilder drawer, int identifier) {
        if (identifier >= 0 && drawer.mStickyFooterView != null && (drawer.mStickyFooterView instanceof LinearLayout)) {
            LinearLayout footer = (LinearLayout) drawer.mStickyFooterView;
            for (int i = 0; i < footer.getChildCount(); i++) {
                Object o = footer.getChildAt(i).getTag();
                if (o != null && (o instanceof IDrawerItem) && ((IDrawerItem) o).getIdentifier() == identifier) {
                    return i;
                }
            }
            return -1;
        }
        return -1;
    }

    public static void handleHeaderView(DrawerBuilder drawer) {
        if (drawer.mAccountHeader != null) {
            if (drawer.mAccountHeaderSticky) {
                drawer.mStickyHeaderView = drawer.mAccountHeader.getView();
            } else {
                drawer.mHeaderView = drawer.mAccountHeader.getView();
                drawer.mHeaderDivider = drawer.mAccountHeader.mAccountHeaderBuilder.mDividerBelowHeader;
            }
        }
        if (drawer.mStickyHeaderView != null) {
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
            layoutParams.addRule(10, 1);
            drawer.mStickyHeaderView.setId(R.id.material_drawer_sticky_header);
            drawer.mSliderLayout.addView(drawer.mStickyHeaderView, 0, layoutParams);
            RelativeLayout.LayoutParams layoutParamsListView = (RelativeLayout.LayoutParams) drawer.mRecyclerView.getLayoutParams();
            layoutParamsListView.addRule(3, R.id.material_drawer_sticky_header);
            drawer.mRecyclerView.setLayoutParams(layoutParamsListView);
            drawer.mStickyHeaderView.setBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(drawer.mActivity, R.attr.material_drawer_background, R.color.material_drawer_background));
            if (Build.VERSION.SDK_INT >= 21) {
                drawer.mStickyHeaderView.setElevation(UIUtils.convertDpToPixel(4.0f, drawer.mActivity));
            } else {
                View view = new View(drawer.mActivity);
                view.setBackgroundResource(R.drawable.material_drawer_shadow_bottom);
                drawer.mSliderLayout.addView(view, -1, (int) UIUtils.convertDpToPixel(4.0f, drawer.mActivity));
                RelativeLayout.LayoutParams lps = (RelativeLayout.LayoutParams) view.getLayoutParams();
                lps.addRule(3, R.id.material_drawer_sticky_header);
                view.setLayoutParams(lps);
            }
            drawer.mRecyclerView.setPadding(0, 0, 0, 0);
        }
        if (drawer.mHeaderView != null) {
            if (drawer.mRecyclerView == null) {
                throw new RuntimeException("can't use a headerView without a recyclerView");
            }
            if (drawer.mHeaderDivider) {
                drawer.getAdapter().addHeaderDrawerItems(new ContainerDrawerItem().withView(drawer.mHeaderView).withViewPosition(ContainerDrawerItem.Position.TOP));
            } else {
                drawer.getAdapter().addHeaderDrawerItems(new ContainerDrawerItem().withView(drawer.mHeaderView).withViewPosition(ContainerDrawerItem.Position.NONE));
            }
            drawer.mRecyclerView.setPadding(drawer.mRecyclerView.getPaddingLeft(), 0, drawer.mRecyclerView.getPaddingRight(), drawer.mRecyclerView.getPaddingBottom());
        }
    }

    public static void rebuildStickyFooterView(final DrawerBuilder drawer) {
        if (drawer.mSliderLayout != null) {
            if (drawer.mStickyFooterView != null) {
                drawer.mStickyFooterView.removeAllViews();
                fillStickyDrawerItemFooter(drawer, drawer.mStickyFooterView, new View.OnClickListener() { // from class: com.mikepenz.materialdrawer.DrawerUtils.1
                    @Override // android.view.View.OnClickListener
                    public void onClick(View v) {
                        IDrawerItem drawerItem = (IDrawerItem) v.getTag();
                        DrawerUtils.onFooterDrawerItemClick(drawer, drawerItem, v, true);
                    }
                });
                drawer.mStickyFooterView.setVisibility(0);
            } else {
                handleFooterView(drawer, new View.OnClickListener() { // from class: com.mikepenz.materialdrawer.DrawerUtils.2
                    @Override // android.view.View.OnClickListener
                    public void onClick(View v) {
                        IDrawerItem drawerItem = (IDrawerItem) v.getTag();
                        DrawerUtils.onFooterDrawerItemClick(drawer, drawerItem, v, true);
                    }
                });
            }
            setStickyFooterSelection(drawer, drawer.mCurrentStickyFooterSelection, false);
        }
    }

    public static void handleFooterView(DrawerBuilder drawer, View.OnClickListener onClickListener) {
        Context ctx = drawer.mSliderLayout.getContext();
        if (drawer.mStickyDrawerItems != null && drawer.mStickyDrawerItems.size() > 0) {
            drawer.mStickyFooterView = buildStickyDrawerItemFooter(ctx, drawer, onClickListener);
        }
        if (drawer.mStickyFooterView != null) {
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
            layoutParams.addRule(12, 1);
            drawer.mStickyFooterView.setId(R.id.material_drawer_sticky_footer);
            drawer.mSliderLayout.addView(drawer.mStickyFooterView, layoutParams);
            if ((drawer.mTranslucentNavigationBar || drawer.mFullscreen) && Build.VERSION.SDK_INT >= 19) {
                drawer.mStickyFooterView.setPadding(0, 0, 0, UIUtils.getNavigationBarHeight(ctx));
            }
            RelativeLayout.LayoutParams layoutParamsListView = (RelativeLayout.LayoutParams) drawer.mRecyclerView.getLayoutParams();
            layoutParamsListView.addRule(2, R.id.material_drawer_sticky_footer);
            drawer.mRecyclerView.setLayoutParams(layoutParamsListView);
            if (drawer.mStickyFooterShadow) {
                drawer.mStickyFooterShadowView = new View(ctx);
                drawer.mStickyFooterShadowView.setBackgroundResource(R.drawable.material_drawer_shadow_top);
                drawer.mSliderLayout.addView(drawer.mStickyFooterShadowView, -1, (int) UIUtils.convertDpToPixel(4.0f, ctx));
                RelativeLayout.LayoutParams lps = (RelativeLayout.LayoutParams) drawer.mStickyFooterShadowView.getLayoutParams();
                lps.addRule(2, R.id.material_drawer_sticky_footer);
                drawer.mStickyFooterShadowView.setLayoutParams(lps);
            }
            drawer.mRecyclerView.setPadding(drawer.mRecyclerView.getPaddingLeft(), drawer.mRecyclerView.getPaddingTop(), drawer.mRecyclerView.getPaddingRight(), ctx.getResources().getDimensionPixelSize(R.dimen.material_drawer_padding));
        }
        if (drawer.mFooterView != null) {
            if (drawer.mRecyclerView == null) {
                throw new RuntimeException("can't use a footerView without a recyclerView");
            }
            if (drawer.mFooterDivider) {
                drawer.getAdapter().addFooterDrawerItems(new ContainerDrawerItem().withView(drawer.mFooterView).withViewPosition(ContainerDrawerItem.Position.BOTTOM));
            } else {
                drawer.getAdapter().addFooterDrawerItems(new ContainerDrawerItem().withView(drawer.mFooterView).withViewPosition(ContainerDrawerItem.Position.NONE));
            }
        }
    }

    public static ViewGroup buildStickyDrawerItemFooter(Context ctx, DrawerBuilder drawer, View.OnClickListener onClickListener) {
        LinearLayout linearLayout = new LinearLayout(ctx);
        linearLayout.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
        linearLayout.setOrientation(1);
        linearLayout.setBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(ctx, R.attr.material_drawer_background, R.color.material_drawer_background));
        if (drawer.mStickyFooterDivider) {
            LinearLayout divider = new LinearLayout(ctx);
            LinearLayout.LayoutParams dividerParams = new LinearLayout.LayoutParams(-1, -2);
            divider.setMinimumHeight((int) UIUtils.convertDpToPixel(1.0f, ctx));
            divider.setOrientation(1);
            divider.setBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(ctx, R.attr.material_drawer_divider, R.color.material_drawer_divider));
            linearLayout.addView(divider, dividerParams);
        }
        fillStickyDrawerItemFooter(drawer, linearLayout, onClickListener);
        return linearLayout;
    }

    public static void fillStickyDrawerItemFooter(DrawerBuilder drawer, ViewGroup container, View.OnClickListener onClickListener) {
        Iterator<IDrawerItem> it = drawer.mStickyDrawerItems.iterator();
        while (it.hasNext()) {
            IDrawerItem drawerItem = it.next();
            int selected_color = UIUtils.getThemeColorFromAttrOrRes(container.getContext(), R.attr.material_drawer_selected, R.color.material_drawer_selected);
            if (drawerItem instanceof PrimaryDrawerItem) {
                selected_color = ColorHolder.color(((PrimaryDrawerItem) drawerItem).getSelectedColor(), container.getContext(), R.attr.material_drawer_selected, R.color.material_drawer_selected);
            } else if (drawerItem instanceof SecondaryDrawerItem) {
                selected_color = ColorHolder.color(((SecondaryDrawerItem) drawerItem).getSelectedColor(), container.getContext(), R.attr.material_drawer_selected, R.color.material_drawer_selected);
            }
            View view = drawerItem.generateView(container.getContext(), container);
            view.setTag(drawerItem);
            if (drawerItem.isEnabled()) {
                UIUtils.setBackground(view, DrawerUIUtils.getSelectableBackground(container.getContext(), selected_color));
                view.setOnClickListener(onClickListener);
            }
            container.addView(view);
            DrawerUIUtils.setDrawerVerticalPadding(view);
        }
        container.setPadding(0, 0, 0, 0);
    }

    public static DrawerLayout.LayoutParams processDrawerLayoutParams(DrawerBuilder drawer, DrawerLayout.LayoutParams params) {
        if (params != null) {
            if (drawer.mDrawerGravity != null && (drawer.mDrawerGravity.intValue() == 5 || drawer.mDrawerGravity.intValue() == 8388613)) {
                params.rightMargin = 0;
                if (Build.VERSION.SDK_INT >= 17) {
                    params.setMarginEnd(0);
                }
                params.leftMargin = drawer.mActivity.getResources().getDimensionPixelSize(R.dimen.material_drawer_margin);
                if (Build.VERSION.SDK_INT >= 17) {
                    params.setMarginEnd(drawer.mActivity.getResources().getDimensionPixelSize(R.dimen.material_drawer_margin));
                }
            }
            if (drawer.mDisplayBelowStatusBar != null && drawer.mDisplayBelowStatusBar.booleanValue() && Build.VERSION.SDK_INT >= 19) {
                params.topMargin = UIUtils.getStatusBarHeight(drawer.mActivity, true);
            }
            if (drawer.mDrawerWidth > -1) {
                params.width = drawer.mDrawerWidth;
            } else {
                params.width = DrawerUIUtils.getOptimalDrawerWidth(drawer.mActivity);
            }
        }
        return params;
    }
}
