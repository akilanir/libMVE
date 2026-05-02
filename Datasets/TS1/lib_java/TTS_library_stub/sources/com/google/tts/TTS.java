package com.google.tts;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import com.google.tts.ITTS;
import com.google.tts.ITTSCallback;

/* loaded from: TTS_library_stub.jar:com/google/tts/TTS.class */
public class TTS {
    private static final int MIN_VER = 10;
    private ServiceConnection serviceConnection;
    private ITTS itts;
    private Context ctx;
    private InitListener cb;
    private int version;
    private boolean started;
    private boolean showInstaller;
    private TTSVersionAlert versionAlert;
    private ITTSCallback ittscallback;
    private SpeechCompletedListener speechCompletedCallback;

    /* loaded from: TTS_library_stub.jar:com/google/tts/TTS$InitListener.class */
    public interface InitListener {
        void onInit(int i);
    }

    /* loaded from: TTS_library_stub.jar:com/google/tts/TTS$SpeechCompletedListener.class */
    public interface SpeechCompletedListener {
        void onSpeechCompleted();
    }

    public TTS(Context context, InitListener callback, boolean displayInstallMessage) {
        this.cb = null;
        this.version = -1;
        this.started = false;
        this.showInstaller = false;
        this.versionAlert = null;
        this.speechCompletedCallback = null;
        this.showInstaller = displayInstallMessage;
        this.ctx = context;
        this.cb = callback;
        if (dataFilesCheck()) {
            initTts();
        }
    }

    public TTS(Context context, InitListener callback, TTSVersionAlert alert) {
        this.cb = null;
        this.version = -1;
        this.started = false;
        this.showInstaller = false;
        this.versionAlert = null;
        this.speechCompletedCallback = null;
        this.showInstaller = true;
        this.versionAlert = alert;
        this.ctx = context;
        this.cb = callback;
        if (dataFilesCheck()) {
            initTts();
        }
    }

    public void setOnSpeechCompletedListener(SpeechCompletedListener listener) {
        this.speechCompletedCallback = listener;
    }

