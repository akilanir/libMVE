package android.support.v4.app;

import android.support.annotation.CallSuper;
import android.support.v4.os.BuildCompat;

/* loaded from: internal_impl-24.0.0-beta1.jar:android/support/v4/app/BaseFragmentActivityApi24.class */
abstract class BaseFragmentActivityApi24 extends BaseFragmentActivityJB {
    abstract void dispatchFragmentsOnMultiWindowModeChanged(boolean z);

    abstract void dispatchFragmentsOnPictureInPictureModeChanged(boolean z);

    BaseFragmentActivityApi24() {
    }

    @Override // android.app.Activity
    @CallSuper
    public void onMultiWindowModeChanged(boolean isInMultiWindowMode) {
        if (BuildCompat.isAtLeastN()) {
            super.onMultiWindowModeChanged(isInMultiWindowMode);
        }
        dispatchFragmentsOnMultiWindowModeChanged(isInMultiWindowMode);
    }

    @Override // android.app.Activity
    @CallSuper
    public void onPictureInPictureModeChanged(boolean isInPictureInPictureMode) {
        if (BuildCompat.isAtLeastN()) {
            super.onPictureInPictureModeChanged(isInPictureInPictureMode);
        }
        dispatchFragmentsOnPictureInPictureModeChanged(isInPictureInPictureMode);
    }
}
