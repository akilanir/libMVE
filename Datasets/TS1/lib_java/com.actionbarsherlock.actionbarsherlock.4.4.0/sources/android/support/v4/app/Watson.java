package android.support.v4.app;

import android.view.View;
import com.actionbarsherlock.ActionBarSherlock;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.MenuInflater;
import com.actionbarsherlock.view.MenuItem;
import java.util.ArrayList;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:android/support/v4/app/Watson.class */
public abstract class Watson extends FragmentActivity implements ActionBarSherlock.OnCreatePanelMenuListener, ActionBarSherlock.OnPreparePanelListener, ActionBarSherlock.OnMenuItemSelectedListener {
    private static final String TAG = "Watson";
    private ArrayList<Fragment> mCreatedMenus;

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:android/support/v4/app/Watson$OnCreateOptionsMenuListener.class */
    public interface OnCreateOptionsMenuListener {
        void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater);
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:android/support/v4/app/Watson$OnOptionsItemSelectedListener.class */
    public interface OnOptionsItemSelectedListener {
        boolean onOptionsItemSelected(MenuItem menuItem);
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:android/support/v4/app/Watson$OnPrepareOptionsMenuListener.class */
    public interface OnPrepareOptionsMenuListener {
        void onPrepareOptionsMenu(Menu menu);
    }

    public abstract boolean onCreateOptionsMenu(Menu menu);

    public abstract boolean onPrepareOptionsMenu(Menu menu);

    public abstract boolean onOptionsItemSelected(MenuItem menuItem);

    public abstract MenuInflater getSupportMenuInflater();

    @Override // com.actionbarsherlock.ActionBarSherlock.OnCreatePanelMenuListener
    public boolean onCreatePanelMenu(int featureId, Menu menu) {
        if (featureId == 0) {
            boolean result = onCreateOptionsMenu(menu);
            MenuInflater inflater = getSupportMenuInflater();
            boolean show = false;
            ArrayList<Fragment> newMenus = null;
            if (this.mFragments.mAdded != null) {
                for (int i = 0; i < this.mFragments.mAdded.size(); i++) {
                    OnCreateOptionsMenuListener onCreateOptionsMenuListener = (Fragment) this.mFragments.mAdded.get(i);
                    if (onCreateOptionsMenuListener != null && !((Fragment) onCreateOptionsMenuListener).mHidden && ((Fragment) onCreateOptionsMenuListener).mHasMenu && ((Fragment) onCreateOptionsMenuListener).mMenuVisible && (onCreateOptionsMenuListener instanceof OnCreateOptionsMenuListener)) {
                        show = true;
                        onCreateOptionsMenuListener.onCreateOptionsMenu(menu, inflater);
                        if (newMenus == null) {
                            newMenus = new ArrayList<>();
                        }
                        newMenus.add(onCreateOptionsMenuListener);
                    }
                }
            }
            if (this.mCreatedMenus != null) {
                for (int i2 = 0; i2 < this.mCreatedMenus.size(); i2++) {
                    Fragment f = this.mCreatedMenus.get(i2);
                    if (newMenus == null || !newMenus.contains(f)) {
                        f.onDestroyOptionsMenu();
                    }
                }
            }
            this.mCreatedMenus = newMenus;
            return result | show;
        }
        return false;
    }

    @Override // com.actionbarsherlock.ActionBarSherlock.OnPreparePanelListener
    public boolean onPreparePanel(int featureId, View view, Menu menu) {
        if (featureId == 0) {
            boolean result = onPrepareOptionsMenu(menu);
            boolean show = false;
            if (this.mFragments.mAdded != null) {
                for (int i = 0; i < this.mFragments.mAdded.size(); i++) {
                    OnPrepareOptionsMenuListener onPrepareOptionsMenuListener = (Fragment) this.mFragments.mAdded.get(i);
                    if (onPrepareOptionsMenuListener != null && !((Fragment) onPrepareOptionsMenuListener).mHidden && ((Fragment) onPrepareOptionsMenuListener).mHasMenu && ((Fragment) onPrepareOptionsMenuListener).mMenuVisible && (onPrepareOptionsMenuListener instanceof OnPrepareOptionsMenuListener)) {
                        show = true;
                        onPrepareOptionsMenuListener.onPrepareOptionsMenu(menu);
                    }
                }
            }
            return (result | show) & menu.hasVisibleItems();
        }
        return false;
    }

    @Override // com.actionbarsherlock.ActionBarSherlock.OnMenuItemSelectedListener
    public boolean onMenuItemSelected(int featureId, MenuItem item) {
        if (featureId == 0) {
            if (onOptionsItemSelected(item)) {
                return true;
            }
            if (this.mFragments.mAdded != null) {
                for (int i = 0; i < this.mFragments.mAdded.size(); i++) {
                    OnOptionsItemSelectedListener onOptionsItemSelectedListener = (Fragment) this.mFragments.mAdded.get(i);
                    if (onOptionsItemSelectedListener != null && !((Fragment) onOptionsItemSelectedListener).mHidden && ((Fragment) onOptionsItemSelectedListener).mHasMenu && ((Fragment) onOptionsItemSelectedListener).mMenuVisible && (onOptionsItemSelectedListener instanceof OnOptionsItemSelectedListener) && onOptionsItemSelectedListener.onOptionsItemSelected(item)) {
                        return true;
                    }
                }
                return false;
            }
            return false;
        }
        return false;
    }
}
