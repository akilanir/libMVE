package com.actionbarsherlock.app;

import android.app.Activity;
import android.support.v4.app.ListFragment;
import android.support.v4.app.Watson;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import com.actionbarsherlock.internal.view.menu.MenuItemWrapper;
import com.actionbarsherlock.internal.view.menu.MenuWrapper;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/app/SherlockListFragment.class */
public class SherlockListFragment extends ListFragment implements Watson.OnCreateOptionsMenuListener, Watson.OnPrepareOptionsMenuListener, Watson.OnOptionsItemSelectedListener {
    private SherlockFragmentActivity mActivity;

    public SherlockFragmentActivity getSherlockActivity() {
        return this.mActivity;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void onAttach(Activity activity) {
        if (!(activity instanceof SherlockFragmentActivity)) {
            throw new IllegalStateException(getClass().getSimpleName() + " must be attached to a SherlockFragmentActivity.");
        }
        this.mActivity = (SherlockFragmentActivity) activity;
        super.onAttach(activity);
    }

    public void onDetach() {
        this.mActivity = null;
        super.onDetach();
    }

    public final void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        onCreateOptionsMenu(new MenuWrapper(menu), this.mActivity.getSupportMenuInflater());
    }

    @Override // android.support.v4.app.Watson.OnCreateOptionsMenuListener
    public void onCreateOptionsMenu(com.actionbarsherlock.view.Menu menu, com.actionbarsherlock.view.MenuInflater inflater) {
    }

    public final void onPrepareOptionsMenu(Menu menu) {
        onPrepareOptionsMenu(new MenuWrapper(menu));
    }

    @Override // android.support.v4.app.Watson.OnPrepareOptionsMenuListener
    public void onPrepareOptionsMenu(com.actionbarsherlock.view.Menu menu) {
    }

    public final boolean onOptionsItemSelected(MenuItem item) {
        return onOptionsItemSelected(new MenuItemWrapper(item));
    }

    @Override // android.support.v4.app.Watson.OnOptionsItemSelectedListener
    public boolean onOptionsItemSelected(com.actionbarsherlock.view.MenuItem item) {
        return false;
    }
}
