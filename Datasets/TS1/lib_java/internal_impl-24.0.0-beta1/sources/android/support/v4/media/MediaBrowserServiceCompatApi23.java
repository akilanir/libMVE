package android.support.v4.media;

import android.content.Context;
import android.media.browse.MediaBrowser;
import android.os.Parcel;
import android.service.media.MediaBrowserService;
import android.support.v4.media.MediaBrowserServiceCompatApi21;

/* loaded from: internal_impl-24.0.0-beta1.jar:android/support/v4/media/MediaBrowserServiceCompatApi23.class */
class MediaBrowserServiceCompatApi23 {

    /* loaded from: internal_impl-24.0.0-beta1.jar:android/support/v4/media/MediaBrowserServiceCompatApi23$ServiceCompatProxy.class */
    public interface ServiceCompatProxy extends MediaBrowserServiceCompatApi21.ServiceCompatProxy {
        void onLoadItem(String str, MediaBrowserServiceCompatApi21.ResultWrapper<Parcel> resultWrapper);
    }

    MediaBrowserServiceCompatApi23() {
    }

    public static Object createService(Context context, ServiceCompatProxy serviceProxy) {
        return new MediaBrowserServiceAdaptor(context, serviceProxy);
    }

    /* loaded from: internal_impl-24.0.0-beta1.jar:android/support/v4/media/MediaBrowserServiceCompatApi23$MediaBrowserServiceAdaptor.class */
    static class MediaBrowserServiceAdaptor extends MediaBrowserServiceCompatApi21.MediaBrowserServiceAdaptor {
        MediaBrowserServiceAdaptor(Context context, ServiceCompatProxy serviceWrapper) {
            super(context, serviceWrapper);
        }

        @Override // android.service.media.MediaBrowserService
        public void onLoadItem(String itemId, MediaBrowserService.Result<MediaBrowser.MediaItem> result) {
            ((ServiceCompatProxy) this.mServiceProxy).onLoadItem(itemId, new MediaBrowserServiceCompatApi21.ResultWrapper<>(result));
        }
    }
}
