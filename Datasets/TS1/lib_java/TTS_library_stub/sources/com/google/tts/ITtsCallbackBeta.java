package com.google.tts;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* loaded from: TTS_library_stub.jar:com/google/tts/ITtsCallbackBeta.class */
public interface ITtsCallbackBeta extends IInterface {
    void utteranceCompleted(String str) throws RemoteException;

    /* loaded from: TTS_library_stub.jar:com/google/tts/ITtsCallbackBeta$Stub.class */
    public static abstract class Stub extends Binder implements ITtsCallbackBeta {
        private static final String DESCRIPTOR = "com.google.tts.ITtsCallbackBeta";
        static final int TRANSACTION_utteranceCompleted = 1;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static ITtsCallbackBeta asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof ITtsCallbackBeta)) {
                return (ITtsCallbackBeta) iin;
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
                    utteranceCompleted(_arg0);
                    break;
                case 1598968902:
                    reply.writeString(DESCRIPTOR);
                    break;
            }
            return true;
        }

        /* loaded from: TTS_library_stub.jar:com/google/tts/ITtsCallbackBeta$Stub$Proxy.class */
        private static class Proxy implements ITtsCallbackBeta {
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

            @Override // com.google.tts.ITtsCallbackBeta
            public void utteranceCompleted(String utteranceId) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(utteranceId);
                    this.mRemote.transact(1, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }
        }
    }
}
