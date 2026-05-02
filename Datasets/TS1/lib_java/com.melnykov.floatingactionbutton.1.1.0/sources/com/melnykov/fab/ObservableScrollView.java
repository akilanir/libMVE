package com.melnykov.fab;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.ScrollView;

/* loaded from: com.melnykov.floatingactionbutton.1.1.0.jar:com/melnykov/fab/ObservableScrollView.class */
public class ObservableScrollView extends ScrollView {
    private OnScrollChangedListener mOnScrollChangedListener;

    /* loaded from: com.melnykov.floatingactionbutton.1.1.0.jar:com/melnykov/fab/ObservableScrollView$OnScrollChangedListener.class */
    public interface OnScrollChangedListener {
        void onScrollChanged(ScrollView scrollView, int i, int i2, int i3, int i4);
    }

    public ObservableScrollView(Context context) {
        super(context);
    }

    public ObservableScrollView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public ObservableScrollView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // android.view.View
    protected void onScrollChanged(int l, int t, int oldl, int oldt) {
        super.onScrollChanged(l, t, oldl, oldt);
        if (this.mOnScrollChangedListener != null) {
            this.mOnScrollChangedListener.onScrollChanged(this, l, t, oldl, oldt);
        }
    }

    public void setOnScrollChangedListener(OnScrollChangedListener listener) {
        this.mOnScrollChangedListener = listener;
    }
}
