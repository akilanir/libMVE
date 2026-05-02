package android.support.v7.app;

import android.R;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.v4.app.ActionBarDrawerToggle;
import android.support.v4.app.NavUtils;
import android.support.v4.internal.view.SupportMenu;
import android.support.v4.view.OnApplyWindowInsetsListener;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewConfigurationCompat;
import android.support.v4.view.WindowInsetsCompat;
import android.support.v7.internal.app.ToolbarActionBar;
import android.support.v7.internal.app.WindowCallback;
import android.support.v7.internal.app.WindowDecorActionBar;
import android.support.v7.internal.view.StandaloneActionMode;
import android.support.v7.internal.view.menu.ListMenuPresenter;
import android.support.v7.internal.view.menu.MenuBuilder;
import android.support.v7.internal.view.menu.MenuPresenter;
import android.support.v7.internal.view.menu.MenuView;
import android.support.v7.internal.widget.ActionBarContextView;
import android.support.v7.internal.widget.DecorContentParent;
import android.support.v7.internal.widget.FitWindowsViewGroup;
import android.support.v7.internal.widget.ProgressBarCompat;
import android.support.v7.internal.widget.TintCheckBox;
import android.support.v7.internal.widget.TintCheckedTextView;
import android.support.v7.internal.widget.TintEditText;
import android.support.v7.internal.widget.TintRadioButton;
import android.support.v7.internal.widget.TintSpinner;
import android.support.v7.internal.widget.ViewStubCompat;
import android.support.v7.internal.widget.ViewUtils;
import android.support.v7.view.ActionMode;
import android.support.v7.widget.Toolbar;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.KeyCharacterMap;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.PopupWindow;

/* loaded from: com.android.support.appcompat-v7.21.0.0.jar:android/support/v7/app/ActionBarActivityDelegateBase.class */
class ActionBarActivityDelegateBase extends ActionBarActivityDelegate implements MenuBuilder.Callback {
    private static final String TAG = "ActionBarActivityDelegateBase";
    private DecorContentParent mDecorContentParent;
    private ActionMenuPresenterCallback mActionMenuPresenterCallback;
    private PanelMenuPresenterCallback mPanelMenuPresenterCallback;
    ActionMode mActionMode;
    ActionBarContextView mActionModeView;
    PopupWindow mActionModePopup;
    Runnable mShowActionModePopup;
    private boolean mSubDecorInstalled;
    private ViewGroup mWindowDecor;
    private ViewGroup mSubDecor;
    private View mStatusGuard;
    private CharSequence mTitleToSet;
    private boolean mFeatureProgress;
    private boolean mFeatureIndeterminateProgress;
    private boolean mClosingActionMenu;
    private PanelFeatureState[] mPanels;
    private PanelFeatureState mPreparedPanel;
    private boolean mInvalidatePanelMenuPosted;
    private int mInvalidatePanelMenuFeatures;
    private final Runnable mInvalidatePanelMenuRunnable;
    private boolean mEnableDefaultActionBarUp;
    private ListMenuPresenter mToolbarListMenuPresenter;
    private Rect mTempRect1;
    private Rect mTempRect2;

