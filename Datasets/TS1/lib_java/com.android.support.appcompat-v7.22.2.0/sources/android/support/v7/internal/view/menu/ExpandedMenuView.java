package android.support.v7.internal.view.menu;

import android.R;
import android.content.Context;
import android.support.v7.internal.view.menu.MenuBuilder;
import android.support.v7.internal.widget.TintTypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

/* loaded from: com.android.support.appcompat-v7.22.2.0.jar:android/support/v7/internal/view/menu/ExpandedMenuView.class */
public final class ExpandedMenuView extends ListView implements MenuBuilder.ItemInvoker, MenuView, AdapterView.OnItemClickListener {
    private static final int[] TINT_ATTRS = {R.attr.background, R.attr.divider};
    private MenuBuilder mMenu;
    private int mAnimations;

    public ExpandedMenuView(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.listViewStyle);
    }

    public ExpandedMenuView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs);
        setOnItemClickListener(this);
        TintTypedArray a = TintTypedArray.obtainStyledAttributes(context, attrs, TINT_ATTRS, defStyleAttr, 0);
        if (a.hasValue(0)) {
            setBackgroundDrawable(a.getDrawable(0));
        }
        if (a.hasValue(1)) {
            setDivider(a.getDrawable(1));
        }
        a.recycle();
    }

    @Override // android.support.v7.internal.view.menu.MenuView
    public void initialize(MenuBuilder menu) {
        this.mMenu = menu;
    }

    @Override // android.widget.ListView, android.widget.AbsListView, android.widget.AdapterView, android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        setChildrenDrawingCacheEnabled(false);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.support.v7.internal.view.menu.MenuBuilder.ItemInvoker
    public boolean invokeItem(MenuItemImpl menuItemImpl) {
        return this.mMenu.performItemAction(menuItemImpl, 0);
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public void onItemClick(AdapterView parent, View v, int position, long id) {
        invokeItem((MenuItemImpl) getAdapter().getItem(position));
    }

    @Override // android.support.v7.internal.view.menu.MenuView
    public int getWindowAnimations() {
        return this.mAnimations;
    }
}
