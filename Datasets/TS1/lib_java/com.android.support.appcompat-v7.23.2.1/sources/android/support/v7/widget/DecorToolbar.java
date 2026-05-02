package android.support.v7.widget;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Parcelable;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.support.v7.view.menu.MenuBuilder;
import android.support.v7.view.menu.MenuPresenter;
import android.util.SparseArray;
import android.view.Menu;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.SpinnerAdapter;

/* loaded from: com.android.support.appcompat-v7.23.2.1.jar:android/support/v7/widget/DecorToolbar.class */
public interface DecorToolbar {
    ViewGroup getViewGroup();

    Context getContext();

    boolean hasExpandedActionView();

    void collapseActionView();

    void setWindowCallback(Window.Callback callback);

    void setWindowTitle(CharSequence charSequence);

    CharSequence getTitle();

    void setTitle(CharSequence charSequence);

    CharSequence getSubtitle();

    void setSubtitle(CharSequence charSequence);

    void initProgress();

    void initIndeterminateProgress();

    boolean hasIcon();

    boolean hasLogo();

    void setIcon(int i);

    void setIcon(Drawable drawable);

    void setLogo(int i);

    void setLogo(Drawable drawable);

    boolean canShowOverflowMenu();

    boolean isOverflowMenuShowing();

    boolean isOverflowMenuShowPending();

    boolean showOverflowMenu();

    boolean hideOverflowMenu();

    void setMenuPrepared();

    void setMenu(Menu menu, MenuPresenter.Callback callback);

    void dismissPopupMenus();

    int getDisplayOptions();

    void setDisplayOptions(int i);

    void setEmbeddedTabView(ScrollingTabContainerView scrollingTabContainerView);

    boolean hasEmbeddedTabs();

    boolean isTitleTruncated();

    void setCollapsible(boolean z);

    void setHomeButtonEnabled(boolean z);

    int getNavigationMode();

    void setNavigationMode(int i);

    void setDropdownParams(SpinnerAdapter spinnerAdapter, AdapterView.OnItemSelectedListener onItemSelectedListener);

    void setDropdownSelectedPosition(int i);

    int getDropdownSelectedPosition();

    int getDropdownItemCount();

    void setCustomView(View view);

    View getCustomView();

    void animateToVisibility(int i);

    ViewPropertyAnimatorCompat setupAnimatorToVisibility(int i, long j);

    void setNavigationIcon(Drawable drawable);

    void setNavigationIcon(int i);

    void setNavigationContentDescription(CharSequence charSequence);

    void setNavigationContentDescription(int i);

    void setDefaultNavigationContentDescription(int i);

    void setDefaultNavigationIcon(Drawable drawable);

    void saveHierarchyState(SparseArray<Parcelable> sparseArray);

    void restoreHierarchyState(SparseArray<Parcelable> sparseArray);

    void setBackgroundDrawable(Drawable drawable);

    int getHeight();

    void setVisibility(int i);

    int getVisibility();

    void setMenuCallbacks(MenuPresenter.Callback callback, MenuBuilder.Callback callback2);

    Menu getMenu();
}
