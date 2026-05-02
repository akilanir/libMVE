package android.support.design.internal;

import android.R;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;
import android.support.v4.graphics.drawable.DrawableCompat;
import android.support.v4.widget.TextViewCompat;
import android.support.v7.view.menu.MenuItemImpl;
import android.support.v7.view.menu.MenuView;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewStub;
import android.widget.CheckedTextView;
import android.widget.FrameLayout;

/* loaded from: com.android.support.design.23.1.1.jar:android/support/design/internal/NavigationMenuItemView.class */
public class NavigationMenuItemView extends ForegroundLinearLayout implements MenuView.ItemView {
    private static final int[] CHECKED_STATE_SET = {R.attr.state_checked};
    private final int mIconSize;
    private final CheckedTextView mTextView;
    private FrameLayout mActionArea;
    private MenuItemImpl mItemData;
    private ColorStateList mIconTintList;

    public NavigationMenuItemView(Context context) {
        this(context, null);
    }

    public NavigationMenuItemView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public NavigationMenuItemView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        setOrientation(0);
        LayoutInflater.from(context).inflate(android.support.design.R.layout.design_navigation_menu_item, (ViewGroup) this, true);
        this.mIconSize = context.getResources().getDimensionPixelSize(android.support.design.R.dimen.design_navigation_icon_size);
        this.mTextView = (CheckedTextView) findViewById(android.support.design.R.id.design_menu_item_text);
        this.mTextView.setDuplicateParentStateEnabled(true);
    }

    public void initialize(MenuItemImpl itemData, int menuType) {
        this.mItemData = itemData;
        setVisibility(itemData.isVisible() ? 0 : 8);
        if (getBackground() == null) {
            setBackgroundDrawable(createDefaultBackground());
        }
        setCheckable(itemData.isCheckable());
        setChecked(itemData.isChecked());
        setEnabled(itemData.isEnabled());
        setTitle(itemData.getTitle());
        setIcon(itemData.getIcon());
        setActionView(itemData.getActionView());
    }

    public void recycle() {
        if (this.mActionArea != null) {
            this.mActionArea.removeAllViews();
        }
        this.mTextView.setCompoundDrawables(null, null, null, null);
    }

    private void setActionView(View actionView) {
        if (this.mActionArea == null) {
            this.mActionArea = (FrameLayout) ((ViewStub) findViewById(android.support.design.R.id.design_menu_item_action_area_stub)).inflate();
        }
        this.mActionArea.removeAllViews();
        if (actionView != null) {
            this.mActionArea.addView(actionView);
        }
    }

    private StateListDrawable createDefaultBackground() {
        TypedValue value = new TypedValue();
        if (getContext().getTheme().resolveAttribute(android.support.design.R.attr.colorControlHighlight, value, true)) {
            StateListDrawable drawable = new StateListDrawable();
            drawable.addState(CHECKED_STATE_SET, new ColorDrawable(value.data));
            drawable.addState(EMPTY_STATE_SET, new ColorDrawable(0));
            return drawable;
        }
        return null;
    }

    public MenuItemImpl getItemData() {
        return this.mItemData;
    }

    public void setTitle(CharSequence title) {
        this.mTextView.setText(title);
    }

    public void setCheckable(boolean checkable) {
        refreshDrawableState();
    }

    public void setChecked(boolean checked) {
        refreshDrawableState();
        this.mTextView.setChecked(checked);
    }

    public void setShortcut(boolean showShortcut, char shortcutKey) {
    }

    public void setIcon(Drawable icon) {
        if (icon != null) {
            Drawable.ConstantState state = icon.getConstantState();
            icon = DrawableCompat.wrap(state == null ? icon : state.newDrawable()).mutate();
            icon.setBounds(0, 0, this.mIconSize, this.mIconSize);
            DrawableCompat.setTintList(icon, this.mIconTintList);
        }
        TextViewCompat.setCompoundDrawablesRelative(this.mTextView, icon, (Drawable) null, (Drawable) null, (Drawable) null);
    }

    public boolean prefersCondensedTitle() {
        return false;
    }

    public boolean showsIcon() {
        return true;
    }

    protected int[] onCreateDrawableState(int extraSpace) {
        int[] drawableState = super.onCreateDrawableState(extraSpace + 1);
        if (this.mItemData != null && this.mItemData.isCheckable() && this.mItemData.isChecked()) {
            mergeDrawableStates(drawableState, CHECKED_STATE_SET);
        }
        return drawableState;
    }

    void setIconTintList(ColorStateList tintList) {
        this.mIconTintList = tintList;
        if (this.mItemData != null) {
            setIcon(this.mItemData.getIcon());
        }
    }

    public void setTextAppearance(Context context, int textAppearance) {
        this.mTextView.setTextAppearance(context, textAppearance);
    }

    public void setTextColor(ColorStateList colors) {
        this.mTextView.setTextColor(colors);
    }
}
