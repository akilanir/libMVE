package com.google.tts;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.IBinder;
import android.os.RemoteException;
import android.speech.tts.TextToSpeech;
import android.util.Log;
import com.google.tts.ITtsBeta;
import com.google.tts.ITtsCallbackBeta;
import java.util.HashMap;
import java.util.Locale;

/* loaded from: TTS_library_stub.jar:com/google/tts/TextToSpeechBeta.class */
public class TextToSpeechBeta extends TextToSpeech {
    public static final String USING_PLATFORM_TTS = "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for ";
    public static final String NOT_ON_PLATFORM_TTS = "TextToSpeechBeta not installed - basic platform TextToSpeech does not support ";
    public static final int SUCCESS = 0;
    public static final int ERROR = -1;
    public static final int QUEUE_FLUSH = 0;
    public static final int QUEUE_ADD = 1;
    public static final int LANG_COUNTRY_VAR_AVAILABLE = 2;
    public static final int LANG_COUNTRY_AVAILABLE = 1;
    public static final int LANG_AVAILABLE = 0;
    public static final int LANG_MISSING_DATA = -1;
    public static final int LANG_NOT_SUPPORTED = -2;
    public static final String ACTION_TTS_QUEUE_PROCESSING_COMPLETED = "android.speech.tts.TTS_QUEUE_PROCESSING_COMPLETED";
    private ServiceConnection mServiceConnection;
    private ITtsBeta mITts;
    private ITtsCallbackBeta mITtscallback;
    private Context mContext;
    private String mPackageName;
    private boolean mStarted;
    private final Object mStartLock;
    private String[] mCachedParams;
    private static OnInitListener mInitListener = null;
    static boolean ttsBetaInstalled = false;
    static TextToSpeech.OnInitListener platformOnInitListener = new TextToSpeech.OnInitListener() { // from class: com.google.tts.TextToSpeechBeta.1
        @Override // android.speech.tts.TextToSpeech.OnInitListener
        public void onInit(int status) {
            if (!TextToSpeechBeta.ttsBetaInstalled && TextToSpeechBeta.mInitListener != null) {
                TextToSpeechBeta.mInitListener.onInit(status, -1);
            }
        }
    };

    /* loaded from: TTS_library_stub.jar:com/google/tts/TextToSpeechBeta$OnInitListener.class */
    public interface OnInitListener {
        void onInit(int i, int i2);
    }

    /* loaded from: TTS_library_stub.jar:com/google/tts/TextToSpeechBeta$OnUtteranceCompletedListener.class */
    public interface OnUtteranceCompletedListener {
        void onUtteranceCompleted(String str);
    }

    /* loaded from: TTS_library_stub.jar:com/google/tts/TextToSpeechBeta$Engine.class */
    public class Engine {
        public static final int DEFAULT_RATE = 100;
        public static final int DEFAULT_PITCH = 100;
        public static final int USE_DEFAULTS = 0;
        public static final String DEFAULT_SYNTH = "com.svox.pico";
        public static final int DEFAULT_STREAM = 3;
        public static final int CHECK_VOICE_DATA_PASS = 1;
        public static final int CHECK_VOICE_DATA_FAIL = 0;
        public static final int CHECK_VOICE_DATA_BAD_DATA = -1;
        public static final int CHECK_VOICE_DATA_MISSING_DATA = -2;
        public static final int CHECK_VOICE_DATA_MISSING_VOLUME = -3;
        public static final String ACTION_INSTALL_TTS_DATA = "android.speech.tts.engine.INSTALL_TTS_DATA";
        public static final String ACTION_TTS_DATA_INSTALLED = "android.speech.tts.engine.TTS_DATA_INSTALLED";
        public static final String ACTION_CHECK_TTS_DATA = "android.speech.tts.engine.CHECK_TTS_DATA";
        public static final String EXTRA_VOICE_DATA_ROOT_DIRECTORY = "dataRoot";
        public static final String EXTRA_VOICE_DATA_FILES = "dataFiles";
        public static final String EXTRA_VOICE_DATA_FILES_INFO = "dataFilesInfo";
        public static final String EXTRA_TTS_DATA_INSTALLED = "dataInstalled";
        public static final String KEY_PARAM_RATE = "rate";
        public static final String KEY_PARAM_LANGUAGE = "language";
        public static final String KEY_PARAM_COUNTRY = "country";
        public static final String KEY_PARAM_VARIANT = "variant";
        public static final String KEY_PARAM_STREAM = "streamType";
        public static final String KEY_PARAM_UTTERANCE_ID = "utteranceId";
        protected static final int PARAM_POSITION_RATE = 0;
        protected static final int PARAM_POSITION_LANGUAGE = 2;
        protected static final int PARAM_POSITION_COUNTRY = 4;
        protected static final int PARAM_POSITION_VARIANT = 6;
        protected static final int PARAM_POSITION_STREAM = 8;
        protected static final int PARAM_POSITION_UTTERANCE_ID = 10;
        protected static final int NB_CACHED_PARAMS = 6;

