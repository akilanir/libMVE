package org.cyanogenmod.internal.statusbar;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import cyanogenmod.app.StatusBarPanelCustomTile;

/* loaded from: org.cyanogenmod.platform.sdk.jar:org/cyanogenmod/internal/statusbar/IStatusBarCustomTileHolder.class */
public interface IStatusBarCustomTileHolder extends IInterface {
    StatusBarPanelCustomTile get() throws RemoteException;

    /* loaded from: org.cyanogenmod.platform.sdk.jar:org/cyanogenmod/internal/statusbar/IStatusBarCustomTileHolder$Stub.class */
    public static abstract class Stub extends Binder implements IStatusBarCustomTileHolder {
        private static final String DESCRIPTOR = "org.cyanogenmod.internal.statusbar.IStatusBarCustomTileHolder";
        static final int TRANSACTION_get_0 = 1;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IStatusBarCustomTileHolder asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof IStatusBarCustomTileHolder)) {
                return (IStatusBarCustomTileHolder) iin;
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
                    StatusBarPanelCustomTile _result = get();
                    reply.writeNoException();
                    if (_result != null) {
                        reply.writeInt(1);
                        _result.writeToParcel(reply, 1);
                        break;
                    } else {
                        reply.writeInt(0);
                        break;
                    }
                case 1598968902:
                    reply.writeString(DESCRIPTOR);
                    break;
            }
            return true;
        }

        /* loaded from: org.cyanogenmod.platform.sdk.jar:org/cyanogenmod/internal/statusbar/IStatusBarCustomTileHolder$Stub$Proxy.class */
        private static class Proxy implements IStatusBarCustomTileHolder {
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

            @Override // org.cyanogenmod.internal.statusbar.IStatusBarCustomTileHolder
            public StatusBarPanelCustomTile get() throws RemoteException {
                StatusBarPanelCustomTile _result;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(1, _data, _reply, 0);
                    _reply.readException();
                    if (0 != _reply.readInt()) {
                        _result = StatusBarPanelCustomTile.CREATOR.createFromParcel(_reply);
                    } else {
                        _result = null;
                    }
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }
        }
    }
}
