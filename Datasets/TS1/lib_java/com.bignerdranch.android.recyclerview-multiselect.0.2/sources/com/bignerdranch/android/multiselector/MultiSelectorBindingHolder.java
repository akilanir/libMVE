package com.bignerdranch.android.multiselector;

import android.support.v7.widget.RebindReportingHolder;
import android.view.View;

/* loaded from: com.bignerdranch.android.recyclerview-multiselect.0.2.jar:com/bignerdranch/android/multiselector/MultiSelectorBindingHolder.class */
public abstract class MultiSelectorBindingHolder extends RebindReportingHolder implements SelectableHolder {
    private final MultiSelector mMultiSelector;

    public MultiSelectorBindingHolder(View itemView, MultiSelector multiSelector) {
        super(itemView);
        this.mMultiSelector = multiSelector;
    }

    @Override // android.support.v7.widget.RebindReportingHolder
    protected void onRebind() {
        this.mMultiSelector.bindHolder(this, getAdapterPosition(), getItemId());
    }
}
