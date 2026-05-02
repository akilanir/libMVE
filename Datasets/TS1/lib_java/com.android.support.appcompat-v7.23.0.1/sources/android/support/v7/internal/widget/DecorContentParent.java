package android.support.v7.internal.widget;

import android.graphics.drawable.Drawable;
import android.os.Parcelable;
import android.support.v7.internal.view.menu.MenuPresenter;
import android.util.SparseArray;
import android.view.Menu;
import android.view.Window;

/* loaded from: com.android.support.appcompat-v7.23.0.1.jar:android/support/v7/internal/widget/DecorContentParent.class */
public interface DecorContentParent {
    void setWindowCallback(Window.Callback callback);

    void setWindowTitle(CharSequence charSequence);

    CharSequence getTitle();

    void initFeature(int i);

    void setUiOptions(int i);

    boolean hasIcon();

    boolean hasLogo();

    void setIcon(int i);

    void setIcon(Drawable drawable);

    void setLogo(int i);

    boolean canShowOverflowMenu();

    boolean isOverflowMenuShowing();

    boolean isOverflowMenuShowPending();

    boolean showOverflowMenu();

    boolean hideOverflowMenu();

    void setMenuPrepared();

    void setMenu(Menu menu, MenuPresenter.Callback callback);

    void saveToolbarHierarchyState(SparseArray<Parcelable> sparseArray);

    void restoreToolbarHierarchyState(SparseArray<Parcelable> sparseArray);

    void dismissPopups();
}
