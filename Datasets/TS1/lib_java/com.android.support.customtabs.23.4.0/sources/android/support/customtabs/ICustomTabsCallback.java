package android.support.customtabs;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* loaded from: com.android.support.customtabs.23.4.0.jar:android/support/customtabs/ICustomTabsCallback.class */
public interface ICustomTabsCallback extends IInterface {
    void onNavigationEvent(int i, Bundle bundle) throws RemoteException;

    void extraCallback(String str, Bundle bundle) throws RemoteException;

    /* loaded from: com.android.support.customtabs.23.4.0.jar:android/support/customtabs/ICustomTabsCallback$Stub.class */
    public static abstract class Stub extends Binder implements ICustomTabsCallback {
        private static final String DESCRIPTOR = "android.support.customtabs.ICustomTabsCallback";
        static final int TRANSACTION_onNavigationEvent = 2;
        static final int TRANSACTION_extraCallback = 3;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static ICustomTabsCallback asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof ICustomTabsCallback)) {
                return (ICustomTabsCallback) iin;
            }
            return new Proxy(obj);
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            Bundle _arg1;
            Bundle _arg12;
            switch (code) {
                case 2:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg0 = data.readInt();
                    if (0 != data.readInt()) {
                        _arg12 = (Bundle) Bundle.CREATOR.createFromParcel(data);
                    } else {
                        _arg12 = null;
                    }
                    onNavigationEvent(_arg0, _arg12);
                    break;
                case 3:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg02 = data.readString();
                    if (0 != data.readInt()) {
                        _arg1 = (Bundle) Bundle.CREATOR.createFromParcel(data);
                    } else {
                        _arg1 = null;
                    }
                    extraCallback(_arg02, _arg1);
                    break;
                case 1598968902:
                    reply.writeString(DESCRIPTOR);
                    break;
            }
            return true;
        }

        /* loaded from: com.android.support.customtabs.23.4.0.jar:android/support/customtabs/ICustomTabsCallback$Stub$Proxy.class */
        private static class Proxy implements ICustomTabsCallback {
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

            @Override // android.support.customtabs.ICustomTabsCallback
            public void onNavigationEvent(int navigationEvent, Bundle extras) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(navigationEvent);
                    if (extras != null) {
                        _data.writeInt(1);
                        extras.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(2, _data, null, 1);
                    _data.recycle();
                } catch (Throwable th) {
                    _data.recycle();
                    throw th;
                }
            }

            @Override // android.support.customtabs.ICustomTabsCallback
            public void extraCallback(String callbackName, Bundle args) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(callbackName);
                    if (args != null) {
                        _data.writeInt(1);
                        args.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(3, _data, null, 1);
                    _data.recycle();
                } catch (Throwable th) {
                    _data.recycle();
                    throw th;
                }
            }
        }
    }
}
