package com.actionbarsherlock.internal.view.menu;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.Toast;
import com.actionbarsherlock.R;
import com.actionbarsherlock.internal.ResourcesCompat;
import com.actionbarsherlock.internal.view.View_HasStateListenerSupport;
import com.actionbarsherlock.internal.view.View_OnAttachStateChangeListener;
import com.actionbarsherlock.internal.view.menu.ActionMenuView;
import com.actionbarsherlock.internal.view.menu.MenuBuilder;
import com.actionbarsherlock.internal.view.menu.MenuView;
import com.actionbarsherlock.internal.widget.CapitalizingButton;
import com.actionbarsherlock.internal.widget.IcsToast;
import java.util.HashSet;
import java.util.Set;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/menu/ActionMenuItemView.class */
public class ActionMenuItemView extends LinearLayout implements MenuView.ItemView, View.OnClickListener, View.OnLongClickListener, ActionMenuView.ActionMenuChildView, View_HasStateListenerSupport {
    private MenuItemImpl mItemData;
    private CharSequence mTitle;
    private MenuBuilder.ItemInvoker mItemInvoker;
    private ImageButton mImageButton;
    private CapitalizingButton mTextButton;
    private boolean mAllowTextWithIcon;
    private boolean mExpandedFormat;
    private int mMinWidth;
    private final Set<View_OnAttachStateChangeListener> mListeners;

    public ActionMenuItemView(Context context) {
        this(context, null);
    }

