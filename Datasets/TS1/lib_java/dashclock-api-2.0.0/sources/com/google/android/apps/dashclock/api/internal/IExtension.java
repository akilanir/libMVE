package com.google.android.apps.dashclock.api.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.apps.dashclock.api.internal.IExtensionHost;

/* loaded from: dashclock-api-2.0.0.jar:com/google/android/apps/dashclock/api/internal/IExtension.class */
public interface IExtension extends IInterface {
    void onInitialize(IExtensionHost iExtensionHost, boolean z) throws RemoteException;

    void onUpdate(int i) throws RemoteException;

    /* loaded from: dashclock-api-2.0.0.jar:com/google/android/apps/dashclock/api/internal/IExtension$Stub.class */
    public static abstract class Stub extends Binder implements IExtension {
        private static final String DESCRIPTOR = "com.google.android.apps.dashclock.api.internal.IExtension";
        static final int TRANSACTION_onInitialize = 1;
        static final int TRANSACTION_onUpdate = 2;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IExtension asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof IExtension)) {
                return (IExtension) iin;
            }
            return new Proxy(obj);
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            switch (code) {
                case 1:
                    data.enforceInterface(DESCRIPTOR);
                    IExtensionHost _arg0 = IExtensionHost.Stub.asInterface(data.readStrongBinder());
                    boolean _arg1 = 0 != data.readInt();
                    onInitialize(_arg0, _arg1);
                    break;
                case 2:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg02 = data.readInt();
                    onUpdate(_arg02);
                    break;
                case 1598968902:
                    reply.writeString(DESCRIPTOR);
                    break;
            }
            return true;
        }

        /* loaded from: dashclock-api-2.0.0.jar:com/google/android/apps/dashclock/api/internal/IExtension$Stub$Proxy.class */
        private static class Proxy implements IExtension {
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

            @Override // com.google.android.apps.dashclock.api.internal.IExtension
            public void onInitialize(IExtensionHost host, boolean isReconnect) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(host != null ? host.asBinder() : null);
                    _data.writeInt(isReconnect ? 1 : 0);
                    this.mRemote.transact(1, _data, null, 1);
                    _data.recycle();
                } catch (Throwable th) {
                    _data.recycle();
                    throw th;
                }
            }

            @Override // com.google.android.apps.dashclock.api.internal.IExtension
            public void onUpdate(int reason) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(reason);
                    this.mRemote.transact(2, _data, null, 1);
                    _data.recycle();
                } catch (Throwable th) {
                    _data.recycle();
                    throw th;
                }
            }
        }
    }
}
