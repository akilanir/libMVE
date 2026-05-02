package android.support.v7.internal.app;

import android.support.v7.app.ActionBar;
import android.view.View;
import android.widget.AdapterView;

/* loaded from: com.android.support.appcompat-v7.23.0.1.jar:android/support/v7/internal/app/NavItemSelectedListener.class */
class NavItemSelectedListener implements AdapterView.OnItemSelectedListener {
    private final ActionBar.OnNavigationListener mListener;

    public NavItemSelectedListener(ActionBar.OnNavigationListener listener) {
        this.mListener = listener;
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
        if (this.mListener != null) {
            this.mListener.onNavigationItemSelected(position, id);
        }
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public void onNothingSelected(AdapterView<?> parent) {
    }
}
