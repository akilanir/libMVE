package com.bignerdranch.android.multiselector;

import android.os.Bundle;
import android.util.SparseBooleanArray;
import java.util.ArrayList;
import java.util.List;

/* loaded from: com.bignerdranch.android.recyclerview-multiselect.0.2.jar:com/bignerdranch/android/multiselector/MultiSelector.class */
public class MultiSelector {
    private static final String SELECTION_POSITIONS = "position";
    private static final String SELECTIONS_STATE = "state";
    private SparseBooleanArray mSelections = new SparseBooleanArray();
    private WeakHolderTracker mTracker = new WeakHolderTracker();
    private boolean mIsSelectable;

    public boolean isSelectable() {
        return this.mIsSelectable;
    }

    public void setSelectable(boolean isSelectable) {
        this.mIsSelectable = isSelectable;
        refreshAllHolders();
    }

    public void setSelected(SelectableHolder holder, boolean isSelected) {
        setSelected(holder.getAdapterPosition(), holder.getItemId(), isSelected);
    }

    public void setSelected(int position, long id, boolean isSelected) {
        this.mSelections.put(position, isSelected);
        refreshHolder(this.mTracker.getHolder(position));
    }

    public boolean isSelected(int position, long id) {
        return this.mSelections.get(position);
    }

    public void clearSelections() {
        this.mSelections.clear();
        refreshAllHolders();
    }

    public List<Integer> getSelectedPositions() {
        List<Integer> positions = new ArrayList<>();
        for (int i = 0; i < this.mSelections.size(); i++) {
            if (this.mSelections.valueAt(i)) {
                positions.add(Integer.valueOf(this.mSelections.keyAt(i)));
            }
        }
        return positions;
    }

    public void bindHolder(SelectableHolder holder, int position, long id) {
        this.mTracker.bindHolder(holder, position);
        refreshHolder(holder);
    }

    public boolean tapSelection(SelectableHolder holder) {
        return tapSelection(holder.getAdapterPosition(), holder.getItemId());
    }

    public boolean tapSelection(int position, long itemId) {
        if (this.mIsSelectable) {
            boolean isSelected = isSelected(position, itemId);
            setSelected(position, itemId, !isSelected);
            return true;
        }
        return false;
    }

    public void refreshAllHolders() {
        for (SelectableHolder holder : this.mTracker.getTrackedHolders()) {
            refreshHolder(holder);
        }
    }

    private void refreshHolder(SelectableHolder holder) {
        if (holder == null) {
            return;
        }
        holder.setSelectable(this.mIsSelectable);
        boolean isActivated = this.mSelections.get(holder.getAdapterPosition());
        holder.setActivated(isActivated);
    }

    public Bundle saveSelectionStates() {
        Bundle information = new Bundle();
        information.putIntegerArrayList(SELECTION_POSITIONS, (ArrayList) getSelectedPositions());
        information.putBoolean(SELECTIONS_STATE, isSelectable());
        return information;
    }

    public void restoreSelectionStates(Bundle savedStates) {
        List<Integer> selectedPositions = savedStates.getIntegerArrayList(SELECTION_POSITIONS);
        restoreSelections(selectedPositions);
        this.mIsSelectable = savedStates.getBoolean(SELECTIONS_STATE);
    }

    private void restoreSelections(List<Integer> selected) {
        if (selected == null) {
            return;
        }
        this.mSelections.clear();
        for (int i = 0; i < selected.size(); i++) {
            int position = selected.get(i).intValue();
            this.mSelections.put(position, true);
        }
        refreshAllHolders();
    }
}
