package com.google.tts;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.tts.ITtsCallbackBeta;

/* loaded from: TTS_library_stub.jar:com/google/tts/ITtsBeta.class */
public interface ITtsBeta extends IInterface {
    int setSpeechRate(String str, int i) throws RemoteException;

    int setPitch(String str, int i) throws RemoteException;

    int speak(String str, String str2, int i, String[] strArr) throws RemoteException;

    boolean isSpeaking() throws RemoteException;

    int stop(String str) throws RemoteException;

    void addSpeech(String str, String str2, String str3, int i) throws RemoteException;

    void addSpeechFile(String str, String str2, String str3) throws RemoteException;

    String[] getLanguage() throws RemoteException;

    int isLanguageAvailable(String str, String str2, String str3) throws RemoteException;

    int setLanguage(String str, String str2, String str3, String str4) throws RemoteException;

    boolean synthesizeToFile(String str, String str2, String[] strArr, String str3) throws RemoteException;

    int playEarcon(String str, String str2, int i, String[] strArr) throws RemoteException;

    void addEarcon(String str, String str2, String str3, int i) throws RemoteException;

    void addEarconFile(String str, String str2, String str3) throws RemoteException;

    int registerCallback(String str, ITtsCallbackBeta iTtsCallbackBeta) throws RemoteException;

    int unregisterCallback(String str, ITtsCallbackBeta iTtsCallbackBeta) throws RemoteException;

    int playSilence(String str, long j, int i, String[] strArr) throws RemoteException;

