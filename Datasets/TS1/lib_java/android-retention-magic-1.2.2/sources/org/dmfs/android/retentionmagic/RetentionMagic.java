package org.dmfs.android.retentionmagic;

import android.annotation.TargetApi;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcelable;
import android.util.SparseArray;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.dmfs.android.retentionmagic.annotations.Parameter;
import org.dmfs.android.retentionmagic.annotations.ParameterArrayList;
import org.dmfs.android.retentionmagic.annotations.Retain;
import org.dmfs.android.retentionmagic.annotations.RetainArrayList;

/* loaded from: android-retention-magic-1.2.2.jar:org/dmfs/android/retentionmagic/RetentionMagic.class */
public final class RetentionMagic {
    private static final Map<Class<?>, PersistenceHelper> FINAL_CLASS_HELPERS = new HashMap();
    private static final Map<Class<?>, PersistenceHelper> OTHER_CLASS_HELPERS = new HashMap();
    private static final Map<Class<?>, PersistenceHelper> ARRAYLIST_FINAL_CLASS_HELPERS = new HashMap();
    private static final Map<Class<?>, PersistenceHelper> ARRAYLIST_OTHER_CLASS_HELPERS = new HashMap();
    private static final Map<Class<?>, Map<Field, PersistenceHelper>> CLASS_CACHE = new HashMap();