        public Engine() {
        }
    }

    public TextToSpeechBeta(Context context, OnInitListener listener) {
        super(context, platformOnInitListener);
        this.mITts = null;
        this.mITtscallback = null;
        this.mContext = null;
        this.mPackageName = "";
        this.mStarted = false;
        this.mStartLock = new Object();
        ttsBetaInstalled = isInstalled(context);
        mInitListener = listener;
        if (ttsBetaInstalled) {
            super.shutdown();
            this.mContext = context;
            this.mPackageName = this.mContext.getPackageName();
            this.mCachedParams = new String[12];
            this.mCachedParams[0] = Engine.KEY_PARAM_RATE;
            this.mCachedParams[2] = Engine.KEY_PARAM_LANGUAGE;
            this.mCachedParams[4] = Engine.KEY_PARAM_COUNTRY;
            this.mCachedParams[6] = Engine.KEY_PARAM_VARIANT;
            this.mCachedParams[8] = Engine.KEY_PARAM_STREAM;
            this.mCachedParams[10] = Engine.KEY_PARAM_UTTERANCE_ID;
            this.mCachedParams[1] = String.valueOf(100);
            Locale defaultLoc = Locale.getDefault();
            this.mCachedParams[3] = defaultLoc.getISO3Language();
            this.mCachedParams[5] = defaultLoc.getISO3Country();
            this.mCachedParams[7] = defaultLoc.getVariant();
            this.mCachedParams[9] = String.valueOf(3);
            this.mCachedParams[11] = "";
            initTts();
        }
    }

    private void initTts() {
        this.mStarted = false;
        this.mServiceConnection = new ServiceConnection() { // from class: com.google.tts.TextToSpeechBeta.2
            /* JADX WARN: Multi-variable type inference failed */
            /* JADX WARN: Type inference failed for: r0v16, types: [com.google.tts.TextToSpeechBeta$OnInitListener] */
            /* JADX WARN: Type inference failed for: r0v17 */
            /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object] */
            /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Throwable] */
            /* JADX WARN: Type inference failed for: r0v8, types: [com.google.tts.TextToSpeechBeta$OnInitListener] */
            @Override // android.content.ServiceConnection
            public void onServiceConnected(ComponentName name, IBinder service) {
                ?? r0 = TextToSpeechBeta.this.mStartLock;
                synchronized (r0) {
                    TextToSpeechBeta.this.mITts = ITtsBeta.Stub.asInterface(service);
                    TextToSpeechBeta.this.mStarted = true;
                    r0 = TextToSpeechBeta.mInitListener;
                    if (r0 != 0) {
                        try {
                            PackageManager pm = TextToSpeechBeta.this.mContext.getPackageManager();
                            PackageInfo info = pm.getPackageInfo("com.google.tts", 0);
                            r0 = TextToSpeechBeta.mInitListener;
                            r0.onInit(0, info.versionCode);
                        } catch (PackageManager.NameNotFoundException e) {
                            e.printStackTrace();
                        }
                        r0 = r0;
                        return;
                    }
                    r0 = r0;
                    return;
                }
            }

