package com.wdullaer.materialdatetimepicker;

import android.content.Context;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.SystemClock;
import android.os.Vibrator;
import android.provider.Settings;

/* loaded from: com.wdullaer.materialdatetimepicker.1.2.1.jar:com/wdullaer/materialdatetimepicker/HapticFeedbackController.class */
public class HapticFeedbackController {
    private static final int VIBRATE_DELAY_MS = 125;
    private static final int VIBRATE_LENGTH_MS = 5;
    private final Context mContext;
    private final ContentObserver mContentObserver = new ContentObserver(null) { // from class: com.wdullaer.materialdatetimepicker.HapticFeedbackController.1
        @Override // android.database.ContentObserver
        public void onChange(boolean selfChange) {
            HapticFeedbackController.this.mIsGloballyEnabled = HapticFeedbackController.checkGlobalSetting(HapticFeedbackController.this.mContext);
        }
    };
    private Vibrator mVibrator;
    private boolean mIsGloballyEnabled;
    private long mLastVibrate;

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean checkGlobalSetting(Context context) {
        return Settings.System.getInt(context.getContentResolver(), "haptic_feedback_enabled", 0) == 1;
    }

    public HapticFeedbackController(Context context) {
        this.mContext = context;
    }

    public void start() {
        this.mVibrator = (Vibrator) this.mContext.getSystemService("vibrator");
        this.mIsGloballyEnabled = checkGlobalSetting(this.mContext);
        Uri uri = Settings.System.getUriFor("haptic_feedback_enabled");
        this.mContext.getContentResolver().registerContentObserver(uri, false, this.mContentObserver);
    }

    public void stop() {
        this.mVibrator = null;
        this.mContext.getContentResolver().unregisterContentObserver(this.mContentObserver);
    }

    public void tryVibrate() {
        if (this.mVibrator != null && this.mIsGloballyEnabled) {
            long now = SystemClock.uptimeMillis();
            if (now - this.mLastVibrate >= 125) {
                this.mVibrator.vibrate(5L);
                this.mLastVibrate = now;
            }
        }
    }
}