    ActionBarActivityDelegateBase(ActionBarActivity activity) {
        super(activity);
        this.mInvalidatePanelMenuRunnable = new Runnable() { // from class: android.support.v7.app.ActionBarActivityDelegateBase.1
            @Override // java.lang.Runnable
            public void run() {
                if ((ActionBarActivityDelegateBase.this.mInvalidatePanelMenuFeatures & 1) != 0) {
                    ActionBarActivityDelegateBase.this.doInvalidatePanelMenu(0);
                }
                if ((ActionBarActivityDelegateBase.this.mInvalidatePanelMenuFeatures & 256) != 0) {
                    ActionBarActivityDelegateBase.this.doInvalidatePanelMenu(8);
                }
                ActionBarActivityDelegateBase.this.mInvalidatePanelMenuPosted = false;
                ActionBarActivityDelegateBase.this.mInvalidatePanelMenuFeatures = 0;
            }
        };
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.mWindowDecor = (ViewGroup) this.mActivity.getWindow().getDecorView();
        if (NavUtils.getParentActivityName(this.mActivity) != null) {
            ActionBar ab = getSupportActionBar();
            if (ab == null) {
                this.mEnableDefaultActionBarUp = true;
            } else {
                ab.setDefaultDisplayHomeAsUpEnabled(true);
            }
        }
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    public ActionBar createSupportActionBar() {
        ensureSubDecor();
        ActionBar ab = new WindowDecorActionBar(this.mActivity, this.mOverlayActionBar);
        ab.setDefaultDisplayHomeAsUpEnabled(this.mEnableDefaultActionBarUp);
        return ab;
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    void setSupportActionBar(Toolbar toolbar) {
        ActionBar ab = getSupportActionBar();
        if (ab instanceof WindowDecorActionBar) {
            throw new IllegalStateException("This Activity already has an action bar supplied by the window decor. Do not request Window.FEATURE_ACTION_BAR and set windowActionBar to false in your theme to use a Toolbar instead.");
        }
        if (ab instanceof ToolbarActionBar) {
            ((ToolbarActionBar) ab).setListMenuPresenter(null);
        }
        ToolbarActionBar tbab = new ToolbarActionBar(toolbar, this.mActivity.getTitle(), this.mActivity.getWindow(), this.mDefaultWindowCallback);
        ensureToolbarListMenuPresenter();
        tbab.setListMenuPresenter(this.mToolbarListMenuPresenter);
        setSupportActionBar(tbab);
        setWindowCallback(tbab.getWrappedWindowCallback());
        tbab.invalidateOptionsMenu();
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    public void onConfigurationChanged(Configuration newConfig) {
        ActionBar ab;
        if (this.mHasActionBar && this.mSubDecorInstalled && (ab = getSupportActionBar()) != null) {
            ab.onConfigurationChanged(newConfig);
        }
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    public void onStop() {
        ActionBar ab = getSupportActionBar();
        if (ab != null) {
            ab.setShowHideAnimationEnabled(false);
        }
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    public void onPostResume() {
        ActionBar ab = getSupportActionBar();
        if (ab != null) {
            ab.setShowHideAnimationEnabled(true);
        }
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    public void setContentView(View v) {
        ensureSubDecor();
        ViewGroup contentParent = (ViewGroup) this.mActivity.findViewById(R.id.content);
        contentParent.removeAllViews();
        contentParent.addView(v);
        this.mActivity.onSupportContentChanged();
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    public void setContentView(int resId) {
        ensureSubDecor();
        ViewGroup contentParent = (ViewGroup) this.mActivity.findViewById(R.id.content);
        contentParent.removeAllViews();
        this.mActivity.getLayoutInflater().inflate(resId, contentParent);
        this.mActivity.onSupportContentChanged();
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    public void setContentView(View v, ViewGroup.LayoutParams lp) {
        ensureSubDecor();
        ViewGroup contentParent = (ViewGroup) this.mActivity.findViewById(R.id.content);
        contentParent.removeAllViews();
        contentParent.addView(v, lp);
        this.mActivity.onSupportContentChanged();
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    public void addContentView(View v, ViewGroup.LayoutParams lp) {
        ensureSubDecor();
        ViewGroup contentParent = (ViewGroup) this.mActivity.findViewById(R.id.content);
        contentParent.addView(v, lp);
        this.mActivity.onSupportContentChanged();
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    public void onContentChanged() {
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v28, types: [android.content.Context] */
    final void ensureSubDecor() {
        Object obj;
        if (!this.mSubDecorInstalled) {
            if (this.mHasActionBar) {
                TypedValue outValue = new TypedValue();
                this.mActivity.getTheme().resolveAttribute(android.support.v7.appcompat.R.attr.actionBarTheme, outValue, true);
                if (outValue.resourceId != 0) {
                    obj = new ContextThemeWrapper((Context) this.mActivity, outValue.resourceId);
                } else {
                    obj = this.mActivity;
                }
                this.mSubDecor = (ViewGroup) LayoutInflater.from(obj).inflate(android.support.v7.appcompat.R.layout.abc_screen_toolbar, (ViewGroup) null);
                this.mDecorContentParent = (DecorContentParent) this.mSubDecor.findViewById(android.support.v7.appcompat.R.id.decor_content_parent);
                this.mDecorContentParent.setWindowCallback(getWindowCallback());
                if (this.mOverlayActionBar) {
                    this.mDecorContentParent.initFeature(9);
                }
                if (this.mFeatureProgress) {
                    this.mDecorContentParent.initFeature(2);
                }
                if (this.mFeatureIndeterminateProgress) {
                    this.mDecorContentParent.initFeature(5);
                }
            } else {
                if (this.mOverlayActionMode) {
                    this.mSubDecor = (ViewGroup) LayoutInflater.from(this.mActivity).inflate(android.support.v7.appcompat.R.layout.abc_screen_simple_overlay_action_mode, (ViewGroup) null);
                } else {
                    this.mSubDecor = (ViewGroup) LayoutInflater.from(this.mActivity).inflate(android.support.v7.appcompat.R.layout.abc_screen_simple, (ViewGroup) null);
                }
                if (Build.VERSION.SDK_INT >= 21) {
                    ViewCompat.setOnApplyWindowInsetsListener(this.mSubDecor, new OnApplyWindowInsetsListener() { // from class: android.support.v7.app.ActionBarActivityDelegateBase.2
                        public WindowInsetsCompat onApplyWindowInsets(View v, WindowInsetsCompat insets) {
                            int top = insets.getSystemWindowInsetTop();
                            int newTop = ActionBarActivityDelegateBase.this.updateStatusGuard(top);
                            if (top != newTop) {
                                return insets.replaceSystemWindowInsets(insets.getSystemWindowInsetLeft(), newTop, insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
                            }
                            return insets;
                        }
                    });
                } else {
                    ((FitWindowsViewGroup) this.mSubDecor).setOnFitSystemWindowsListener(new FitWindowsViewGroup.OnFitSystemWindowsListener() { // from class: android.support.v7.app.ActionBarActivityDelegateBase.3
                        @Override // android.support.v7.internal.widget.FitWindowsViewGroup.OnFitSystemWindowsListener
                        public void onFitSystemWindows(Rect insets) {
                            insets.top = ActionBarActivityDelegateBase.this.updateStatusGuard(insets.top);
                        }
                    });
                }
            }
            ViewUtils.makeOptionalFitsSystemWindows(this.mSubDecor);
            this.mActivity.superSetContentView(this.mSubDecor);
            View decorContent = this.mActivity.findViewById(R.id.content);
            decorContent.setId(-1);
            View abcContent = this.mActivity.findViewById(android.support.v7.appcompat.R.id.action_bar_activity_content);
            abcContent.setId(R.id.content);
            if (decorContent instanceof FrameLayout) {
                ((FrameLayout) decorContent).setForeground(null);
            }
            if (this.mTitleToSet != null && this.mDecorContentParent != null) {
                this.mDecorContentParent.setWindowTitle(this.mTitleToSet);
                this.mTitleToSet = null;
            }
            applyFixedSizeWindow();
            onSubDecorInstalled();
            this.mSubDecorInstalled = true;
            PanelFeatureState st = getPanelState(0, false);
            if (isDestroyed()) {
                return;
            }
            if (st == null || st.menu == null) {
                invalidatePanelMenu(8);
            }
        }
    }

    void onSubDecorInstalled() {
    }

    private void applyFixedSizeWindow() {
        TypedArray a = this.mActivity.obtainStyledAttributes(android.support.v7.appcompat.R.styleable.Theme);
        TypedValue mFixedWidthMajor = null;
        TypedValue mFixedWidthMinor = null;
        TypedValue mFixedHeightMajor = null;
        TypedValue mFixedHeightMinor = null;
        if (a.hasValue(android.support.v7.appcompat.R.styleable.Theme_windowFixedWidthMajor)) {
            if (0 == 0) {
                mFixedWidthMajor = new TypedValue();
            }
            a.getValue(android.support.v7.appcompat.R.styleable.Theme_windowFixedWidthMajor, mFixedWidthMajor);
        }
        if (a.hasValue(android.support.v7.appcompat.R.styleable.Theme_windowFixedWidthMinor)) {
            if (0 == 0) {
                mFixedWidthMinor = new TypedValue();
            }
            a.getValue(android.support.v7.appcompat.R.styleable.Theme_windowFixedWidthMinor, mFixedWidthMinor);
        }
        if (a.hasValue(android.support.v7.appcompat.R.styleable.Theme_windowFixedHeightMajor)) {
            if (0 == 0) {
                mFixedHeightMajor = new TypedValue();
            }
            a.getValue(android.support.v7.appcompat.R.styleable.Theme_windowFixedHeightMajor, mFixedHeightMajor);
        }
        if (a.hasValue(android.support.v7.appcompat.R.styleable.Theme_windowFixedHeightMinor)) {
            if (0 == 0) {
                mFixedHeightMinor = new TypedValue();
            }
            a.getValue(android.support.v7.appcompat.R.styleable.Theme_windowFixedHeightMinor, mFixedHeightMinor);
        }
        DisplayMetrics metrics = this.mActivity.getResources().getDisplayMetrics();
        boolean isPortrait = metrics.widthPixels < metrics.heightPixels;
        int w = -1;
        int h = -1;
        TypedValue tvw = isPortrait ? mFixedWidthMinor : mFixedWidthMajor;
        if (tvw != null && tvw.type != 0) {
            if (tvw.type == 5) {
                w = (int) tvw.getDimension(metrics);
            } else if (tvw.type == 6) {
                w = (int) tvw.getFraction(metrics.widthPixels, metrics.widthPixels);
            }
        }
        TypedValue tvh = isPortrait ? mFixedHeightMajor : mFixedHeightMinor;
        if (tvh != null && tvh.type != 0) {
            if (tvh.type == 5) {
                h = (int) tvh.getDimension(metrics);
            } else if (tvh.type == 6) {
                h = (int) tvh.getFraction(metrics.heightPixels, metrics.heightPixels);
            }
        }
        if (w != -1 || h != -1) {
            this.mActivity.getWindow().setLayout(w, h);
        }
        a.recycle();
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    public boolean supportRequestWindowFeature(int featureId) {
        switch (featureId) {
            case 2:
                this.mFeatureProgress = true;
                break;
            case 5:
                this.mFeatureIndeterminateProgress = true;
                break;
            case ActionBar.DISPLAY_SHOW_TITLE /* 8 */:
                this.mHasActionBar = true;
                break;
            case 9:
                this.mOverlayActionBar = true;
                break;
            case 10:
                this.mOverlayActionMode = true;
                break;
        }
        return true;
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    public void onTitleChanged(CharSequence title) {
        if (this.mDecorContentParent != null) {
            this.mDecorContentParent.setWindowTitle(title);
        } else if (getSupportActionBar() != null) {
            getSupportActionBar().setWindowTitle(title);
        } else {
            this.mTitleToSet = title;
        }
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    public View onCreatePanelView(int featureId) {
        View panelView = null;
        if (this.mActionMode == null) {
            WindowCallback callback = getWindowCallback();
            if (callback != null) {
                panelView = callback.onCreatePanelView(featureId);
            }
            if (panelView == null && this.mToolbarListMenuPresenter == null) {
                PanelFeatureState st = getPanelState(featureId, true);
                openPanel(st, (KeyEvent) null);
                if (st.isOpen) {
                    panelView = st.shownPanelView;
                }
            }
        }
        return panelView;
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    public boolean onCreatePanelMenu(int featureId, Menu menu) {
        if (featureId != 0) {
            return getWindowCallback().onCreatePanelMenu(featureId, menu);
        }
        return false;
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    public boolean onPreparePanel(int featureId, View view, Menu menu) {
        if (featureId != 0) {
            return getWindowCallback().onPreparePanel(featureId, view, menu);
        }
        return false;
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    public void onPanelClosed(int featureId, Menu menu) {
        PanelFeatureState st = getPanelState(featureId, false);
        if (st != null) {
            closePanel(st, false);
        }
        if (featureId != 8) {
            if (!isDestroyed()) {
                this.mActivity.superOnPanelClosed(featureId, menu);
            }
        } else {
            ActionBar ab = getSupportActionBar();
            if (ab != null) {
                ab.dispatchMenuVisibilityChanged(false);
            }
        }
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    boolean onMenuOpened(int featureId, Menu menu) {
        if (featureId == 8) {
            ActionBar ab = getSupportActionBar();
            if (ab != null) {
                ab.dispatchMenuVisibilityChanged(true);
                return true;
            }
            return true;
        }
        return this.mActivity.superOnMenuOpened(featureId, menu);
    }

    @Override // android.support.v7.internal.view.menu.MenuBuilder.Callback
    public boolean onMenuItemSelected(MenuBuilder menu, MenuItem item) {
        PanelFeatureState panel;
        WindowCallback cb = getWindowCallback();
        if (cb != null && !isDestroyed() && (panel = findMenuPanel(menu.getRootMenu())) != null) {
            return cb.onMenuItemSelected(panel.featureId, item);
        }
        return false;
    }

    @Override // android.support.v7.internal.view.menu.MenuBuilder.Callback
    public void onMenuModeChange(MenuBuilder menu) {
        reopenMenu(menu, true);
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    public ActionMode startSupportActionMode(ActionMode.Callback callback) {
        if (callback == null) {
            throw new IllegalArgumentException("ActionMode callback can not be null.");
        }
        if (this.mActionMode != null) {
            this.mActionMode.finish();
        }
        ActionMode.Callback wrappedCallback = new ActionModeCallbackWrapper(callback);
        ActionBar ab = getSupportActionBar();
        if (ab != null) {
            this.mActionMode = ab.startActionMode(wrappedCallback);
            if (this.mActionMode != null) {
                this.mActivity.onSupportActionModeStarted(this.mActionMode);
            }
        }
        if (this.mActionMode == null) {
            this.mActionMode = startSupportActionModeFromWindow(wrappedCallback);
        }
        return this.mActionMode;
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    public void supportInvalidateOptionsMenu() {
        ActionBar ab = getSupportActionBar();
        if (ab == null || !ab.invalidateOptionsMenu()) {
            invalidatePanelMenu(0);
        }
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    ActionMode startSupportActionModeFromWindow(ActionMode.Callback callback) {
        if (this.mActionMode != null) {
            this.mActionMode.finish();
        }
        ActionMode.Callback wrappedCallback = new ActionModeCallbackWrapper(callback);
        Context context = getActionBarThemedContext();
        if (this.mActionModeView == null) {
            if (this.mIsFloating) {
                this.mActionModeView = new ActionBarContextView(context);
                this.mActionModePopup = new PopupWindow(context, (AttributeSet) null, android.support.v7.appcompat.R.attr.actionModePopupWindowStyle);
                this.mActionModePopup.setContentView(this.mActionModeView);
                this.mActionModePopup.setWidth(-1);
                TypedValue heightValue = new TypedValue();
                this.mActivity.getTheme().resolveAttribute(android.support.v7.appcompat.R.attr.actionBarSize, heightValue, true);
                int height = TypedValue.complexToDimensionPixelSize(heightValue.data, this.mActivity.getResources().getDisplayMetrics());
                this.mActionModeView.setContentHeight(height);
                this.mActionModePopup.setHeight(-2);
                this.mShowActionModePopup = new Runnable() { // from class: android.support.v7.app.ActionBarActivityDelegateBase.4
                    @Override // java.lang.Runnable
                    public void run() {
                        ActionBarActivityDelegateBase.this.mActionModePopup.showAtLocation(ActionBarActivityDelegateBase.this.mActionModeView, 55, 0, 0);
                    }
                };
            } else {
                ViewStubCompat stub = (ViewStubCompat) this.mActivity.findViewById(android.support.v7.appcompat.R.id.action_mode_bar_stub);
                if (stub != null) {
                    stub.setLayoutInflater(LayoutInflater.from(context));
                    this.mActionModeView = (ActionBarContextView) stub.inflate();
                }
            }
        }
        if (this.mActionModeView != null) {
            this.mActionModeView.killMode();
            ActionMode mode = new StandaloneActionMode(context, this.mActionModeView, wrappedCallback, this.mActionModePopup == null);
            if (callback.onCreateActionMode(mode, mode.getMenu())) {
                mode.invalidate();
                this.mActionModeView.initForMode(mode);
                this.mActionModeView.setVisibility(0);
                this.mActionMode = mode;
                if (this.mActionModePopup != null) {
                    this.mActivity.getWindow().getDecorView().post(this.mShowActionModePopup);
                }
                this.mActionModeView.sendAccessibilityEvent(32);
                if (this.mActionModeView.getParent() != null) {
                    ViewCompat.requestApplyInsets((View) this.mActionModeView.getParent());
                }
            } else {
                this.mActionMode = null;
            }
        }
        if (this.mActionMode != null && this.mActivity != null) {
            this.mActivity.onSupportActionModeStarted(this.mActionMode);
        }
        return this.mActionMode;
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    public boolean onBackPressed() {
        if (this.mActionMode != null) {
            this.mActionMode.finish();
            return true;
        }
        ActionBar ab = getSupportActionBar();
        if (ab != null && ab.collapseActionView()) {
            return true;
        }
        return false;
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    void setSupportProgressBarVisibility(boolean visible) {
        updateProgressBars(visible ? -1 : -2);
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    void setSupportProgressBarIndeterminateVisibility(boolean visible) {
        updateProgressBars(visible ? -1 : -2);
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    void setSupportProgressBarIndeterminate(boolean indeterminate) {
        updateProgressBars(indeterminate ? -3 : -4);
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    void setSupportProgress(int progress) {
        updateProgressBars(0 + progress);
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    int getHomeAsUpIndicatorAttrId() {
        return android.support.v7.appcompat.R.attr.homeAsUpIndicator;
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    boolean onKeyShortcut(int keyCode, KeyEvent ev) {
        if (this.mPreparedPanel != null) {
            boolean handled = performPanelShortcut(this.mPreparedPanel, ev.getKeyCode(), ev, 1);
            if (handled) {
                if (this.mPreparedPanel != null) {
                    this.mPreparedPanel.isHandled = true;
                    return true;
                }
                return true;
            }
        }
        if (this.mPreparedPanel == null) {
            PanelFeatureState st = getPanelState(0, true);
            preparePanel(st, ev);
            boolean handled2 = performPanelShortcut(st, ev.getKeyCode(), ev, 1);
            st.isPrepared = false;
            if (handled2) {
                return true;
            }
            return false;
        }
        return false;
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    boolean onKeyDown(int keyCode, KeyEvent event) {
        return onKeyShortcut(keyCode, event);
    }

    @Override // android.support.v7.app.ActionBarActivityDelegate
    View createView(String name, @NonNull AttributeSet attrs) {
        if (Build.VERSION.SDK_INT < 21) {
            switch (name) {
                case "EditText":
                    return new TintEditText(this.mActivity, attrs);
                case "Spinner":
                    return new TintSpinner(this.mActivity, attrs);
                case "CheckBox":
                    return new TintCheckBox(this.mActivity, attrs);
                case "RadioButton":
                    return new TintRadioButton(this.mActivity, attrs);
                case "CheckedTextView":
                    return new TintCheckedTextView(this.mActivity, attrs);
                default:
                    return null;
            }
        }
        return null;
    }

    private void updateProgressBars(int value) {
        ProgressBarCompat circularProgressBar = getCircularProgressBar();
        ProgressBarCompat horizontalProgressBar = getHorizontalProgressBar();
        if (value == -1) {
            if (this.mFeatureProgress) {
                int level = horizontalProgressBar.getProgress();
                int visibility = (horizontalProgressBar.isIndeterminate() || level < 10000) ? 0 : 4;
                horizontalProgressBar.setVisibility(visibility);
            }
            if (this.mFeatureIndeterminateProgress) {
                circularProgressBar.setVisibility(0);
                return;
            }
            return;
        }
        if (value == -2) {
            if (this.mFeatureProgress) {
                horizontalProgressBar.setVisibility(8);
            }
            if (this.mFeatureIndeterminateProgress) {
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
            } else {
                hideProgressBars(horizontalProgressBar, circularProgressBar);
            }
        }
    }

    private void openPanel(int featureId, KeyEvent event) {
        if (featureId == 0 && this.mDecorContentParent != null && this.mDecorContentParent.canShowOverflowMenu() && !ViewConfigurationCompat.hasPermanentMenuKey(ViewConfiguration.get(this.mActivity))) {
            this.mDecorContentParent.showOverflowMenu();
        } else {
            openPanel(getPanelState(featureId, true), event);
        }
    }

    private void openPanel(PanelFeatureState st, KeyEvent event) {
        if (st.isOpen || isDestroyed()) {
            return;
        }
        if (st.featureId == 0) {
            ActionBarDrawerToggle.DelegateProvider delegateProvider = this.mActivity;
            Configuration config = delegateProvider.getResources().getConfiguration();
            boolean isXLarge = (config.screenLayout & 15) == 4;
            boolean isHoneycombApp = delegateProvider.getApplicationInfo().targetSdkVersion >= 11;
            if (isXLarge && isHoneycombApp) {
                return;
            }
        }
        WindowCallback windowCallback = getWindowCallback();
        if (windowCallback != null && !windowCallback.onMenuOpened(st.featureId, st.menu)) {
            closePanel(st, true);
            return;
        }
        if (!preparePanel(st, event)) {
            return;
        }
        if (st.decorView == null || st.refreshDecorView) {
            initializePanelDecor(st);
        }
        if (!initializePanelContent(st) || !st.hasPanelItems()) {
            return;
        }
        st.isHandled = false;
        st.isOpen = true;
    }

    private void initializePanelDecor(PanelFeatureState st) {
        st.decorView = this.mWindowDecor;
        st.setStyle(getActionBarThemedContext());
    }

    private void reopenMenu(MenuBuilder menu, boolean toggleMenuMode) {
        if (this.mDecorContentParent != null && this.mDecorContentParent.canShowOverflowMenu() && (!ViewConfigurationCompat.hasPermanentMenuKey(ViewConfiguration.get(this.mActivity)) || this.mDecorContentParent.isOverflowMenuShowPending())) {
            WindowCallback windowCallback = getWindowCallback();
            if (!this.mDecorContentParent.isOverflowMenuShowing() || !toggleMenuMode) {
                if (windowCallback != null && !isDestroyed()) {
                    if (this.mInvalidatePanelMenuPosted && (this.mInvalidatePanelMenuFeatures & 1) != 0) {
                        this.mWindowDecor.removeCallbacks(this.mInvalidatePanelMenuRunnable);
                        this.mInvalidatePanelMenuRunnable.run();
                    }
                    PanelFeatureState st = getPanelState(0, true);
                    if (st.menu != null && !st.refreshMenuContent && windowCallback.onPreparePanel(0, null, st.menu)) {
                        windowCallback.onMenuOpened(8, st.menu);
                        this.mDecorContentParent.showOverflowMenu();
                        return;
                    }
                    return;
                }
                return;
            }
            this.mDecorContentParent.hideOverflowMenu();
            if (!isDestroyed()) {
                this.mActivity.onPanelClosed(8, getPanelState(0, true).menu);
                return;
            }
            return;
        }
        PanelFeatureState st2 = getPanelState(0, true);
        st2.refreshDecorView = true;
        closePanel(st2, false);
        openPanel(st2, (KeyEvent) null);
    }

    private void showProgressBars(ProgressBarCompat horizontalProgressBar, ProgressBarCompat spinnyProgressBar) {
        if (this.mFeatureIndeterminateProgress && spinnyProgressBar.getVisibility() == 4) {
            spinnyProgressBar.setVisibility(0);
        }
        if (this.mFeatureProgress && horizontalProgressBar.getProgress() < 10000) {
            horizontalProgressBar.setVisibility(0);
        }
    }

    private void hideProgressBars(ProgressBarCompat horizontalProgressBar, ProgressBarCompat spinnyProgressBar) {
        if (this.mFeatureIndeterminateProgress && spinnyProgressBar.getVisibility() == 0) {
            spinnyProgressBar.setVisibility(4);
        }
        if (this.mFeatureProgress && horizontalProgressBar.getVisibility() == 0) {
            horizontalProgressBar.setVisibility(4);
        }
    }

    private ProgressBarCompat getCircularProgressBar() {
        ProgressBarCompat pb = (ProgressBarCompat) this.mActivity.findViewById(android.support.v7.appcompat.R.id.progress_circular);
        if (pb != null) {
            pb.setVisibility(4);
        }
        return pb;
    }

    private ProgressBarCompat getHorizontalProgressBar() {
        ProgressBarCompat pb = (ProgressBarCompat) this.mActivity.findViewById(android.support.v7.appcompat.R.id.progress_horizontal);
        if (pb != null) {
            pb.setVisibility(4);
        }
        return pb;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:6:0x0015  */
    /* JADX WARN: Type inference failed for: r7v0, types: [android.content.Context] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private boolean initializePanelMenu(android.support.v7.app.ActionBarActivityDelegateBase.PanelFeatureState r6) {
        /*
            r5 = this;
            r0 = r5
            android.support.v7.app.ActionBarActivity r0 = r0.mActivity
            r7 = r0
            r0 = r6
            int r0 = r0.featureId
            if (r0 == 0) goto L15
            r0 = r6
            int r0 = r0.featureId
            r1 = 8
            if (r0 != r1) goto Lb0
        L15:
            r0 = r5
            android.support.v7.internal.widget.DecorContentParent r0 = r0.mDecorContentParent
            if (r0 == 0) goto Lb0
            android.util.TypedValue r0 = new android.util.TypedValue
            r1 = r0
            r1.<init>()
            r8 = r0
            r0 = r7
            android.content.res.Resources$Theme r0 = r0.getTheme()
            r9 = r0
            r0 = r9
            int r1 = android.support.v7.appcompat.R.attr.actionBarTheme
            r2 = r8
            r3 = 1
            boolean r0 = r0.resolveAttribute(r1, r2, r3)
            r0 = 0
            r10 = r0
            r0 = r8
            int r0 = r0.resourceId
            if (r0 == 0) goto L67
            r0 = r7
            android.content.res.Resources r0 = r0.getResources()
            android.content.res.Resources$Theme r0 = r0.newTheme()
            r10 = r0
            r0 = r10
            r1 = r9
            r0.setTo(r1)
            r0 = r10
            r1 = r8
            int r1 = r1.resourceId
            r2 = 1
            r0.applyStyle(r1, r2)
            r0 = r10
            int r1 = android.support.v7.appcompat.R.attr.actionBarWidgetTheme
            r2 = r8
            r3 = 1
            boolean r0 = r0.resolveAttribute(r1, r2, r3)
            goto L72
        L67:
            r0 = r9
            int r1 = android.support.v7.appcompat.R.attr.actionBarWidgetTheme
            r2 = r8
            r3 = 1
            boolean r0 = r0.resolveAttribute(r1, r2, r3)
        L72:
            r0 = r8
            int r0 = r0.resourceId
            if (r0 == 0) goto L98
            r0 = r10
            if (r0 != 0) goto L8e
            r0 = r7
            android.content.res.Resources r0 = r0.getResources()
            android.content.res.Resources$Theme r0 = r0.newTheme()
            r10 = r0
            r0 = r10
            r1 = r9
            r0.setTo(r1)
        L8e:
            r0 = r10
            r1 = r8
            int r1 = r1.resourceId
            r2 = 1
            r0.applyStyle(r1, r2)
        L98:
            r0 = r10
            if (r0 == 0) goto Lb0
            android.view.ContextThemeWrapper r0 = new android.view.ContextThemeWrapper
            r1 = r0
            r2 = r7
            r3 = 0
            r1.<init>(r2, r3)
            r7 = r0
            r0 = r7
            android.content.res.Resources$Theme r0 = r0.getTheme()
            r1 = r10
            r0.setTo(r1)
        Lb0:
            android.support.v7.internal.view.menu.MenuBuilder r0 = new android.support.v7.internal.view.menu.MenuBuilder
            r1 = r0
            r2 = r7
            r1.<init>(r2)
            r8 = r0
            r0 = r8
            r1 = r5
            r0.setCallback(r1)
            r0 = r6
            r1 = r8
            r0.setMenu(r1)
            r0 = 1
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v7.app.ActionBarActivityDelegateBase.initializePanelMenu(android.support.v7.app.ActionBarActivityDelegateBase$PanelFeatureState):boolean");
    }

    private boolean initializePanelContent(PanelFeatureState st) {
        if (st.menu == null) {
            return false;
        }
        if (this.mPanelMenuPresenterCallback == null) {
            this.mPanelMenuPresenterCallback = new PanelMenuPresenterCallback();
        }
        st.shownPanelView = (View) st.getListMenuView(this.mPanelMenuPresenterCallback);
        return st.shownPanelView != null;
    }

    private boolean preparePanel(PanelFeatureState st, KeyEvent event) {
        if (isDestroyed()) {
            return false;
        }
        if (st.isPrepared) {
            return true;
        }
        if (this.mPreparedPanel != null && this.mPreparedPanel != st) {
            closePanel(this.mPreparedPanel, false);
        }
        boolean isActionBarMenu = st.featureId == 0 || st.featureId == 8;
        if (isActionBarMenu && this.mDecorContentParent != null) {
            this.mDecorContentParent.setMenuPrepared();
        }
        if (st.menu == null || st.refreshMenuContent) {
            if (st.menu == null && (!initializePanelMenu(st) || st.menu == null)) {
                return false;
            }
            if (isActionBarMenu && this.mDecorContentParent != null) {
                if (this.mActionMenuPresenterCallback == null) {
                    this.mActionMenuPresenterCallback = new ActionMenuPresenterCallback();
                }
                this.mDecorContentParent.setMenu(st.menu, this.mActionMenuPresenterCallback);
            }
            st.menu.stopDispatchingItemsChanged();
            if (!getWindowCallback().onCreatePanelMenu(st.featureId, st.menu)) {
                st.setMenu(null);
                if (isActionBarMenu && this.mDecorContentParent != null) {
                    this.mDecorContentParent.setMenu(null, this.mActionMenuPresenterCallback);
                    return false;
                }
                return false;
            }
            st.refreshMenuContent = false;
        }
        st.menu.stopDispatchingItemsChanged();
        if (st.frozenActionViewState != null) {
            st.menu.restoreActionViewStates(st.frozenActionViewState);
            st.frozenActionViewState = null;
        }
        if (!getWindowCallback().onPreparePanel(0, null, st.menu)) {
            if (isActionBarMenu && this.mDecorContentParent != null) {
                this.mDecorContentParent.setMenu(null, this.mActionMenuPresenterCallback);
            }
            st.menu.startDispatchingItemsChanged();
            return false;
        }
        KeyCharacterMap kmap = KeyCharacterMap.load(event != null ? event.getDeviceId() : -1);
        st.qwertyMode = kmap.getKeyboardType() != 1;
        st.menu.setQwertyMode(st.qwertyMode);
        st.menu.startDispatchingItemsChanged();
        st.isPrepared = true;
        st.isHandled = false;
        this.mPreparedPanel = st;
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    public void checkCloseActionMenu(MenuBuilder menuBuilder) {
        if (this.mClosingActionMenu) {
            return;
        }
        this.mClosingActionMenu = true;
        this.mDecorContentParent.dismissPopups();
        WindowCallback cb = getWindowCallback();
        if (cb != null && !isDestroyed()) {
            cb.onPanelClosed(8, menuBuilder);
        }
        this.mClosingActionMenu = false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void closePanel(PanelFeatureState st, boolean doCallback) {
        if (doCallback && st.featureId == 0 && this.mDecorContentParent != null && this.mDecorContentParent.isOverflowMenuShowing()) {
            checkCloseActionMenu(st.menu);
            return;
        }
        if (st.isOpen && doCallback) {
            callOnPanelClosed(st.featureId, st, null);
        }
        st.isPrepared = false;
        st.isHandled = false;
        st.isOpen = false;
        st.shownPanelView = null;
        st.refreshDecorView = true;
        if (this.mPreparedPanel == st) {
            this.mPreparedPanel = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v9, types: [android.support.v7.internal.view.menu.MenuBuilder] */
    public void callOnPanelClosed(int featureId, PanelFeatureState panel, Menu menu) {
        if (menu == null) {
            if (panel == null && featureId >= 0 && featureId < this.mPanels.length) {
                panel = this.mPanels[featureId];
            }
            if (panel != null) {
                menu = panel.menu;
            }
        }
        if (panel != null && !panel.isOpen) {
            return;
        }
        getWindowCallback().onPanelClosed(featureId, menu);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public PanelFeatureState findMenuPanel(Menu menu) {
        PanelFeatureState[] panels = this.mPanels;
        int N = panels != null ? panels.length : 0;
        for (int i = 0; i < N; i++) {
            PanelFeatureState panel = panels[i];
            if (panel != null && panel.menu == menu) {
                return panel;
            }
        }
        return null;
    }

    private PanelFeatureState getPanelState(int featureId, boolean required) {
        PanelFeatureState[] panelFeatureStateArr = this.mPanels;
        PanelFeatureState[] ar = panelFeatureStateArr;
        if (panelFeatureStateArr == null || ar.length <= featureId) {
            PanelFeatureState[] nar = new PanelFeatureState[featureId + 1];
            if (ar != null) {
                System.arraycopy(ar, 0, nar, 0, ar.length);
            }
            ar = nar;
            this.mPanels = nar;
        }
        PanelFeatureState st = ar[featureId];
        if (st == null) {
            PanelFeatureState panelFeatureState = new PanelFeatureState(featureId);
            st = panelFeatureState;
            ar[featureId] = panelFeatureState;
        }
        return st;
    }

    final boolean performPanelShortcut(PanelFeatureState st, int keyCode, KeyEvent event, int flags) {
        if (event.isSystem()) {
            return false;
        }
        boolean handled = false;
        if ((st.isPrepared || preparePanel(st, event)) && st.menu != null) {
            handled = st.menu.performShortcut(keyCode, event, flags);
        }
        if (handled && (flags & 1) == 0 && this.mDecorContentParent == null) {
            closePanel(st, true);
        }
        return handled;
    }

    private void invalidatePanelMenu(int featureId) {
        this.mInvalidatePanelMenuFeatures |= 1 << featureId;
        if (!this.mInvalidatePanelMenuPosted && this.mWindowDecor != null) {
            ViewCompat.postOnAnimation(this.mWindowDecor, this.mInvalidatePanelMenuRunnable);
            this.mInvalidatePanelMenuPosted = true;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doInvalidatePanelMenu(int featureId) {
        PanelFeatureState st;
        PanelFeatureState st2 = getPanelState(featureId, true);
        if (st2.menu != null) {
            Bundle savedActionViewStates = new Bundle();
            st2.menu.saveActionViewStates(savedActionViewStates);
            if (savedActionViewStates.size() > 0) {
                st2.frozenActionViewState = savedActionViewStates;
            }
            st2.menu.stopDispatchingItemsChanged();
            st2.menu.clear();
        }
        st2.refreshMenuContent = true;
        st2.refreshDecorView = true;
        if ((featureId == 8 || featureId == 0) && this.mDecorContentParent != null && (st = getPanelState(0, false)) != null) {
            st.isPrepared = false;
            preparePanel(st, null);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int updateStatusGuard(int insetTop) {
        boolean showStatusGuard = false;
        if (this.mActionModeView != null && (this.mActionModeView.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) {
            ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) this.mActionModeView.getLayoutParams();
            boolean mlpChanged = false;
            if (this.mActionModeView.isShown()) {
                if (this.mTempRect1 == null) {
                    this.mTempRect1 = new Rect();
                    this.mTempRect2 = new Rect();
                }
                Rect insets = this.mTempRect1;
                Rect localInsets = this.mTempRect2;
                insets.set(0, insetTop, 0, 0);
                ViewUtils.computeFitSystemWindows(this.mSubDecor, insets, localInsets);
                int newMargin = localInsets.top == 0 ? insetTop : 0;
                if (mlp.topMargin != newMargin) {
                    mlpChanged = true;
                    mlp.topMargin = insetTop;
                    if (this.mStatusGuard == null) {
                        this.mStatusGuard = new View(this.mActivity);
                        this.mStatusGuard.setBackgroundColor(this.mActivity.getResources().getColor(android.support.v7.appcompat.R.color.abc_input_method_navigation_guard));
                        this.mSubDecor.addView(this.mStatusGuard, -1, new ViewGroup.LayoutParams(-1, insetTop));
                    } else {
                        ViewGroup.LayoutParams lp = this.mStatusGuard.getLayoutParams();
                        if (lp.height != insetTop) {
                            lp.height = insetTop;
                            this.mStatusGuard.setLayoutParams(lp);
                        }
                    }
                }
                showStatusGuard = this.mStatusGuard != null;
                if (!this.mOverlayActionMode && showStatusGuard) {
                    insetTop = 0;
                }
            } else if (mlp.topMargin != 0) {
                mlpChanged = true;
                mlp.topMargin = 0;
            }
            if (mlpChanged) {
                this.mActionModeView.setLayoutParams(mlp);
            }
        }
        if (this.mStatusGuard != null) {
            this.mStatusGuard.setVisibility(showStatusGuard ? 0 : 8);
        }
        return insetTop;
    }

    private void ensureToolbarListMenuPresenter() {
        if (this.mToolbarListMenuPresenter == null) {
            TypedValue outValue = new TypedValue();
            this.mActivity.getTheme().resolveAttribute(android.support.v7.appcompat.R.attr.panelMenuListTheme, outValue, true);
            Context context = new ContextThemeWrapper((Context) this.mActivity, outValue.resourceId != 0 ? outValue.resourceId : android.support.v7.appcompat.R.style.Theme_AppCompat_CompactMenu);
            this.mToolbarListMenuPresenter = new ListMenuPresenter(context, android.support.v7.appcompat.R.layout.abc_list_menu_item_layout);
        }
    }

    /* loaded from: com.android.support.appcompat-v7.21.0.0.jar:android/support/v7/app/ActionBarActivityDelegateBase$ActionModeCallbackWrapper.class */
    private class ActionModeCallbackWrapper implements ActionMode.Callback {
        private ActionMode.Callback mWrapped;

        public ActionModeCallbackWrapper(ActionMode.Callback wrapped) {
            this.mWrapped = wrapped;
        }

        @Override // android.support.v7.view.ActionMode.Callback
        public boolean onCreateActionMode(ActionMode mode, Menu menu) {
            return this.mWrapped.onCreateActionMode(mode, menu);
        }

        @Override // android.support.v7.view.ActionMode.Callback
        public boolean onPrepareActionMode(ActionMode mode, Menu menu) {
            return this.mWrapped.onPrepareActionMode(mode, menu);
        }

        @Override // android.support.v7.view.ActionMode.Callback
        public boolean onActionItemClicked(ActionMode mode, MenuItem item) {
            return this.mWrapped.onActionItemClicked(mode, item);
        }

        @Override // android.support.v7.view.ActionMode.Callback
        public void onDestroyActionMode(ActionMode mode) {
            this.mWrapped.onDestroyActionMode(mode);
            if (ActionBarActivityDelegateBase.this.mActionModePopup != null) {
                ActionBarActivityDelegateBase.this.mActivity.getWindow().getDecorView().removeCallbacks(ActionBarActivityDelegateBase.this.mShowActionModePopup);
                ActionBarActivityDelegateBase.this.mActionModePopup.dismiss();
            } else if (ActionBarActivityDelegateBase.this.mActionModeView != null) {
                ActionBarActivityDelegateBase.this.mActionModeView.setVisibility(8);
                if (ActionBarActivityDelegateBase.this.mActionModeView.getParent() != null) {
                    ViewCompat.requestApplyInsets((View) ActionBarActivityDelegateBase.this.mActionModeView.getParent());
                }
            }
            if (ActionBarActivityDelegateBase.this.mActionModeView != null) {
                ActionBarActivityDelegateBase.this.mActionModeView.removeAllViews();
            }
            if (ActionBarActivityDelegateBase.this.mActivity != null) {
                try {
                    ActionBarActivityDelegateBase.this.mActivity.onSupportActionModeFinished(ActionBarActivityDelegateBase.this.mActionMode);
                } catch (AbstractMethodError e) {
                }
            }
            ActionBarActivityDelegateBase.this.mActionMode = null;
        }
    }

    /* loaded from: com.android.support.appcompat-v7.21.0.0.jar:android/support/v7/app/ActionBarActivityDelegateBase$PanelMenuPresenterCallback.class */
    private final class PanelMenuPresenterCallback implements MenuPresenter.Callback {
        private PanelMenuPresenterCallback() {
        }

        @Override // android.support.v7.internal.view.menu.MenuPresenter.Callback
        public void onCloseMenu(MenuBuilder menu, boolean allMenusAreClosing) {
            SupportMenu rootMenu = menu.getRootMenu();
            boolean isSubMenu = rootMenu != menu;
            PanelFeatureState panel = ActionBarActivityDelegateBase.this.findMenuPanel(isSubMenu ? rootMenu : menu);
            if (panel != null) {
                if (isSubMenu) {
                    ActionBarActivityDelegateBase.this.callOnPanelClosed(panel.featureId, panel, rootMenu);
                    ActionBarActivityDelegateBase.this.closePanel(panel, true);
                } else {
                    ActionBarActivityDelegateBase.this.mActivity.closeOptionsMenu();
                    ActionBarActivityDelegateBase.this.closePanel(panel, allMenusAreClosing);
                }
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // android.support.v7.internal.view.menu.MenuPresenter.Callback
        public boolean onOpenSubMenu(MenuBuilder menuBuilder) {
            WindowCallback cb;
            if (menuBuilder == 0 && ActionBarActivityDelegateBase.this.mHasActionBar && (cb = ActionBarActivityDelegateBase.this.getWindowCallback()) != null && !ActionBarActivityDelegateBase.this.isDestroyed()) {
                cb.onMenuOpened(8, menuBuilder);
                return true;
            }
            return true;
        }
    }

    /* loaded from: com.android.support.appcompat-v7.21.0.0.jar:android/support/v7/app/ActionBarActivityDelegateBase$ActionMenuPresenterCallback.class */
    private final class ActionMenuPresenterCallback implements MenuPresenter.Callback {
        private ActionMenuPresenterCallback() {
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // android.support.v7.internal.view.menu.MenuPresenter.Callback
        public boolean onOpenSubMenu(MenuBuilder menuBuilder) {
            WindowCallback cb = ActionBarActivityDelegateBase.this.getWindowCallback();
            if (cb != null) {
                cb.onMenuOpened(8, menuBuilder);
                return true;
            }
            return true;
        }

        @Override // android.support.v7.internal.view.menu.MenuPresenter.Callback
        public void onCloseMenu(MenuBuilder menu, boolean allMenusAreClosing) {
            ActionBarActivityDelegateBase.this.checkCloseActionMenu(menu);
        }
    }

    /* loaded from: com.android.support.appcompat-v7.21.0.0.jar:android/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState.class */
    private static final class PanelFeatureState {
        int featureId;
        ViewGroup decorView;
        View shownPanelView;
        MenuBuilder menu;
        ListMenuPresenter listMenuPresenter;
        Context listPresenterContext;
        boolean isPrepared;
        boolean isHandled;
        boolean isOpen;
        public boolean qwertyMode;
        boolean refreshDecorView = false;
        boolean refreshMenuContent;
        boolean wasLastOpen;
        Bundle frozenMenuState;
        Bundle frozenActionViewState;

        PanelFeatureState(int featureId) {
            this.featureId = featureId;
        }

        public boolean hasPanelItems() {
            return this.shownPanelView != null && this.listMenuPresenter.getAdapter().getCount() > 0;
        }

        public void clearMenuPresenters() {
            if (this.menu != null) {
                this.menu.removeMenuPresenter(this.listMenuPresenter);
            }
            this.listMenuPresenter = null;
        }

        void setStyle(Context context) {
            TypedValue outValue = new TypedValue();
            Resources.Theme widgetTheme = context.getResources().newTheme();
            widgetTheme.setTo(context.getTheme());
            widgetTheme.resolveAttribute(android.support.v7.appcompat.R.attr.actionBarPopupTheme, outValue, true);
            if (outValue.resourceId != 0) {
                widgetTheme.applyStyle(outValue.resourceId, true);
            }
            widgetTheme.resolveAttribute(android.support.v7.appcompat.R.attr.panelMenuListTheme, outValue, true);
            if (outValue.resourceId != 0) {
                widgetTheme.applyStyle(outValue.resourceId, true);
            } else {
                widgetTheme.applyStyle(android.support.v7.appcompat.R.style.Theme_AppCompat_CompactMenu, true);
            }
            Context context2 = new ContextThemeWrapper(context, 0);
            context2.getTheme().setTo(widgetTheme);
            this.listPresenterContext = context2;
        }

        void setMenu(MenuBuilder menu) {
            if (menu == this.menu) {
                return;
            }
            if (this.menu != null) {
                this.menu.removeMenuPresenter(this.listMenuPresenter);
            }
            this.menu = menu;
            if (menu == null || this.listMenuPresenter == null) {
                return;
            }
            menu.addMenuPresenter(this.listMenuPresenter);
        }

        MenuView getListMenuView(MenuPresenter.Callback cb) {
            if (this.menu == null) {
                return null;
            }
            if (this.listMenuPresenter == null) {
                this.listMenuPresenter = new ListMenuPresenter(this.listPresenterContext, android.support.v7.appcompat.R.layout.abc_list_menu_item_layout);
                this.listMenuPresenter.setCallback(cb);
                this.menu.addMenuPresenter(this.listMenuPresenter);
            }
            MenuView result = this.listMenuPresenter.getMenuView(this.decorView);
            return result;
        }

        Parcelable onSaveInstanceState() {
            SavedState savedState = new SavedState();
            savedState.featureId = this.featureId;
            savedState.isOpen = this.isOpen;
            if (this.menu != null) {
                savedState.menuState = new Bundle();
                this.menu.savePresenterStates(savedState.menuState);
            }
            return savedState;
        }

        void onRestoreInstanceState(Parcelable state) {
            SavedState savedState = (SavedState) state;
            this.featureId = savedState.featureId;
            this.wasLastOpen = savedState.isOpen;
            this.frozenMenuState = savedState.menuState;
            this.shownPanelView = null;
            this.decorView = null;
        }

        void applyFrozenState() {
            if (this.menu != null && this.frozenMenuState != null) {
                this.menu.restorePresenterStates(this.frozenMenuState);
                this.frozenMenuState = null;
            }
        }

        /* loaded from: com.android.support.appcompat-v7.21.0.0.jar:android/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState$SavedState.class */
        private static class SavedState implements Parcelable {
            int featureId;
            boolean isOpen;
            Bundle menuState;
            public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: android.support.v7.app.ActionBarActivityDelegateBase.PanelFeatureState.SavedState.1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // android.os.Parcelable.Creator
                public SavedState createFromParcel(Parcel in) {
                    return SavedState.readFromParcel(in);
                }

                /* JADX WARN: Can't rename method to resolve collision */
                @Override // android.os.Parcelable.Creator
                public SavedState[] newArray(int size) {
                    return new SavedState[size];
                }
            };

            private SavedState() {
            }

            @Override // android.os.Parcelable
            public int describeContents() {
                return 0;
            }

            @Override // android.os.Parcelable
            public void writeToParcel(Parcel dest, int flags) {
                dest.writeInt(this.featureId);
                dest.writeInt(this.isOpen ? 1 : 0);
                if (this.isOpen) {
                    dest.writeBundle(this.menuState);
                }
            }

            /* JADX INFO: Access modifiers changed from: private */
            public static SavedState readFromParcel(Parcel source) {
                SavedState savedState = new SavedState();
                savedState.featureId = source.readInt();
                savedState.isOpen = source.readInt() == 1;
                if (savedState.isOpen) {
                    savedState.menuState = source.readBundle();
                }
                return savedState;
            }
        }
    }
}
