package com.actionbarsherlock.internal;

import android.app.Activity;
import android.content.Context;
import android.content.res.AssetManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.os.Bundle;
import android.util.AndroidRuntimeException;
import android.util.Log;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.KeyCharacterMap;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewStub;
import android.view.Window;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import com.actionbarsherlock.ActionBarSherlock;
import com.actionbarsherlock.R;
import com.actionbarsherlock.app.ActionBar;
import com.actionbarsherlock.internal.app.ActionBarImpl;
import com.actionbarsherlock.internal.view.StandaloneActionMode;
import com.actionbarsherlock.internal.view.menu.ActionMenuPresenter;
import com.actionbarsherlock.internal.view.menu.MenuBuilder;
import com.actionbarsherlock.internal.view.menu.MenuItemImpl;
import com.actionbarsherlock.internal.view.menu.MenuPresenter;
import com.actionbarsherlock.internal.widget.ActionBarContainer;
import com.actionbarsherlock.internal.widget.ActionBarContextView;
import com.actionbarsherlock.internal.widget.ActionBarView;
import com.actionbarsherlock.internal.widget.IcsProgressBar;
import com.actionbarsherlock.view.ActionMode;
import com.actionbarsherlock.view.Window;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

@ActionBarSherlock.Implementation(api = 7)
/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/ActionBarSherlockCompat.class */
public class ActionBarSherlockCompat extends ActionBarSherlock implements MenuBuilder.Callback, Window.Callback, MenuPresenter.Callback, MenuItem.OnMenuItemClickListener {
    protected static final int DEFAULT_FEATURES = 0;
    private static final String PANELS_TAG = "sherlock:Panels";
    private boolean mReserveOverflow;
    private boolean mReserveOverflowSet;
    private MenuBuilder mMenu;
    protected HashMap<MenuItem, MenuItemImpl> mNativeItemMap;
    private ViewGroup mDecor;
    private ViewGroup mContentParent;
    private boolean mIsTitleReady;
    private boolean mIsDestroyed;
    private boolean mClosingActionMenu;
    private boolean mMenuIsPrepared;
    private boolean mMenuRefreshContent;
    private Bundle mMenuFrozenActionViewState;
    private ActionBarImpl aActionBar;
    private ActionBarView wActionBar;
    private int mFeatures;
    private int mUiOptions;
    private IcsProgressBar mCircularProgressBar;
    private IcsProgressBar mHorizontalProgressBar;
    private ActionMode mActionMode;
    private ActionBarContextView mActionModeView;

