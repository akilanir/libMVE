package android.support.v4.app;

import android.app.Activity;
import android.app.SharedElementCallback;
import android.content.Context;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.media.session.MediaController;
import android.os.Parcelable;
import android.view.View;
import java.util.List;
import java.util.Map;

/* loaded from: internal_impl-23.2.0.jar:android/support/v4/app/ActivityCompat21.class */
class ActivityCompat21 {

    /* loaded from: internal_impl-23.2.0.jar:android/support/v4/app/ActivityCompat21$SharedElementCallback21.class */
    public static abstract class SharedElementCallback21 {
        public abstract void onSharedElementStart(List<String> list, List<View> list2, List<View> list3);

        public abstract void onSharedElementEnd(List<String> list, List<View> list2, List<View> list3);

        public abstract void onRejectSharedElements(List<View> list);

        public abstract void onMapSharedElements(List<String> list, Map<String, View> map);

        public abstract Parcelable onCaptureSharedElementSnapshot(View view, Matrix matrix, RectF rectF);

        public abstract View onCreateSnapshotView(Context context, Parcelable parcelable);
    }

    ActivityCompat21() {
    }

    public static void setMediaController(Activity activity, Object mediaControllerObj) {
        activity.setMediaController((MediaController) mediaControllerObj);
    }

    public static void finishAfterTransition(Activity activity) {
        activity.finishAfterTransition();
    }

    public static void setEnterSharedElementCallback(Activity activity, SharedElementCallback21 callback) {
        activity.setEnterSharedElementCallback(createCallback(callback));
    }

    public static void setExitSharedElementCallback(Activity activity, SharedElementCallback21 callback) {
        activity.setExitSharedElementCallback(createCallback(callback));
    }

    public static void postponeEnterTransition(Activity activity) {
        activity.postponeEnterTransition();
    }

    public static void startPostponedEnterTransition(Activity activity) {
        activity.startPostponedEnterTransition();
    }

    private static SharedElementCallback createCallback(SharedElementCallback21 callback) {
        SharedElementCallback newListener = null;
        if (callback != null) {
            newListener = new SharedElementCallbackImpl(callback);
        }
        return newListener;
    }

    /* loaded from: internal_impl-23.2.0.jar:android/support/v4/app/ActivityCompat21$SharedElementCallbackImpl.class */
    private static class SharedElementCallbackImpl extends SharedElementCallback {
        private SharedElementCallback21 mCallback;

        public SharedElementCallbackImpl(SharedElementCallback21 callback) {
            this.mCallback = callback;
        }

        @Override // android.app.SharedElementCallback
        public void onSharedElementStart(List<String> sharedElementNames, List<View> sharedElements, List<View> sharedElementSnapshots) {
            this.mCallback.onSharedElementStart(sharedElementNames, sharedElements, sharedElementSnapshots);
        }

        @Override // android.app.SharedElementCallback
        public void onSharedElementEnd(List<String> sharedElementNames, List<View> sharedElements, List<View> sharedElementSnapshots) {
            this.mCallback.onSharedElementEnd(sharedElementNames, sharedElements, sharedElementSnapshots);
        }

        @Override // android.app.SharedElementCallback
        public void onRejectSharedElements(List<View> rejectedSharedElements) {
            this.mCallback.onRejectSharedElements(rejectedSharedElements);
        }

        @Override // android.app.SharedElementCallback
        public void onMapSharedElements(List<String> names, Map<String, View> sharedElements) {
            this.mCallback.onMapSharedElements(names, sharedElements);
        }

        @Override // android.app.SharedElementCallback
        public Parcelable onCaptureSharedElementSnapshot(View sharedElement, Matrix viewToGlobalMatrix, RectF screenBounds) {
            return this.mCallback.onCaptureSharedElementSnapshot(sharedElement, viewToGlobalMatrix, screenBounds);
        }

        @Override // android.app.SharedElementCallback
        public View onCreateSnapshotView(Context context, Parcelable snapshot) {
            return this.mCallback.onCreateSnapshotView(context, snapshot);
        }
    }
}
