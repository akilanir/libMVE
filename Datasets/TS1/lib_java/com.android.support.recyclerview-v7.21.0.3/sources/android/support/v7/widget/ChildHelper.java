package android.support.v7.widget;

import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.List;

/* loaded from: com.android.support.recyclerview-v7.21.0.3.jar:android/support/v7/widget/ChildHelper.class */
class ChildHelper {
    private static final boolean DEBUG = false;
    private static final String TAG = "ChildrenHelper";
    final Callback mCallback;
    final Bucket mBucket = new Bucket();
    final List<View> mHiddenViews = new ArrayList();

    /* loaded from: com.android.support.recyclerview-v7.21.0.3.jar:android/support/v7/widget/ChildHelper$Callback.class */
    interface Callback {
        int getChildCount();

        void addView(View view, int i);

        int indexOfChild(View view);

        void removeViewAt(int i);

        View getChildAt(int i);

        void removeAllViews();

        RecyclerView.ViewHolder getChildViewHolder(View view);

        void attachViewToParent(View view, int i, ViewGroup.LayoutParams layoutParams);

        void detachViewFromParent(int i);
    }

    ChildHelper(Callback callback) {
        this.mCallback = callback;
    }

    void addView(View child, boolean hidden) {
        addView(child, -1, hidden);
    }

    void addView(View child, int index, boolean hidden) {
        int offset;
        if (index < 0) {
            offset = this.mCallback.getChildCount();
        } else {
            offset = getOffset(index);
        }
        this.mCallback.addView(child, offset);
        this.mBucket.insert(offset, hidden);
        if (hidden) {
            this.mHiddenViews.add(child);
        }
    }

    private int getOffset(int index) {
        if (index < 0) {
            return -1;
        }
        int limit = this.mCallback.getChildCount();
        int i = index;
        while (true) {
            int offset = i;
            if (offset < limit) {
                int removedBefore = this.mBucket.countOnesBefore(offset);
                int diff = index - (offset - removedBefore);
                if (diff == 0) {
                    while (this.mBucket.get(offset)) {
                        offset++;
                    }
                    return offset;
                }
                i = offset + diff;
            } else {
                return -1;
            }
        }
    }

    void removeView(View view) {
        int index = this.mCallback.indexOfChild(view);
        if (index < 0) {
            return;
        }
        this.mCallback.removeViewAt(index);
        if (this.mBucket.remove(index)) {
            this.mHiddenViews.remove(view);
        }
    }

    void removeViewAt(int index) {
        int offset = getOffset(index);
        View view = this.mCallback.getChildAt(offset);
        if (view == null) {
            return;
        }
        this.mCallback.removeViewAt(offset);
        if (this.mBucket.remove(offset)) {
            this.mHiddenViews.remove(view);
        }
    }

    View getChildAt(int index) {
        int offset = getOffset(index);
        return this.mCallback.getChildAt(offset);
    }

    void removeAllViewsUnfiltered() {
        this.mCallback.removeAllViews();
        this.mBucket.reset();
        this.mHiddenViews.clear();
    }

    View findHiddenNonRemovedView(int position, int type) {
        int count = this.mHiddenViews.size();
        for (int i = 0; i < count; i++) {
            View view = this.mHiddenViews.get(i);
            RecyclerView.ViewHolder holder = this.mCallback.getChildViewHolder(view);
            if (holder.getPosition() == position && !holder.isInvalid() && (type == -1 || holder.getItemViewType() == type)) {
                return view;
            }
        }
        return null;
    }

    void attachViewToParent(View child, int index, ViewGroup.LayoutParams layoutParams, boolean hidden) {
        int offset;
        if (index < 0) {
            offset = this.mCallback.getChildCount();
        } else {
            offset = getOffset(index);
        }
        this.mCallback.attachViewToParent(child, offset, layoutParams);
        this.mBucket.insert(offset, hidden);
        if (hidden) {
            this.mHiddenViews.add(child);
        }
    }

    int getChildCount() {
        return this.mCallback.getChildCount() - this.mHiddenViews.size();
    }

    int getUnfilteredChildCount() {
        return this.mCallback.getChildCount();
    }

    View getUnfilteredChildAt(int index) {
        return this.mCallback.getChildAt(index);
    }

    void detachViewFromParent(int index) {
        int offset = getOffset(index);
        this.mCallback.detachViewFromParent(offset);
        this.mBucket.remove(offset);
    }

