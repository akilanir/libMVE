package android.support.v4.media;

import android.content.Context;
import android.content.Intent;
import android.media.browse.MediaBrowser;
import android.media.session.MediaSession;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.service.media.MediaBrowserService;
import java.util.ArrayList;
import java.util.List;

/* loaded from: internal_impl-24.0.0.jar:android/support/v4/media/MediaBrowserServiceCompatApi21.class */
class MediaBrowserServiceCompatApi21 {

    /* loaded from: internal_impl-24.0.0.jar:android/support/v4/media/MediaBrowserServiceCompatApi21$ServiceCompatProxy.class */
    public interface ServiceCompatProxy {
        BrowserRoot onGetRoot(String str, int i, Bundle bundle);

        void onLoadChildren(String str, ResultWrapper<List<Parcel>> resultWrapper);
    }

    MediaBrowserServiceCompatApi21() {
    }

    public static Object createService(Context context, ServiceCompatProxy serviceProxy) {
        return new MediaBrowserServiceAdaptor(context, serviceProxy);
    }

    public static void onCreate(Object serviceObj) {
        ((MediaBrowserService) serviceObj).onCreate();
    }

    public static IBinder onBind(Object serviceObj, Intent intent) {
        return ((MediaBrowserService) serviceObj).onBind(intent);
    }

    public static void setSessionToken(Object serviceObj, Object token) {
        ((MediaBrowserService) serviceObj).setSessionToken((MediaSession.Token) token);
    }

    public static void notifyChildrenChanged(Object serviceObj, String parentId) {
        ((MediaBrowserService) serviceObj).notifyChildrenChanged(parentId);
    }

    /* loaded from: internal_impl-24.0.0.jar:android/support/v4/media/MediaBrowserServiceCompatApi21$ResultWrapper.class */
    static class ResultWrapper<T> {
        MediaBrowserService.Result mResultObj;

        ResultWrapper(MediaBrowserService.Result result) {
            this.mResultObj = result;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public void sendResult(T t) {
            if (t instanceof List) {
                this.mResultObj.sendResult(parcelListToItemList((List) t));
            } else if (t instanceof Parcel) {
                this.mResultObj.sendResult(MediaBrowser.MediaItem.CREATOR.createFromParcel((Parcel) t));
            }
        }

        public void detach() {
            this.mResultObj.detach();
        }

        List<MediaBrowser.MediaItem> parcelListToItemList(List<Parcel> parcelList) {
            if (parcelList == null) {
                return null;
            }
            ArrayList arrayList = new ArrayList();
            for (Parcel parcel : parcelList) {
                parcel.setDataPosition(0);
                arrayList.add(MediaBrowser.MediaItem.CREATOR.createFromParcel(parcel));
                parcel.recycle();
            }
            return arrayList;
        }
    }

    /* loaded from: internal_impl-24.0.0.jar:android/support/v4/media/MediaBrowserServiceCompatApi21$BrowserRoot.class */
    static class BrowserRoot {
        final String mRootId;
        final Bundle mExtras;

        BrowserRoot(String rootId, Bundle extras) {
            this.mRootId = rootId;
            this.mExtras = extras;
        }
    }

    /* loaded from: internal_impl-24.0.0.jar:android/support/v4/media/MediaBrowserServiceCompatApi21$MediaBrowserServiceAdaptor.class */
    static class MediaBrowserServiceAdaptor extends MediaBrowserService {
        final ServiceCompatProxy mServiceProxy;

        MediaBrowserServiceAdaptor(Context context, ServiceCompatProxy serviceWrapper) {
            attachBaseContext(context);
            this.mServiceProxy = serviceWrapper;
        }

        @Override // android.service.media.MediaBrowserService
        public MediaBrowserService.BrowserRoot onGetRoot(String clientPackageName, int clientUid, Bundle rootHints) {
            BrowserRoot browserRoot = this.mServiceProxy.onGetRoot(clientPackageName, clientUid, rootHints);
            if (browserRoot == null) {
                return null;
            }
            return new MediaBrowserService.BrowserRoot(browserRoot.mRootId, browserRoot.mExtras);
        }

        @Override // android.service.media.MediaBrowserService
        public void onLoadChildren(String parentId, MediaBrowserService.Result<List<MediaBrowser.MediaItem>> result) {
            this.mServiceProxy.onLoadChildren(parentId, new ResultWrapper<>(result));
        }
    }
}
