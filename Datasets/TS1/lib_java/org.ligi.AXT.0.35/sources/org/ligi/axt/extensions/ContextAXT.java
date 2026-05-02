package org.ligi.axt.extensions;

import android.content.Context;
import android.view.ViewConfiguration;
import java.lang.reflect.Field;
import org.ligi.axt.extensions.misc.CommonIntentStarter;

/* loaded from: org.ligi.AXT.0.35.jar:org/ligi/axt/extensions/ContextAXT.class */
public class ContextAXT {
    private final Context context;

    public ContextAXT(Context context) {
        this.context = context;
    }

    public void forceOverFlowMenuEvenThoughDeviceHasPhysical() {
        try {
            ViewConfiguration config = ViewConfiguration.get(this.context);
            Field menuKeyField = ViewConfiguration.class.getDeclaredField("sHasPermanentMenuKey");
            if (menuKeyField != null) {
                menuKeyField.setAccessible(true);
                menuKeyField.setBoolean(config, false);
            }
        } catch (Exception e) {
        }
    }

    public CommonIntentStarter startCommonIntent() {
        return new CommonIntentStarter(this.context);
    }
}
