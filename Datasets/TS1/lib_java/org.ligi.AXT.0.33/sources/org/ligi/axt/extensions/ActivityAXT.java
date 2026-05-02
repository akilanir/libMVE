package org.ligi.axt.extensions;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.os.Build;
import android.os.Handler;
import android.view.View;
import org.ligi.axt.BuildConfig;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/extensions/ActivityAXT.class */
public class ActivityAXT extends ContextAXT {
    private final Activity activity;

    public ActivityAXT(Activity activity) {
        super(activity);
        this.activity = activity;
    }

    public <T extends View> T findById(int i) {
        return (T) this.activity.findViewById(i);
    }

    public void disableRotation() {
        lockOrientation(this.activity.getResources().getConfiguration().orientation);
    }

    public void lockOrientation(int orientation) {
        switch (orientation) {
            case BuildConfig.VERSION_CODE /* 1 */:
                if (Build.VERSION.SDK_INT < 8) {
                    this.activity.setRequestedOrientation(1);
                    break;
                } else {
                    int rotation = this.activity.getWindowManager().getDefaultDisplay().getRotation();
                    if (rotation == 1 || rotation == 2) {
                        this.activity.setRequestedOrientation(9);
                        break;
                    } else {
                        this.activity.setRequestedOrientation(1);
                        break;
                    }
                }
                break;
            case 2:
                if (Build.VERSION.SDK_INT < 8) {
                    this.activity.setRequestedOrientation(0);
                    break;
                } else {
                    int rotation2 = this.activity.getWindowManager().getDefaultDisplay().getRotation();
                    if (rotation2 == 0 || rotation2 == 1) {
                        this.activity.setRequestedOrientation(0);
                        break;
                    } else {
                        this.activity.setRequestedOrientation(8);
                        break;
                    }
                }
                break;
        }
    }

    public void enableRotation() {
        this.activity.setRequestedOrientation(-1);
    }

    public void rethrowIntentExcludingSelf() {
        final ComponentName component = new ComponentName(this.activity, this.activity.getClass());
        this.activity.getPackageManager().setComponentEnabledSetting(component, 2, 1);
        try {
            Intent intent = this.activity.getIntent();
            intent.setComponent(null);
            this.activity.startActivity(intent);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            new Handler().postDelayed(new Runnable() { // from class: org.ligi.axt.extensions.ActivityAXT.1
                @Override // java.lang.Runnable
                public void run() {
                    ActivityAXT.this.activity.getPackageManager().setComponentEnabledSetting(component, 1, 1);
                    ActivityAXT.this.activity.finish();
                }
            }, 250L);
        }
    }
}
