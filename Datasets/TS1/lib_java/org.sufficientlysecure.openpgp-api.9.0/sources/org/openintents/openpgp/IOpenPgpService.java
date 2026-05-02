package org.openintents.openpgp;

import android.content.Intent;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.RemoteException;

/* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/IOpenPgpService.class */
public interface IOpenPgpService extends IInterface {
    Intent execute(Intent intent, ParcelFileDescriptor parcelFileDescriptor, ParcelFileDescriptor parcelFileDescriptor2) throws RemoteException;

    /* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/IOpenPgpService$Stub.class */
    public static abstract class Stub extends Binder implements IOpenPgpService {
        private static final String DESCRIPTOR = "org.openintents.openpgp.IOpenPgpService";
        static final int TRANSACTION_execute = 1;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IOpenPgpService asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof IOpenPgpService)) {
                return (IOpenPgpService) iin;
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
            ParcelFileDescriptor _arg2;
            switch (code) {
                case 1:
                    data.enforceInterface(DESCRIPTOR);
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
                    if (0 != data.readInt()) {
                        _arg2 = (ParcelFileDescriptor) ParcelFileDescriptor.CREATOR.createFromParcel(data);
                    } else {
                        _arg2 = null;
                    }
                    Intent _result = execute(_arg0, _arg1, _arg2);
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

        /* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/IOpenPgpService$Stub$Proxy.class */
        private static class Proxy implements IOpenPgpService {
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

            @Override // org.openintents.openpgp.IOpenPgpService
            public Intent execute(Intent data, ParcelFileDescriptor input, ParcelFileDescriptor output) throws RemoteException {
                Intent _result;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
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
                    if (output != null) {
                        _data.writeInt(1);
                        output.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(1, _data, _reply, 0);
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
