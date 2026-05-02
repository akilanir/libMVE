package com.nononsenseapps.filepicker;

import android.support.v7.util.SortedList;
import android.support.v7.widget.RecyclerView;
import android.view.ViewGroup;
import com.nononsenseapps.filepicker.AbstractFilePickerFragment;

/* loaded from: com.nononsenseapps.filepicker.2.5.0.jar:com/nononsenseapps/filepicker/FileItemAdapter.class */
public class FileItemAdapter<T> extends RecyclerView.Adapter<RecyclerView.ViewHolder> {
    private final LogicHandler<T> mLogic;
    private SortedList<T> mList = null;

    public FileItemAdapter(LogicHandler<T> logic) {
        this.mLogic = logic;
    }

    public void setList(SortedList<T> list) {
        this.mList = list;
        notifyDataSetChanged();
    }

    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        return this.mLogic.onCreateViewHolder(parent, viewType);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int i) {
        if (i == 0) {
            this.mLogic.onBindHeaderViewHolder((AbstractFilePickerFragment.HeaderViewHolder) viewHolder);
        } else {
            int i2 = i - 1;
            this.mLogic.onBindViewHolder((AbstractFilePickerFragment.DirViewHolder) viewHolder, i2, this.mList.get(i2));
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public int getItemViewType(int i) {
        if (0 == i) {
            return 0;
        }
        int i2 = i - 1;
        return this.mLogic.getItemViewType(i2, this.mList.get(i2));
    }

    public int getItemCount() {
        if (this.mList == null) {
            return 0;
        }
        return 1 + this.mList.size();
    }
}