            /* JADX WARN: Multi-variable type inference failed */
            /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object] */
            /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Throwable] */
            /* JADX WARN: Type inference failed for: r0v9 */
            @Override // android.content.ServiceConnection
            public void onServiceDisconnected(ComponentName name) {
                ?? r0 = TextToSpeechBeta.this.mStartLock;
                synchronized (r0) {
                    TextToSpeechBeta.this.mITts = null;
                    TextToSpeechBeta.mInitListener = null;
                    TextToSpeechBeta.this.mStarted = false;
                    r0 = r0;
                }
            }
        };
        Intent intent = new Intent("com.google.intent.action.START_TTS_SERVICE_BETA");
        intent.addCategory("com.google.intent.category.TTS_BETA");
        this.mContext.bindService(intent, this.mServiceConnection, 1);
    }

    @Override // android.speech.tts.TextToSpeech
    public void shutdown() {
        if (!ttsBetaInstalled) {
            Log.d("TextToSpeechBeta", "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for shutdown");
            super.shutdown();
        } else {
            try {
                this.mContext.unbindService(this.mServiceConnection);
            } catch (IllegalArgumentException e) {
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v5, types: [boolean] */
    @Override // android.speech.tts.TextToSpeech
    public int addSpeech(String text, String packagename, int resourceId) {
        if (!ttsBetaInstalled) {
            Log.d("TextToSpeechBeta", "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for addSpeech");
            return super.addSpeech(text, packagename, resourceId);
        }
        ?? r0 = this.mStartLock;
        synchronized (r0) {
            r0 = this.mStarted;
            if (r0 == 0) {
                return -1;
            }
            try {
                try {
                    try {
                        this.mITts.addSpeech(this.mPackageName, text, packagename, resourceId);
                        return 0;
                    } catch (RemoteException e) {
                        Log.e("TextToSpeech.java - addSpeech", "RemoteException");
                        e.printStackTrace();
                        this.mStarted = false;
                        initTts();
                        return -1;
                    }
                } catch (IllegalStateException e2) {
                    Log.e("TextToSpeech.java - addSpeech", "IllegalStateException");
                    e2.printStackTrace();
                    this.mStarted = false;
                    initTts();
                    return -1;
                }
            } catch (NullPointerException e3) {
                Log.e("TextToSpeech.java - addSpeech", "NullPointerException");
                e3.printStackTrace();
                this.mStarted = false;
                initTts();
                return -1;
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v5, types: [boolean] */
    @Override // android.speech.tts.TextToSpeech
    public int addSpeech(String text, String filename) {
        if (!ttsBetaInstalled) {
            Log.d("TextToSpeechBeta", "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for addSpeech");
            return super.addSpeech(text, filename);
        }
        ?? r0 = this.mStartLock;
        synchronized (r0) {
            r0 = this.mStarted;
            if (r0 == 0) {
                return -1;
            }
            try {
                this.mITts.addSpeechFile(this.mPackageName, text, filename);
                return 0;
            } catch (RemoteException e) {
                Log.e("TextToSpeech.java - addSpeech", "RemoteException");
                e.printStackTrace();
                this.mStarted = false;
                initTts();
                return -1;
            } catch (IllegalStateException e2) {
                Log.e("TextToSpeech.java - addSpeech", "IllegalStateException");
                e2.printStackTrace();
                this.mStarted = false;
                initTts();
                return -1;
            } catch (NullPointerException e3) {
                Log.e("TextToSpeech.java - addSpeech", "NullPointerException");
                e3.printStackTrace();
                this.mStarted = false;
                initTts();
                return -1;
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v5, types: [boolean] */
    @Override // android.speech.tts.TextToSpeech
    public int addEarcon(String earcon, String packagename, int resourceId) {
        if (!ttsBetaInstalled) {
            Log.d("TextToSpeechBeta", "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for addEarcon");
            return super.addEarcon(earcon, packagename, resourceId);
        }
        ?? r0 = this.mStartLock;
        synchronized (r0) {
            r0 = this.mStarted;
            if (r0 == 0) {
                return -1;
            }
            try {
                try {
                    try {
                        this.mITts.addEarcon(this.mPackageName, earcon, packagename, resourceId);
                        return 0;
                    } catch (RemoteException e) {
                        Log.e("TextToSpeech.java - addEarcon", "RemoteException");
                        e.printStackTrace();
                        this.mStarted = false;
                        initTts();
                        return -1;
                    }
                } catch (IllegalStateException e2) {
                    Log.e("TextToSpeech.java - addEarcon", "IllegalStateException");
                    e2.printStackTrace();
                    this.mStarted = false;
                    initTts();
                    return -1;
                }
            } catch (NullPointerException e3) {
                Log.e("TextToSpeech.java - addEarcon", "NullPointerException");
                e3.printStackTrace();
                this.mStarted = false;
                initTts();
                return -1;
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v5, types: [boolean] */
    @Override // android.speech.tts.TextToSpeech
    public int addEarcon(String earcon, String filename) {
        if (!ttsBetaInstalled) {
            Log.d("TextToSpeechBeta", "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for addEarcon");
            return super.addEarcon(earcon, filename);
        }
        ?? r0 = this.mStartLock;
        synchronized (r0) {
            r0 = this.mStarted;
            if (r0 == 0) {
                return -1;
            }
            try {
                this.mITts.addEarconFile(this.mPackageName, earcon, filename);
                return 0;
            } catch (RemoteException e) {
                Log.e("TextToSpeech.java - addEarcon", "RemoteException");
                e.printStackTrace();
                this.mStarted = false;
                initTts();
                return -1;
            } catch (IllegalStateException e2) {
                Log.e("TextToSpeech.java - addEarcon", "IllegalStateException");
                e2.printStackTrace();
                this.mStarted = false;
                initTts();
                return -1;
            } catch (NullPointerException e3) {
                Log.e("TextToSpeech.java - addEarcon", "NullPointerException");
                e3.printStackTrace();
                this.mStarted = false;
                initTts();
                return -1;
            }
        }
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object, java.lang.Throwable] */
    @Override // android.speech.tts.TextToSpeech
    public int speak(String text, int queueMode, HashMap<String, String> params) {
        if (!ttsBetaInstalled) {
            Log.d("TextToSpeechBeta", "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for speak");
            return super.speak(text, queueMode, params);
        }
        synchronized (this.mStartLock) {
            int result = -1;
            Log.i("TTS received: ", text);
            if (!this.mStarted) {
                return -1;
            }
            if (params != null) {
                try {
                    if (!params.isEmpty()) {
                        String extra = params.get(Engine.KEY_PARAM_STREAM);
                        if (extra != null) {
                            this.mCachedParams[9] = extra;
                        }
                        String extra2 = params.get(Engine.KEY_PARAM_UTTERANCE_ID);
                        if (extra2 != null) {
                            this.mCachedParams[11] = extra2;
                        }
                    }
                } catch (RemoteException e) {
                    Log.e("TextToSpeech.java - speak", "RemoteException");
                    e.printStackTrace();
                    this.mStarted = false;
                    initTts();
                } catch (IllegalStateException e2) {
                    Log.e("TextToSpeech.java - speak", "IllegalStateException");
                    e2.printStackTrace();
                    this.mStarted = false;
                    initTts();
                } catch (NullPointerException e3) {
                    Log.e("TextToSpeech.java - speak", "NullPointerException");
                    e3.printStackTrace();
                    this.mStarted = false;
                    initTts();
                }
            }
            result = this.mITts.speak(this.mPackageName, text, queueMode, this.mCachedParams);
            resetCachedParams();
            return result;
        }
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object, java.lang.Throwable] */
    @Override // android.speech.tts.TextToSpeech
    public int playEarcon(String earcon, int queueMode, HashMap<String, String> params) {
        if (!ttsBetaInstalled) {
            Log.d("TextToSpeechBeta", "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for playEarcon");
            return super.playEarcon(earcon, queueMode, params);
        }
        synchronized (this.mStartLock) {
            int result = -1;
            if (!this.mStarted) {
                return -1;
            }
            if (params != null) {
                try {
                    if (!params.isEmpty()) {
                        String extra = params.get(Engine.KEY_PARAM_STREAM);
                        if (extra != null) {
                            this.mCachedParams[9] = extra;
                        }
                        String extra2 = params.get(Engine.KEY_PARAM_UTTERANCE_ID);
                        if (extra2 != null) {
                            this.mCachedParams[11] = extra2;
                        }
                    }
                } catch (RemoteException e) {
                    Log.e("TextToSpeech.java - playEarcon", "RemoteException");
                    e.printStackTrace();
                    this.mStarted = false;
                    initTts();
                } catch (IllegalStateException e2) {
                    Log.e("TextToSpeech.java - playEarcon", "IllegalStateException");
                    e2.printStackTrace();
                    this.mStarted = false;
                    initTts();
                } catch (NullPointerException e3) {
                    Log.e("TextToSpeech.java - playEarcon", "NullPointerException");
                    e3.printStackTrace();
                    this.mStarted = false;
                    initTts();
                }
            }
            result = this.mITts.playEarcon(this.mPackageName, earcon, queueMode, null);
            resetCachedParams();
            return result;
        }
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object, java.lang.Throwable] */
    @Override // android.speech.tts.TextToSpeech
    public int playSilence(long durationInMs, int queueMode, HashMap<String, String> params) {
        String extra;
        if (!ttsBetaInstalled) {
            Log.d("TextToSpeechBeta", "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for playSilence");
            return super.playSilence(durationInMs, queueMode, params);
        }
        synchronized (this.mStartLock) {
            int result = -1;
            if (!this.mStarted) {
                return -1;
            }
            if (params != null) {
                try {
                    if (!params.isEmpty() && (extra = params.get(Engine.KEY_PARAM_UTTERANCE_ID)) != null) {
                        this.mCachedParams[11] = extra;
                    }
                } catch (RemoteException e) {
                    Log.e("TextToSpeech.java - playSilence", "RemoteException");
                    e.printStackTrace();
                    this.mStarted = false;
                    initTts();
                } catch (IllegalStateException e2) {
                    Log.e("TextToSpeech.java - playSilence", "IllegalStateException");
                    e2.printStackTrace();
                    this.mStarted = false;
                    initTts();
                } catch (NullPointerException e3) {
                    Log.e("TextToSpeech.java - playSilence", "NullPointerException");
                    e3.printStackTrace();
                    this.mStarted = false;
                    initTts();
                }
            }
            result = this.mITts.playSilence(this.mPackageName, durationInMs, queueMode, this.mCachedParams);
            return result;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v25, types: [boolean] */
    /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v5, types: [boolean] */
    @Override // android.speech.tts.TextToSpeech
    public boolean isSpeaking() {
        if (!ttsBetaInstalled) {
            Log.d("TextToSpeechBeta", "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for isSpeaking");
            return super.isSpeaking();
        }
        ?? r0 = this.mStartLock;
        synchronized (r0) {
            r0 = this.mStarted;
            if (r0 == 0) {
                return false;
            }
            try {
                try {
                    try {
                        r0 = this.mITts.isSpeaking();
                        return r0;
                    } catch (NullPointerException e) {
                        Log.e("TextToSpeech.java - isSpeaking", "NullPointerException");
                        e.printStackTrace();
                        this.mStarted = false;
                        initTts();
                        return false;
                    }
                } catch (RemoteException e2) {
                    Log.e("TextToSpeech.java - isSpeaking", "RemoteException");
                    e2.printStackTrace();
                    this.mStarted = false;
                    initTts();
                    return false;
                }
            } catch (IllegalStateException e3) {
                Log.e("TextToSpeech.java - isSpeaking", "IllegalStateException");
                e3.printStackTrace();
                this.mStarted = false;
                initTts();
                return false;
            }
        }
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object, java.lang.Throwable] */
    @Override // android.speech.tts.TextToSpeech
    public int stop() {
        if (!ttsBetaInstalled) {
            Log.d("TextToSpeechBeta", "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for stop");
            return super.stop();
        }
        synchronized (this.mStartLock) {
            int result = -1;
            if (!this.mStarted) {
                return -1;
            }
            try {
                result = this.mITts.stop(this.mPackageName);
            } catch (RemoteException e) {
                Log.e("TextToSpeech.java - stop", "RemoteException");
                e.printStackTrace();
                this.mStarted = false;
                initTts();
            } catch (IllegalStateException e2) {
                Log.e("TextToSpeech.java - stop", "IllegalStateException");
                e2.printStackTrace();
                this.mStarted = false;
                initTts();
            } catch (NullPointerException e3) {
                Log.e("TextToSpeech.java - stop", "NullPointerException");
                e3.printStackTrace();
                this.mStarted = false;
                initTts();
            }
            return result;
        }
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object, java.lang.Throwable] */
    @Override // android.speech.tts.TextToSpeech
    public int setSpeechRate(float speechRate) {
        if (!ttsBetaInstalled) {
            Log.d("TextToSpeechBeta", "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech");
            return super.setSpeechRate(speechRate);
        }
        synchronized (this.mStartLock) {
            int result = -1;
            if (!this.mStarted) {
                return -1;
            }
            if (speechRate > 0.0f) {
                try {
                    int rate = (int) (speechRate * 100.0f);
                    this.mCachedParams[1] = String.valueOf(rate);
                    result = speechRate > 0.0f ? 0 : -1;
                } catch (IllegalStateException e) {
                    Log.e("TextToSpeech.java - setSpeechRate", "IllegalStateException");
                    e.printStackTrace();
                    this.mStarted = false;
                    initTts();
                } catch (NullPointerException e2) {
                    Log.e("TextToSpeech.java - setSpeechRate", "NullPointerException");
                    e2.printStackTrace();
                    this.mStarted = false;
                    initTts();
                }
            }
            return result;
        }
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object, java.lang.Throwable] */
    @Override // android.speech.tts.TextToSpeech
    public int setPitch(float pitch) {
        if (!ttsBetaInstalled) {
            Log.d("TextToSpeechBeta", "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech");
            return super.setPitch(pitch);
        }
        synchronized (this.mStartLock) {
            int result = -1;
            if (!this.mStarted) {
                return -1;
            }
            if (pitch > 0.0f) {
                try {
                    result = this.mITts.setPitch(this.mPackageName, (int) (pitch * 100.0f));
                } catch (RemoteException e) {
                    Log.e("TextToSpeech.java - setPitch", "RemoteException");
                    e.printStackTrace();
                    this.mStarted = false;
                    initTts();
                } catch (IllegalStateException e2) {
                    Log.e("TextToSpeech.java - setPitch", "IllegalStateException");
                    e2.printStackTrace();
                    this.mStarted = false;
                    initTts();
                } catch (NullPointerException e3) {
                    Log.e("TextToSpeech.java - setPitch", "NullPointerException");
                    e3.printStackTrace();
                    this.mStarted = false;
                    initTts();
                }
            }
            return result;
        }
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object, java.lang.Throwable] */
    @Override // android.speech.tts.TextToSpeech
    public int setLanguage(Locale loc) {
        if (!ttsBetaInstalled) {
            Log.d("TextToSpeechBeta", "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for setLanguage");
            return super.setLanguage(loc);
        }
        synchronized (this.mStartLock) {
            int result = -2;
            if (!this.mStarted) {
                return -2;
            }
            try {
                this.mCachedParams[3] = loc.getISO3Language();
                this.mCachedParams[5] = loc.getISO3Country();
                this.mCachedParams[7] = loc.getVariant();
                result = this.mITts.isLanguageAvailable(this.mCachedParams[3], this.mCachedParams[5], this.mCachedParams[7]);
            } catch (RemoteException e) {
                Log.e("TextToSpeech.java - setLanguage", "RemoteException");
                e.printStackTrace();
                this.mStarted = false;
                initTts();
            } catch (IllegalStateException e2) {
                Log.e("TextToSpeech.java - setLanguage", "IllegalStateException");
                e2.printStackTrace();
                this.mStarted = false;
                initTts();
            } catch (NullPointerException e3) {
                Log.e("TextToSpeech.java - setLanguage", "NullPointerException");
                e3.printStackTrace();
                this.mStarted = false;
                initTts();
            }
            return result;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v31, types: [java.util.Locale] */
    /* JADX WARN: Type inference failed for: r0v5, types: [boolean] */
    @Override // android.speech.tts.TextToSpeech
    public Locale getLanguage() {
        if (!ttsBetaInstalled) {
            Log.d("TextToSpeechBeta", "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for getLanguage");
            return super.getLanguage();
        }
        ?? r0 = this.mStartLock;
        synchronized (r0) {
            r0 = this.mStarted;
            if (r0 == 0) {
                return null;
            }
            try {
                try {
                    String[] locStrings = this.mITts.getLanguage();
                    if (locStrings == null || locStrings.length != 3) {
                        return null;
                    }
                    r0 = new Locale(locStrings[0], locStrings[1], locStrings[2]);
                    return r0;
                } catch (IllegalStateException e) {
                    Log.e("TextToSpeech.java - getLanguage", "IllegalStateException");
                    e.printStackTrace();
                    this.mStarted = false;
                    initTts();
                    return null;
                }
            } catch (RemoteException e2) {
                Log.e("TextToSpeech.java - getLanguage", "RemoteException");
                e2.printStackTrace();
                this.mStarted = false;
                initTts();
                return null;
            } catch (NullPointerException e3) {
                Log.e("TextToSpeech.java - getLanguage", "NullPointerException");
                e3.printStackTrace();
                this.mStarted = false;
                initTts();
                return null;
            }
        }
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object, java.lang.Throwable] */
    @Override // android.speech.tts.TextToSpeech
    public int isLanguageAvailable(Locale loc) {
        if (!ttsBetaInstalled) {
            Log.d("TextToSpeechBeta", "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for isLanguageAvailable");
            return super.isLanguageAvailable(loc);
        }
        synchronized (this.mStartLock) {
            int result = -2;
            if (!this.mStarted) {
                return -2;
            }
            try {
                result = this.mITts.isLanguageAvailable(loc.getISO3Language(), loc.getISO3Country(), loc.getVariant());
            } catch (RemoteException e) {
                Log.e("TextToSpeech.java - isLanguageAvailable", "RemoteException");
                e.printStackTrace();
                this.mStarted = false;
                initTts();
            } catch (IllegalStateException e2) {
                Log.e("TextToSpeech.java - isLanguageAvailable", "IllegalStateException");
                e2.printStackTrace();
                this.mStarted = false;
                initTts();
            } catch (NullPointerException e3) {
                Log.e("TextToSpeech.java - isLanguageAvailable", "NullPointerException");
                e3.printStackTrace();
                this.mStarted = false;
                initTts();
            }
            return result;
        }
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object, java.lang.Throwable] */
    @Override // android.speech.tts.TextToSpeech
    public int synthesizeToFile(String text, HashMap<String, String> params, String filename) {
        String extra;
        if (!ttsBetaInstalled) {
            Log.d("TextToSpeechBeta", "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for synthesizeToFile");
            return super.synthesizeToFile(text, params, filename);
        }
        synchronized (this.mStartLock) {
            int result = -1;
            if (!this.mStarted) {
                return -1;
            }
            if (params != null) {
                try {
                    if (!params.isEmpty() && (extra = params.get(Engine.KEY_PARAM_UTTERANCE_ID)) != null) {
                        this.mCachedParams[11] = extra;
                    }
                } catch (RemoteException e) {
                    Log.e("TextToSpeech.java - synthesizeToFile", "RemoteException");
                    e.printStackTrace();
                    this.mStarted = false;
                    initTts();
                } catch (IllegalStateException e2) {
                    Log.e("TextToSpeech.java - synthesizeToFile", "IllegalStateException");
                    e2.printStackTrace();
                    this.mStarted = false;
                    initTts();
                } catch (NullPointerException e3) {
                    Log.e("TextToSpeech.java - synthesizeToFile", "NullPointerException");
                    e3.printStackTrace();
                    this.mStarted = false;
                    initTts();
                }
            }
            if (this.mITts.synthesizeToFile(this.mPackageName, text, this.mCachedParams, filename)) {
                result = 0;
            }
            resetCachedParams();
            return result;
        }
    }

    private void resetCachedParams() {
        if (!ttsBetaInstalled) {
            Log.d("TextToSpeechBeta", "TextToSpeechBeta not installed - basic platform TextToSpeech does not support resetCachedParams");
        } else {
            this.mCachedParams[9] = String.valueOf(3);
            this.mCachedParams[11] = "";
        }
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object, java.lang.Throwable] */
    public int setOnUtteranceCompletedListener(final OnUtteranceCompletedListener listener) {
        if (!ttsBetaInstalled) {
            Log.d("TextToSpeechBeta", "TextToSpeechBeta not installed - defaulting to basic platform TextToSpeech for setOnUtteranceCompletedListener");
            TextToSpeech.OnUtteranceCompletedListener platformUtteranceCompletedListener = new TextToSpeech.OnUtteranceCompletedListener() { // from class: com.google.tts.TextToSpeechBeta.3
                @Override // android.speech.tts.TextToSpeech.OnUtteranceCompletedListener
                public void onUtteranceCompleted(String utteranceId) {
                    listener.onUtteranceCompleted(utteranceId);
                }
            };
            return super.setOnUtteranceCompletedListener(platformUtteranceCompletedListener);
        }
        synchronized (this.mStartLock) {
            int result = -1;
            if (!this.mStarted) {
                return -1;
            }
            this.mITtscallback = new ITtsCallbackBeta.Stub() { // from class: com.google.tts.TextToSpeechBeta.4
                @Override // com.google.tts.ITtsCallbackBeta
                public void utteranceCompleted(String utteranceId) throws RemoteException {
                    if (listener != null) {
                        listener.onUtteranceCompleted(utteranceId);
                    }
                }
            };
            try {
                try {
                    result = this.mITts.registerCallback(this.mPackageName, this.mITtscallback);
                } catch (Throwable unused) {
                }
            } catch (RemoteException e) {
                Log.e("TextToSpeech.java - registerCallback", "RemoteException");
                e.printStackTrace();
                this.mStarted = false;
                initTts();
            } catch (IllegalStateException e2) {
                Log.e("TextToSpeech.java - registerCallback", "IllegalStateException");
                e2.printStackTrace();
                this.mStarted = false;
                initTts();
            } catch (NullPointerException e3) {
                Log.e("TextToSpeech.java - registerCallback", "NullPointerException");
                e3.printStackTrace();
                this.mStarted = false;
                initTts();
            }
            return result;
        }
    }

    public static boolean isInstalled(Context ctx) {
        PackageManager pm = ctx.getPackageManager();
        Intent intent = new Intent("com.google.intent.action.START_TTS_SERVICE_BETA");
        intent.addCategory("com.google.intent.category.TTS_BETA");
        ResolveInfo info = pm.resolveService(intent, 0);
        if (info == null) {
            return false;
        }
        return true;
    }
}
