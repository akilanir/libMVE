package android.support.v7.util;

import android.support.v7.util.TileList;

/* loaded from: com.android.support.recyclerview-v7.23.3.0.jar:android/support/v7/util/ThreadUtil.class */
interface ThreadUtil<T> {

    /* loaded from: com.android.support.recyclerview-v7.23.3.0.jar:android/support/v7/util/ThreadUtil$BackgroundCallback.class */
    public interface BackgroundCallback<T> {
        void refresh(int i);

        void updateRange(int i, int i2, int i3, int i4, int i5);

        void loadTile(int i, int i2);

        void recycleTile(TileList.Tile<T> tile);
    }

    /* loaded from: com.android.support.recyclerview-v7.23.3.0.jar:android/support/v7/util/ThreadUtil$MainThreadCallback.class */
    public interface MainThreadCallback<T> {
        void updateItemCount(int i, int i2);

        void addTile(int i, TileList.Tile<T> tile);

        void removeTile(int i, int i2);
    }

    MainThreadCallback<T> getMainThreadProxy(MainThreadCallback<T> mainThreadCallback);

    BackgroundCallback<T> getBackgroundProxy(BackgroundCallback<T> backgroundCallback);
}
