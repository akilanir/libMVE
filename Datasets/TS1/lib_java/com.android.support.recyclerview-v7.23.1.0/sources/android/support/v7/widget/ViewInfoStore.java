package android.support.v7.widget;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.ArrayMap;
import android.support.v4.util.LongSparseArray;
import android.support.v4.util.Pools;
import android.support.v7.widget.RecyclerView;

/* loaded from: com.android.support.recyclerview-v7.23.1.0.jar:android/support/v7/widget/ViewInfoStore.class */
class ViewInfoStore {
    private static final boolean DEBUG = false;
    final ArrayMap<RecyclerView.ViewHolder, InfoRecord> mLayoutHolderMap = new ArrayMap<>();
    final LongSparseArray<RecyclerView.ViewHolder> mOldChangedHolders = new LongSparseArray<>();

    /* loaded from: com.android.support.recyclerview-v7.23.1.0.jar:android/support/v7/widget/ViewInfoStore$ProcessCallback.class */
    interface ProcessCallback {
        void processDisappeared(RecyclerView.ViewHolder viewHolder, RecyclerView.ItemAnimator.ItemHolderInfo itemHolderInfo, @Nullable RecyclerView.ItemAnimator.ItemHolderInfo itemHolderInfo2);

        void processAppeared(RecyclerView.ViewHolder viewHolder, @Nullable RecyclerView.ItemAnimator.ItemHolderInfo itemHolderInfo, RecyclerView.ItemAnimator.ItemHolderInfo itemHolderInfo2);

        void processPersistent(RecyclerView.ViewHolder viewHolder, @NonNull RecyclerView.ItemAnimator.ItemHolderInfo itemHolderInfo, @NonNull RecyclerView.ItemAnimator.ItemHolderInfo itemHolderInfo2);

        void unused(RecyclerView.ViewHolder viewHolder);
    }

    ViewInfoStore() {
    }

    void clear() {
        this.mLayoutHolderMap.clear();
        this.mOldChangedHolders.clear();
    }

    void addToPreLayout(RecyclerView.ViewHolder holder, RecyclerView.ItemAnimator.ItemHolderInfo info) {
        InfoRecord record = (InfoRecord) this.mLayoutHolderMap.get(holder);
        if (record == null) {
            record = InfoRecord.obtain();
            this.mLayoutHolderMap.put(holder, record);
        }
        record.preInfo = info;
        record.flags |= 4;
    }

    @Nullable
    RecyclerView.ItemAnimator.ItemHolderInfo popFromPreLayout(RecyclerView.ViewHolder vh) {
        InfoRecord record;
        int index = this.mLayoutHolderMap.indexOfKey(vh);
        if (index >= 0 && (record = (InfoRecord) this.mLayoutHolderMap.valueAt(index)) != null && (record.flags & 4) != 0) {
            record.flags &= -5;
            RecyclerView.ItemAnimator.ItemHolderInfo info = record.preInfo;
            if (record.flags == 0) {
                this.mLayoutHolderMap.removeAt(index);
                InfoRecord.recycle(record);
            }
            return info;
        }
        return null;
    }

    void addToOldChangeHolders(long key, RecyclerView.ViewHolder holder) {
        this.mOldChangedHolders.put(key, holder);
    }

    void addToAppearedInPreLayoutHolders(RecyclerView.ViewHolder holder, RecyclerView.ItemAnimator.ItemHolderInfo info) {
        InfoRecord record = (InfoRecord) this.mLayoutHolderMap.get(holder);
        if (record == null) {
            record = InfoRecord.obtain();
            this.mLayoutHolderMap.put(holder, record);
        }
        record.flags |= 2;
        record.preInfo = info;
    }

    boolean isInPreLayout(RecyclerView.ViewHolder viewHolder) {
        InfoRecord record = (InfoRecord) this.mLayoutHolderMap.get(viewHolder);
        return (record == null || (record.flags & 4) == 0) ? false : true;
    }

    RecyclerView.ViewHolder getFromOldChangeHolders(long key) {
        return (RecyclerView.ViewHolder) this.mOldChangedHolders.get(key);
    }

