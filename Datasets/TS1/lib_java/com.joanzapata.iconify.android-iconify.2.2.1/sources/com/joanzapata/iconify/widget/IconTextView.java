package com.joanzapata.iconify.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.TextView;
import com.joanzapata.iconify.Iconify;
import com.joanzapata.iconify.internal.HasOnViewAttachListener;

/* loaded from: com.joanzapata.iconify.android-iconify.2.2.1.jar:com/joanzapata/iconify/widget/IconTextView.class */
public class IconTextView extends TextView implements HasOnViewAttachListener {
    private HasOnViewAttachListener.HasOnViewAttachListenerDelegate delegate;

    public IconTextView(Context context) {
        super(context);
        init();
    }

    public IconTextView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public IconTextView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init();
    }

    private void init() {
        setTransformationMethod(null);
    }

    @Override // android.widget.TextView
    public void setText(CharSequence text, TextView.BufferType type) {
        super.setText(Iconify.compute(getContext(), text, this), type);
    }

    @Override // com.joanzapata.iconify.internal.HasOnViewAttachListener
    public void setOnViewAttachListener(HasOnViewAttachListener.OnViewAttachListener listener) {
        if (this.delegate == null) {
            this.delegate = new HasOnViewAttachListener.HasOnViewAttachListenerDelegate(this);
        }
        this.delegate.setOnViewAttachListener(listener);
    }

    @Override // android.widget.TextView, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.delegate.onAttachedToWindow();
    }

    @Override // android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.delegate.onDetachedFromWindow();
    }
}