    /* loaded from: TTS_library_stub.jar:com/google/tts/ITtsBeta$Stub.class */
    public static abstract class Stub extends Binder implements ITtsBeta {
        private static final String DESCRIPTOR = "com.google.tts.ITtsBeta";
        static final int TRANSACTION_setSpeechRate = 1;
        static final int TRANSACTION_setPitch = 2;
        static final int TRANSACTION_speak = 3;
        static final int TRANSACTION_isSpeaking = 4;
        static final int TRANSACTION_stop = 5;
        static final int TRANSACTION_addSpeech = 6;
        static final int TRANSACTION_addSpeechFile = 7;
        static final int TRANSACTION_getLanguage = 8;
        static final int TRANSACTION_isLanguageAvailable = 9;
        static final int TRANSACTION_setLanguage = 10;
        static final int TRANSACTION_synthesizeToFile = 11;
        static final int TRANSACTION_playEarcon = 12;
        static final int TRANSACTION_addEarcon = 13;
        static final int TRANSACTION_addEarconFile = 14;
        static final int TRANSACTION_registerCallback = 15;
        static final int TRANSACTION_unregisterCallback = 16;
        static final int TRANSACTION_playSilence = 17;

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static ITtsBeta asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && (iin instanceof ITtsBeta)) {
                return (ITtsBeta) iin;
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
                    int _arg1 = data.readInt();
                    int _result = setSpeechRate(_arg0, _arg1);
                    reply.writeNoException();
                    reply.writeInt(_result);
                    break;
                case 2:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg02 = data.readString();
                    int _arg12 = data.readInt();
                    int _result2 = setPitch(_arg02, _arg12);
                    reply.writeNoException();
                    reply.writeInt(_result2);
                    break;
                case 3:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg03 = data.readString();
                    String _arg13 = data.readString();
                    int _arg2 = data.readInt();
                    String[] _arg3 = data.createStringArray();
                    int _result3 = speak(_arg03, _arg13, _arg2, _arg3);
                    reply.writeNoException();
                    reply.writeInt(_result3);
                    break;
                case TRANSACTION_isSpeaking /* 4 */:
                    data.enforceInterface(DESCRIPTOR);
                    boolean _result4 = isSpeaking();
                    reply.writeNoException();
                    reply.writeInt(_result4 ? 1 : 0);
                    break;
                case TRANSACTION_stop /* 5 */:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg04 = data.readString();
                    int _result5 = stop(_arg04);
                    reply.writeNoException();
                    reply.writeInt(_result5);
                    break;
                case TRANSACTION_addSpeech /* 6 */:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg05 = data.readString();
                    String _arg14 = data.readString();
                    String _arg22 = data.readString();
                    int _arg32 = data.readInt();
                    addSpeech(_arg05, _arg14, _arg22, _arg32);
                    reply.writeNoException();
                    break;
                case TRANSACTION_addSpeechFile /* 7 */:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg06 = data.readString();
                    String _arg15 = data.readString();
                    String _arg23 = data.readString();
                    addSpeechFile(_arg06, _arg15, _arg23);
                    reply.writeNoException();
                    break;
                case TRANSACTION_getLanguage /* 8 */:
                    data.enforceInterface(DESCRIPTOR);
                    String[] _result6 = getLanguage();
                    reply.writeNoException();
                    reply.writeStringArray(_result6);
                    break;
                case TRANSACTION_isLanguageAvailable /* 9 */:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg07 = data.readString();
                    String _arg16 = data.readString();
                    String _arg24 = data.readString();
                    int _result7 = isLanguageAvailable(_arg07, _arg16, _arg24);
                    reply.writeNoException();
                    reply.writeInt(_result7);
                    break;
                case TRANSACTION_setLanguage /* 10 */:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg08 = data.readString();
                    String _arg17 = data.readString();
                    String _arg25 = data.readString();
                    String _arg33 = data.readString();
                    int _result8 = setLanguage(_arg08, _arg17, _arg25, _arg33);
                    reply.writeNoException();
                    reply.writeInt(_result8);
                    break;
                case TRANSACTION_synthesizeToFile /* 11 */:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg09 = data.readString();
                    String _arg18 = data.readString();
                    String[] _arg26 = data.createStringArray();
                    String _arg34 = data.readString();
                    boolean _result9 = synthesizeToFile(_arg09, _arg18, _arg26, _arg34);
                    reply.writeNoException();
                    reply.writeInt(_result9 ? 1 : 0);
                    break;
                case TRANSACTION_playEarcon /* 12 */:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg010 = data.readString();
                    String _arg19 = data.readString();
                    int _arg27 = data.readInt();
                    String[] _arg35 = data.createStringArray();
                    int _result10 = playEarcon(_arg010, _arg19, _arg27, _arg35);
                    reply.writeNoException();
                    reply.writeInt(_result10);
                    break;
                case TRANSACTION_addEarcon /* 13 */:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg011 = data.readString();
                    String _arg110 = data.readString();
                    String _arg28 = data.readString();
                    int _arg36 = data.readInt();
                    addEarcon(_arg011, _arg110, _arg28, _arg36);
                    reply.writeNoException();
                    break;
                case TRANSACTION_addEarconFile /* 14 */:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg012 = data.readString();
                    String _arg111 = data.readString();
                    String _arg29 = data.readString();
                    addEarconFile(_arg012, _arg111, _arg29);
                    reply.writeNoException();
                    break;
                case TRANSACTION_registerCallback /* 15 */:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg013 = data.readString();
                    ITtsCallbackBeta _arg112 = ITtsCallbackBeta.Stub.asInterface(data.readStrongBinder());
                    int _result11 = registerCallback(_arg013, _arg112);
                    reply.writeNoException();
                    reply.writeInt(_result11);
                    break;
                case TRANSACTION_unregisterCallback /* 16 */:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg014 = data.readString();
                    ITtsCallbackBeta _arg113 = ITtsCallbackBeta.Stub.asInterface(data.readStrongBinder());
                    int _result12 = unregisterCallback(_arg014, _arg113);
                    reply.writeNoException();
                    reply.writeInt(_result12);
                    break;
                case TRANSACTION_playSilence /* 17 */:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg015 = data.readString();
                    long _arg114 = data.readLong();
                    int _arg210 = data.readInt();
                    String[] _arg37 = data.createStringArray();
                    int _result13 = playSilence(_arg015, _arg114, _arg210, _arg37);
                    reply.writeNoException();
                    reply.writeInt(_result13);
                    break;
                case 1598968902:
                    reply.writeString(DESCRIPTOR);
                    break;
            }
            return true;
        }

        /* loaded from: TTS_library_stub.jar:com/google/tts/ITtsBeta$Stub$Proxy.class */
        private static class Proxy implements ITtsBeta {
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

            @Override // com.google.tts.ITtsBeta
            public int setSpeechRate(String callingApp, int speechRate) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(callingApp);
                    _data.writeInt(speechRate);
                    this.mRemote.transact(1, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITtsBeta
            public int setPitch(String callingApp, int pitch) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(callingApp);
                    _data.writeInt(pitch);
                    this.mRemote.transact(2, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITtsBeta
            public int speak(String callingApp, String text, int queueMode, String[] params) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(callingApp);
                    _data.writeString(text);
                    _data.writeInt(queueMode);
                    _data.writeStringArray(params);
                    this.mRemote.transact(3, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITtsBeta
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

            @Override // com.google.tts.ITtsBeta
            public int stop(String callingApp) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(callingApp);
                    this.mRemote.transact(Stub.TRANSACTION_stop, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITtsBeta
            public void addSpeech(String callingApp, String text, String packageName, int resId) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(callingApp);
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

            @Override // com.google.tts.ITtsBeta
            public void addSpeechFile(String callingApp, String text, String filename) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(callingApp);
                    _data.writeString(text);
                    _data.writeString(filename);
                    this.mRemote.transact(Stub.TRANSACTION_addSpeechFile, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITtsBeta
            public String[] getLanguage() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(Stub.TRANSACTION_getLanguage, _data, _reply, 0);
                    _reply.readException();
                    String[] _result = _reply.createStringArray();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITtsBeta
            public int isLanguageAvailable(String language, String country, String variant) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(language);
                    _data.writeString(country);
                    _data.writeString(variant);
                    this.mRemote.transact(Stub.TRANSACTION_isLanguageAvailable, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITtsBeta
            public int setLanguage(String callingApp, String language, String country, String variant) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(callingApp);
                    _data.writeString(language);
                    _data.writeString(country);
                    _data.writeString(variant);
                    this.mRemote.transact(Stub.TRANSACTION_setLanguage, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITtsBeta
            public boolean synthesizeToFile(String callingApp, String text, String[] params, String outputDirectory) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(callingApp);
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

            @Override // com.google.tts.ITtsBeta
            public int playEarcon(String callingApp, String earcon, int queueMode, String[] params) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(callingApp);
                    _data.writeString(earcon);
                    _data.writeInt(queueMode);
                    _data.writeStringArray(params);
                    this.mRemote.transact(Stub.TRANSACTION_playEarcon, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITtsBeta
            public void addEarcon(String callingApp, String earcon, String packageName, int resId) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(callingApp);
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

            @Override // com.google.tts.ITtsBeta
            public void addEarconFile(String callingApp, String earcon, String filename) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(callingApp);
                    _data.writeString(earcon);
                    _data.writeString(filename);
                    this.mRemote.transact(Stub.TRANSACTION_addEarconFile, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITtsBeta
            public int registerCallback(String callingApp, ITtsCallbackBeta cb) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(callingApp);
                    _data.writeStrongBinder(cb != null ? cb.asBinder() : null);
                    this.mRemote.transact(Stub.TRANSACTION_registerCallback, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITtsBeta
            public int unregisterCallback(String callingApp, ITtsCallbackBeta cb) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(callingApp);
                    _data.writeStrongBinder(cb != null ? cb.asBinder() : null);
                    this.mRemote.transact(Stub.TRANSACTION_unregisterCallback, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            @Override // com.google.tts.ITtsBeta
            public int playSilence(String callingApp, long duration, int queueMode, String[] params) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(callingApp);
                    _data.writeLong(duration);
                    _data.writeInt(queueMode);
                    _data.writeStringArray(params);
                    this.mRemote.transact(Stub.TRANSACTION_playSilence, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }
        }
    }
}
