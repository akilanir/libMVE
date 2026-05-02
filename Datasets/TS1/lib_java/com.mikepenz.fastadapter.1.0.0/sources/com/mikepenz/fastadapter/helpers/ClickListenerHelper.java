package com.mikepenz.fastadapter.helpers;

import android.support.annotation.IdRes;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import com.mikepenz.fastadapter.FastAdapter;
import com.mikepenz.fastadapter.IItem;

/* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/helpers/ClickListenerHelper.class */
public class ClickListenerHelper<Item extends IItem> {
    private FastAdapter<Item> mFastAdapter;

    /* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/helpers/ClickListenerHelper$OnClickListener.class */
    public interface OnClickListener<Item extends IItem> {
        void onClick(View view, int i, Item item);
    }

    public ClickListenerHelper(FastAdapter<Item> fastAdapter) {
        this.mFastAdapter = fastAdapter;
    }

    public void listen(final RecyclerView.ViewHolder viewHolder, View view, final OnClickListener onClickListener) {
        view.setOnClickListener(new View.OnClickListener() { // from class: com.mikepenz.fastadapter.helpers.ClickListenerHelper.1
            /* JADX WARN: Multi-variable type inference failed */
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                int pos = viewHolder.getAdapterPosition();
                if (pos != -1) {
                    onClickListener.onClick(v, pos, ClickListenerHelper.this.mFastAdapter.getItem(pos));
                }
            }
        });
    }

    public void listen(final RecyclerView.ViewHolder viewHolder, @IdRes int viewId, final OnClickListener onClickListener) {
        viewHolder.itemView.findViewById(viewId).setOnClickListener(new View.OnClickListener() { // from class: com.mikepenz.fastadapter.helpers.ClickListenerHelper.2
            /* JADX WARN: Multi-variable type inference failed */
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                int pos = viewHolder.getAdapterPosition();
                if (pos != -1) {
                    onClickListener.onClick(v, pos, ClickListenerHelper.this.mFastAdapter.getItem(pos));
                }
            }
        });
    }
}
