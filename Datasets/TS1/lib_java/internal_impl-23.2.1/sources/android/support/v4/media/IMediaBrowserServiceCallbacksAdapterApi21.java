package android.support.v4.media;

import android.media.session.MediaSession;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: internal_impl-23.2.1.jar:android/support/v4/media/IMediaBrowserServiceCallbacksAdapterApi21.class */
class IMediaBrowserServiceCallbacksAdapterApi21 {
    Object mCallbackObject;
    private Method mAsBinderMethod;
    private Method mOnConnectMethod;
    private Method mOnConnectFailedMethod;
    private Method mOnLoadChildrenMethod;

    IMediaBrowserServiceCallbacksAdapterApi21(Object callbackObject) {
        this.mCallbackObject = callbackObject;
        try {
            Class theClass = Class.forName("android.service.media.IMediaBrowserServiceCallbacks");
            Class parceledListSliceClass = Class.forName("android.content.pm.ParceledListSlice");
            this.mAsBinderMethod = theClass.getMethod("asBinder", new Class[0]);
            this.mOnConnectMethod = theClass.getMethod("onConnect", String.class, MediaSession.Token.class, Bundle.class);
            this.mOnConnectFailedMethod = theClass.getMethod("onConnectFailed", new Class[0]);
            this.mOnLoadChildrenMethod = theClass.getMethod("onLoadChildren", String.class, parceledListSliceClass);
        } catch (ClassNotFoundException | NoSuchMethodException e) {
            e.printStackTrace();
        }
    }

    IBinder asBinder() {
        IBinder result = null;
        try {
            result = (IBinder) this.mAsBinderMethod.invoke(this.mCallbackObject, new Object[0]);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
        return result;
    }

    void onConnect(String root, Object session, Bundle extras) throws RemoteException {
        try {
            this.mOnConnectMethod.invoke(this.mCallbackObject, root, session, extras);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    void onConnectFailed() throws RemoteException {
        try {
            this.mOnConnectFailedMethod.invoke(this.mCallbackObject, new Object[0]);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    void onLoadChildren(String mediaId, Object parceledListSliceObj) throws RemoteException {
        try {
            this.mOnLoadChildrenMethod.invoke(this.mCallbackObject, mediaId, parceledListSliceObj);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    /* loaded from: internal_impl-23.2.1.jar:android/support/v4/media/IMediaBrowserServiceCallbacksAdapterApi21$Stub.class */
    static class Stub {
        static Method sAsInterfaceMethod;

        Stub() {
        }

        static {
            try {
                Class theClass = Class.forName("android.service.media.IMediaBrowserServiceCallbacks$Stub");
                sAsInterfaceMethod = theClass.getMethod("asInterface", IBinder.class);
            } catch (ClassNotFoundException | NoSuchMethodException e) {
                e.printStackTrace();
            }
        }

        static Object asInterface(IBinder binder) {
            Object result = null;
            try {
                result = sAsInterfaceMethod.invoke(null, binder);
            } catch (IllegalAccessException | InvocationTargetException e) {
                e.printStackTrace();
            }
            return result;
        }
    }
}
