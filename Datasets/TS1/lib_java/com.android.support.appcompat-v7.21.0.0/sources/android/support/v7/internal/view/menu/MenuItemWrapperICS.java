package android.support.v7.internal.view.menu;

import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.support.v4.internal.view.SupportMenuItem;
import android.support.v4.view.ActionProvider;
import android.support.v4.view.MenuItemCompat;
import android.support.v7.view.CollapsibleActionView;
import android.util.Log;
import android.view.ActionProvider;
import android.view.ContextMenu;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;
import android.widget.FrameLayout;
import java.lang.reflect.Method;

/* loaded from: com.android.support.appcompat-v7.21.0.0.jar:android/support/v7/internal/view/menu/MenuItemWrapperICS.class */
public class MenuItemWrapperICS extends BaseMenuWrapper<MenuItem> implements SupportMenuItem {
    static final String LOG_TAG = "MenuItemWrapper";
    private final boolean mEmulateProviderVisibilityOverride;
    private boolean mLastRequestVisible;
    private Method mSetExclusiveCheckableMethod;

    MenuItemWrapperICS(MenuItem object, boolean emulateProviderVisibilityOverride) {
        super(object);
        this.mLastRequestVisible = object.isVisible();
        this.mEmulateProviderVisibilityOverride = emulateProviderVisibilityOverride;
    }

    MenuItemWrapperICS(MenuItem object) {
        this(object, true);
    }

    public int getItemId() {
        return ((MenuItem) this.mWrappedObject).getItemId();
    }

    public int getGroupId() {
        return ((MenuItem) this.mWrappedObject).getGroupId();
    }

