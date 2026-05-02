package android.support.v4.media.routing;

import android.media.MediaRouter;

/* loaded from: internal_impl-22.2.1.jar:android/support/v4/media/routing/MediaRouterJellybeanMr2.class */
class MediaRouterJellybeanMr2 extends MediaRouterJellybeanMr1 {
    MediaRouterJellybeanMr2() {
    }

    public static Object getDefaultRoute(Object routerObj) {
        return ((MediaRouter) routerObj).getDefaultRoute();
    }

    public static void addCallback(Object routerObj, int types, Object callbackObj, int flags) {
        ((MediaRouter) routerObj).addCallback(types, (MediaRouter.Callback) callbackObj, flags);
    }

    /* loaded from: internal_impl-22.2.1.jar:android/support/v4/media/routing/MediaRouterJellybeanMr2$RouteInfo.class */
    public static final class RouteInfo {
        public static CharSequence getDescription(Object routeObj) {
            return ((MediaRouter.RouteInfo) routeObj).getDescription();
        }

        public static boolean isConnecting(Object routeObj) {
            return ((MediaRouter.RouteInfo) routeObj).isConnecting();
        }
    }

    /* loaded from: internal_impl-22.2.1.jar:android/support/v4/media/routing/MediaRouterJellybeanMr2$UserRouteInfo.class */
    public static final class UserRouteInfo {
        public static void setDescription(Object routeObj, CharSequence description) {
            ((MediaRouter.UserRouteInfo) routeObj).setDescription(description);
        }
    }
}
