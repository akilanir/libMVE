package org.dmfs.android.retentionmagic;

import android.content.SharedPreferences;
import android.os.Bundle;
import java.lang.reflect.Field;

/* loaded from: android-retention-magic-1.2.2.jar:org/dmfs/android/retentionmagic/PersistenceHelper.class */
abstract class PersistenceHelper {
    public abstract void storeInBundle(Field field, Object obj, String str, Bundle bundle) throws IllegalAccessException;

    public abstract void restoreFromBundle(Field field, Object obj, String str, Bundle bundle) throws IllegalAccessException;

    PersistenceHelper() {
    }

    public void storeInPreferences(Field field, Object instance, String key, SharedPreferences.Editor editor) throws IllegalAccessException {
        throw new UnsupportedOperationException("saving of type " + field.getClass().getCanonicalName() + " in preferences is not supported");
    }

    public void restoreFromPreferences(Field field, Object instance, String key, SharedPreferences prefs) throws IllegalAccessException {
        throw new UnsupportedOperationException("loading of type " + field.getClass().getCanonicalName() + " from preferences not supported");
    }
}
