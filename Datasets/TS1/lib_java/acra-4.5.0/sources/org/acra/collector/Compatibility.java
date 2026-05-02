package org.acra.collector;

import android.content.Context;
import android.os.Build;
import java.lang.reflect.Field;

/* loaded from: acra-4.5.0.jar:org/acra/collector/Compatibility.class */
public final class Compatibility {
    public static int getAPILevel() {
        int apiLevel;
        try {
            Field SDK_INT = Build.VERSION.class.getField("SDK_INT");
            apiLevel = SDK_INT.getInt(null);
        } catch (IllegalAccessException e) {
            apiLevel = Integer.parseInt(Build.VERSION.SDK);
        } catch (IllegalArgumentException e2) {
            apiLevel = Integer.parseInt(Build.VERSION.SDK);
        } catch (NoSuchFieldException e3) {
            apiLevel = Integer.parseInt(Build.VERSION.SDK);
        } catch (SecurityException e4) {
            apiLevel = Integer.parseInt(Build.VERSION.SDK);
        }
        return apiLevel;
    }

    public static String getDropBoxServiceName() throws NoSuchFieldException, IllegalAccessException {
        Field serviceName = Context.class.getField("DROPBOX_SERVICE");
        if (serviceName != null) {
            return (String) serviceName.get(null);
        }
        return null;
    }
}
