package android.support.v4.media;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import android.os.ResultReceiver;
import android.support.v4.media.IMediaBrowserServiceCallbacksAdapterApi21;

/* loaded from: internal_impl-23.2.1.jar:android/support/v4/media/IMediaBrowserServiceAdapterApi21.class */
class IMediaBrowserServiceAdapterApi21 {
    IMediaBrowserServiceAdapterApi21() {
    }

    /* loaded from: internal_impl-23.2.1.jar:android/support/v4/media/IMediaBrowserServiceAdapterApi21$Stub.class */
    static abstract class Stub extends Binder implements IInterface {
        private static final String DESCRIPTOR = "android.service.media.IMediaBrowserService";
        private static final int TRANSACTION_connect = 1;
        private static final int TRANSACTION_disconnect = 2;
        private static final int TRANSACTION_addSubscription = 3;
        private static final int TRANSACTION_removeSubscription = 4;
        private static final int TRANSACTION_getMediaItem = 5;

        public abstract void connect(String str, Bundle bundle, Object obj);

        public abstract void disconnect(Object obj);

        public abstract void addSubscription(String str, Object obj);

        public abstract void removeSubscription(String str, Object obj);

        public abstract void getMediaItem(String str, ResultReceiver resultReceiver);

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            ResultReceiver arg1;
            Bundle arg12;
            switch (code) {
                case 1:
                    data.enforceInterface(DESCRIPTOR);
                    String arg0 = data.readString();
                    if (data.readInt() != 0) {
                        arg12 = (Bundle) Bundle.CREATOR.createFromParcel(data);
                    } else {
                        arg12 = null;
                    }
                    Object arg2 = IMediaBrowserServiceCallbacksAdapterApi21.Stub.asInterface(data.readStrongBinder());
                    connect(arg0, arg12, arg2);
                    break;
                case 2:
                    data.enforceInterface(DESCRIPTOR);
                    Object arg02 = IMediaBrowserServiceCallbacksAdapterApi21.Stub.asInterface(data.readStrongBinder());
                    disconnect(arg02);
                    break;
                case TRANSACTION_addSubscription /* 3 */:
                    data.enforceInterface(DESCRIPTOR);
                    String arg03 = data.readString();
                    Object arg13 = IMediaBrowserServiceCallbacksAdapterApi21.Stub.asInterface(data.readStrongBinder());
                    addSubscription(arg03, arg13);
                    break;
                case TRANSACTION_removeSubscription /* 4 */:
                    data.enforceInterface(DESCRIPTOR);
                    String arg04 = data.readString();
                    Object arg14 = IMediaBrowserServiceCallbacksAdapterApi21.Stub.asInterface(data.readStrongBinder());
                    removeSubscription(arg04, arg14);
                    break;
                case TRANSACTION_getMediaItem /* 5 */:
                    data.enforceInterface(DESCRIPTOR);
                    String arg05 = data.readString();
                    if (data.readInt() != 0) {
                        arg1 = (ResultReceiver) ResultReceiver.CREATOR.createFromParcel(data);
                    } else {
                        arg1 = null;
                    }
                    getMediaItem(arg05, arg1);
                    break;
                case 1598968902:
                    reply.writeString(DESCRIPTOR);
                    break;
            }
            return true;
        }
    }
}