    void addToPostLayout(RecyclerView.ViewHolder holder, RecyclerView.ItemAnimator.ItemHolderInfo info) {
        InfoRecord record = (InfoRecord) this.mLayoutHolderMap.get(holder);
        if (record == null) {
            record = InfoRecord.obtain();
            this.mLayoutHolderMap.put(holder, record);
        }
        record.postInfo = info;
        record.flags |= 8;
    }

    void addToDisappearedInLayout(RecyclerView.ViewHolder holder) {
        InfoRecord record = (InfoRecord) this.mLayoutHolderMap.get(holder);
        if (record == null) {
            record = InfoRecord.obtain();
            this.mLayoutHolderMap.put(holder, record);
        }
        record.flags |= 1;
    }

    void removeFromDisappearedInLayout(RecyclerView.ViewHolder holder) {
        InfoRecord record = (InfoRecord) this.mLayoutHolderMap.get(holder);
        if (record == null) {
            return;
        }
        record.flags &= -2;
    }

    void process(ProcessCallback callback) {
        for (int index = this.mLayoutHolderMap.size() - 1; index >= 0; index--) {
            RecyclerView.ViewHolder viewHolder = (RecyclerView.ViewHolder) this.mLayoutHolderMap.keyAt(index);
            InfoRecord record = (InfoRecord) this.mLayoutHolderMap.removeAt(index);
            if ((record.flags & 3) == 3) {
                callback.unused(viewHolder);
            } else if ((record.flags & 1) != 0) {
                callback.processDisappeared(viewHolder, record.preInfo, record.postInfo);
            } else if ((record.flags & 14) == 14) {
                callback.processAppeared(viewHolder, record.preInfo, record.postInfo);
            } else if ((record.flags & 12) == 12) {
                callback.processPersistent(viewHolder, record.preInfo, record.postInfo);
            } else if ((record.flags & 4) != 0) {
                callback.processDisappeared(viewHolder, record.preInfo, null);
            } else if ((record.flags & 8) != 0) {
                callback.processAppeared(viewHolder, record.preInfo, record.postInfo);
            } else if ((record.flags & 2) != 0) {
            }
            InfoRecord.recycle(record);
        }
    }

    void removeViewHolder(RecyclerView.ViewHolder holder) {
        int i = this.mOldChangedHolders.size() - 1;
        while (true) {
            if (i < 0) {
                break;
            }
            if (holder != this.mOldChangedHolders.valueAt(i)) {
                i--;
            } else {
                this.mOldChangedHolders.removeAt(i);
                break;
            }
        }
        InfoRecord info = (InfoRecord) this.mLayoutHolderMap.remove(holder);
        if (info != null) {
            InfoRecord.recycle(info);
        }
    }

    void onDetach() {
        InfoRecord.drainCache();
    }

    /* loaded from: com.android.support.recyclerview-v7.23.1.0.jar:android/support/v7/widget/ViewInfoStore$InfoRecord.class */
    static class InfoRecord {
        static final int FLAG_DISAPPEARED = 1;
        static final int FLAG_APPEAR = 2;
        static final int FLAG_PRE = 4;
        static final int FLAG_POST = 8;
        static final int FLAG_APPEAR_AND_DISAPPEAR = 3;
        static final int FLAG_PRE_AND_POST = 12;
        static final int FLAG_APPEAR_PRE_AND_POST = 14;
        int flags;

        @Nullable
        RecyclerView.ItemAnimator.ItemHolderInfo preInfo;

        @Nullable
        RecyclerView.ItemAnimator.ItemHolderInfo postInfo;
        static Pools.Pool<InfoRecord> sPool = new Pools.SimplePool(20);

        private InfoRecord() {
        }

        static InfoRecord obtain() {
            InfoRecord record = (InfoRecord) sPool.acquire();
            return record == null ? new InfoRecord() : record;
        }

        static void recycle(InfoRecord record) {
            record.flags = 0;
            record.preInfo = null;
            record.postInfo = null;
            sPool.release(record);
        }

        static void drainCache() {
            while (sPool.acquire() != null) {
            }
        }
    }
}