    private boolean dataFilesCheck() {
        if (!ConfigurationManager.allFilesExist()) {
            if (!this.showInstaller) {
                return false;
            }
            try {
                Context myContext = this.ctx.createPackageContext("com.google.tts", 3);
                Class<?> appClass = myContext.getClassLoader().loadClass("com.google.tts.ConfigurationManager");
                Intent intent = new Intent(myContext, appClass);
                this.ctx.startActivity(intent);
                return false;
            } catch (PackageManager.NameNotFoundException e) {
                e.printStackTrace();
                return true;
            } catch (ClassNotFoundException e2) {
                e2.printStackTrace();
                return true;
            }
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void initTts() {
        this.started = false;
        this.serviceConnection = new ServiceConnection() { // from class: com.google.tts.TTS.1
            @Override // android.content.ServiceConnection
            public void onServiceConnected(ComponentName name, IBinder service) {
                TTS.this.itts = ITTS.Stub.asInterface(service);
                try {
                    TTS.this.version = TTS.this.itts.getVersion();
                    if (TTS.this.version < TTS.MIN_VER) {
                        if (TTS.this.showInstaller) {
                            if (TTS.this.versionAlert != null) {
                                TTS.this.versionAlert.show();
                                return;
                            } else {
                                new TTSVersionAlert(TTS.this.ctx, null, null, null).show();
                                return;
                            }
                        }
                        return;
                    }
                    TTS.this.ittscallback = new ITTSCallback.Stub() { // from class: com.google.tts.TTS.1.1
                        @Override // com.google.tts.ITTSCallback
                        public void markReached(String mark) throws RemoteException {
                            if (TTS.this.speechCompletedCallback != null) {
                                TTS.this.speechCompletedCallback.onSpeechCompleted();
                            }
                        }
                    };
                    TTS.this.itts.registerCallback(TTS.this.ittscallback);
                    TTS.this.started = true;
                    if (TTS.this.cb != null) {
                        TTS.this.cb.onInit(TTS.this.version);
                    }
                } catch (RemoteException e) {
                    TTS.this.initTts();
                }
            }

            @Override // android.content.ServiceConnection
            public void onServiceDisconnected(ComponentName name) {
                TTS.this.itts = null;
                TTS.this.cb = null;
                TTS.this.started = false;
            }
        };
        Intent intent = new Intent("android.intent.action.USE_TTS");
        intent.addCategory("android.intent.category.TTS");
        if (!this.ctx.bindService(intent, this.serviceConnection, 1) && this.showInstaller) {
            if (this.versionAlert != null) {
                this.versionAlert.show();
            } else {
                new TTSVersionAlert(this.ctx, null, null, null).show();
            }
        }
    }

    public void shutdown() {
        try {
            this.ctx.unbindService(this.serviceConnection);
        } catch (IllegalArgumentException e) {
        }
    }

    public void addSpeech(String text, String packagename, int resourceId) {
        if (!this.started) {
            return;
        }
        try {
            this.itts.addSpeech(text, packagename, resourceId);
        } catch (RemoteException e) {
            this.started = false;
            initTts();
        } catch (IllegalStateException e2) {
            this.started = false;
            initTts();
        } catch (NullPointerException e3) {
            this.started = false;
            initTts();
        }
    }

    public void addSpeech(String text, String filename) {
        if (!this.started) {
            return;
        }
        try {
            this.itts.addSpeechFile(text, filename);
        } catch (RemoteException e) {
            this.started = false;
            initTts();
        } catch (IllegalStateException e2) {
            this.started = false;
            initTts();
        } catch (NullPointerException e3) {
            this.started = false;
            initTts();
        }
    }

    public void speak(String text, int queueMode, String[] params) {
        Log.i("TTS received: ", text);
        if (!this.started) {
            return;
        }
        try {
            this.itts.speak(text, queueMode, params);
        } catch (RemoteException e) {
            Log.e("TTS", "RemoteException error.");
            this.started = false;
            initTts();
        } catch (IllegalStateException e2) {
            Log.e("TTS", "IllegalStateException error.");
            this.started = false;
            initTts();
        } catch (NullPointerException e3) {
            Log.e("TTS", "NullPointerException error.");
            this.started = false;
            initTts();
        }
    }

    public void playEarcon(String earcon, int queueMode, String[] params) {
        if (!this.started) {
            return;
        }
        try {
            this.itts.playEarcon(earcon, queueMode, params);
        } catch (RemoteException e) {
            this.started = false;
            initTts();
        } catch (IllegalStateException e2) {
            this.started = false;
            initTts();
        } catch (NullPointerException e3) {
            this.started = false;
            initTts();
        }
    }

    public void playEarcon(TTSEarcon earcon, int queueMode, String[] params) {
        playEarcon(earcon.name(), queueMode, params);
    }

    public boolean isSpeaking() {
        if (!this.started) {
            return false;
        }
        try {
            return this.itts.isSpeaking();
        } catch (RemoteException e) {
            this.started = false;
            initTts();
            return false;
        } catch (IllegalStateException e2) {
            this.started = false;
            initTts();
            return false;
        } catch (NullPointerException e3) {
            this.started = false;
            initTts();
            return false;
        }
    }

    public void stop() {
        if (!this.started) {
            return;
        }
        try {
            this.itts.stop();
        } catch (RemoteException e) {
            this.started = false;
            initTts();
        } catch (IllegalStateException e2) {
            this.started = false;
            initTts();
        } catch (NullPointerException e3) {
            this.started = false;
            initTts();
        }
    }

    public int getVersion() {
        return this.version;
    }

    public void setEngine(TTSEngine selectedEngine) {
        if (!this.started) {
            return;
        }
        try {
            this.itts.setEngine(selectedEngine.toString());
        } catch (RemoteException e) {
            this.started = false;
            initTts();
        }
    }

    public void setEngine(String ttsEngineBinary) {
        if (!this.started) {
            return;
        }
        try {
            this.itts.setEngine(ttsEngineBinary);
        } catch (RemoteException e) {
            this.started = false;
            initTts();
        }
    }

    public void setSpeechRate(int speechRate) {
        if (!this.started) {
            return;
        }
        try {
            this.itts.setSpeechRate(speechRate);
        } catch (RemoteException e) {
            this.started = false;
            initTts();
        }
    }

    public void setLanguage(String language) {
        if (!this.started) {
            return;
        }
        try {
            this.itts.setLanguage(language);
        } catch (RemoteException e) {
            this.started = false;
            initTts();
        }
    }

    public boolean synthesizeToFile(String text, String[] params, String filename) {
        if (!this.started) {
            return false;
        }
        try {
            return this.itts.synthesizeToFile(text, params, filename);
        } catch (RemoteException e) {
            this.started = false;
            initTts();
            return false;
        } catch (IllegalStateException e2) {
            this.started = false;
            initTts();
            return false;
        } catch (NullPointerException e3) {
            this.started = false;
            initTts();
            return false;
        }
    }

    public void showVersionAlert() {
        if (!this.started) {
            return;
        }
        if (this.versionAlert != null) {
            this.versionAlert.show();
        } else {
            new TTSVersionAlert(this.ctx, null, null, null).show();
        }
    }

    public static boolean isInstalled(Context ctx) {
        PackageManager pm = ctx.getPackageManager();
        Intent intent = new Intent("android.intent.action.USE_TTS");
        intent.addCategory("android.intent.category.TTS");
        ResolveInfo info = pm.resolveService(intent, 0);
        if (info == null) {
            return false;
        }
        return true;
    }
}