    public ActionBarSherlockCompat(Activity activity, int flags) {
        super(activity, flags);
        this.mReserveOverflowSet = false;
        this.mIsTitleReady = false;
        this.mIsDestroyed = false;
        this.mFeatures = 0;
        this.mUiOptions = 0;
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public ActionBar getActionBar() {
        initActionBar();
        return this.aActionBar;
    }

    private void initActionBar() {
        if (this.mDecor == null) {
            installDecor();
        }
        if (this.aActionBar != null || !hasFeature(8) || hasFeature(1) || this.mActivity.isChild()) {
            return;
        }
        this.aActionBar = new ActionBarImpl(this.mActivity, this.mFeatures);
        if (!this.mIsDelegate) {
            this.wActionBar.setWindowTitle(this.mActivity.getTitle());
        }
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    protected Context getThemedContext() {
        return this.aActionBar.getThemedContext();
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void setTitle(CharSequence title) {
        dispatchTitleChanged(title, 0);
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public ActionMode startActionMode(ActionMode.Callback callback) {
        ViewStub stub;
        if (this.mActionMode != null) {
            this.mActionMode.finish();
        }
        ActionMode.Callback wrappedCallback = new ActionModeCallbackWrapper(callback);
        ActionMode mode = null;
        initActionBar();
        if (this.aActionBar != null) {
            mode = this.aActionBar.startActionMode(wrappedCallback);
        }
        if (mode != null) {
            this.mActionMode = mode;
        } else {
            if (this.mActionModeView == null && (stub = (ViewStub) this.mDecor.findViewById(R.id.abs__action_mode_bar_stub)) != null) {
                this.mActionModeView = (ActionBarContextView) stub.inflate();
            }
            if (this.mActionModeView != null) {
                this.mActionModeView.killMode();
                ActionMode mode2 = new StandaloneActionMode(this.mActivity, this.mActionModeView, wrappedCallback, true);
                if (callback.onCreateActionMode(mode2, mode2.getMenu())) {
                    mode2.invalidate();
                    this.mActionModeView.initForMode(mode2);
                    this.mActionModeView.setVisibility(0);
                    this.mActionMode = mode2;
                    this.mActionModeView.sendAccessibilityEvent(32);
                } else {
                    this.mActionMode = null;
                }
            }
        }
        if (this.mActionMode != null && (this.mActivity instanceof ActionBarSherlock.OnActionModeStartedListener)) {
            ((ActionBarSherlock.OnActionModeStartedListener) this.mActivity).onActionModeStarted(this.mActionMode);
        }
        return this.mActionMode;
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void dispatchConfigurationChanged(Configuration newConfig) {
        if (this.aActionBar != null) {
            this.aActionBar.onConfigurationChanged(newConfig);
        }
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void dispatchPostResume() {
        if (this.aActionBar != null) {
            this.aActionBar.setShowHideAnimationEnabled(true);
        }
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void dispatchPause() {
        if (this.wActionBar != null && this.wActionBar.isOverflowMenuShowing()) {
            this.wActionBar.hideOverflowMenu();
        }
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void dispatchStop() {
        if (this.aActionBar != null) {
            this.aActionBar.setShowHideAnimationEnabled(false);
        }
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void dispatchInvalidateOptionsMenu() {
        if (this.mMenu != null) {
            Bundle savedActionViewStates = new Bundle();
            this.mMenu.saveActionViewStates(savedActionViewStates);
            if (savedActionViewStates.size() > 0) {
                this.mMenuFrozenActionViewState = savedActionViewStates;
            }
            this.mMenu.stopDispatchingItemsChanged();
            this.mMenu.clear();
        }
        this.mMenuRefreshContent = true;
        if (this.wActionBar != null) {
            this.mMenuIsPrepared = false;
            preparePanel();
        }
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public boolean dispatchOpenOptionsMenu() {
        if (!isReservingOverflow()) {
            return false;
        }
        return this.wActionBar.showOverflowMenu();
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public boolean dispatchCloseOptionsMenu() {
        if (isReservingOverflow() && this.wActionBar != null) {
            return this.wActionBar.hideOverflowMenu();
        }
        return false;
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void dispatchPostCreate(Bundle savedInstanceState) {
        if (this.mIsDelegate) {
            this.mIsTitleReady = true;
        }
        if (this.mDecor == null) {
            initActionBar();
        }
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public boolean dispatchCreateOptionsMenu(Menu menu) {
        return true;
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public boolean dispatchPrepareOptionsMenu(Menu menu) {
        if (this.mActionMode != null) {
            return false;
        }
        this.mMenuIsPrepared = false;
        if (!preparePanel() || isReservingOverflow()) {
            return false;
        }
        if (this.mNativeItemMap == null) {
            this.mNativeItemMap = new HashMap<>();
        } else {
            this.mNativeItemMap.clear();
        }
        if (this.mMenu == null) {
            return false;
        }
        boolean result = this.mMenu.bindNativeOverflow(menu, this, this.mNativeItemMap);
        return result;
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public boolean dispatchOptionsItemSelected(MenuItem item) {
        throw new IllegalStateException("Native callback invoked. Create a test case and report!");
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public boolean dispatchMenuOpened(int featureId, Menu menu) {
        if (featureId == 8 || featureId == 0) {
            if (this.aActionBar != null) {
                this.aActionBar.dispatchMenuVisibilityChanged(true);
                return true;
            }
            return true;
        }
        return false;
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void dispatchPanelClosed(int featureId, Menu menu) {
        if ((featureId == 8 || featureId == 0) && this.aActionBar != null) {
            this.aActionBar.dispatchMenuVisibilityChanged(false);
        }
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void dispatchTitleChanged(CharSequence title, int color) {
        if ((!this.mIsDelegate || this.mIsTitleReady) && this.wActionBar != null) {
            this.wActionBar.setWindowTitle(title);
        }
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public boolean dispatchKeyEvent(KeyEvent event) {
        int keyCode = event.getKeyCode();
        if (keyCode == 4) {
            int action = event.getAction();
            if (this.mActionMode != null) {
                if (action == 1) {
                    this.mActionMode.finish();
                    return true;
                }
                return true;
            }
            if (this.wActionBar != null && this.wActionBar.hasExpandedActionView()) {
                if (action == 1) {
                    this.wActionBar.collapseActionView();
                    return true;
                }
                return true;
            }
            return false;
        }
        return false;
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void dispatchDestroy() {
        this.mIsDestroyed = true;
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void dispatchSaveInstanceState(Bundle outState) {
        if (this.mMenu != null) {
            this.mMenuFrozenActionViewState = new Bundle();
            this.mMenu.saveActionViewStates(this.mMenuFrozenActionViewState);
        }
        outState.putParcelable(PANELS_TAG, this.mMenuFrozenActionViewState);
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void dispatchRestoreInstanceState(Bundle savedInstanceState) {
        this.mMenuFrozenActionViewState = (Bundle) savedInstanceState.getParcelable(PANELS_TAG);
    }

    private boolean preparePanel() {
        if (this.mMenuIsPrepared) {
            return true;
        }
        if (this.mMenu == null || this.mMenuRefreshContent) {
            if (this.mMenu == null && (!initializePanelMenu() || this.mMenu == null)) {
                return false;
            }
            if (this.wActionBar != null) {
                this.wActionBar.setMenu(this.mMenu, this);
            }
            this.mMenu.stopDispatchingItemsChanged();
            if (!callbackCreateOptionsMenu(this.mMenu)) {
                this.mMenu = null;
                if (this.wActionBar != null) {
                    this.wActionBar.setMenu(null, this);
                    return false;
                }
                return false;
            }
            this.mMenuRefreshContent = false;
        }
        this.mMenu.stopDispatchingItemsChanged();
        if (this.mMenuFrozenActionViewState != null) {
            this.mMenu.restoreActionViewStates(this.mMenuFrozenActionViewState);
            this.mMenuFrozenActionViewState = null;
        }
        if (!callbackPrepareOptionsMenu(this.mMenu)) {
            if (this.wActionBar != null) {
                this.wActionBar.setMenu(null, this);
            }
            this.mMenu.startDispatchingItemsChanged();
            return false;
        }
        KeyCharacterMap kmap = KeyCharacterMap.load(-1);
        this.mMenu.setQwertyMode(kmap.getKeyboardType() != 1);
        this.mMenu.startDispatchingItemsChanged();
        this.mMenuIsPrepared = true;
        return true;
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuBuilder.Callback
    public boolean onMenuItemSelected(MenuBuilder menu, com.actionbarsherlock.view.MenuItem item) {
        return callbackOptionsItemSelected(item);
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuBuilder.Callback
    public void onMenuModeChange(MenuBuilder menu) {
        reopenMenu(true);
    }

    private void reopenMenu(boolean toggleMenuMode) {
        if (this.wActionBar != null && this.wActionBar.isOverflowReserved()) {
            if (!this.wActionBar.isOverflowMenuShowing() || !toggleMenuMode) {
                if (this.wActionBar.getVisibility() == 0 && callbackPrepareOptionsMenu(this.mMenu)) {
                    this.wActionBar.showOverflowMenu();
                    return;
                }
                return;
            }
            this.wActionBar.hideOverflowMenu();
        }
    }

    private boolean initializePanelMenu() {
        Context context = this.mActivity;
        if (this.wActionBar != null) {
            TypedValue outValue = new TypedValue();
            Resources.Theme currentTheme = context.getTheme();
            currentTheme.resolveAttribute(R.attr.actionBarWidgetTheme, outValue, true);
            int targetThemeRes = outValue.resourceId;
            if (targetThemeRes != 0) {
                context = new ContextThemeWrapper(context, targetThemeRes);
            }
        }
        this.mMenu = new MenuBuilder(context);
        this.mMenu.setCallback(this);
        return true;
    }

    void checkCloseActionMenu(com.actionbarsherlock.view.Menu menu) {
        if (this.mClosingActionMenu) {
            return;
        }
        this.mClosingActionMenu = true;
        this.wActionBar.dismissPopupMenus();
        this.mClosingActionMenu = false;
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuPresenter.Callback
    public boolean onOpenSubMenu(MenuBuilder subMenu) {
        return true;
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuPresenter.Callback
    public void onCloseMenu(MenuBuilder menu, boolean allMenusAreClosing) {
        checkCloseActionMenu(menu);
    }

    @Override // android.view.MenuItem.OnMenuItemClickListener
    public boolean onMenuItemClick(MenuItem item) {
        MenuItemImpl sherlockItem = this.mNativeItemMap.get(item);
        if (sherlockItem != null) {
            sherlockItem.invoke();
            return true;
        }
        Log.e("ActionBarSherlock", "Options item \"" + item + "\" not found in mapping");
        return true;
    }

    @Override // com.actionbarsherlock.view.Window.Callback
    public boolean onMenuItemSelected(int featureId, com.actionbarsherlock.view.MenuItem item) {
        return callbackOptionsItemSelected(item);
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void setProgressBarVisibility(boolean visible) {
        setFeatureInt(2, visible ? -1 : -2);
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void setProgressBarIndeterminateVisibility(boolean visible) {
        setFeatureInt(5, visible ? -1 : -2);
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void setProgressBarIndeterminate(boolean indeterminate) {
        setFeatureInt(2, indeterminate ? -3 : -4);
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void setProgress(int progress) {
        setFeatureInt(2, progress + 0);
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void setSecondaryProgress(int secondaryProgress) {
        setFeatureInt(2, secondaryProgress + 20000);
    }

    private void setFeatureInt(int featureId, int value) {
        updateInt(featureId, value, false);
    }

    private void updateInt(int featureId, int value, boolean fromResume) {
        if (this.mContentParent == null) {
            return;
        }
        int featureMask = 1 << featureId;
        if ((getFeatures() & featureMask) == 0 && !fromResume) {
            return;
        }
        onIntChanged(featureId, value);
    }

    private void onIntChanged(int featureId, int value) {
        if (featureId == 2 || featureId == 5) {
            updateProgressBars(value);
        }
    }

    private void updateProgressBars(int value) {
        IcsProgressBar circularProgressBar = getCircularProgressBar(true);
        IcsProgressBar horizontalProgressBar = getHorizontalProgressBar(true);
        int features = this.mFeatures;
        if (value == -1) {
            if ((features & 4) != 0) {
                int level = horizontalProgressBar.getProgress();
                int visibility = (horizontalProgressBar.isIndeterminate() || level < 10000) ? 0 : 4;
                horizontalProgressBar.setVisibility(visibility);
            }
            if ((features & 32) != 0) {
                circularProgressBar.setVisibility(0);
                return;
            }
            return;
        }
        if (value == -2) {
            if ((features & 4) != 0) {
                horizontalProgressBar.setVisibility(8);
            }
            if ((features & 32) != 0) {
                circularProgressBar.setVisibility(8);
                return;
            }
            return;
        }
        if (value == -3) {
            horizontalProgressBar.setIndeterminate(true);
            return;
        }
        if (value == -4) {
            horizontalProgressBar.setIndeterminate(false);
            return;
        }
        if (0 <= value && value <= 10000) {
            horizontalProgressBar.setProgress(value - 0);
            if (value < 10000) {
                showProgressBars(horizontalProgressBar, circularProgressBar);
                return;
            } else {
                hideProgressBars(horizontalProgressBar, circularProgressBar);
                return;
            }
        }
        if (20000 <= value && value <= 30000) {
            horizontalProgressBar.setSecondaryProgress(value - 20000);
            showProgressBars(horizontalProgressBar, circularProgressBar);
        }
    }

    private void showProgressBars(IcsProgressBar horizontalProgressBar, IcsProgressBar spinnyProgressBar) {
        int features = this.mFeatures;
        if ((features & 32) != 0 && spinnyProgressBar.getVisibility() == 4) {
            spinnyProgressBar.setVisibility(0);
        }
        if ((features & 4) != 0 && horizontalProgressBar.getProgress() < 10000) {
            horizontalProgressBar.setVisibility(0);
        }
    }

    private void hideProgressBars(IcsProgressBar horizontalProgressBar, IcsProgressBar spinnyProgressBar) {
        int features = this.mFeatures;
        Animation anim = AnimationUtils.loadAnimation(this.mActivity, android.R.anim.fade_out);
        anim.setDuration(1000L);
        if ((features & 32) != 0 && spinnyProgressBar.getVisibility() == 0) {
            spinnyProgressBar.startAnimation(anim);
            spinnyProgressBar.setVisibility(4);
        }
        if ((features & 4) != 0 && horizontalProgressBar.getVisibility() == 0) {
            horizontalProgressBar.startAnimation(anim);
            horizontalProgressBar.setVisibility(4);
        }
    }

    private IcsProgressBar getCircularProgressBar(boolean shouldInstallDecor) {
        if (this.mCircularProgressBar != null) {
            return this.mCircularProgressBar;
        }
        if (this.mContentParent == null && shouldInstallDecor) {
            installDecor();
        }
        this.mCircularProgressBar = (IcsProgressBar) this.mDecor.findViewById(R.id.abs__progress_circular);
        if (this.mCircularProgressBar != null) {
            this.mCircularProgressBar.setVisibility(4);
        }
        return this.mCircularProgressBar;
    }

    private IcsProgressBar getHorizontalProgressBar(boolean shouldInstallDecor) {
        if (this.mHorizontalProgressBar != null) {
            return this.mHorizontalProgressBar;
        }
        if (this.mContentParent == null && shouldInstallDecor) {
            installDecor();
        }
        this.mHorizontalProgressBar = (IcsProgressBar) this.mDecor.findViewById(R.id.abs__progress_horizontal);
        if (this.mHorizontalProgressBar != null) {
            this.mHorizontalProgressBar.setVisibility(4);
        }
        return this.mHorizontalProgressBar;
    }

    private int getFeatures() {
        return this.mFeatures;
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public boolean hasFeature(int featureId) {
        boolean result = (this.mFeatures & (1 << featureId)) != 0;
        return result;
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public boolean requestFeature(int featureId) {
        if (this.mContentParent != null) {
            throw new AndroidRuntimeException("requestFeature() must be called before adding content");
        }
        switch (featureId) {
            case 1:
            case 2:
            case 5:
            case 8:
            case 9:
            case 10:
                this.mFeatures |= 1 << featureId;
                return true;
            case 3:
            case 4:
            case 6:
            case 7:
            default:
                return false;
        }
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void setUiOptions(int uiOptions) {
        this.mUiOptions = uiOptions;
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void setUiOptions(int uiOptions, int mask) {
        this.mUiOptions = (this.mUiOptions & (mask ^ (-1))) | (uiOptions & mask);
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void setContentView(int layoutResId) {
        if (this.mContentParent == null) {
            installDecor();
        } else {
            this.mContentParent.removeAllViews();
        }
        this.mActivity.getLayoutInflater().inflate(layoutResId, this.mContentParent);
        Window.Callback callback = this.mActivity.getWindow().getCallback();
        if (callback != null) {
            callback.onContentChanged();
        }
        initActionBar();
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void setContentView(View view, ViewGroup.LayoutParams params) {
        if (this.mContentParent == null) {
            installDecor();
        } else {
            this.mContentParent.removeAllViews();
        }
        this.mContentParent.addView(view, params);
        Window.Callback callback = this.mActivity.getWindow().getCallback();
        if (callback != null) {
            callback.onContentChanged();
        }
        initActionBar();
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void addContentView(View view, ViewGroup.LayoutParams params) {
        if (this.mContentParent == null) {
            installDecor();
        }
        this.mContentParent.addView(view, params);
        initActionBar();
    }

    private void installDecor() {
        boolean splitActionBar;
        if (this.mDecor == null) {
            this.mDecor = (ViewGroup) this.mActivity.getWindow().getDecorView().findViewById(android.R.id.content);
        }
        if (this.mContentParent == null) {
            List<View> views = null;
            if (this.mDecor.getChildCount() > 0) {
                views = new ArrayList<>(1);
                int children = this.mDecor.getChildCount();
                for (int i = 0; i < children; i++) {
                    View child = this.mDecor.getChildAt(0);
                    this.mDecor.removeView(child);
                    views.add(child);
                }
            }
            this.mContentParent = generateLayout();
            if (views != null) {
                Iterator i$ = views.iterator();
                while (i$.hasNext()) {
                    this.mContentParent.addView(i$.next());
                }
            }
            this.wActionBar = (ActionBarView) this.mDecor.findViewById(R.id.abs__action_bar);
            if (this.wActionBar != null) {
                this.wActionBar.setWindowCallback(this);
                if (this.wActionBar.getTitle() == null) {
                    this.wActionBar.setWindowTitle(this.mActivity.getTitle());
                }
                if (hasFeature(2)) {
                    this.wActionBar.initProgress();
                }
                if (hasFeature(5)) {
                    this.wActionBar.initIndeterminateProgress();
                }
                int uiOptions = loadUiOptionsFromManifest(this.mActivity);
                if (uiOptions != 0) {
                    this.mUiOptions = uiOptions;
                }
                boolean splitWhenNarrow = (this.mUiOptions & 1) != 0;
                if (splitWhenNarrow) {
                    splitActionBar = ResourcesCompat.getResources_getBoolean(this.mActivity, R.bool.abs__split_action_bar_is_narrow);
                } else {
                    splitActionBar = this.mActivity.getTheme().obtainStyledAttributes(R.styleable.SherlockTheme).getBoolean(62, false);
                }
                ActionBarContainer splitView = (ActionBarContainer) this.mDecor.findViewById(R.id.abs__split_action_bar);
                if (splitView != null) {
                    this.wActionBar.setSplitView(splitView);
                    this.wActionBar.setSplitActionBar(splitActionBar);
                    this.wActionBar.setSplitWhenNarrow(splitWhenNarrow);
                    this.mActionModeView = (ActionBarContextView) this.mDecor.findViewById(R.id.abs__action_context_bar);
                    this.mActionModeView.setSplitView(splitView);
                    this.mActionModeView.setSplitActionBar(splitActionBar);
                    this.mActionModeView.setSplitWhenNarrow(splitWhenNarrow);
                } else if (splitActionBar) {
                    Log.e("ActionBarSherlock", "Requested split action bar with incompatible window decor! Ignoring request.");
                }
                this.mDecor.post(new Runnable() { // from class: com.actionbarsherlock.internal.ActionBarSherlockCompat.1
                    @Override // java.lang.Runnable
                    public void run() {
                        if (!ActionBarSherlockCompat.this.mIsDestroyed && !ActionBarSherlockCompat.this.mActivity.isFinishing() && ActionBarSherlockCompat.this.mMenu == null) {
                            ActionBarSherlockCompat.this.dispatchInvalidateOptionsMenu();
                        }
                    }
                });
            }
        }
    }

    private ViewGroup generateLayout() {
        int layoutResource;
        IcsProgressBar progress;
        TypedArray a = this.mActivity.getTheme().obtainStyledAttributes(R.styleable.SherlockTheme);
        if (!a.hasValue(59)) {
            throw new IllegalStateException("You must use Theme.Sherlock, Theme.Sherlock.Light, Theme.Sherlock.Light.DarkActionBar, or a derivative.");
        }
        if (a.getBoolean(58, false)) {
            requestFeature(1);
        } else if (a.getBoolean(59, false)) {
            requestFeature(8);
        }
        if (a.getBoolean(60, false)) {
            requestFeature(9);
        }
        if (a.getBoolean(61, false)) {
            requestFeature(10);
        }
        a.recycle();
        if (!hasFeature(1)) {
            if (hasFeature(9)) {
                layoutResource = R.layout.abs__screen_action_bar_overlay;
            } else {
                layoutResource = R.layout.abs__screen_action_bar;
            }
        } else if (hasFeature(10) && !hasFeature(1)) {
            layoutResource = R.layout.abs__screen_simple_overlay_action_mode;
        } else {
            layoutResource = R.layout.abs__screen_simple;
        }
        View in = this.mActivity.getLayoutInflater().inflate(layoutResource, (ViewGroup) null);
        this.mDecor.addView(in, new ViewGroup.LayoutParams(-1, -1));
        ViewGroup contentParent = (ViewGroup) this.mDecor.findViewById(R.id.abs__content);
        if (contentParent == null) {
            throw new RuntimeException("Couldn't find content container view");
        }
        this.mDecor.setId(-1);
        contentParent.setId(android.R.id.content);
        if (hasFeature(5) && (progress = getCircularProgressBar(false)) != null) {
            progress.setIndeterminate(true);
        }
        return contentParent;
    }

    private boolean isReservingOverflow() {
        if (!this.mReserveOverflowSet) {
            this.mReserveOverflow = ActionMenuPresenter.reserveOverflow(this.mActivity);
            this.mReserveOverflowSet = true;
        }
        return this.mReserveOverflow;
    }

    private static int loadUiOptionsFromManifest(Activity activity) {
        int uiOptions = 0;
        try {
            String thisPackage = activity.getClass().getName();
            String packageName = activity.getApplicationInfo().packageName;
            AssetManager am = activity.createPackageContext(packageName, 0).getAssets();
            XmlResourceParser xml = am.openXmlResourceParser("AndroidManifest.xml");
            for (int eventType = xml.getEventType(); eventType != 1; eventType = xml.nextToken()) {
                if (eventType == 2) {
                    String name = xml.getName();
                    if ("application".equals(name)) {
                        int i = xml.getAttributeCount() - 1;
                        while (true) {
                            if (i < 0) {
                                break;
                            }
                            if ("uiOptions".equals(xml.getAttributeName(i))) {
                                uiOptions = xml.getAttributeIntValue(i, 0);
                                break;
                            }
                            i--;
                        }
                    } else if ("activity".equals(name)) {
                        Integer activityUiOptions = null;
                        String activityPackage = null;
                        boolean isOurActivity = false;
                        for (int i2 = xml.getAttributeCount() - 1; i2 >= 0; i2--) {
                            String attrName = xml.getAttributeName(i2);
                            if ("uiOptions".equals(attrName)) {
                                activityUiOptions = Integer.valueOf(xml.getAttributeIntValue(i2, 0));
                            } else if ("name".equals(attrName)) {
                                activityPackage = cleanActivityName(packageName, xml.getAttributeValue(i2));
                                if (!thisPackage.equals(activityPackage)) {
                                    break;
                                }
                                isOurActivity = true;
                            }
                            if (activityUiOptions != null && activityPackage != null) {
                                uiOptions = activityUiOptions.intValue();
                            }
                        }
                        if (isOurActivity) {
                            break;
                        }
                    } else {
                        continue;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uiOptions;
    }

    public static String cleanActivityName(String manifestPackage, String activityName) {
        if (activityName.charAt(0) == '.') {
            return manifestPackage + activityName;
        }
        if (activityName.indexOf(46, 1) == -1) {
            return manifestPackage + "." + activityName;
        }
        return activityName;
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/ActionBarSherlockCompat$ActionModeCallbackWrapper.class */
    private class ActionModeCallbackWrapper implements ActionMode.Callback {
        private final ActionMode.Callback mWrapped;

        public ActionModeCallbackWrapper(ActionMode.Callback wrapped) {
            this.mWrapped = wrapped;
        }

        @Override // com.actionbarsherlock.view.ActionMode.Callback
        public boolean onCreateActionMode(ActionMode mode, com.actionbarsherlock.view.Menu menu) {
            return this.mWrapped.onCreateActionMode(mode, menu);
        }

        @Override // com.actionbarsherlock.view.ActionMode.Callback
        public boolean onPrepareActionMode(ActionMode mode, com.actionbarsherlock.view.Menu menu) {
            return this.mWrapped.onPrepareActionMode(mode, menu);
        }

        @Override // com.actionbarsherlock.view.ActionMode.Callback
        public boolean onActionItemClicked(ActionMode mode, com.actionbarsherlock.view.MenuItem item) {
            return this.mWrapped.onActionItemClicked(mode, item);
        }

        @Override // com.actionbarsherlock.view.ActionMode.Callback
        public void onDestroyActionMode(ActionMode mode) {
            this.mWrapped.onDestroyActionMode(mode);
            if (ActionBarSherlockCompat.this.mActionModeView != null) {
                ActionBarSherlockCompat.this.mActionModeView.setVisibility(8);
                ActionBarSherlockCompat.this.mActionModeView.removeAllViews();
            }
            if (ActionBarSherlockCompat.this.mActivity instanceof ActionBarSherlock.OnActionModeFinishedListener) {
                ((ActionBarSherlock.OnActionModeFinishedListener) ActionBarSherlockCompat.this.mActivity).onActionModeFinished(ActionBarSherlockCompat.this.mActionMode);
            }
            ActionBarSherlockCompat.this.mActionMode = null;
        }
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void ensureActionBar() {
        if (this.mDecor == null) {
            initActionBar();
        }
    }
}
