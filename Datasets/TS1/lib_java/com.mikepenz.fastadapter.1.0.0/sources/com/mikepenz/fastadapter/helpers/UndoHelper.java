package com.mikepenz.fastadapter.helpers;

import android.support.design.widget.Snackbar;
import android.view.View;
import com.mikepenz.fastadapter.FastAdapter;
import com.mikepenz.fastadapter.IItem;
import com.mikepenz.fastadapter.IItemAdapter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;

/* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/helpers/UndoHelper.class */
public class UndoHelper<Item extends IItem> {
    private static final int ACTION_REMOVE = 2;
    private FastAdapter<Item> mAdapter;
    private UndoListener mUndoListener;
    private UndoHelper<Item>.History mHistory = null;

    /* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/helpers/UndoHelper$UndoListener.class */
    public interface UndoListener<Item extends IItem> {
        void commitRemove(Set<Integer> set, ArrayList<FastAdapter.RelativeInfo<Item>> arrayList);
    }

    public UndoHelper(FastAdapter adapter, UndoListener undoListener) {
        this.mAdapter = adapter;
        this.mUndoListener = undoListener;
    }

    public Snackbar remove(View view, String text, String actionText, int duration, Set<Integer> positions) {
        if (this.mHistory != null) {
            notifyCommit();
        }
        UndoHelper<Item>.History history = new History();
        history.positions = positions;
        history.action = ACTION_REMOVE;
        Iterator<Integer> it = positions.iterator();
        while (it.hasNext()) {
            int position = it.next().intValue();
            history.items.add(this.mAdapter.getRelativeInfo(position));
        }
        this.mHistory = history;
        Snackbar snackbar = Snackbar.make(view, text, duration).setCallback(new Snackbar.Callback() { // from class: com.mikepenz.fastadapter.helpers.UndoHelper.2
            public void onDismissed(Snackbar snackbar2, int event) {
                super.onDismissed(snackbar2, event);
                switch (event) {
                    case UndoHelper.ACTION_REMOVE /* 2 */:
                        UndoHelper.this.notifyCommit();
                        break;
                }
            }

            public void onShown(Snackbar snackbar2) {
                super.onShown(snackbar2);
                UndoHelper.this.doChange();
            }
        }).setAction(actionText, new View.OnClickListener() { // from class: com.mikepenz.fastadapter.helpers.UndoHelper.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                UndoHelper.this.undoChange();
            }
        });
        snackbar.show();
        return snackbar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyCommit() {
        if (this.mHistory != null && this.mHistory.action == ACTION_REMOVE) {
            this.mUndoListener.commitRemove(this.mHistory.positions, this.mHistory.items);
            this.mHistory = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doChange() {
        if (this.mHistory != null && this.mHistory.action == ACTION_REMOVE) {
            Integer[] positions = new Integer[this.mHistory.positions.size()];
            this.mHistory.positions.toArray(positions);
            for (int i = positions.length - 1; i >= 0; i--) {
                FastAdapter.RelativeInfo<Item> relativeInfo = this.mHistory.items.get(i);
                if (relativeInfo.adapter instanceof IItemAdapter) {
                    ((IItemAdapter) relativeInfo.adapter).remove(positions[i].intValue());
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void undoChange() {
        if (this.mHistory != null && this.mHistory.action == ACTION_REMOVE) {
            int count = 0;
            for (Integer position : this.mHistory.positions) {
                FastAdapter.RelativeInfo<Item> relativeInfo = this.mHistory.items.get(count);
                if (relativeInfo.adapter instanceof IItemAdapter) {
                    IItemAdapter<Item> adapter = (IItemAdapter) relativeInfo.adapter;
                    adapter.add(position.intValue(), relativeInfo.item);
                    if (relativeInfo.item.isSelected()) {
                        this.mAdapter.select(position.intValue());
                    }
                }
                count++;
            }
        }
        this.mHistory = null;
    }

    /* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/helpers/UndoHelper$History.class */
    private class History {
        public int action;
        public Set<Integer> positions;
        public ArrayList<FastAdapter.RelativeInfo<Item>> items;

        private History() {
            this.items = new ArrayList<>();
        }
    }
}
