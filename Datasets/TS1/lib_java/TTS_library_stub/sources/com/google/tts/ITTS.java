package com.google.tts;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.tts.ITTSCallback;

/* loaded from: TTS_library_stub.jar:com/google/tts/ITTS.class */
public interface ITTS extends IInterface {
    void setEngine(String str) throws RemoteException;

    void setSpeechRate(int i) throws RemoteException;

    void speak(String str, int i, String[] strArr) throws RemoteException;

    boolean isSpeaking() throws RemoteException;

    void stop() throws RemoteException;

    void addSpeech(String str, String str2, int i) throws RemoteException;

    void addSpeechFile(String str, String str2) throws RemoteException;

    int getVersion() throws RemoteException;

    void setLanguage(String str) throws RemoteException;

    boolean synthesizeToFile(String str, String[] strArr, String str2) throws RemoteException;

    void playEarcon(String str, int i, String[] strArr) throws RemoteException;

    void addEarcon(String str, String str2, int i) throws RemoteException;

    void addEarconFile(String str, String str2) throws RemoteException;

    void registerCallback(ITTSCallback iTTSCallback) throws RemoteException;

    void unregisterCallback(ITTSCallback iTTSCallback) throws RemoteException;

    /* loaded from: TTS_library_stub.jar:com/google/tts/ITTS$Stub.class */
    public static abstract class Stub extends Binder implements ITTS {
        private static final String DESCRIPTOR = "com.google.tts.ITTS";
        static final int TRANSACTION_setEngine = 1;
        static final int TRANSACTION_setSpeechRate = 2;
        static final int TRANSACTION_speak = 3;
        static final int TRANSACTION_isSpeaking = 4;
        static final int TRANSACTION_stop = 5;
        static final int TRANSACTION_addSpeech = 6;
        static final int TRANSACTION_addSpeechFile = 7;
        static final int TRANSACTION_getVersion = 8;
        static final int TRANSACTION_setLanguage = 9;
        static final int TRANSACTION_synthesizeToFile = 10;
        static final int TRANSACTION_playEarcon = 11;
        static final int TRANSACTION_addEarcon = 12;
        static final int TRANSACTION_addEarconFile = 13;
        static final int TRANSACTION_registerCallback = 14;
        static final int TRANSACTION_unregisterCallback = 15;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static ITTS asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof ITTS)) {
                return (ITTS) iin;
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
                    setEngine(_arg0);
                    reply.writeNoException();
                    break;
                case 2:
                    data.enforceInterface(DESCRIPTOR);
                    int _arg02 = data.readInt();
                    setSpeechRate(_arg02);
                    reply.writeNoException();
                    break;
                case 3:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg03 = data.readString();
                    int _arg1 = data.readInt();
                    String[] _arg2 = data.createStringArray();
                    speak(_arg03, _arg1, _arg2);
                    reply.writeNoException();
                    break;
                case TRANSACTION_isSpeaking /* 4 */:
                    data.enforceInterface(DESCRIPTOR);
                    boolean _result = isSpeaking();
                    reply.writeNoException();
                    reply.writeInt(_result ? 1 : 0);
                    break;
                case TRANSACTION_stop /* 5 */:
                    data.enforceInterface(DESCRIPTOR);
                    stop();
                    reply.writeNoException();
                    break;
                case TRANSACTION_addSpeech /* 6 */:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg04 = data.readString();
                    String _arg12 = data.readString();
                    int _arg22 = data.readInt();
                    addSpeech(_arg04, _arg12, _arg22);
                    reply.writeNoException();
                    break;
                case TRANSACTION_addSpeechFile /* 7 */:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg05 = data.readString();
                    String _arg13 = data.readString();
                    addSpeechFile(_arg05, _arg13);
                    reply.writeNoException();
                    break;
                case TRANSACTION_getVersion /* 8 */:
                    data.enforceInterface(DESCRIPTOR);
                    int _result2 = getVersion();
                    reply.writeNoException();
                    reply.writeInt(_result2);
                    break;
                case TRANSACTION_setLanguage /* 9 */:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg06 = data.readString();
                    setLanguage(_arg06);
                    reply.writeNoException();
                    break;
                case TRANSACTION_synthesizeToFile /* 10 */:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg07 = data.readString();
                    String[] _arg14 = data.createStringArray();
                    String _arg23 = data.readString();
                    boolean _result3 = synthesizeToFile(_arg07, _arg14, _arg23);
                    reply.writeNoException();
                    reply.writeInt(_result3 ? 1 : 0);
                    break;
                case TRANSACTION_playEarcon /* 11 */:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg08 = data.readString();
                    int _arg15 = data.readInt();
                    String[] _arg24 = data.createStringArray();
                    playEarcon(_arg08, _arg15, _arg24);
                    reply.writeNoException();
                    break;
                case TRANSACTION_addEarcon /* 12 */:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg09 = data.readString();
                    String _arg16 = data.readString();
                    int _arg25 = data.readInt();
                    addEarcon(_arg09, _arg16, _arg25);
                    reply.writeNoException();
                    break;
                case TRANSACTION_addEarconFile /* 13 */:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg010 = data.readString();
                    String _arg17 = data.readString();
                    addEarconFile(_arg010, _arg17);
                    reply.writeNoException();
                    break;
                case TRANSACTION_registerCallback /* 14 */:
                    data.enforceInterface(DESCRIPTOR);
                    ITTSCallback _arg011 = ITTSCallback.Stub.asInterface(data.readStrongBinder());
                    registerCallback(_arg011);
                    reply.writeNoException();
                    break;
                case TRANSACTION_unregisterCallback /* 15 */:
                    data.enforceInterface(DESCRIPTOR);
                    ITTSCallback _arg012 = ITTSCallback.Stub.asInterface(data.readStrongBinder());
                    unregisterCallback(_arg012);
                    reply.writeNoException();
                    break;
                case 1598968902:
                    reply.writeString(DESCRIPTOR);
                    break;
            }
            return true;
        }

        /* loaded from: TTS_library_stub.jar:com/google/tts/ITTS$Stub$Proxy.class */
        private static class Proxy implements ITTS {
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

            @Override // com.google.tts.ITTS
            public void setEngine(String selectedEngine) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(selectedEngine);
                    this.mRemote.transact(1, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITTS
            public void setSpeechRate(int speechRate) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(speechRate);
                    this.mRemote.transact(2, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITTS
            public void speak(String text, int queueMode, String[] params) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(text);
                    _data.writeInt(queueMode);
                    _data.writeStringArray(params);
                    this.mRemote.transact(3, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITTS
            public boolean isSpeaking() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(Stub.TRANSACTION_isSpeaking, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITTS
            public void stop() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(Stub.TRANSACTION_stop, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITTS
            public void addSpeech(String text, String packageName, int resId) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(text);
                    _data.writeString(packageName);
                    _data.writeInt(resId);
                    this.mRemote.transact(Stub.TRANSACTION_addSpeech, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITTS
            public void addSpeechFile(String text, String filename) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(text);
                    _data.writeString(filename);
                    this.mRemote.transact(Stub.TRANSACTION_addSpeechFile, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITTS
            public int getVersion() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(Stub.TRANSACTION_getVersion, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITTS
            public void setLanguage(String language) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(language);
                    this.mRemote.transact(Stub.TRANSACTION_setLanguage, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITTS
            public boolean synthesizeToFile(String text, String[] params, String outputDirectory) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(text);
                    _data.writeStringArray(params);
                    _data.writeString(outputDirectory);
                    this.mRemote.transact(Stub.TRANSACTION_synthesizeToFile, _data, _reply, 0);
                    _reply.readException();
                    boolean _result = _reply.readInt() != 0;
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITTS
            public void playEarcon(String earcon, int queueMode, String[] params) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(earcon);
                    _data.writeInt(queueMode);
                    _data.writeStringArray(params);
                    this.mRemote.transact(Stub.TRANSACTION_playEarcon, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITTS
            public void addEarcon(String earcon, String packageName, int resId) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(earcon);
                    _data.writeString(packageName);
                    _data.writeInt(resId);
                    this.mRemote.transact(Stub.TRANSACTION_addEarcon, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITTS
            public void addEarconFile(String earcon, String filename) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(earcon);
                    _data.writeString(filename);
                    this.mRemote.transact(Stub.TRANSACTION_addEarconFile, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITTS
            public void registerCallback(ITTSCallback cb) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(cb != null ? cb.asBinder() : null);
                    this.mRemote.transact(Stub.TRANSACTION_registerCallback, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITTS
            public void unregisterCallback(ITTSCallback cb) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStrongBinder(cb != null ? cb.asBinder() : null);
                    this.mRemote.transact(Stub.TRANSACTION_unregisterCallback, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }
        }
    }
}