    int indexOfChild(View child) {
        int index = this.mCallback.indexOfChild(child);
        if (index == -1 || this.mBucket.get(index)) {
            return -1;
        }
        return index - this.mBucket.countOnesBefore(index);
    }

    boolean isHidden(View view) {
        return this.mHiddenViews.contains(view);
    }

    void hide(View view) {
        int offset = this.mCallback.indexOfChild(view);
        if (offset < 0) {
            throw new IllegalArgumentException("view is not a child, cannot hide " + view);
        }
        this.mBucket.set(offset);
        this.mHiddenViews.add(view);
    }

    public String toString() {
        return this.mBucket.toString() + ", hidden list:" + this.mHiddenViews.size();
    }

    boolean removeViewIfHidden(View view) {
        int index = this.mCallback.indexOfChild(view);
        if (index == -1) {
            if (this.mHiddenViews.remove(view)) {
            }
            return true;
        }
        if (this.mBucket.get(index)) {
            this.mBucket.remove(index);
            this.mCallback.removeViewAt(index);
            if (!this.mHiddenViews.remove(view)) {
            }
            return true;
        }
        return false;
    }

    /* loaded from: com.android.support.recyclerview-v7.21.0.3.jar:android/support/v7/widget/ChildHelper$Bucket.class */
    static class Bucket {
        static final int BITS_PER_WORD = 64;
        static final long LAST_BIT = Long.MIN_VALUE;
        long mData = 0;
        Bucket next;

        Bucket() {
        }

        void set(int index) {
            if (index >= BITS_PER_WORD) {
                ensureNext();
                this.next.set(index - BITS_PER_WORD);
            } else {
                this.mData |= 1 << index;
            }
        }

        private void ensureNext() {
            if (this.next == null) {
                this.next = new Bucket();
            }
        }

        void clear(int index) {
            if (index >= BITS_PER_WORD) {
                if (this.next != null) {
                    this.next.clear(index - BITS_PER_WORD);
                    return;
                }
                return;
            }
            this.mData &= (1 << index) ^ (-1);
        }

        boolean get(int index) {
            if (index < BITS_PER_WORD) {
                return (this.mData & (1 << index)) != 0;
            }
            ensureNext();
            return this.next.get(index - BITS_PER_WORD);
        }

        void reset() {
            this.mData = 0L;
            if (this.next != null) {
                this.next.reset();
            }
        }

        void insert(int index, boolean value) {
            if (index >= BITS_PER_WORD) {
                ensureNext();
                this.next.insert(index - BITS_PER_WORD, value);
                return;
            }
            boolean lastBit = (this.mData & LAST_BIT) != 0;
            long mask = (1 << index) - 1;
            long before = this.mData & mask;
            long after = (this.mData & (mask ^ (-1))) << 1;
            this.mData = before | after;
            if (value) {
                set(index);
            } else {
                clear(index);
            }
            if (lastBit || this.next != null) {
                ensureNext();
                this.next.insert(0, lastBit);
            }
        }

        boolean remove(int index) {
            if (index >= BITS_PER_WORD) {
                ensureNext();
                return this.next.remove(index - BITS_PER_WORD);
            }
            long mask = 1 << index;
            boolean value = (this.mData & mask) != 0;
            this.mData &= mask ^ (-1);
            long mask2 = mask - 1;
            long before = this.mData & mask2;
            long after = Long.rotateRight(this.mData & (mask2 ^ (-1)), 1);
            this.mData = before | after;
            if (this.next != null) {
                if (this.next.get(0)) {
                    set(63);
                }
                this.next.remove(0);
            }
            return value;
        }

        int countOnesBefore(int index) {
            if (this.next == null) {
                if (index >= BITS_PER_WORD) {
                    return Long.bitCount(this.mData);
                }
                return Long.bitCount(this.mData & ((1 << index) - 1));
            }
            if (index < BITS_PER_WORD) {
                return Long.bitCount(this.mData & ((1 << index) - 1));
            }
            return this.next.countOnesBefore(index - BITS_PER_WORD) + Long.bitCount(this.mData);
        }

        public String toString() {
            return this.next == null ? Long.toBinaryString(this.mData) : this.next.toString() + "xx" + Long.toBinaryString(this.mData);
        }
    }
}
