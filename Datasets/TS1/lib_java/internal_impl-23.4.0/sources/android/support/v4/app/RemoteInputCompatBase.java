package android.support.v4.app;

import android.os.Bundle;

/* loaded from: internal_impl-23.4.0.jar:android/support/v4/app/RemoteInputCompatBase.class */
class RemoteInputCompatBase {

    /* loaded from: internal_impl-23.4.0.jar:android/support/v4/app/RemoteInputCompatBase$RemoteInput.class */
    public static abstract class RemoteInput {

        /* loaded from: internal_impl-23.4.0.jar:android/support/v4/app/RemoteInputCompatBase$RemoteInput$Factory.class */
        public interface Factory {
            RemoteInput build(String str, CharSequence charSequence, CharSequence[] charSequenceArr, boolean z, Bundle bundle);

            RemoteInput[] newArray(int i);
        }

        protected abstract String getResultKey();

        protected abstract CharSequence getLabel();

        protected abstract CharSequence[] getChoices();

        protected abstract boolean getAllowFreeFormInput();

        protected abstract Bundle getExtras();
    }

    RemoteInputCompatBase() {
    }
}
