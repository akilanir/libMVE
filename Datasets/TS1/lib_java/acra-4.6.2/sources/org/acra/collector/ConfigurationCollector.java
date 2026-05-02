package org.acra.collector;

import android.content.Context;
import android.content.res.Configuration;
import android.util.SparseArray;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import org.acra.ACRA;

/* loaded from: acra-4.6.2.jar:org/acra/collector/ConfigurationCollector.class */
public final class ConfigurationCollector {
    private static final String SUFFIX_MASK = "_MASK";
    private static final String FIELD_SCREENLAYOUT = "screenLayout";
    private static final String FIELD_UIMODE = "uiMode";
    private static final String FIELD_MNC = "mnc";
    private static final String FIELD_MCC = "mcc";
    private static final String PREFIX_UI_MODE = "UI_MODE_";
    private static final String PREFIX_TOUCHSCREEN = "TOUCHSCREEN_";
    private static final String PREFIX_SCREENLAYOUT = "SCREENLAYOUT_";
    private static final String PREFIX_ORIENTATION = "ORIENTATION_";
    private static final String PREFIX_NAVIGATIONHIDDEN = "NAVIGATIONHIDDEN_";
    private static final String PREFIX_NAVIGATION = "NAVIGATION_";
    private static final String PREFIX_KEYBOARDHIDDEN = "KEYBOARDHIDDEN_";
    private static final String PREFIX_KEYBOARD = "KEYBOARD_";
    private static final String PREFIX_HARDKEYBOARDHIDDEN = "HARDKEYBOARDHIDDEN_";
    private final HashMap<String, SparseArray<String>> mValueArrays = new HashMap<>();

    private ConfigurationCollector() {
        SparseArray<String> hardKeyboardHiddenValues = new SparseArray<>();
        SparseArray<String> keyboardValues = new SparseArray<>();
        SparseArray<String> keyboardHiddenValues = new SparseArray<>();
        SparseArray<String> navigationValues = new SparseArray<>();
        SparseArray<String> navigationHiddenValues = new SparseArray<>();
        SparseArray<String> orientationValues = new SparseArray<>();
        SparseArray<String> screenLayoutValues = new SparseArray<>();
        SparseArray<String> touchScreenValues = new SparseArray<>();
        SparseArray<String> uiModeValues = new SparseArray<>();
        Field[] arr$ = Configuration.class.getFields();
        for (Field f : arr$) {
            if (Modifier.isStatic(f.getModifiers()) && Modifier.isFinal(f.getModifiers())) {
                String fieldName = f.getName();
                try {
                    if (fieldName.startsWith(PREFIX_HARDKEYBOARDHIDDEN)) {
                        hardKeyboardHiddenValues.put(f.getInt(null), fieldName);
                    } else if (fieldName.startsWith(PREFIX_KEYBOARD)) {
                        keyboardValues.put(f.getInt(null), fieldName);
                    } else if (fieldName.startsWith(PREFIX_KEYBOARDHIDDEN)) {
                        keyboardHiddenValues.put(f.getInt(null), fieldName);
                    } else if (fieldName.startsWith(PREFIX_NAVIGATION)) {
                        navigationValues.put(f.getInt(null), fieldName);
                    } else if (fieldName.startsWith(PREFIX_NAVIGATIONHIDDEN)) {
                        navigationHiddenValues.put(f.getInt(null), fieldName);
                    } else if (fieldName.startsWith(PREFIX_ORIENTATION)) {
                        orientationValues.put(f.getInt(null), fieldName);
                    } else if (fieldName.startsWith(PREFIX_SCREENLAYOUT)) {
                        screenLayoutValues.put(f.getInt(null), fieldName);
                    } else if (fieldName.startsWith(PREFIX_TOUCHSCREEN)) {
                        touchScreenValues.put(f.getInt(null), fieldName);
                    } else if (fieldName.startsWith(PREFIX_UI_MODE)) {
                        uiModeValues.put(f.getInt(null), fieldName);
                    }
                } catch (IllegalAccessException e) {
                    ACRA.log.w(ACRA.LOG_TAG, "Error while inspecting device configuration: ", e);
                } catch (IllegalArgumentException e2) {
                    ACRA.log.w(ACRA.LOG_TAG, "Error while inspecting device configuration: ", e2);
                }
            }
        }
        this.mValueArrays.put(PREFIX_HARDKEYBOARDHIDDEN, hardKeyboardHiddenValues);
        this.mValueArrays.put(PREFIX_KEYBOARD, keyboardValues);
        this.mValueArrays.put(PREFIX_KEYBOARDHIDDEN, keyboardHiddenValues);
        this.mValueArrays.put(PREFIX_NAVIGATION, navigationValues);
        this.mValueArrays.put(PREFIX_NAVIGATIONHIDDEN, navigationHiddenValues);
        this.mValueArrays.put(PREFIX_ORIENTATION, orientationValues);
        this.mValueArrays.put(PREFIX_SCREENLAYOUT, screenLayoutValues);
        this.mValueArrays.put(PREFIX_TOUCHSCREEN, touchScreenValues);
        this.mValueArrays.put(PREFIX_UI_MODE, uiModeValues);
    }

