package android.support.v7.preference;

import android.content.Context;
import android.content.SharedPreferences;
import android.support.v4.content.SharedPreferencesCompat;

/* loaded from: com.android.support.preference-v7.23.4.0.jar:android/support/v7/preference/PreferenceManager.class */
public class PreferenceManager {
    private static final String TAG = "PreferenceManager";
    public static final String KEY_HAS_SET_DEFAULT_VALUES = "_has_set_default_values";
    private Context mContext;
    private long mNextId = 0;
    private SharedPreferences mSharedPreferences;
    private SharedPreferences.Editor mEditor;
    private boolean mNoCommit;
    private String mSharedPreferencesName;
    private int mSharedPreferencesMode;
    private PreferenceScreen mPreferenceScreen;
    private OnPreferenceTreeClickListener mOnPreferenceTreeClickListener;
    private OnDisplayPreferenceDialogListener mOnDisplayPreferenceDialogListener;
    private OnNavigateToScreenListener mOnNavigateToScreenListener;

    /* loaded from: com.android.support.preference-v7.23.4.0.jar:android/support/v7/preference/PreferenceManager$OnDisplayPreferenceDialogListener.class */
    public interface OnDisplayPreferenceDialogListener {
        void onDisplayPreferenceDialog(Preference preference);
    }

    /* loaded from: com.android.support.preference-v7.23.4.0.jar:android/support/v7/preference/PreferenceManager$OnNavigateToScreenListener.class */
    public interface OnNavigateToScreenListener {
        void onNavigateToScreen(PreferenceScreen preferenceScreen);
    }

    /* loaded from: com.android.support.preference-v7.23.4.0.jar:android/support/v7/preference/PreferenceManager$OnPreferenceTreeClickListener.class */
    public interface OnPreferenceTreeClickListener {
        boolean onPreferenceTreeClick(Preference preference);
    }

