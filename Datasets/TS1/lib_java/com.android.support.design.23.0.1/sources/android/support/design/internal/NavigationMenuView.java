package android.support.design.internal;

import android.content.Context;
import android.support.v7.internal.view.menu.MenuBuilder;
import android.support.v7.internal.view.menu.MenuView;
import android.util.AttributeSet;
import android.widget.ListView;

/* loaded from: com.android.support.design.23.0.1.jar:android/support/design/internal/NavigationMenuView.class */
public class NavigationMenuView extends ListView implements MenuView {
    public NavigationMenuView(Context context) {
        this(context, null);
    }

    public NavigationMenuView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public NavigationMenuView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public void initialize(MenuBuilder menu) {
    }

    public int getWindowAnimations() {
        return 0;
    }
}
