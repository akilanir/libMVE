package com.nononsenseapps.filepicker;

import android.net.Uri;
import android.support.v4.content.Loader;
import android.support.v7.util.SortedList;
import android.support.v7.widget.RecyclerView;
import android.view.ViewGroup;

/* loaded from: com.nononsenseapps.filepicker.2.5.0.jar:com/nononsenseapps/filepicker/LogicHandler.class */
public interface LogicHandler<T> {
    public static final int VIEWTYPE_HEADER = 0;
    public static final int VIEWTYPE_DIR = 1;
    public static final int VIEWTYPE_CHECKABLE = 2;

    boolean isDir(T t);

    String getName(T t);

    Uri toUri(T t);

    T getParent(T t);

    String getFullPath(T t);

    T getPath(String str);

    T getRoot();

    Loader<SortedList<T>> getLoader();

    void onBindHeaderViewHolder(AbstractFilePickerFragment<T>.HeaderViewHolder headerViewHolder);

    RecyclerView.ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i);

    void onBindViewHolder(AbstractFilePickerFragment<T>.DirViewHolder dirViewHolder, int i, T t);

    int getItemViewType(int i, T t);
}