    /*  JADX ERROR: Failed to decode insn: 0x0009: MOVE_MULTI
        java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[8]
        	at java.base/java.lang.System.arraycopy(Native Method)
        	at jadx.plugins.input.java.data.code.StackState.insert(StackState.java:52)
        	at jadx.plugins.input.java.data.code.CodeDecodeState.insert(CodeDecodeState.java:137)
        	at jadx.plugins.input.java.data.code.JavaInsnsRegister.dup2x1(JavaInsnsRegister.java:313)
        	at jadx.plugins.input.java.data.code.JavaInsnData.decode(JavaInsnData.java:46)
        	at jadx.core.dex.instructions.InsnDecoder.lambda$process$0(InsnDecoder.java:50)
        	at jadx.plugins.input.java.data.code.JavaCodeReader.visitInstructions(JavaCodeReader.java:85)
        	at jadx.core.dex.instructions.InsnDecoder.process(InsnDecoder.java:46)
        	at jadx.core.dex.nodes.MethodNode.load(MethodNode.java:157)
        	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:458)
        	at jadx.core.ProcessClass.process(ProcessClass.java:69)
        	at jadx.core.ProcessClass.generateCode(ProcessClass.java:109)
        	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
        	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
        	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
        */
    long getNextId() {
        /*
            r8 = this;
            r0 = r8
            r1 = r0
            r9 = r1
            monitor-enter(r0)
            r0 = r8
            r1 = r0
            long r1 = r1.mNextId
            // decode failed: arraycopy: source index -1 out of bounds for object array[8]
            r2 = 1
            long r1 = r1 + r2
            r0.mNextId = r1
            r0 = r9
            monitor-exit(r0)
            return r-1
            r10 = move-exception
            r0 = r9
            monitor-exit(r0)
            r0 = r10
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v7.preference.PreferenceManager.getNextId():long");
    }

    public PreferenceManager(Context context) {
        this.mContext = context;
        setSharedPreferencesName(getDefaultSharedPreferencesName(context));
    }

    public PreferenceScreen inflateFromResource(Context context, int resId, PreferenceScreen rootPreferences) {
        setNoCommit(true);
        PreferenceInflater inflater = new PreferenceInflater(context, this);
        PreferenceScreen rootPreferences2 = (PreferenceScreen) inflater.inflate(resId, rootPreferences);
        rootPreferences2.onAttachedToHierarchy(this);
        setNoCommit(false);
        return rootPreferences2;
    }

    public PreferenceScreen createPreferenceScreen(Context context) {
        PreferenceScreen preferenceScreen = new PreferenceScreen(context, null);
        preferenceScreen.onAttachedToHierarchy(this);
        return preferenceScreen;
    }

    public String getSharedPreferencesName() {
        return this.mSharedPreferencesName;
    }

    public void setSharedPreferencesName(String sharedPreferencesName) {
        this.mSharedPreferencesName = sharedPreferencesName;
        this.mSharedPreferences = null;
    }

    public int getSharedPreferencesMode() {
        return this.mSharedPreferencesMode;
    }

    public void setSharedPreferencesMode(int sharedPreferencesMode) {
        this.mSharedPreferencesMode = sharedPreferencesMode;
        this.mSharedPreferences = null;
    }

    public SharedPreferences getSharedPreferences() {
        if (this.mSharedPreferences == null) {
            this.mSharedPreferences = this.mContext.getSharedPreferences(this.mSharedPreferencesName, this.mSharedPreferencesMode);
        }
        return this.mSharedPreferences;
    }

    public static SharedPreferences getDefaultSharedPreferences(Context context) {
        return context.getSharedPreferences(getDefaultSharedPreferencesName(context), getDefaultSharedPreferencesMode());
    }

    private static String getDefaultSharedPreferencesName(Context context) {
        return context.getPackageName() + "_preferences";
    }

    private static int getDefaultSharedPreferencesMode() {
        return 0;
    }

    public PreferenceScreen getPreferenceScreen() {
        return this.mPreferenceScreen;
    }

    public boolean setPreferences(PreferenceScreen preferenceScreen) {
        if (preferenceScreen != this.mPreferenceScreen) {
            this.mPreferenceScreen = preferenceScreen;
            return true;
        }
        return false;
    }

    public Preference findPreference(CharSequence key) {
        if (this.mPreferenceScreen == null) {
            return null;
        }
        return this.mPreferenceScreen.findPreference(key);
    }

    public static void setDefaultValues(Context context, int resId, boolean readAgain) {
        setDefaultValues(context, getDefaultSharedPreferencesName(context), getDefaultSharedPreferencesMode(), resId, readAgain);
    }

    public static void setDefaultValues(Context context, String sharedPreferencesName, int sharedPreferencesMode, int resId, boolean readAgain) {
        SharedPreferences defaultValueSp = context.getSharedPreferences(KEY_HAS_SET_DEFAULT_VALUES, 0);
        if (readAgain || !defaultValueSp.getBoolean(KEY_HAS_SET_DEFAULT_VALUES, false)) {
            PreferenceManager pm = new PreferenceManager(context);
            pm.setSharedPreferencesName(sharedPreferencesName);
            pm.setSharedPreferencesMode(sharedPreferencesMode);
            pm.inflateFromResource(context, resId, null);
            SharedPreferences.Editor editor = defaultValueSp.edit().putBoolean(KEY_HAS_SET_DEFAULT_VALUES, true);
            SharedPreferencesCompat.EditorCompat.getInstance().apply(editor);
        }
    }

    SharedPreferences.Editor getEditor() {
        if (this.mNoCommit) {
            if (this.mEditor == null) {
                this.mEditor = getSharedPreferences().edit();
            }
            return this.mEditor;
        }
        return getSharedPreferences().edit();
    }

    boolean shouldCommit() {
        return !this.mNoCommit;
    }

    private void setNoCommit(boolean noCommit) {
        if (!noCommit && this.mEditor != null) {
            SharedPreferencesCompat.EditorCompat.getInstance().apply(this.mEditor);
        }
        this.mNoCommit = noCommit;
    }

    public Context getContext() {
        return this.mContext;
    }

    public OnDisplayPreferenceDialogListener getOnDisplayPreferenceDialogListener() {
        return this.mOnDisplayPreferenceDialogListener;
    }

    public void setOnDisplayPreferenceDialogListener(OnDisplayPreferenceDialogListener onDisplayPreferenceDialogListener) {
        this.mOnDisplayPreferenceDialogListener = onDisplayPreferenceDialogListener;
    }

    public void showDialog(Preference preference) {
        if (this.mOnDisplayPreferenceDialogListener != null) {
            this.mOnDisplayPreferenceDialogListener.onDisplayPreferenceDialog(preference);
        }
    }

    public void setOnPreferenceTreeClickListener(OnPreferenceTreeClickListener listener) {
        this.mOnPreferenceTreeClickListener = listener;
    }

    public OnPreferenceTreeClickListener getOnPreferenceTreeClickListener() {
        return this.mOnPreferenceTreeClickListener;
    }

    public void setOnNavigateToScreenListener(OnNavigateToScreenListener listener) {
        this.mOnNavigateToScreenListener = listener;
    }

    public OnNavigateToScreenListener getOnNavigateToScreenListener() {
        return this.mOnNavigateToScreenListener;
    }
}
