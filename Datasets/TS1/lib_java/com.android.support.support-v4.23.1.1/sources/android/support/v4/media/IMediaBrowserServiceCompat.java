package android.support.v4.media;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import android.support.v4.media.IMediaBrowserServiceCompatCallbacks;
import android.support.v4.os.ResultReceiver;

/* loaded from: com.android.support.support-v4.23.1.1.jar:android/support/v4/media/IMediaBrowserServiceCompat.class */
public interface IMediaBrowserServiceCompat extends IInterface {
    void connect(String str, Bundle bundle, IMediaBrowserServiceCompatCallbacks iMediaBrowserServiceCompatCallbacks) throws RemoteException;

    void disconnect(IMediaBrowserServiceCompatCallbacks iMediaBrowserServiceCompatCallbacks) throws RemoteException;

    void addSubscription(String str, IMediaBrowserServiceCompatCallbacks iMediaBrowserServiceCompatCallbacks) throws RemoteException;

    void removeSubscription(String str, IMediaBrowserServiceCompatCallbacks iMediaBrowserServiceCompatCallbacks) throws RemoteException;

    void getMediaItem(String str, ResultReceiver resultReceiver) throws RemoteException;

    /* loaded from: com.android.support.support-v4.23.1.1.jar:android/support/v4/media/IMediaBrowserServiceCompat$Stub.class */
    public static abstract class Stub extends Binder implements IMediaBrowserServiceCompat {
        private static final String DESCRIPTOR = "android.support.v4.media.IMediaBrowserServiceCompat";
        static final int TRANSACTION_connect = 1;
        static final int TRANSACTION_disconnect = 2;
        static final int TRANSACTION_addSubscription = 3;
        static final int TRANSACTION_removeSubscription = 4;
        static final int TRANSACTION_getMediaItem = 5;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IMediaBrowserServiceCompat asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof IMediaBrowserServiceCompat)) {
                return (IMediaBrowserServiceCompat) iin;
            }
            return new Proxy(obj);
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            ResultReceiver _arg1;
            Bundle _arg12;
            switch (code) {
                case 1:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg0 = data.readString();
                    if (0 != data.readInt()) {
                        _arg12 = (Bundle) Bundle.CREATOR.createFromParcel(data);
                    } else {
                        _arg12 = null;
                    }
                    IMediaBrowserServiceCompatCallbacks _arg2 = IMediaBrowserServiceCompatCallbacks.Stub.asInterface(data.readStrongBinder());
                    connect(_arg0, _arg12, _arg2);
                    break;
                case 2:
                    data.enforceInterface(DESCRIPTOR);
                    IMediaBrowserServiceCompatCallbacks _arg02 = IMediaBrowserServiceCompatCallbacks.Stub.asInterface(data.readStrongBinder());
                    disconnect(_arg02);
                    break;
                case 3:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg03 = data.readString();
                    IMediaBrowserServiceCompatCallbacks _arg13 = IMediaBrowserServiceCompatCallbacks.Stub.asInterface(data.readStrongBinder());
                    addSubscription(_arg03, _arg13);
                    break;
                case 4:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg04 = data.readString();
                    IMediaBrowserServiceCompatCallbacks _arg14 = IMediaBrowserServiceCompatCallbacks.Stub.asInterface(data.readStrongBinder());
                    removeSubscription(_arg04, _arg14);
                    break;
                case 5:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg05 = data.readString();
                    if (0 != data.readInt()) {
                        _arg1 = ResultReceiver.CREATOR.createFromParcel(data);
                    } else {
                        _arg1 = null;
                    }
                    getMediaItem(_arg05, _arg1);
                    break;
                case 1598968902:
                    reply.writeString(DESCRIPTOR);
                    break;
            }
            return true;
        }

        /* loaded from: com.android.support.support-v4.23.1.1.jar:android/support/v4/media/IMediaBrowserServiceCompat$Stub$Proxy.class */
        private static class Proxy implements IMediaBrowserServiceCompat {
            private IBinder mRemote;

            Proxy(IBinder remote) {
                this.mRemote = remote;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return Stub.DESCRIPTOR;
            }

            @Override // android.support.v4.media.IMediaBrowserServiceCompat
            public void connect(String pkg, Bundle rootHints, IMediaBrowserServiceCompatCallbacks callbacks) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(pkg);
                    if (rootHints != null) {
                        _data.writeInt(1);
                        rootHints.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    _data.writeStrongBinder(callbacks != null ? callbacks.asBinder() : null);
                    this.mRemote.transact(1, _data, null, 1);
                    _data.recycle();
                } catch (Throwable th) {
                    _data.recycle();
                    throw th;
                }
            }

            @Override // android.support.v4.media.IMediaBrowserServiceCompat
            public void disconnect(IMediaBrowserServiceCompatCallbacks callbacks) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(callbacks != null ? callbacks.asBinder() : null);
                    this.mRemote.transact(2, _data, null, 1);
                    _data.recycle();
                } catch (Throwable th) {
                    _data.recycle();
                    throw th;
                }
            }

            @Override // android.support.v4.media.IMediaBrowserServiceCompat
            public void addSubscription(String uri, IMediaBrowserServiceCompatCallbacks callbacks) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(uri);
                    _data.writeStrongBinder(callbacks != null ? callbacks.asBinder() : null);
                    this.mRemote.transact(3, _data, null, 1);
                    _data.recycle();
                } catch (Throwable th) {
                    _data.recycle();
                    throw th;
                }
            }

            @Override // android.support.v4.media.IMediaBrowserServiceCompat
            public void removeSubscription(String uri, IMediaBrowserServiceCompatCallbacks callbacks) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(uri);
                    _data.writeStrongBinder(callbacks != null ? callbacks.asBinder() : null);
                    this.mRemote.transact(4, _data, null, 1);
                    _data.recycle();
                } catch (Throwable th) {
                    _data.recycle();
                    throw th;
                }
            }

            @Override // android.support.v4.media.IMediaBrowserServiceCompat
            public void getMediaItem(String uri, ResultReceiver cb) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(uri);
                    if (cb != null) {
                        _data.writeInt(1);
                        cb.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(5, _data, null, 1);
                    _data.recycle();
                } catch (Throwable th) {
                    _data.recycle();
                    throw th;
                }
            }
        }
    }
}
