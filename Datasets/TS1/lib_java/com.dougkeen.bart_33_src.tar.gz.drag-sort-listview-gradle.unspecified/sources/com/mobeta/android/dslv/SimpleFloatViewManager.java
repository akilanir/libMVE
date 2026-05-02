package com.mobeta.android.dslv;

import android.graphics.Bitmap;
import android.graphics.Point;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ListView;
import com.mobeta.android.dslv.DragSortListView;

/* loaded from: com.dougkeen.bart_33_src.tar.gz.drag-sort-listview-gradle.unspecified.jar:com/mobeta/android/dslv/SimpleFloatViewManager.class */
public class SimpleFloatViewManager implements DragSortListView.FloatViewManager {
    private Bitmap mFloatBitmap;
    private ImageView mImageView;
    private int mFloatBGColor = -16777216;
    private ListView mListView;

    public SimpleFloatViewManager(ListView lv) {
        this.mListView = lv;
    }

    public void setBackgroundColor(int color) {
        this.mFloatBGColor = color;
    }

    @Override // com.mobeta.android.dslv.DragSortListView.FloatViewManager
    public View onCreateFloatView(int position) {
        View v = this.mListView.getChildAt((position + this.mListView.getHeaderViewsCount()) - this.mListView.getFirstVisiblePosition());
        if (v == null) {
            return null;
        }
        v.setPressed(false);
        v.setDrawingCacheEnabled(true);
        this.mFloatBitmap = Bitmap.createBitmap(v.getDrawingCache());
        v.setDrawingCacheEnabled(false);
        if (this.mImageView == null) {
            this.mImageView = new ImageView(this.mListView.getContext());
        }
        this.mImageView.setBackgroundColor(this.mFloatBGColor);
        this.mImageView.setPadding(0, 0, 0, 0);
        this.mImageView.setImageBitmap(this.mFloatBitmap);
        this.mImageView.setLayoutParams(new ViewGroup.LayoutParams(v.getWidth(), v.getHeight()));
        return this.mImageView;
    }

    @Override // com.mobeta.android.dslv.DragSortListView.FloatViewManager
    public void onDragFloatView(View floatView, Point position, Point touch) {
    }

    @Override // com.mobeta.android.dslv.DragSortListView.FloatViewManager
    public void onDestroyFloatView(View floatView) {
        ((ImageView) floatView).setImageDrawable(null);
        this.mFloatBitmap.recycle();
        this.mFloatBitmap = null;
    }
}