    public int getOrder() {
        return ((MenuItem) this.mWrappedObject).getOrder();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setTitle(CharSequence title) {
        ((MenuItem) this.mWrappedObject).setTitle(title);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setTitle(int title) {
        ((MenuItem) this.mWrappedObject).setTitle(title);
        return this;
    }

    public CharSequence getTitle() {
        return ((MenuItem) this.mWrappedObject).getTitle();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setTitleCondensed(CharSequence title) {
        ((MenuItem) this.mWrappedObject).setTitleCondensed(title);
        return this;
    }

    public CharSequence getTitleCondensed() {
        return ((MenuItem) this.mWrappedObject).getTitleCondensed();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setIcon(Drawable icon) {
        ((MenuItem) this.mWrappedObject).setIcon(icon);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setIcon(int iconRes) {
        ((MenuItem) this.mWrappedObject).setIcon(iconRes);
        return this;
    }

    public Drawable getIcon() {
        return ((MenuItem) this.mWrappedObject).getIcon();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setIntent(Intent intent) {
        ((MenuItem) this.mWrappedObject).setIntent(intent);
        return this;
    }

    public Intent getIntent() {
        return ((MenuItem) this.mWrappedObject).getIntent();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setShortcut(char numericChar, char alphaChar) {
        ((MenuItem) this.mWrappedObject).setShortcut(numericChar, alphaChar);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setNumericShortcut(char numericChar) {
        ((MenuItem) this.mWrappedObject).setNumericShortcut(numericChar);
        return this;
    }

    public char getNumericShortcut() {
        return ((MenuItem) this.mWrappedObject).getNumericShortcut();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setAlphabeticShortcut(char alphaChar) {
        ((MenuItem) this.mWrappedObject).setAlphabeticShortcut(alphaChar);
        return this;
    }

    public char getAlphabeticShortcut() {
        return ((MenuItem) this.mWrappedObject).getAlphabeticShortcut();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setCheckable(boolean checkable) {
        ((MenuItem) this.mWrappedObject).setCheckable(checkable);
        return this;
    }

    public boolean isCheckable() {
        return ((MenuItem) this.mWrappedObject).isCheckable();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setChecked(boolean checked) {
        ((MenuItem) this.mWrappedObject).setChecked(checked);
        return this;
    }

    public boolean isChecked() {
        return ((MenuItem) this.mWrappedObject).isChecked();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setVisible(boolean visible) {
        if (this.mEmulateProviderVisibilityOverride) {
            this.mLastRequestVisible = visible;
            if (checkActionProviderOverrideVisibility()) {
                return this;
            }
        }
        return wrappedSetVisible(visible);
    }

    public boolean isVisible() {
        return ((MenuItem) this.mWrappedObject).isVisible();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setEnabled(boolean enabled) {
        ((MenuItem) this.mWrappedObject).setEnabled(enabled);
        return this;
    }

    public boolean isEnabled() {
        return ((MenuItem) this.mWrappedObject).isEnabled();
    }

    public boolean hasSubMenu() {
        return ((MenuItem) this.mWrappedObject).hasSubMenu();
    }

    public SubMenu getSubMenu() {
        return getSubMenuWrapper(((MenuItem) this.mWrappedObject).getSubMenu());
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setOnMenuItemClickListener(MenuItem.OnMenuItemClickListener menuItemClickListener) {
        ((MenuItem) this.mWrappedObject).setOnMenuItemClickListener(menuItemClickListener != null ? new OnMenuItemClickListenerWrapper(menuItemClickListener) : null);
        return this;
    }

    public ContextMenu.ContextMenuInfo getMenuInfo() {
        return ((MenuItem) this.mWrappedObject).getMenuInfo();
    }

    public void setShowAsAction(int actionEnum) {
        ((MenuItem) this.mWrappedObject).setShowAsAction(actionEnum);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setShowAsActionFlags(int actionEnum) {
        ((MenuItem) this.mWrappedObject).setShowAsActionFlags(actionEnum);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setActionView(View view) {
        if (view instanceof CollapsibleActionView) {
            view = new CollapsibleActionViewWrapper(view);
        }
        ((MenuItem) this.mWrappedObject).setActionView(view);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setActionView(int resId) {
        ((MenuItem) this.mWrappedObject).setActionView(resId);
        View actionView = ((MenuItem) this.mWrappedObject).getActionView();
        if (actionView instanceof CollapsibleActionView) {
            ((MenuItem) this.mWrappedObject).setActionView(new CollapsibleActionViewWrapper(actionView));
        }
        return this;
    }

    public View getActionView() {
        View actionView = ((MenuItem) this.mWrappedObject).getActionView();
        if (actionView instanceof CollapsibleActionViewWrapper) {
            return ((CollapsibleActionViewWrapper) actionView).getWrappedView();
        }
        return actionView;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setActionProvider(ActionProvider provider) {
        ((MenuItem) this.mWrappedObject).setActionProvider(provider);
        if (provider != null && this.mEmulateProviderVisibilityOverride) {
            checkActionProviderOverrideVisibility();
        }
        return this;
    }

    public ActionProvider getActionProvider() {
        return ((MenuItem) this.mWrappedObject).getActionProvider();
    }

    public boolean expandActionView() {
        return ((MenuItem) this.mWrappedObject).expandActionView();
    }

    public boolean collapseActionView() {
        return ((MenuItem) this.mWrappedObject).collapseActionView();
    }

    public boolean isActionViewExpanded() {
        return ((MenuItem) this.mWrappedObject).isActionViewExpanded();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setOnActionExpandListener(MenuItem.OnActionExpandListener listener) {
        ((MenuItem) this.mWrappedObject).setOnActionExpandListener(listener);
        return this;
    }

    public SupportMenuItem setSupportOnActionExpandListener(MenuItemCompat.OnActionExpandListener listener) {
        ((MenuItem) this.mWrappedObject).setOnActionExpandListener(listener != null ? new OnActionExpandListenerWrapper(listener) : null);
        return null;
    }

    public SupportMenuItem setSupportActionProvider(android.support.v4.view.ActionProvider actionProvider) {
        ((MenuItem) this.mWrappedObject).setActionProvider(actionProvider != null ? createActionProviderWrapper(actionProvider) : null);
        return this;
    }

    public android.support.v4.view.ActionProvider getSupportActionProvider() {
        ActionProviderWrapper providerWrapper = (ActionProviderWrapper) ((MenuItem) this.mWrappedObject).getActionProvider();
        if (providerWrapper != null) {
            return providerWrapper.mInner;
        }
        return null;
    }

    public void setExclusiveCheckable(boolean checkable) {
        try {
            if (this.mSetExclusiveCheckableMethod == null) {
                this.mSetExclusiveCheckableMethod = ((MenuItem) this.mWrappedObject).getClass().getDeclaredMethod("setExclusiveCheckable", Boolean.TYPE);
            }
            this.mSetExclusiveCheckableMethod.invoke(this.mWrappedObject, Boolean.valueOf(checkable));
        } catch (Exception e) {
            Log.w(LOG_TAG, "Error while calling setExclusiveCheckable", e);
        }
    }

    ActionProviderWrapper createActionProviderWrapper(android.support.v4.view.ActionProvider provider) {
        return new ActionProviderWrapper(provider);
    }

    final boolean checkActionProviderOverrideVisibility() {
        android.support.v4.view.ActionProvider provider;
        if (this.mLastRequestVisible && (provider = getSupportActionProvider()) != null && provider.overridesItemVisibility() && !provider.isVisible()) {
            wrappedSetVisible(false);
            return true;
        }
        return false;
    }

    final MenuItem wrappedSetVisible(boolean visible) {
        return ((MenuItem) this.mWrappedObject).setVisible(visible);
    }

    /* loaded from: com.android.support.appcompat-v7.21.0.0.jar:android/support/v7/internal/view/menu/MenuItemWrapperICS$OnMenuItemClickListenerWrapper.class */
    private class OnMenuItemClickListenerWrapper extends BaseWrapper<MenuItem.OnMenuItemClickListener> implements MenuItem.OnMenuItemClickListener {
        OnMenuItemClickListenerWrapper(MenuItem.OnMenuItemClickListener object) {
            super(object);
        }

        @Override // android.view.MenuItem.OnMenuItemClickListener
        public boolean onMenuItemClick(MenuItem item) {
            return ((MenuItem.OnMenuItemClickListener) this.mWrappedObject).onMenuItemClick(MenuItemWrapperICS.this.getMenuItemWrapper(item));
        }
    }

    /* loaded from: com.android.support.appcompat-v7.21.0.0.jar:android/support/v7/internal/view/menu/MenuItemWrapperICS$OnActionExpandListenerWrapper.class */
    private class OnActionExpandListenerWrapper extends BaseWrapper<MenuItemCompat.OnActionExpandListener> implements MenuItem.OnActionExpandListener {
        OnActionExpandListenerWrapper(MenuItemCompat.OnActionExpandListener object) {
            super(object);
        }

        @Override // android.view.MenuItem.OnActionExpandListener
        public boolean onMenuItemActionExpand(MenuItem item) {
            return ((MenuItemCompat.OnActionExpandListener) this.mWrappedObject).onMenuItemActionExpand(MenuItemWrapperICS.this.getMenuItemWrapper(item));
        }

        @Override // android.view.MenuItem.OnActionExpandListener
        public boolean onMenuItemActionCollapse(MenuItem item) {
            return ((MenuItemCompat.OnActionExpandListener) this.mWrappedObject).onMenuItemActionCollapse(MenuItemWrapperICS.this.getMenuItemWrapper(item));
        }
    }

    /* loaded from: com.android.support.appcompat-v7.21.0.0.jar:android/support/v7/internal/view/menu/MenuItemWrapperICS$ActionProviderWrapper.class */
    class ActionProviderWrapper extends ActionProvider {
        final android.support.v4.view.ActionProvider mInner;

        public ActionProviderWrapper(android.support.v4.view.ActionProvider inner) {
            super(inner.getContext());
            this.mInner = inner;
            if (MenuItemWrapperICS.this.mEmulateProviderVisibilityOverride) {
                this.mInner.setVisibilityListener(new ActionProvider.VisibilityListener() { // from class: android.support.v7.internal.view.menu.MenuItemWrapperICS.ActionProviderWrapper.1
                    public void onActionProviderVisibilityChanged(boolean isVisible) {
                        if (ActionProviderWrapper.this.mInner.overridesItemVisibility() && MenuItemWrapperICS.this.mLastRequestVisible) {
                            MenuItemWrapperICS.this.wrappedSetVisible(isVisible);
                        }
                    }
                });
            }
        }

        @Override // android.view.ActionProvider
        public View onCreateActionView() {
            if (MenuItemWrapperICS.this.mEmulateProviderVisibilityOverride) {
                MenuItemWrapperICS.this.checkActionProviderOverrideVisibility();
            }
            return this.mInner.onCreateActionView();
        }

        @Override // android.view.ActionProvider
        public boolean onPerformDefaultAction() {
            return this.mInner.onPerformDefaultAction();
        }

        @Override // android.view.ActionProvider
        public boolean hasSubMenu() {
            return this.mInner.hasSubMenu();
        }

        @Override // android.view.ActionProvider
        public void onPrepareSubMenu(SubMenu subMenu) {
            this.mInner.onPrepareSubMenu(MenuItemWrapperICS.this.getSubMenuWrapper(subMenu));
        }
    }

    /* loaded from: com.android.support.appcompat-v7.21.0.0.jar:android/support/v7/internal/view/menu/MenuItemWrapperICS$CollapsibleActionViewWrapper.class */
    static class CollapsibleActionViewWrapper extends FrameLayout implements android.view.CollapsibleActionView {
        final CollapsibleActionView mWrappedView;

        /* JADX WARN: Multi-variable type inference failed */
        CollapsibleActionViewWrapper(View view) {
            super(view.getContext());
            this.mWrappedView = (CollapsibleActionView) view;
            addView(view);
        }

        @Override // android.view.CollapsibleActionView
        public void onActionViewExpanded() {
            this.mWrappedView.onActionViewExpanded();
        }

        @Override // android.view.CollapsibleActionView
        public void onActionViewCollapsed() {
            this.mWrappedView.onActionViewCollapsed();
        }

        View getWrappedView() {
            return (View) this.mWrappedView;
        }
    }
}
