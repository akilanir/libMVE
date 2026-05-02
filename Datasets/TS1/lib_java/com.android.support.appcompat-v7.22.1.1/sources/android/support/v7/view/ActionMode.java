package android.support.v7.view;

import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;

/* loaded from: com.android.support.appcompat-v7.22.1.1.jar:android/support/v7/view/ActionMode.class */
public abstract class ActionMode {
    private Object mTag;
    private boolean mTitleOptionalHint;

    /* loaded from: com.android.support.appcompat-v7.22.1.1.jar:android/support/v7/view/ActionMode$Callback.class */
    public interface Callback {
        boolean onCreateActionMode(ActionMode actionMode, Menu menu);

        boolean onPrepareActionMode(ActionMode actionMode, Menu menu);

        boolean onActionItemClicked(ActionMode actionMode, MenuItem menuItem);

        void onDestroyActionMode(ActionMode actionMode);
    }

    public abstract void setTitle(CharSequence charSequence);

    public abstract void setTitle(int i);

    public abstract void setSubtitle(CharSequence charSequence);

    public abstract void setSubtitle(int i);

    public abstract void setCustomView(View view);

    public abstract void invalidate();

    public abstract void finish();

    public abstract Menu getMenu();

    public abstract CharSequence getTitle();

    public abstract CharSequence getSubtitle();

    public abstract View getCustomView();

    public abstract MenuInflater getMenuInflater();

    public void setTag(Object tag) {
        this.mTag = tag;
    }

    public Object getTag() {
        return this.mTag;
    }

    public void setTitleOptionalHint(boolean titleOptional) {
        this.mTitleOptionalHint = titleOptional;
    }

    public boolean getTitleOptionalHint() {
        return this.mTitleOptionalHint;
    }

    public boolean isTitleOptional() {
        return false;
    }

    public boolean isUiFocusable() {
        return true;
    }
}
