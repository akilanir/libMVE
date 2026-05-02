package com.joanzapata.iconify.internal;

import android.support.v4.view.ViewCompat;
import android.widget.TextView;

/* loaded from: com.joanzapata.iconify.android-iconify.2.2.1.jar:com/joanzapata/iconify/internal/HasOnViewAttachListener.class */
public interface HasOnViewAttachListener {

    /* loaded from: com.joanzapata.iconify.android-iconify.2.2.1.jar:com/joanzapata/iconify/internal/HasOnViewAttachListener$OnViewAttachListener.class */
    public interface OnViewAttachListener {
        void onAttach();

        void onDetach();
    }

    void setOnViewAttachListener(OnViewAttachListener onViewAttachListener);

    /* loaded from: com.joanzapata.iconify.android-iconify.2.2.1.jar:com/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate.class */
    public static class HasOnViewAttachListenerDelegate {
        private final TextView view;
        private OnViewAttachListener listener;

        public HasOnViewAttachListenerDelegate(TextView view) {
            this.view = view;
        }

        public void setOnViewAttachListener(OnViewAttachListener listener) {
            if (this.listener != null) {
                this.listener.onDetach();
            }
            this.listener = listener;
            if (ViewCompat.isAttachedToWindow(this.view) && listener != null) {
                listener.onAttach();
            }
        }

        public void onAttachedToWindow() {
            if (this.listener != null) {
                this.listener.onAttach();
            }
        }

        public void onDetachedFromWindow() {
            if (this.listener != null) {
                this.listener.onDetach();
            }
        }
    }
}
