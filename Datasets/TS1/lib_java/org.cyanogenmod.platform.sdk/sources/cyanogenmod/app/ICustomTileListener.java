package cyanogenmod.app;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import org.cyanogenmod.internal.statusbar.IStatusBarCustomTileHolder;

/* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/app/ICustomTileListener.class */
public interface ICustomTileListener extends IInterface {
    void onListenerConnected() throws RemoteException;

    void onCustomTilePosted(IStatusBarCustomTileHolder iStatusBarCustomTileHolder) throws RemoteException;

    void onCustomTileRemoved(IStatusBarCustomTileHolder iStatusBarCustomTileHolder) throws RemoteException;

    /* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/app/ICustomTileListener$Stub.class */
    public static abstract class Stub extends Binder implements ICustomTileListener {
        private static final String DESCRIPTOR = "cyanogenmod.app.ICustomTileListener";
        static final int TRANSACTION_onListenerConnected_0 = 1;
        static final int TRANSACTION_onCustomTilePosted_1 = 2;
        static final int TRANSACTION_onCustomTileRemoved = 3;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static ICustomTileListener asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof ICustomTileListener)) {
                return (ICustomTileListener) iin;
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
                    onListenerConnected();
                    break;
                case TRANSACTION_onCustomTilePosted_1 /* 2 */:
                    data.enforceInterface(DESCRIPTOR);
                    IStatusBarCustomTileHolder _arg0 = IStatusBarCustomTileHolder.Stub.asInterface(data.readStrongBinder());
                    onCustomTilePosted(_arg0);
                    break;
                case TRANSACTION_onCustomTileRemoved /* 3 */:
                    data.enforceInterface(DESCRIPTOR);
                    IStatusBarCustomTileHolder _arg02 = IStatusBarCustomTileHolder.Stub.asInterface(data.readStrongBinder());
                    onCustomTileRemoved(_arg02);
                    break;
                case 1598968902:
                    reply.writeString(DESCRIPTOR);
                    break;
            }
            return true;
        }

        /* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/app/ICustomTileListener$Stub$Proxy.class */
        private static class Proxy implements ICustomTileListener {
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

            @Override // cyanogenmod.app.ICustomTileListener
            public void onListenerConnected() throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(1, _data, null, 1);
                    _data.recycle();
                } catch (Throwable th) {
                    _data.recycle();
                    throw th;
                }
            }

            @Override // cyanogenmod.app.ICustomTileListener
            public void onCustomTilePosted(IStatusBarCustomTileHolder customTileHolder) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(customTileHolder != null ? customTileHolder.asBinder() : null);
                    this.mRemote.transact(Stub.TRANSACTION_onCustomTilePosted_1, _data, null, 1);
                    _data.recycle();
                } catch (Throwable th) {
                    _data.recycle();
                    throw th;
                }
            }

            @Override // cyanogenmod.app.ICustomTileListener
            public void onCustomTileRemoved(IStatusBarCustomTileHolder customTileHolder) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(customTileHolder != null ? customTileHolder.asBinder() : null);
                    this.mRemote.transact(Stub.TRANSACTION_onCustomTileRemoved, _data, null, 1);
                    _data.recycle();
                } catch (Throwable th) {
                    _data.recycle();
                    throw th;
                }
            }
        }
    }
}
