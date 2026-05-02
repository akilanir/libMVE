package com.bignerdranch.android.multiselector;

import android.support.v7.view.ActionMode;
import android.view.Menu;

/* loaded from: com.bignerdranch.android.recyclerview-multiselect.0.2.jar:com/bignerdranch/android/multiselector/ModalMultiSelectorCallback.class */
public abstract class ModalMultiSelectorCallback implements ActionMode.Callback {
    private MultiSelector mMultiSelector;
    private static final String TAG = "modalMultiSelectorCallback";
    private boolean mClearOnPrepare = true;

    public ModalMultiSelectorCallback(MultiSelector multiSelector) {
        this.mMultiSelector = multiSelector;
    }

    public boolean shouldClearOnPrepare() {
        return this.mClearOnPrepare;
    }

    public void setClearOnPrepare(boolean clearOnPrepare) {
        this.mClearOnPrepare = clearOnPrepare;
    }

    public MultiSelector getMultiSelector() {
        return this.mMultiSelector;
    }

    public void setMultiSelector(MultiSelector multiSelector) {
        this.mMultiSelector = multiSelector;
    }

    public boolean onPrepareActionMode(ActionMode actionMode, Menu menu) {
        return false;
    }

    public boolean onCreateActionMode(ActionMode actionMode, Menu menu) {
        if (this.mClearOnPrepare) {
            this.mMultiSelector.clearSelections();
        }
        this.mMultiSelector.setSelectable(true);
        return false;
    }

    public void onDestroyActionMode(ActionMode actionMode) {
        this.mMultiSelector.setSelectable(false);
    }
}
