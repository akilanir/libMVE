package com.google.tts;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* loaded from: TTS_library_stub.jar:com/google/tts/ITTSCallback.class */
public interface ITTSCallback extends IInterface {
    void markReached(String str) throws RemoteException;

    /* loaded from: TTS_library_stub.jar:com/google/tts/ITTSCallback$Stub.class */
    public static abstract class Stub extends Binder implements ITTSCallback {
        private static final String DESCRIPTOR = "com.google.tts.ITTSCallback";
        static final int TRANSACTION_markReached = 1;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static ITTSCallback asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof ITTSCallback)) {
                return (ITTSCallback) iin;
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
                    String _arg0 = data.readString();
                    markReached(_arg0);
                    break;
                case 1598968902:
                    reply.writeString(DESCRIPTOR);
                    break;
            }
            return true;
        }

        /* loaded from: TTS_library_stub.jar:com/google/tts/ITTSCallback$Stub$Proxy.class */
        private static class Proxy implements ITTSCallback {
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

            @Override // com.google.tts.ITTSCallback
            public void markReached(String mark) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(mark);
                    this.mRemote.transact(1, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }
        }
    }
}
