package com.mikepenz.materialdrawer;

import android.app.Activity;
import android.os.Build;
import android.support.v4.widget.DrawerLayout;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import com.mikepenz.materialdrawer.model.PrimaryDrawerItem;
import com.mikepenz.materialdrawer.model.SecondaryDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.Checkable;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import com.mikepenz.materialdrawer.util.UIUtils;
import java.util.Iterator;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/DrawerUtils.class */
class DrawerUtils {
    DrawerUtils() {
    }

    public static void onFooterDrawerItemClick(DrawerBuilder drawer, IDrawerItem drawerItem, View v, boolean fireOnClick) {
        boolean checkable = drawerItem == null || !(drawerItem instanceof Checkable) || ((Checkable) drawerItem).isCheckable();
        if (checkable) {
            drawer.resetStickyFooterSelection();
            if (Build.VERSION.SDK_INT >= 11) {
                v.setActivated(true);
            }
            v.setSelected(true);
            drawer.mListView.setSelection(-1);
            drawer.mListView.setItemChecked(drawer.mCurrentSelection + drawer.mHeaderOffset, false);
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
                        drawer.mCurrentFooterSelection = i;
                        break;
                    }
                }
            }
        }
        boolean consumed = false;
        if (fireOnClick && drawer.mOnDrawerItemClickListener != null) {
            consumed = drawer.mOnDrawerItemClickListener.onItemClick(null, v, -1, -1L, drawerItem);
        }
        if (!consumed) {
            drawer.closeDrawerDelayed();
        }
    }

    public static boolean setListSelection(DrawerBuilder drawer, int position, boolean fireOnClick) {
        return setListSelection(drawer, position, fireOnClick, null);
    }

    public static boolean setListSelection(DrawerBuilder drawer, int position, boolean fireOnClick, IDrawerItem drawerItem) {
        if (position >= -1) {
            if (drawer.mListView != null && position + drawer.mHeaderOffset > -1) {
                drawer.resetStickyFooterSelection();
                drawer.mListView.setSelection(position + drawer.mHeaderOffset);
                drawer.mListView.setItemChecked(position + drawer.mHeaderOffset, true);
                drawer.mCurrentSelection = position;
                drawer.mCurrentFooterSelection = -1;
            }
            if (fireOnClick && drawer.mOnDrawerItemClickListener != null) {
                return drawer.mOnDrawerItemClickListener.onItemClick(null, null, position, -1L, drawerItem);
            }
            return false;
        }
        return false;
    }

    public static void setFooterSelection(DrawerBuilder drawer, int position, boolean fireOnClick) {
        if (position > -1 && drawer.mStickyFooterView != null && (drawer.mStickyFooterView instanceof LinearLayout)) {
            LinearLayout footer = (LinearLayout) drawer.mStickyFooterView;
            if (footer.getChildCount() > position && position >= 0) {
                IDrawerItem drawerItem = (IDrawerItem) footer.getChildAt(position).getTag();
                onFooterDrawerItemClick(drawer, drawerItem, footer.getChildAt(position), fireOnClick);
            }
        }
    }

    public static int getPositionFromIdentifier(DrawerBuilder drawer, int identifier) {
        if (identifier >= 0 && drawer.mDrawerItems != null) {
            int position = 0;
            Iterator<IDrawerItem> it = drawer.mDrawerItems.iterator();
            while (it.hasNext()) {
                IDrawerItem i = it.next();
                if (i.getIdentifier() == identifier) {
                    return position;
                }
                position++;
            }
            return -1;
        }
        return -1;
    }

    public static int getFooterPositionFromIdentifier(DrawerBuilder drawer, int identifier) {
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

    public static void setTranslucentStatusFlag(Activity activity, boolean on) {
        if (Build.VERSION.SDK_INT >= 19) {
            setFlag(activity, 67108864, on);
        }
    }

    public static void setTranslucentNavigationFlag(Activity activity, boolean on) {
        if (Build.VERSION.SDK_INT >= 19) {
            setFlag(activity, 134217728, on);
        }
    }

    public static void setFlag(Activity activity, int bits, boolean on) {
        Window win = activity.getWindow();
        WindowManager.LayoutParams winParams = win.getAttributes();
        if (on) {
            winParams.flags |= bits;
        } else {
            winParams.flags &= bits ^ (-1);
        }
        win.setAttributes(winParams);
    }

    public static void handleHeaderView(DrawerBuilder drawer) {
        if (drawer.mAccountHeader != null) {
            if (drawer.mAccountHeaderSticky) {
                drawer.mStickyHeaderView = drawer.mAccountHeader.getView();
            } else {
                drawer.mHeaderView = drawer.mAccountHeader.getView();
            }
        }
        if (drawer.mStickyHeaderView != null) {
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
            layoutParams.addRule(10, 1);
            drawer.mStickyHeaderView.setId(R.id.sticky_header);
            drawer.mSliderLayout.addView(drawer.mStickyHeaderView, 0, layoutParams);
            RelativeLayout.LayoutParams layoutParamsListView = (RelativeLayout.LayoutParams) drawer.mListView.getLayoutParams();
            layoutParamsListView.addRule(3, R.id.sticky_header);
            drawer.mListView.setLayoutParams(layoutParamsListView);
            drawer.mListView.setPadding(0, 0, 0, 0);
        }
        if (drawer.mHeaderView != null) {
            if (drawer.mListView == null) {
                throw new RuntimeException("can't use a headerView without a listView");
            }
            if (drawer.mHeaderDivider) {
                LinearLayout headerContainer = (LinearLayout) drawer.mActivity.getLayoutInflater().inflate(R.layout.material_drawer_item_header, (ViewGroup) drawer.mListView, false);
                headerContainer.addView(drawer.mHeaderView, 0);
                headerContainer.findViewById(R.id.divider).setBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(drawer.mActivity, R.attr.material_drawer_divider, R.color.material_drawer_divider));
                drawer.mListView.addHeaderView(headerContainer, null, drawer.mHeaderClickable);
                drawer.mHeaderView = headerContainer;
            } else {
                drawer.mListView.addHeaderView(drawer.mHeaderView, null, drawer.mHeaderClickable);
            }
            drawer.mListView.setPadding(drawer.mListView.getPaddingLeft(), 0, drawer.mListView.getPaddingRight(), drawer.mListView.getPaddingBottom());
        }
    }

    public static void rebuildFooterView(final DrawerBuilder drawer) {
        if (drawer.mSliderLayout != null) {
            if (drawer.mStickyFooterView != null && (drawer.mStickyFooterView instanceof ViewGroup)) {
                ((LinearLayout) drawer.mStickyFooterView).removeAllViews();
            }
            fillStickyDrawerItemFooter(drawer, drawer.mStickyFooterView, new View.OnClickListener() { // from class: com.mikepenz.materialdrawer.DrawerUtils.1
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    IDrawerItem drawerItem = (IDrawerItem) v.getTag();
                    DrawerUtils.onFooterDrawerItemClick(drawer, drawerItem, v, true);
                }
            });
            setFooterSelection(drawer, drawer.mCurrentFooterSelection, false);
        }
    }

    public static void handleFooterView(DrawerBuilder drawer, View.OnClickListener onClickListener) {
        if (drawer.mStickyDrawerItems != null && drawer.mStickyDrawerItems.size() > 0) {
            drawer.mStickyFooterView = buildStickyDrawerItemFooter(drawer, onClickListener);
        }
        if (drawer.mStickyFooterView != null) {
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
            layoutParams.addRule(12, 1);
            drawer.mStickyFooterView.setId(R.id.sticky_footer);
            drawer.mSliderLayout.addView(drawer.mStickyFooterView, layoutParams);
            if ((drawer.mTranslucentNavigationBar || drawer.mFullscreen) && Build.VERSION.SDK_INT >= 19) {
                drawer.mStickyFooterView.setPadding(0, 0, 0, UIUtils.getNavigationBarHeight(drawer.mActivity));
            }
            RelativeLayout.LayoutParams layoutParamsListView = (RelativeLayout.LayoutParams) drawer.mListView.getLayoutParams();
            layoutParamsListView.addRule(2, R.id.sticky_footer);
            drawer.mListView.setLayoutParams(layoutParamsListView);
            drawer.mListView.setPadding(drawer.mListView.getPaddingLeft(), drawer.mListView.getPaddingTop(), drawer.mListView.getPaddingRight(), drawer.mActivity.getResources().getDimensionPixelSize(R.dimen.material_drawer_padding));
        }
        if (drawer.mFooterView != null) {
            if (drawer.mListView == null) {
                throw new RuntimeException("can't use a footerView without a listView");
            }
            if (drawer.mFooterDivider) {
                LinearLayout footerContainer = (LinearLayout) drawer.mActivity.getLayoutInflater().inflate(R.layout.material_drawer_item_footer, (ViewGroup) drawer.mListView, false);
                footerContainer.addView(drawer.mFooterView, 1);
                footerContainer.findViewById(R.id.divider).setBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(drawer.mActivity, R.attr.material_drawer_divider, R.color.material_drawer_divider));
                drawer.mListView.addFooterView(footerContainer, null, drawer.mFooterClickable);
                drawer.mFooterView = footerContainer;
                return;
            }
            drawer.mListView.addFooterView(drawer.mFooterView, null, drawer.mFooterClickable);
        }
    }

    public static ViewGroup buildStickyDrawerItemFooter(DrawerBuilder drawer, View.OnClickListener onClickListener) {
        LinearLayout linearLayout = new LinearLayout(drawer.mActivity);
        linearLayout.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
        linearLayout.setOrientation(1);
        linearLayout.setBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(drawer.mActivity, R.attr.material_drawer_background, R.color.material_drawer_background));
        if (Build.VERSION.SDK_INT >= 21) {
            linearLayout.setElevation(UIUtils.convertDpToPixel(4.0f, drawer.mActivity));
        } else if (drawer.mStickyFooterDivider == null) {
            drawer.mStickyFooterDivider = true;
        }
        if (drawer.mStickyFooterDivider != null && drawer.mStickyFooterDivider.booleanValue()) {
            LinearLayout divider = new LinearLayout(drawer.mActivity);
            LinearLayout.LayoutParams dividerParams = new LinearLayout.LayoutParams(-1, -2);
            divider.setMinimumHeight((int) UIUtils.convertDpToPixel(1.0f, drawer.mActivity));
            divider.setOrientation(1);
            divider.setBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(drawer.mActivity, R.attr.material_drawer_divider, R.color.material_drawer_divider));
            linearLayout.addView(divider, dividerParams);
        }
        fillStickyDrawerItemFooter(drawer, linearLayout, onClickListener);
        return linearLayout;
    }

    public static void fillStickyDrawerItemFooter(DrawerBuilder drawer, ViewGroup container, View.OnClickListener onClickListener) {
        LayoutInflater layoutInflater = LayoutInflater.from(container.getContext());
        Iterator<IDrawerItem> it = drawer.mStickyDrawerItems.iterator();
        while (it.hasNext()) {
            IDrawerItem drawerItem = it.next();
            int selected_color = UIUtils.getThemeColorFromAttrOrRes(container.getContext(), R.attr.material_drawer_selected, R.color.material_drawer_selected);
            if (drawerItem instanceof PrimaryDrawerItem) {
                if (selected_color == 0 && ((PrimaryDrawerItem) drawerItem).getSelectedColorRes() != -1) {
                    selected_color = container.getContext().getResources().getColor(((PrimaryDrawerItem) drawerItem).getSelectedColorRes());
                } else if (((PrimaryDrawerItem) drawerItem).getSelectedColor() != 0) {
                    selected_color = ((PrimaryDrawerItem) drawerItem).getSelectedColor();
                }
            } else if (drawerItem instanceof SecondaryDrawerItem) {
                if (selected_color == 0 && ((SecondaryDrawerItem) drawerItem).getSelectedColorRes() != -1) {
                    selected_color = container.getContext().getResources().getColor(((SecondaryDrawerItem) drawerItem).getSelectedColorRes());
                } else if (((SecondaryDrawerItem) drawerItem).getSelectedColor() != 0) {
                    selected_color = ((SecondaryDrawerItem) drawerItem).getSelectedColor();
                }
            }
            View view = drawerItem.convertView(layoutInflater, null, container);
            view.setTag(drawerItem);
            if (drawerItem.isEnabled()) {
                UIUtils.setBackground(view, UIUtils.getSelectableBackground(container.getContext(), selected_color));
                view.setOnClickListener(onClickListener);
            }
            container.addView(view);
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
            if (drawer.mTranslucentActionBarCompatibility) {
                int topMargin = UIUtils.getActionBarHeight(drawer.mActivity);
                if (drawer.mTranslucentStatusBar) {
                    topMargin += UIUtils.getStatusBarHeight(drawer.mActivity);
                }
                params.topMargin = topMargin;
            } else if (drawer.mDisplayBelowStatusBar != null && drawer.mDisplayBelowStatusBar.booleanValue()) {
                params.topMargin = UIUtils.getStatusBarHeight(drawer.mActivity, true);
            }
            if (drawer.mDrawerWidth > -1) {
                params.width = drawer.mDrawerWidth;
            } else {
                params.width = UIUtils.getOptimalDrawerWidth(drawer.mActivity);
            }
        }
        return params;
    }
}
