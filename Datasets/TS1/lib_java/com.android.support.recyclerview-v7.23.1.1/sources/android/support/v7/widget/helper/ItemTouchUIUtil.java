package android.support.v7.widget.helper;

import android.graphics.Canvas;
import android.support.v7.widget.RecyclerView;
import android.view.View;

/* loaded from: com.android.support.recyclerview-v7.23.1.1.jar:android/support/v7/widget/helper/ItemTouchUIUtil.class */
public interface ItemTouchUIUtil {
    void onDraw(Canvas canvas, RecyclerView recyclerView, View view, float f, float f2, int i, boolean z);

    void onDrawOver(Canvas canvas, RecyclerView recyclerView, View view, float f, float f2, int i, boolean z);

    void clearView(View view);

    void onSelected(View view);
}
