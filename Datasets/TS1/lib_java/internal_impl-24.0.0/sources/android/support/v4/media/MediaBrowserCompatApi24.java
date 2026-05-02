package android.support.v4.media;

import android.media.browse.MediaBrowser;
import android.os.Bundle;
import android.os.Parcel;
import android.support.annotation.NonNull;
import android.support.v4.media.MediaBrowserCompatApi21;
import java.util.List;

/* loaded from: internal_impl-24.0.0.jar:android/support/v4/media/MediaBrowserCompatApi24.class */
class MediaBrowserCompatApi24 {

    /* loaded from: internal_impl-24.0.0.jar:android/support/v4/media/MediaBrowserCompatApi24$SubscriptionCallback.class */
    interface SubscriptionCallback extends MediaBrowserCompatApi21.SubscriptionCallback {
        void onChildrenLoaded(@NonNull String str, List<Parcel> list, @NonNull Bundle bundle);

        void onError(@NonNull String str, @NonNull Bundle bundle);
    }

    MediaBrowserCompatApi24() {
    }

    public static Object createSubscriptionCallback(SubscriptionCallback callback) {
        return new SubscriptionCallbackProxy(callback);
    }

    public static void subscribe(Object browserObj, String parentId, Bundle options, Object subscriptionCallbackObj) {
        ((MediaBrowser) browserObj).subscribe(parentId, options, (MediaBrowser.SubscriptionCallback) subscriptionCallbackObj);
    }

    public static void unsubscribe(Object browserObj, String parentId, Object subscriptionCallbackObj) {
        ((MediaBrowser) browserObj).unsubscribe(parentId, (MediaBrowser.SubscriptionCallback) subscriptionCallbackObj);
    }

    /* loaded from: internal_impl-24.0.0.jar:android/support/v4/media/MediaBrowserCompatApi24$SubscriptionCallbackProxy.class */
    static class SubscriptionCallbackProxy<T extends SubscriptionCallback> extends MediaBrowserCompatApi21.SubscriptionCallbackProxy<T> {
        public SubscriptionCallbackProxy(T callback) {
            super(callback);
        }

        @Override // android.media.browse.MediaBrowser.SubscriptionCallback
        public void onChildrenLoaded(@NonNull String parentId, List<MediaBrowser.MediaItem> children, @NonNull Bundle options) {
            ((SubscriptionCallback) this.mSubscriptionCallback).onChildrenLoaded(parentId, itemListToParcelList(children), options);
        }

        @Override // android.media.browse.MediaBrowser.SubscriptionCallback
        public void onError(@NonNull String parentId, @NonNull Bundle options) {
            ((SubscriptionCallback) this.mSubscriptionCallback).onError(parentId, options);
        }
    }
}
