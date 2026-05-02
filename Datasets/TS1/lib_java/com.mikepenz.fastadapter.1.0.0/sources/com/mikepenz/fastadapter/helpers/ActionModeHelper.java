package com.mikepenz.fastadapter.helpers;

import android.support.annotation.MenuRes;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.view.ActionMode;
import android.view.Menu;
import android.view.MenuItem;
import com.mikepenz.fastadapter.FastAdapter;
import com.mikepenz.fastadapter.IExpandable;
import com.mikepenz.fastadapter.IItem;

/* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/helpers/ActionModeHelper.class */
public class ActionModeHelper {
    private FastAdapter mFastAdapter;

    @MenuRes
    private int mCabMenu;
    private ActionMode.Callback mInternalCallback = new ActionBarCallBack();
    private ActionMode.Callback mCallback;
    private ActionMode mActionMode;

    public ActionModeHelper(FastAdapter fastAdapter, int cabMenu) {
        this.mFastAdapter = fastAdapter;
        this.mCabMenu = cabMenu;
    }

    public ActionModeHelper(FastAdapter fastAdapter, int cabMenu, ActionMode.Callback callback) {
        this.mFastAdapter = fastAdapter;
        this.mCabMenu = cabMenu;
        this.mCallback = callback;
    }

    public ActionMode getActionMode() {
        return this.mActionMode;
    }

    public Boolean onClick(IItem item, int position) {
        if ((item instanceof IExpandable) && ((IExpandable) item).getSubItems() != null) {
            this.mFastAdapter.toggleExpandable(position);
            if (this.mActionMode != null && this.mFastAdapter.getSelections().size() == 0) {
                this.mActionMode.finish();
            }
            return true;
        }
        if (this.mActionMode != null && this.mFastAdapter.getSelections().size() == 1 && item.isSelected()) {
            this.mActionMode.finish();
            return false;
        }
        return null;
    }

    public ActionMode onLongClick(AppCompatActivity act, int position) {
        if (this.mActionMode == null && this.mFastAdapter.getItem(position).isSelectable()) {
            this.mActionMode = act.startSupportActionMode(this.mInternalCallback);
            this.mFastAdapter.select(position);
            return this.mActionMode;
        }
        return this.mActionMode;
    }

    /* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack.class */
    private class ActionBarCallBack implements ActionMode.Callback {
        private ActionBarCallBack() {
        }

        public boolean onActionItemClicked(ActionMode mode, MenuItem item) {
            boolean consumed = false;
            if (ActionModeHelper.this.mCallback != null) {
                consumed = ActionModeHelper.this.mCallback.onActionItemClicked(mode, item);
            }
            if (!consumed) {
                ActionModeHelper.this.mFastAdapter.deleteAllSelectedItems();
                mode.finish();
            }
            return consumed;
        }

        public boolean onCreateActionMode(ActionMode mode, Menu menu) {
            mode.getMenuInflater().inflate(ActionModeHelper.this.mCabMenu, menu);
            ActionModeHelper.this.mFastAdapter.withSelectOnLongClick(false);
            return ActionModeHelper.this.mCallback == null || ActionModeHelper.this.mCallback.onCreateActionMode(mode, menu);
        }

        public void onDestroyActionMode(ActionMode mode) {
            ActionModeHelper.this.mActionMode = null;
            ActionModeHelper.this.mFastAdapter.withSelectOnLongClick(true);
            ActionModeHelper.this.mFastAdapter.deselect();
            if (ActionModeHelper.this.mCallback != null) {
                ActionModeHelper.this.mCallback.onDestroyActionMode(mode);
            }
        }

        public boolean onPrepareActionMode(ActionMode mode, Menu menu) {
            return ActionModeHelper.this.mCallback != null && ActionModeHelper.this.mCallback.onPrepareActionMode(mode, menu);
        }
    }
}
