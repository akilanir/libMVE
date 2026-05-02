package cyanogenmod.app;

import android.content.ComponentName;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import cyanogenmod.app.ICustomTileListener;

/* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/app/ICMStatusBarManager.class */
public interface ICMStatusBarManager extends IInterface {
    void createCustomTileWithTag(String str, String str2, String str3, int i, CustomTile customTile, int[] iArr, int i2) throws RemoteException;

    void removeCustomTileWithTag(String str, String str2, int i, int i2) throws RemoteException;

    void registerListener(ICustomTileListener iCustomTileListener, ComponentName componentName, int i) throws RemoteException;

    void unregisterListener(ICustomTileListener iCustomTileListener, int i) throws RemoteException;

    void removeCustomTileFromListener(ICustomTileListener iCustomTileListener, String str, String str2, int i) throws RemoteException;

    /* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/app/ICMStatusBarManager$Stub.class */
    public static abstract class Stub extends Binder implements ICMStatusBarManager {
        private static final String DESCRIPTOR = "cyanogenmod.app.ICMStatusBarManager";
        static final int TRANSACTION_createCustomTileWithTag = 1;
        static final int TRANSACTION_removeCustomTileWithTag = 2;
        static final int TRANSACTION_registerListener = 3;
        static final int TRANSACTION_unregisterListener = 4;
        static final int TRANSACTION_removeCustomTileFromListener = 5;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static ICMStatusBarManager asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof ICMStatusBarManager)) {
                return (ICMStatusBarManager) iin;
            }
            return new Proxy(obj);
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            ComponentName _arg1;
            CustomTile _arg4;
            switch (code) {
                case 1:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg0 = data.readString();
                    String _arg12 = data.readString();
                    String _arg2 = data.readString();
                    int _arg3 = data.readInt();
                    if (0 != data.readInt()) {
                        _arg4 = CustomTile.CREATOR.createFromParcel(data);
                    } else {
                        _arg4 = null;
                    }
                    int[] _arg5 = data.createIntArray();
                    int _arg6 = data.readInt();
                    createCustomTileWithTag(_arg0, _arg12, _arg2, _arg3, _arg4, _arg5, _arg6);
                    reply.writeNoException();
                    reply.writeIntArray(_arg5);
                    break;
                case TRANSACTION_removeCustomTileWithTag /* 2 */:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg02 = data.readString();
                    String _arg13 = data.readString();
                    int _arg22 = data.readInt();
                    int _arg32 = data.readInt();
                    removeCustomTileWithTag(_arg02, _arg13, _arg22, _arg32);
                    reply.writeNoException();
                    break;
                case TRANSACTION_registerListener /* 3 */:
                    data.enforceInterface(DESCRIPTOR);
                    ICustomTileListener _arg03 = ICustomTileListener.Stub.asInterface(data.readStrongBinder());
                    if (0 != data.readInt()) {
                        _arg1 = (ComponentName) ComponentName.CREATOR.createFromParcel(data);
                    } else {
                        _arg1 = null;
                    }
                    int _arg23 = data.readInt();
                    registerListener(_arg03, _arg1, _arg23);
                    reply.writeNoException();
                    break;
                case TRANSACTION_unregisterListener /* 4 */:
                    data.enforceInterface(DESCRIPTOR);
                    ICustomTileListener _arg04 = ICustomTileListener.Stub.asInterface(data.readStrongBinder());
                    int _arg14 = data.readInt();
                    unregisterListener(_arg04, _arg14);
                    reply.writeNoException();
                    break;
                case TRANSACTION_removeCustomTileFromListener /* 5 */:
                    data.enforceInterface(DESCRIPTOR);
                    ICustomTileListener _arg05 = ICustomTileListener.Stub.asInterface(data.readStrongBinder());
                    String _arg15 = data.readString();
                    String _arg24 = data.readString();
                    int _arg33 = data.readInt();
                    removeCustomTileFromListener(_arg05, _arg15, _arg24, _arg33);
                    reply.writeNoException();
                    break;
                case 1598968902:
                    reply.writeString(DESCRIPTOR);
                    break;
            }
            return true;
        }

        /* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/app/ICMStatusBarManager$Stub$Proxy.class */
        private static class Proxy implements ICMStatusBarManager {
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

            @Override // cyanogenmod.app.ICMStatusBarManager
            public void createCustomTileWithTag(String pkg, String opPkg, String tag, int id, CustomTile tile, int[] idReceived, int userId) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(pkg);
                    _data.writeString(opPkg);
                    _data.writeString(tag);
                    _data.writeInt(id);
                    if (tile != null) {
                        _data.writeInt(1);
                        tile.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    _data.writeIntArray(idReceived);
                    _data.writeInt(userId);
                    this.mRemote.transact(1, _data, _reply, 0);
                    _reply.readException();
                    _reply.readIntArray(idReceived);
                    _reply.recycle();
                    _data.recycle();
                } catch (Throwable th) {
                    _reply.recycle();
                    _data.recycle();
                    throw th;
                }
            }

            @Override // cyanogenmod.app.ICMStatusBarManager
            public void removeCustomTileWithTag(String pkg, String tag, int id, int userId) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(pkg);
                    _data.writeString(tag);
                    _data.writeInt(id);
                    _data.writeInt(userId);
                    this.mRemote.transact(Stub.TRANSACTION_removeCustomTileWithTag, _data, _reply, 0);
                    _reply.readException();
                    _reply.recycle();
                    _data.recycle();
                } catch (Throwable th) {
                    _reply.recycle();
                    _data.recycle();
                    throw th;
                }
            }

            @Override // cyanogenmod.app.ICMStatusBarManager
            public void registerListener(ICustomTileListener listener, ComponentName component, int userid) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    if (component != null) {
                        _data.writeInt(1);
                        component.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    _data.writeInt(userid);
                    this.mRemote.transact(Stub.TRANSACTION_registerListener, _data, _reply, 0);
                    _reply.readException();
                    _reply.recycle();
                    _data.recycle();
                } catch (Throwable th) {
                    _reply.recycle();
                    _data.recycle();
                    throw th;
                }
            }

            @Override // cyanogenmod.app.ICMStatusBarManager
            public void unregisterListener(ICustomTileListener listener, int userid) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    _data.writeInt(userid);
                    this.mRemote.transact(Stub.TRANSACTION_unregisterListener, _data, _reply, 0);
                    _reply.readException();
                    _reply.recycle();
                    _data.recycle();
                } catch (Throwable th) {
                    _reply.recycle();
                    _data.recycle();
                    throw th;
                }
            }

            @Override // cyanogenmod.app.ICMStatusBarManager
            public void removeCustomTileFromListener(ICustomTileListener listener, String pkg, String tag, int id) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(listener != null ? listener.asBinder() : null);
                    _data.writeString(pkg);
                    _data.writeString(tag);
                    _data.writeInt(id);
                    this.mRemote.transact(Stub.TRANSACTION_removeCustomTileFromListener, _data, _reply, 0);
                    _reply.readException();
                    _reply.recycle();
                    _data.recycle();
                } catch (Throwable th) {
                    _reply.recycle();
                    _data.recycle();
                    throw th;
                }
            }
        }
    }
}