    public ActionMenuItemView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public ActionMenuItemView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs);
        this.mListeners = new HashSet();
        this.mAllowTextWithIcon = ResourcesCompat.getResources_getBoolean(context, R.bool.abs__config_allowActionMenuItemTextWithIcon);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.SherlockActionMenuItemView, 0, 0);
        this.mMinWidth = a.getDimensionPixelSize(0, 0);
        a.recycle();
    }

    @Override // com.actionbarsherlock.internal.view.View_HasStateListenerSupport
    public void addOnAttachStateChangeListener(View_OnAttachStateChangeListener listener) {
        this.mListeners.add(listener);
    }

    @Override // com.actionbarsherlock.internal.view.View_HasStateListenerSupport
    public void removeOnAttachStateChangeListener(View_OnAttachStateChangeListener listener) {
        this.mListeners.remove(listener);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        for (View_OnAttachStateChangeListener listener : this.mListeners) {
            listener.onViewAttachedToWindow(this);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        for (View_OnAttachStateChangeListener listener : this.mListeners) {
            listener.onViewDetachedFromWindow(this);
        }
    }

    @Override // android.view.View
    public void onFinishInflate() {
        this.mImageButton = (ImageButton) findViewById(R.id.abs__imageButton);
        this.mTextButton = (CapitalizingButton) findViewById(R.id.abs__textButton);
        this.mImageButton.setOnClickListener(this);
        this.mTextButton.setOnClickListener(this);
        this.mImageButton.setOnLongClickListener(this);
        setOnClickListener(this);
        setOnLongClickListener(this);
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuView.ItemView
    public MenuItemImpl getItemData() {
        return this.mItemData;
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuView.ItemView
    public void initialize(MenuItemImpl itemData, int menuType) {
        this.mItemData = itemData;
        setIcon(itemData.getIcon());
        setTitle(itemData.getTitleForItemView(this));
        setId(itemData.getItemId());
        setVisibility(itemData.isVisible() ? 0 : 8);
        setEnabled(itemData.isEnabled());
    }

    @Override // android.view.View, com.actionbarsherlock.internal.view.menu.MenuView.ItemView
    public void setEnabled(boolean enabled) {
        super.setEnabled(enabled);
        this.mImageButton.setEnabled(enabled);
        this.mTextButton.setEnabled(enabled);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (this.mItemInvoker != null) {
            this.mItemInvoker.invokeItem(this.mItemData);
        }
    }

    public void setItemInvoker(MenuBuilder.ItemInvoker invoker) {
        this.mItemInvoker = invoker;
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuView.ItemView
    public boolean prefersCondensedTitle() {
        return true;
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuView.ItemView
    public void setCheckable(boolean checkable) {
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuView.ItemView
    public void setChecked(boolean checked) {
    }

    public void setExpandedFormat(boolean expandedFormat) {
        if (this.mExpandedFormat != expandedFormat) {
            this.mExpandedFormat = expandedFormat;
            if (this.mItemData != null) {
                this.mItemData.actionFormatChanged();
            }
        }
    }

    private void updateTextButtonVisibility() {
        boolean visible = !TextUtils.isEmpty(this.mTextButton.getText());
        this.mTextButton.setVisibility(visible & (this.mImageButton.getDrawable() == null || (this.mItemData.showsTextAsAction() && (this.mAllowTextWithIcon || this.mExpandedFormat))) ? 0 : 8);
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuView.ItemView
    public void setIcon(Drawable icon) {
        this.mImageButton.setImageDrawable(icon);
        if (icon != null) {
            this.mImageButton.setVisibility(0);
        } else {
            this.mImageButton.setVisibility(8);
        }
        updateTextButtonVisibility();
    }

    public boolean hasText() {
        return this.mTextButton.getVisibility() != 8;
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuView.ItemView
    public void setShortcut(boolean showShortcut, char shortcutKey) {
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuView.ItemView
    public void setTitle(CharSequence title) {
        this.mTitle = title;
        this.mTextButton.setTextCompat(this.mTitle);
        setContentDescription(this.mTitle);
        updateTextButtonVisibility();
    }

    @Override // android.view.View
    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent event) {
        onPopulateAccessibilityEvent(event);
        return true;
    }

    @Override // android.view.View
    public void onPopulateAccessibilityEvent(AccessibilityEvent event) {
        if (Build.VERSION.SDK_INT >= 14) {
            super.onPopulateAccessibilityEvent(event);
        }
        CharSequence cdesc = getContentDescription();
        if (!TextUtils.isEmpty(cdesc)) {
            event.getText().add(cdesc);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchHoverEvent(MotionEvent event) {
        if (Build.VERSION.SDK_INT >= 14) {
            return onHoverEvent(event);
        }
        return false;
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuView.ItemView
    public boolean showsIcon() {
        return true;
    }

    @Override // com.actionbarsherlock.internal.view.menu.ActionMenuView.ActionMenuChildView
    public boolean needsDividerBefore() {
        return hasText() && this.mItemData.getIcon() == null;
    }

    @Override // com.actionbarsherlock.internal.view.menu.ActionMenuView.ActionMenuChildView
    public boolean needsDividerAfter() {
        return hasText();
    }

    @Override // android.view.View.OnLongClickListener
    public boolean onLongClick(View v) {
        if (hasText()) {
            return false;
        }
        int[] screenPos = new int[2];
        Rect displayFrame = new Rect();
        getLocationOnScreen(screenPos);
        getWindowVisibleDisplayFrame(displayFrame);
        Context context = getContext();
        int width = getWidth();
        int height = getHeight();
        int midy = screenPos[1] + (height / 2);
        int screenWidth = context.getResources().getDisplayMetrics().widthPixels;
        Toast cheatSheet = IcsToast.makeText(context, this.mItemData.getTitle(), 0);
        if (midy < displayFrame.height()) {
            cheatSheet.setGravity(53, (screenWidth - screenPos[0]) - (width / 2), height);
        } else {
            cheatSheet.setGravity(81, 0, height);
        }
        cheatSheet.show();
        return true;
    }

    @Override // android.widget.LinearLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
        int specSize = View.MeasureSpec.getSize(widthMeasureSpec);
        int oldMeasuredWidth = getMeasuredWidth();
        int targetWidth = widthMode == Integer.MIN_VALUE ? Math.min(specSize, this.mMinWidth) : this.mMinWidth;
        if (widthMode != 1073741824 && this.mMinWidth > 0 && oldMeasuredWidth < targetWidth) {
            super.onMeasure(View.MeasureSpec.makeMeasureSpec(targetWidth, 1073741824), heightMeasureSpec);
        }
    }
}