    static {
        FINAL_CLASS_HELPERS.put(Boolean.TYPE, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.1
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.setBoolean(instance, bundle.getBoolean(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putBoolean(key, field.getBoolean(instance));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromPreferences(Field field, Object instance, String key, SharedPreferences prefs) throws IllegalAccessException {
                field.setBoolean(instance, prefs.getBoolean(key, field.getBoolean(instance)));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInPreferences(Field field, Object instance, String key, SharedPreferences.Editor editor) throws IllegalAccessException {
                editor.putBoolean(key, field.getBoolean(instance));
            }
        });
        FINAL_CLASS_HELPERS.put(boolean[].class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.2
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.set(instance, bundle.getBooleanArray(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putBooleanArray(key, (boolean[]) field.get(instance));
            }
        });
        FINAL_CLASS_HELPERS.put(Byte.TYPE, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.3
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.setByte(instance, bundle.getByte(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putByte(key, field.getByte(instance));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromPreferences(Field field, Object instance, String key, SharedPreferences prefs) throws IllegalAccessException {
                field.setByte(instance, (byte) (prefs.getInt(key, field.getByte(instance)) & 255));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInPreferences(Field field, Object instance, String key, SharedPreferences.Editor editor) throws IllegalAccessException {
                editor.putInt(key, field.getByte(instance));
            }
        });
        FINAL_CLASS_HELPERS.put(byte[].class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.4
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.set(instance, bundle.getByteArray(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putByteArray(key, (byte[]) field.get(instance));
            }
        });
        FINAL_CLASS_HELPERS.put(Short.TYPE, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.5
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.setShort(instance, bundle.getShort(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putShort(key, field.getShort(instance));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromPreferences(Field field, Object instance, String key, SharedPreferences prefs) throws IllegalAccessException {
                field.setShort(instance, (short) prefs.getInt(key, field.getShort(instance)));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInPreferences(Field field, Object instance, String key, SharedPreferences.Editor editor) throws IllegalAccessException {
                editor.putInt(key, field.getShort(instance));
            }
        });
        FINAL_CLASS_HELPERS.put(short[].class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.6
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.set(instance, bundle.getShortArray(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putShortArray(key, (short[]) field.get(instance));
            }
        });
        FINAL_CLASS_HELPERS.put(Character.TYPE, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.7
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.setChar(instance, bundle.getChar(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putChar(key, field.getChar(instance));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromPreferences(Field field, Object instance, String key, SharedPreferences prefs) throws IllegalAccessException {
                field.setChar(instance, (char) prefs.getInt(key, field.getChar(instance)));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInPreferences(Field field, Object instance, String key, SharedPreferences.Editor editor) throws IllegalAccessException {
                editor.putInt(key, field.getChar(instance));
            }
        });
        FINAL_CLASS_HELPERS.put(char[].class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.8
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.set(instance, bundle.getCharArray(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putCharArray(key, (char[]) field.get(instance));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromPreferences(Field field, Object instance, String key, SharedPreferences prefs) throws IllegalAccessException {
                field.set(instance, prefs.getString(key, new String((char[]) field.get(instance))).toCharArray());
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInPreferences(Field field, Object instance, String key, SharedPreferences.Editor editor) throws IllegalAccessException {
                editor.putString(key, new String((char[]) field.get(instance)));
            }
        });
        FINAL_CLASS_HELPERS.put(Integer.TYPE, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.9
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.setInt(instance, bundle.getInt(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putInt(key, field.getInt(instance));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromPreferences(Field field, Object instance, String key, SharedPreferences prefs) throws IllegalAccessException {
                field.setInt(instance, prefs.getInt(key, field.getInt(instance)));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInPreferences(Field field, Object instance, String key, SharedPreferences.Editor editor) throws IllegalAccessException {
                editor.putInt(key, field.getInt(instance));
            }
        });
        FINAL_CLASS_HELPERS.put(int[].class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.10
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.set(instance, bundle.getIntArray(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putIntArray(key, (int[]) field.get(instance));
            }
        });
        FINAL_CLASS_HELPERS.put(Long.TYPE, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.11
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.setLong(instance, bundle.getLong(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putLong(key, field.getLong(instance));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromPreferences(Field field, Object instance, String key, SharedPreferences prefs) throws IllegalAccessException {
                field.setLong(instance, prefs.getLong(key, field.getLong(instance)));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInPreferences(Field field, Object instance, String key, SharedPreferences.Editor editor) throws IllegalAccessException {
                editor.putLong(key, field.getLong(instance));
            }
        });
        FINAL_CLASS_HELPERS.put(long[].class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.12
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.set(instance, bundle.getLongArray(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putLongArray(key, (long[]) field.get(instance));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInPreferences(Field field, Object instance, String key, SharedPreferences.Editor editor) throws IllegalAccessException {
                StringBuilder arrayStringBuilder = new StringBuilder(1024);
                long[] longArray = (long[]) field.get(instance);
                if (longArray != null) {
                    boolean first = true;
                    for (long j : longArray) {
                        if (first) {
                            first = !first;
                        } else {
                            arrayStringBuilder.append(",");
                        }
                        arrayStringBuilder.append(j);
                    }
                    editor.putString(key, arrayStringBuilder.toString());
                    return;
                }
                editor.putString(key, null);
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromPreferences(Field field, Object instance, String key, SharedPreferences prefs) throws IllegalAccessException {
                String longArrayPref = prefs.getString(key, (String) field.get(instance));
                long[] longArray = null;
                if (longArrayPref != null) {
                    if (longArrayPref.length() > 0) {
                        String[] arrayString = longArrayPref.split(",");
                        longArray = new long[arrayString.length];
                        for (int i = 0; i < longArray.length; i++) {
                            longArray[i] = Long.valueOf(arrayString[i]).longValue();
                        }
                    } else {
                        longArray = new long[0];
                    }
                }
                field.set(instance, longArray);
            }
        });
        FINAL_CLASS_HELPERS.put(Float.TYPE, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.13
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.setFloat(instance, bundle.getFloat(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putFloat(key, field.getFloat(instance));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromPreferences(Field field, Object instance, String key, SharedPreferences prefs) throws IllegalAccessException {
                field.setFloat(instance, prefs.getFloat(key, field.getFloat(instance)));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInPreferences(Field field, Object instance, String key, SharedPreferences.Editor editor) throws IllegalAccessException {
                editor.putFloat(key, field.getFloat(instance));
            }
        });
        FINAL_CLASS_HELPERS.put(float[].class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.14
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.set(instance, bundle.getFloatArray(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putFloatArray(key, (float[]) field.get(instance));
            }
        });
        FINAL_CLASS_HELPERS.put(Double.TYPE, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.15
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.setDouble(instance, bundle.getDouble(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putDouble(key, field.getDouble(instance));
            }
        });
        FINAL_CLASS_HELPERS.put(double[].class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.16
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.set(instance, bundle.getDoubleArray(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putDoubleArray(key, (double[]) field.get(instance));
            }
        });
        FINAL_CLASS_HELPERS.put(String.class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.17
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.set(instance, bundle.getString(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putString(key, (String) field.get(instance));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromPreferences(Field field, Object instance, String key, SharedPreferences prefs) throws IllegalAccessException {
                field.set(instance, prefs.getString(key, (String) field.get(instance)));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInPreferences(Field field, Object instance, String key, SharedPreferences.Editor editor) throws IllegalAccessException {
                editor.putString(key, (String) field.get(instance));
            }
        });
        FINAL_CLASS_HELPERS.put(String[].class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.18
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.set(instance, bundle.getStringArray(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putStringArray(key, (String[]) field.get(instance));
            }
        });
        FINAL_CLASS_HELPERS.put(Bundle.class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.19
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.set(instance, bundle.getBundle(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putBundle(key, (Bundle) field.get(instance));
            }
        });
        FINAL_CLASS_HELPERS.put(SparseArray.class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.20
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.set(instance, bundle.getSparseParcelableArray(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putSparseParcelableArray(key, (SparseArray) field.get(instance));
            }
        });
        ARRAYLIST_FINAL_CLASS_HELPERS.put(Integer.class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.21
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.set(instance, bundle.getIntegerArrayList(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putIntegerArrayList(key, (ArrayList) field.get(instance));
            }
        });
        ARRAYLIST_FINAL_CLASS_HELPERS.put(String.class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.22
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.set(instance, bundle.getStringArrayList(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putStringArrayList(key, (ArrayList) field.get(instance));
            }
        });
        if (Build.VERSION.SDK_INT >= 8) {
            ARRAYLIST_OTHER_CLASS_HELPERS.put(CharSequence.class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.23
                @Override // org.dmfs.android.retentionmagic.PersistenceHelper
                @TargetApi(8)
                public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                    field.set(instance, bundle.getCharSequenceArrayList(key));
                }

                @Override // org.dmfs.android.retentionmagic.PersistenceHelper
                @TargetApi(8)
                public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                    bundle.putCharSequenceArrayList(key, (ArrayList) field.get(instance));
                }
            });
        }
        ARRAYLIST_OTHER_CLASS_HELPERS.put(Parcelable.class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.24
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.set(instance, bundle.getParcelableArrayList(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putParcelableArrayList(key, (ArrayList) field.get(instance));
            }
        });
        OTHER_CLASS_HELPERS.put(CharSequence.class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.25
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.set(instance, bundle.getCharSequence(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putCharSequence(key, (CharSequence) field.get(instance));
            }
        });
        if (Build.VERSION.SDK_INT >= 8) {
            OTHER_CLASS_HELPERS.put(CharSequence[].class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.26
                @Override // org.dmfs.android.retentionmagic.PersistenceHelper
                @TargetApi(8)
                public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                    field.set(instance, bundle.getCharSequenceArray(key));
                }

                @Override // org.dmfs.android.retentionmagic.PersistenceHelper
                @TargetApi(8)
                public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                    bundle.putCharSequenceArray(key, (CharSequence[]) field.get(instance));
                }
            });
        }
        OTHER_CLASS_HELPERS.put(Parcelable.class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.27
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.set(instance, bundle.getParcelable(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putParcelable(key, (Parcelable) field.get(instance));
            }
        });
        OTHER_CLASS_HELPERS.put(Parcelable[].class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.28
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.set(instance, bundle.getParcelableArray(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putParcelableArray(key, (Parcelable[]) field.get(instance));
            }
        });
        OTHER_CLASS_HELPERS.put(Serializable.class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.29
            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                field.set(instance, bundle.getSerializable(key));
            }

            @Override // org.dmfs.android.retentionmagic.PersistenceHelper
            public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                bundle.putSerializable(key, (Serializable) field.get(instance));
            }
        });
        if (Build.VERSION.SDK_INT >= 18) {
            OTHER_CLASS_HELPERS.put(IBinder.class, new PersistenceHelper() { // from class: org.dmfs.android.retentionmagic.RetentionMagic.30
                @Override // org.dmfs.android.retentionmagic.PersistenceHelper
                @TargetApi(18)
                public void restoreFromBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                    field.set(instance, bundle.getBinder(key));
                }

                @Override // org.dmfs.android.retentionmagic.PersistenceHelper
                @TargetApi(18)
                public void storeInBundle(Field field, Object instance, String key, Bundle bundle) throws IllegalAccessException {
                    bundle.putBinder(key, (IBinder) field.get(instance));
                }
            });
        }
    }

    private RetentionMagic() {
    }

    public static void store(android.app.Activity activity, Bundle instanceState) {
        try {
            storeAndRestore(activity.getClass(), activity, instanceState, true);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    public static void store(android.app.Fragment fragment, Bundle instanceState) {
        try {
            storeAndRestore(fragment.getClass(), fragment, instanceState, true);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    public static void store(android.support.v4.app.Fragment fragment, Bundle instanceState) {
        try {
            storeAndRestore(fragment.getClass(), fragment, instanceState, true);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    public static void restore(android.app.Activity activity, Bundle instanceState) {
        try {
            storeAndRestore(activity.getClass(), activity, instanceState, false);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    public static void restore(android.app.Fragment fragment, Bundle instanceState) {
        try {
            storeAndRestore(fragment.getClass(), fragment, instanceState, false);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    public static void restore(android.support.v4.app.Fragment fragment, Bundle instanceState) {
        try {
            storeAndRestore(fragment.getClass(), fragment, instanceState, false);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    private static void storeAndRestore(Class<?> classInstance, Object instance, Bundle instanceState, boolean store) throws IllegalAccessException {
        String key;
        if (instanceState == null) {
            return;
        }
        Map<Field, PersistenceHelper> helperCache = CLASS_CACHE.get(classInstance);
        if (helperCache == null) {
            Map<Field, PersistenceHelper> helperCache2 = new HashMap<>();
            for (Field field : classInstance.getDeclaredFields()) {
                Retain retain = (Retain) field.getAnnotation(Retain.class);
                if (retain != null && !ArrayList.class.isAssignableFrom(field.getType())) {
                    field.setAccessible(true);
                    String key2 = retain.key();
                    if (key2 == null || key2.length() == 0) {
                        key2 = field.getName();
                    }
                    PersistenceHelper helper = getHelper(field.getType());
                    if (helper != null) {
                        if (store) {
                            helper.storeInBundle(field, instance, key2, instanceState);
                        } else {
                            helper.restoreFromBundle(field, instance, key2, instanceState);
                        }
                        helperCache2.put(field, helper);
                    } else {
                        throw new UnsupportedOperationException("field of class " + field.getType().getCanonicalName() + " not supported");
                    }
                } else {
                    if (retain != null) {
                        throw new UnsupportedOperationException("@Retain does not support ArrayLists, use @RetainArrayList instead");
                    }
                    RetainArrayList retainList = (RetainArrayList) field.getAnnotation(RetainArrayList.class);
                    if (retainList != null && ArrayList.class.isAssignableFrom(field.getType())) {
                        field.setAccessible(true);
                        String key3 = retainList.key();
                        if (key3 == null || key3.length() == 0) {
                            key3 = field.getName();
                        }
                        PersistenceHelper helper2 = getArrayListHelper(retainList.genericType());
                        if (helper2 != null) {
                            if (store) {
                                helper2.storeInBundle(field, instance, key3, instanceState);
                            } else {
                                helper2.restoreFromBundle(field, instance, key3, instanceState);
                            }
                            helperCache2.put(field, helper2);
                        } else {
                            throw new UnsupportedOperationException("list with generic type of " + field.getType().getCanonicalName() + " not supported");
                        }
                    } else if (retainList != null) {
                        throw new UnsupportedOperationException("@RetainArrayList supports only ArrayList fields, use @Retain instead");
                    }
                }
            }
            CLASS_CACHE.put(classInstance, helperCache2);
            return;
        }
        for (Map.Entry<Field, PersistenceHelper> entry : helperCache.entrySet()) {
            PersistenceHelper helper3 = entry.getValue();
            Field field2 = entry.getKey();
            if (helper3 != null) {
                Retain retain2 = (Retain) field2.getAnnotation(Retain.class);
                if (retain2 != null) {
                    key = retain2.key();
                } else {
                    key = ((RetainArrayList) field2.getAnnotation(RetainArrayList.class)).key();
                }
                if (key == null || key.length() == 0) {
                    key = field2.getName();
                }
                if (store) {
                    helper3.storeInBundle(field2, instance, key, instanceState);
                } else {
                    helper3.restoreFromBundle(field2, instance, key, instanceState);
                }
            }
        }
    }

    public static void init(android.app.Activity activity, SharedPreferences prefs) {
        try {
            init(activity.getClass(), activity, prefs);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    public static void init(android.app.Fragment fragment, SharedPreferences prefs) {
        try {
            init(fragment.getClass(), fragment, prefs);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    public static void init(android.support.v4.app.Fragment fragment, SharedPreferences prefs) {
        try {
            init(fragment.getClass(), fragment, prefs);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    public static void init(android.app.Activity activity, Bundle extras) {
        try {
            init(activity.getClass(), activity, extras);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    public static void init(android.app.Fragment fragment, Bundle arguments) {
        try {
            init(fragment.getClass(), fragment, arguments);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    public static void init(android.support.v4.app.Fragment fragment, Bundle arguments) {
        try {
            init(fragment.getClass(), fragment, arguments);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    @TargetApi(9)
    public static void persist(android.app.Activity activity, SharedPreferences prefs) {
        SharedPreferences.Editor editor = prefs.edit();
        persist(activity, editor);
        if (Build.VERSION.SDK_INT >= 9) {
            editor.apply();
        } else {
            editor.commit();
        }
    }

    @TargetApi(9)
    public static void persist(android.app.Fragment fragment, SharedPreferences prefs) {
        SharedPreferences.Editor editor = prefs.edit();
        persist(fragment, editor);
        if (Build.VERSION.SDK_INT >= 9) {
            editor.apply();
        } else {
            editor.commit();
        }
    }

    @TargetApi(9)
    public static void persist(android.support.v4.app.Fragment fragment, SharedPreferences prefs) {
        SharedPreferences.Editor editor = prefs.edit();
        persist(fragment, editor);
        if (Build.VERSION.SDK_INT >= 9) {
            editor.apply();
        } else {
            editor.commit();
        }
    }

    public static void persist(android.app.Activity activity, SharedPreferences.Editor editor) {
        try {
            persist(activity.getClass(), activity, editor);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    public static void persist(android.app.Fragment fragment, SharedPreferences.Editor editor) {
        try {
            persist(fragment.getClass(), fragment, editor);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    public static void persist(android.support.v4.app.Fragment fragment, SharedPreferences.Editor editor) {
        try {
            persist(fragment.getClass(), fragment, editor);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    private static void init(Class<?> classInstance, Object instance, SharedPreferences prefs) throws IllegalAccessException {
        Retain retain;
        Map<Field, PersistenceHelper> helperCache = CLASS_CACHE.get(classInstance);
        if (helperCache == null) {
            for (Field field : classInstance.getDeclaredFields()) {
                Retain retain2 = (Retain) field.getAnnotation(Retain.class);
                if (retain2 != null && !ArrayList.class.isAssignableFrom(field.getType())) {
                    if (retain2.permanent()) {
                        field.setAccessible(true);
                        String key = retain2.key();
                        String key2 = getTag(classInstance, retain2.instanceNSField(), retain2.classNS(), instance).append((key == null || key.length() == 0) ? field.getName() : key).toString();
                        PersistenceHelper helper = getHelper(field.getType());
                        if (helper != null) {
                            helper.restoreFromPreferences(field, instance, key2, prefs);
                        } else {
                            throw new UnsupportedOperationException("field of class " + field.getType().getCanonicalName() + " not supported for permanent storage");
                        }
                    } else {
                        continue;
                    }
                } else if (retain2 != null) {
                    throw new UnsupportedOperationException("@Retain does not support ArrayLists, use @RetainArrayList instead");
                }
            }
            return;
        }
        for (Map.Entry<Field, PersistenceHelper> entry : helperCache.entrySet()) {
            PersistenceHelper helper2 = entry.getValue();
            Field field2 = entry.getKey();
            if (helper2 != null && (retain = (Retain) field2.getAnnotation(Retain.class)) != null && retain.permanent()) {
                String key3 = retain.key();
                helper2.restoreFromPreferences(field2, instance, getTag(classInstance, retain.instanceNSField(), retain.classNS(), instance).append((key3 == null || key3.length() == 0) ? field2.getName() : key3).toString(), prefs);
            }
        }
    }

    private static void persist(Class<?> classInstance, Object instance, SharedPreferences.Editor editor) throws IllegalAccessException {
        Retain retain;
        Map<Field, PersistenceHelper> helperCache = CLASS_CACHE.get(classInstance);
        if (helperCache == null) {
            for (Field field : classInstance.getDeclaredFields()) {
                Retain retain2 = (Retain) field.getAnnotation(Retain.class);
                if (retain2 != null && !ArrayList.class.isAssignableFrom(field.getType())) {
                    if (retain2.permanent()) {
                        field.setAccessible(true);
                        String key = retain2.key();
                        String key2 = getTag(classInstance, retain2.instanceNSField(), retain2.classNS(), instance).append((key == null || key.length() == 0) ? field.getName() : key).toString();
                        PersistenceHelper helper = getHelper(field.getType());
                        if (helper != null) {
                            helper.storeInPreferences(field, instance, key2, editor);
                        } else {
                            throw new UnsupportedOperationException("field of class " + field.getType().getCanonicalName() + " not supported for permanent storage");
                        }
                    } else {
                        continue;
                    }
                } else if (retain2 != null) {
                    throw new UnsupportedOperationException("@Retain does not support ArrayLists, use @RetainArrayList instead");
                }
            }
            return;
        }
        for (Map.Entry<Field, PersistenceHelper> entry : helperCache.entrySet()) {
            PersistenceHelper helper2 = entry.getValue();
            Field field2 = entry.getKey();
            if (helper2 != null && (retain = (Retain) field2.getAnnotation(Retain.class)) != null && retain.permanent()) {
                String key3 = retain.key();
                helper2.storeInPreferences(field2, instance, getTag(classInstance, retain.instanceNSField(), retain.classNS(), instance).append((key3 == null || key3.length() == 0) ? field2.getName() : key3).toString(), editor);
            }
        }
    }

    private static void init(Class<?> classInstance, Object instance, Bundle bundle) throws IllegalAccessException {
        if (bundle == null || bundle.size() == 0) {
            return;
        }
        for (Field field : classInstance.getDeclaredFields()) {
            Parameter param = (Parameter) field.getAnnotation(Parameter.class);
            if (param != null && !ArrayList.class.isAssignableFrom(field.getType())) {
                field.setAccessible(true);
                String key = param.key();
                if (key == null || key.length() == 0) {
                    key = field.getName();
                }
                PersistenceHelper helper = getHelper(field.getType());
                if (helper != null) {
                    helper.restoreFromBundle(field, instance, key, bundle);
                } else {
                    throw new UnsupportedOperationException("field of class " + field.getType().getCanonicalName() + " not supported for initialization from a Bundle");
                }
            } else {
                if (param != null) {
                    throw new UnsupportedOperationException("@Parameter does not support ArrayLists, use @ParameterArrayList instead");
                }
                ParameterArrayList paramList = (ParameterArrayList) field.getAnnotation(ParameterArrayList.class);
                if (paramList != null && ArrayList.class.isAssignableFrom(field.getType())) {
                    field.setAccessible(true);
                    String key2 = paramList.value();
                    if (key2 == null || key2.length() == 0) {
                        key2 = field.getName();
                    }
                    PersistenceHelper helper2 = getArrayListHelper(paramList.genericType());
                    if (helper2 != null) {
                        helper2.restoreFromBundle(field, instance, key2, bundle);
                    } else {
                        throw new UnsupportedOperationException("list with generic type of " + field.getType().getCanonicalName() + " not supported");
                    }
                } else if (paramList != null) {
                    throw new UnsupportedOperationException("@ParameterArrayList supports only ArrayList fields, use @Parameter instead");
                }
            }
        }
    }

    private static PersistenceHelper getHelper(Class<?> fieldType) {
        return getHelper(fieldType, FINAL_CLASS_HELPERS, OTHER_CLASS_HELPERS);
    }

    private static PersistenceHelper getArrayListHelper(Class<?> genericArrayListType) {
        return getHelper(genericArrayListType, ARRAYLIST_FINAL_CLASS_HELPERS, ARRAYLIST_OTHER_CLASS_HELPERS);
    }

    private static PersistenceHelper getHelper(Class<?> genericType, Map<Class<?>, PersistenceHelper> finalClassHelper, Map<Class<?>, PersistenceHelper> otherClassHelper) {
        PersistenceHelper result = finalClassHelper.get(genericType);
        if (result != null) {
            return result;
        }
        for (Class<?> classClass : otherClassHelper.keySet()) {
            if (classClass.isAssignableFrom(genericType)) {
                return otherClassHelper.get(classClass);
            }
        }
        return null;
    }

    private static StringBuilder getTag(Class<?> classType, String instanceTag, String classTag, Object instance) throws IllegalAccessException {
        StringBuilder result = new StringBuilder(256);
        if (classTag != null && classTag.length() > 0) {
            if (classTag.length() == 1 && classTag.charAt(0) == '.') {
                try {
                    Field tagField = classType.getDeclaredField("TAG");
                    tagField.setAccessible(true);
                    result.append(tagField.get(instance).toString());
                } catch (Exception e) {
                    result.append(classType.getCanonicalName());
                }
            } else {
                result.append(classTag);
            }
            result.append('.');
        }
        if (instanceTag != null && instanceTag.length() > 0) {
            try {
                Field tagField2 = classType.getDeclaredField(instanceTag);
                tagField2.setAccessible(true);
                Object value = tagField2.get(instance);
                if (value != null) {
                    result.append(value.toString());
                    result.append('.');
                }
            } catch (NoSuchFieldException e2) {
            } catch (SecurityException e3) {
            }
        }
        return result;
    }
}
