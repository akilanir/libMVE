package com.actionbarsherlock.view;

import android.view.View;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/view/ActionMode.class */
public abstract class ActionMode {
    private Object mTag;

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/view/ActionMode$Callback.class */
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

    public boolean isUiFocusable() {
        return true;
    }
}
