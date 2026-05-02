package com.mikepenz.fastadapter.drag;

import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.helper.ItemTouchHelper;

/* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/drag/SimpleDragCallback.class */
public class SimpleDragCallback extends ItemTouchHelper.SimpleCallback {
    private ItemTouchCallback mCallbackItemTouch;
    private boolean mIsDragEnabled;

    public SimpleDragCallback(ItemTouchCallback itemTouchCallback) {
        super(3, 0);
        this.mIsDragEnabled = true;
        this.mCallbackItemTouch = itemTouchCallback;
    }

    public void setIsDragEnabled(boolean mIsDragEnabled) {
        this.mIsDragEnabled = mIsDragEnabled;
    }

    public boolean isLongPressDragEnabled() {
        return this.mIsDragEnabled;
    }

    public boolean onMove(RecyclerView recyclerView, RecyclerView.ViewHolder viewHolder, RecyclerView.ViewHolder target) {
        return this.mCallbackItemTouch.itemTouchOnMove(viewHolder.getAdapterPosition(), target.getAdapterPosition());
    }

    public void onSwiped(RecyclerView.ViewHolder viewHolder, int direction) {
    }
}
