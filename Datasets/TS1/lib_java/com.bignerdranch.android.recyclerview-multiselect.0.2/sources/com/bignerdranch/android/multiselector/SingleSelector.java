package com.bignerdranch.android.multiselector;

/* loaded from: com.bignerdranch.android.recyclerview-multiselect.0.2.jar:com/bignerdranch/android/multiselector/SingleSelector.class */
public class SingleSelector extends MultiSelector {
    @Override // com.bignerdranch.android.multiselector.MultiSelector
    public void setSelected(int position, long id, boolean isSelected) {
        if (isSelected) {
            for (Integer selectedPosition : getSelectedPositions()) {
                if (selectedPosition.intValue() != position) {
                    super.setSelected(selectedPosition.intValue(), 0L, false);
                }
            }
        }
        super.setSelected(position, id, isSelected);
    }
}
