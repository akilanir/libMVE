package com.bignerdranch.android.multiselector;

/* loaded from: com.bignerdranch.android.recyclerview-multiselect.0.2.jar:com/bignerdranch/android/multiselector/SelectableHolder.class */
public interface SelectableHolder {
    void setSelectable(boolean z);

    boolean isSelectable();

    void setActivated(boolean z);

    boolean isActivated();

    int getAdapterPosition();

    long getItemId();
}
