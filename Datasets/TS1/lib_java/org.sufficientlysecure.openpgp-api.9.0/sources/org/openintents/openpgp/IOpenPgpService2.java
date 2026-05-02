package org.openintents.openpgp;

import android.content.Intent;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.RemoteException;

/* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/IOpenPgpService2.class */
public interface IOpenPgpService2 extends IInterface {
    ParcelFileDescriptor createOutputPipe(int i) throws RemoteException;

    Intent execute(Intent intent, ParcelFileDescriptor parcelFileDescriptor, int i) throws RemoteException;

    /* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/IOpenPgpService2$Stub.class */
    public static abstract class Stub extends Binder implements IOpenPgpService2 {
        private static final String DESCRIPTOR = "org.openintents.openpgp.IOpenPgpService2";
        static final int TRANSACTION_createOutputPipe = 1;
        static final int TRANSACTION_execute = 2;

        public Stub() {
            attachInterface(this, "org.openintents.openpgp.IOpenPgpService2");
        }

        public static IOpenPgpService2 asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface("org.openintents.openpgp.IOpenPgpService2");
            if (iin != null && (iin instanceof IOpenPgpService2)) {
                return (IOpenPgpService2) iin;
            }
            return new Proxy(obj);
        }

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            Intent _arg0;
            ParcelFileDescriptor _arg1;
            switch (code) {
                case 1:
                    data.enforceInterface("org.openintents.openpgp.IOpenPgpService2");
                    int _arg02 = data.readInt();
                    ParcelFileDescriptor _result = createOutputPipe(_arg02);
                    reply.writeNoException();
                    if (_result != null) {
                        reply.writeInt(1);
                        _result.writeToParcel(reply, 1);
                        break;
                    } else {
                        reply.writeInt(0);
                        break;
                    }
                case 2:
                    data.enforceInterface("org.openintents.openpgp.IOpenPgpService2");
                    if (0 != data.readInt()) {
                        _arg0 = (Intent) Intent.CREATOR.createFromParcel(data);
                    } else {
                        _arg0 = null;
                    }
                    if (0 != data.readInt()) {
                        _arg1 = (ParcelFileDescriptor) ParcelFileDescriptor.CREATOR.createFromParcel(data);
                    } else {
                        _arg1 = null;
                    }
                    int _arg2 = data.readInt();
                    Intent _result2 = execute(_arg0, _arg1, _arg2);
                    reply.writeNoException();
                    if (_result2 != null) {
                        reply.writeInt(1);
                        _result2.writeToParcel(reply, 1);
                        break;
                    } else {
                        reply.writeInt(0);
                        break;
                    }
                case 1598968902:
                    reply.writeString("org.openintents.openpgp.IOpenPgpService2");
                    break;
            }
            return true;
        }

        /* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/IOpenPgpService2$Stub$Proxy.class */
        private static class Proxy implements IOpenPgpService2 {
            private IBinder mRemote;

            Proxy(IBinder remote) {
                this.mRemote = remote;
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return "org.openintents.openpgp.IOpenPgpService2";
            }

            @Override // org.openintents.openpgp.IOpenPgpService2
            public ParcelFileDescriptor createOutputPipe(int pipeId) throws RemoteException {
                ParcelFileDescriptor _result;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken("org.openintents.openpgp.IOpenPgpService2");
                    _data.writeInt(pipeId);
                    this.mRemote.transact(1, _data, _reply, 0);
                    _reply.readException();
                    if (0 != _reply.readInt()) {
                        _result = (ParcelFileDescriptor) ParcelFileDescriptor.CREATOR.createFromParcel(_reply);
                    } else {
                        _result = null;
                    }
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // org.openintents.openpgp.IOpenPgpService2
            public Intent execute(Intent data, ParcelFileDescriptor input, int pipeId) throws RemoteException {
                Intent _result;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken("org.openintents.openpgp.IOpenPgpService2");
                    if (data != null) {
                        _data.writeInt(1);
                        data.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    if (input != null) {
                        _data.writeInt(1);
                        input.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    _data.writeInt(pipeId);
                    this.mRemote.transact(2, _data, _reply, 0);
                    _reply.readException();
                    if (0 != _reply.readInt()) {
                        _result = (Intent) Intent.CREATOR.createFromParcel(_reply);
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
