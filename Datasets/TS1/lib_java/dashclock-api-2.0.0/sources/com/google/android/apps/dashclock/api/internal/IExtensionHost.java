package com.google.android.apps.dashclock.api.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.apps.dashclock.api.ExtensionData;

/* loaded from: dashclock-api-2.0.0.jar:com/google/android/apps/dashclock/api/internal/IExtensionHost.class */
public interface IExtensionHost extends IInterface {
    void publishUpdate(ExtensionData extensionData) throws RemoteException;

    void addWatchContentUris(String[] strArr) throws RemoteException;

    void setUpdateWhenScreenOn(boolean z) throws RemoteException;

    void removeAllWatchContentUris() throws RemoteException;

    /* loaded from: dashclock-api-2.0.0.jar:com/google/android/apps/dashclock/api/internal/IExtensionHost$Stub.class */
    public static abstract class Stub extends Binder implements IExtensionHost {
        private static final String DESCRIPTOR = "com.google.android.apps.dashclock.api.internal.IExtensionHost";
        static final int TRANSACTION_publishUpdate = 1;
        static final int TRANSACTION_addWatchContentUris = 2;
        static final int TRANSACTION_setUpdateWhenScreenOn = 3;
        static final int TRANSACTION_removeAllWatchContentUris = 4;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IExtensionHost asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof IExtensionHost)) {
                return (IExtensionHost) iin;
            }
            return new Proxy(obj);
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            ExtensionData _arg0;
            switch (code) {
                case 1:
                    data.enforceInterface(DESCRIPTOR);
                    if (0 != data.readInt()) {
                        _arg0 = ExtensionData.CREATOR.createFromParcel(data);
                    } else {
                        _arg0 = null;
                    }
                    publishUpdate(_arg0);
                    break;
                case 2:
                    data.enforceInterface(DESCRIPTOR);
                    String[] _arg02 = data.createStringArray();
                    addWatchContentUris(_arg02);
                    break;
                case 3:
                    data.enforceInterface(DESCRIPTOR);
                    boolean _arg03 = 0 != data.readInt();
                    setUpdateWhenScreenOn(_arg03);
                    break;
                case 4:
                    data.enforceInterface(DESCRIPTOR);
                    removeAllWatchContentUris();
                    break;
                case 1598968902:
                    reply.writeString(DESCRIPTOR);
                    break;
            }
            return true;
        }

        /* loaded from: dashclock-api-2.0.0.jar:com/google/android/apps/dashclock/api/internal/IExtensionHost$Stub$Proxy.class */
        private static class Proxy implements IExtensionHost {
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

            @Override // com.google.android.apps.dashclock.api.internal.IExtensionHost
            public void publishUpdate(ExtensionData data) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (data != null) {
                        _data.writeInt(1);
                        data.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(1, _data, null, 1);
                    _data.recycle();
                } catch (Throwable th) {
                    _data.recycle();
                    throw th;
                }
            }

            @Override // com.google.android.apps.dashclock.api.internal.IExtensionHost
            public void addWatchContentUris(String[] contentUris) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStringArray(contentUris);
                    this.mRemote.transact(2, _data, null, 1);
                    _data.recycle();
                } catch (Throwable th) {
                    _data.recycle();
                    throw th;
                }
            }

            @Override // com.google.android.apps.dashclock.api.internal.IExtensionHost
            public void setUpdateWhenScreenOn(boolean updateWhenScreenOn) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(updateWhenScreenOn ? 1 : 0);
                    this.mRemote.transact(3, _data, null, 1);
                    _data.recycle();
                } catch (Throwable th) {
                    _data.recycle();
                    throw th;
                }
            }

            @Override // com.google.android.apps.dashclock.api.internal.IExtensionHost
            public void removeAllWatchContentUris() throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(4, _data, null, 1);
                    _data.recycle();
                } catch (Throwable th) {
                    _data.recycle();
                    throw th;
                }
            }
        }
    }
}