    private String toString(Configuration conf) {
        StringBuilder result = new StringBuilder();
        Field[] arr$ = conf.getClass().getFields();
        for (Field f : arr$) {
            try {
                if (!Modifier.isStatic(f.getModifiers())) {
                    String fieldName = f.getName();
                    result.append(fieldName).append('=');
                    if (f.getType().equals(Integer.TYPE)) {
                        result.append(getFieldValueName(conf, f));
                    } else if (f.get(conf) != null) {
                        result.append(f.get(conf).toString());
                    }
                    result.append('\n');
                }
            } catch (IllegalAccessException e) {
                ACRA.log.e(ACRA.LOG_TAG, "Error while inspecting device configuration: ", e);
            } catch (IllegalArgumentException e2) {
                ACRA.log.e(ACRA.LOG_TAG, "Error while inspecting device configuration: ", e2);
            }
        }
        return result.toString();
    }

    private String getFieldValueName(Configuration conf, Field f) throws IllegalAccessException {
        String fieldName = f.getName();
        if (fieldName.equals(FIELD_MCC) || fieldName.equals(FIELD_MNC)) {
            return Integer.toString(f.getInt(conf));
        }
        if (fieldName.equals(FIELD_UIMODE)) {
            return activeFlags(this.mValueArrays.get(PREFIX_UI_MODE), f.getInt(conf));
        }
        if (fieldName.equals(FIELD_SCREENLAYOUT)) {
            return activeFlags(this.mValueArrays.get(PREFIX_SCREENLAYOUT), f.getInt(conf));
        }
        SparseArray<String> values = this.mValueArrays.get(fieldName.toUpperCase() + '_');
        if (values == null) {
            return Integer.toString(f.getInt(conf));
        }
        String value = values.get(f.getInt(conf));
        if (value == null) {
            return Integer.toString(f.getInt(conf));
        }
        return value;
    }

    private static String activeFlags(SparseArray<String> valueNames, int bitfield) {
        int value;
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < valueNames.size(); i++) {
            int maskValue = valueNames.keyAt(i);
            if (valueNames.get(maskValue).endsWith(SUFFIX_MASK) && (value = bitfield & maskValue) > 0) {
                if (result.length() > 0) {
                    result.append('+');
                }
                result.append(valueNames.get(value));
            }
        }
        return result.toString();
    }

    public static String collectConfiguration(Context context) {
        try {
            ConfigurationCollector collector = new ConfigurationCollector();
            Configuration crashConf = context.getResources().getConfiguration();
            return collector.toString(crashConf);
        } catch (RuntimeException e) {
            ACRA.log.w(ACRA.LOG_TAG, "Couldn't retrieve CrashConfiguration for : " + context.getPackageName(), e);
            return "Couldn't retrieve crash config";
        }
    }
}
