package com.google.zxing.client.android;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import com.google.zxing.DecodeHintType;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

/* loaded from: com.journeyapps.zxing-android-embedded.3.0.2.jar:com/google/zxing/client/android/DecodeHintManager.class */
public final class DecodeHintManager {
    private static final String TAG = DecodeHintManager.class.getSimpleName();
    private static final Pattern COMMA = Pattern.compile(",");

    private DecodeHintManager() {
    }

    private static Map<String, String> splitQuery(String query) {
        String name;
        String text;
        Map<String, String> map = new HashMap<>();
        int pos = 0;
        while (true) {
            if (pos >= query.length()) {
                break;
            }
            if (query.charAt(pos) == '&') {
                pos++;
            } else {
                int amp = query.indexOf(38, pos);
                int equ = query.indexOf(61, pos);
                if (amp < 0) {
                    if (equ < 0) {
                        String name2 = query.substring(pos);
                        name = Uri.decode(name2.replace('+', ' '));
                        text = "";
                    } else {
                        String name3 = query.substring(pos, equ);
                        name = Uri.decode(name3.replace('+', ' '));
                        String text2 = query.substring(equ + 1);
                        text = Uri.decode(text2.replace('+', ' '));
                    }
                    if (!map.containsKey(name)) {
                        map.put(name, text);
                    }
                } else if (equ < 0 || equ > amp) {
                    String name4 = query.substring(pos, amp);
                    String name5 = Uri.decode(name4.replace('+', ' '));
                    if (!map.containsKey(name5)) {
                        map.put(name5, "");
                    }
                    pos = amp + 1;
                } else {
                    String name6 = query.substring(pos, equ);
                    String name7 = Uri.decode(name6.replace('+', ' '));
                    String text3 = query.substring(equ + 1, amp);
                    String text4 = Uri.decode(text3.replace('+', ' '));
                    if (!map.containsKey(name7)) {
                        map.put(name7, text4);
                    }
                    pos = amp + 1;
                }
            }
        }
        return map;
    }

    static Map<DecodeHintType, ?> parseDecodeHints(Uri inputUri) {
        String query = inputUri.getEncodedQuery();
        if (query == null || query.isEmpty()) {
            return null;
        }
        Map<String, String> parameters = splitQuery(query);
        Map<DecodeHintType, Object> hints = new EnumMap<>(DecodeHintType.class);
        DecodeHintType[] arr$ = DecodeHintType.values();
        for (DecodeHintType hintType : arr$) {
            if (hintType != DecodeHintType.CHARACTER_SET && hintType != DecodeHintType.NEED_RESULT_POINT_CALLBACK && hintType != DecodeHintType.POSSIBLE_FORMATS) {
                String parameterName = hintType.name();
                String parameterText = parameters.get(parameterName);
                if (parameterText != null) {
                    if (hintType.getValueType().equals(Object.class)) {
                        hints.put(hintType, parameterText);
                    } else if (hintType.getValueType().equals(Void.class)) {
                        hints.put(hintType, Boolean.TRUE);
                    } else if (hintType.getValueType().equals(String.class)) {
                        hints.put(hintType, parameterText);
                    } else if (hintType.getValueType().equals(Boolean.class)) {
                        if (parameterText.isEmpty()) {
                            hints.put(hintType, Boolean.TRUE);
                        } else if ("0".equals(parameterText) || "false".equalsIgnoreCase(parameterText) || "no".equalsIgnoreCase(parameterText)) {
                            hints.put(hintType, Boolean.FALSE);
                        } else {
                            hints.put(hintType, Boolean.TRUE);
                        }
                    } else if (hintType.getValueType().equals(int[].class)) {
                        if (!parameterText.isEmpty() && parameterText.charAt(parameterText.length() - 1) == ',') {
                            parameterText = parameterText.substring(0, parameterText.length() - 1);
                        }
                        String[] values = COMMA.split(parameterText);
                        int[] array = new int[values.length];
                        for (int i = 0; i < values.length; i++) {
                            try {
                                array[i] = Integer.parseInt(values[i]);
                            } catch (NumberFormatException e) {
                                Log.w(TAG, "Skipping array of integers hint " + hintType + " due to invalid numeric value: '" + values[i] + '\'');
                                array = null;
                            }
                        }
                        if (array != null) {
                            hints.put(hintType, array);
                        }
                    } else {
                        Log.w(TAG, "Unsupported hint type '" + hintType + "' of type " + hintType.getValueType());
                    }
                }
            }
        }
        Log.i(TAG, "Hints from the URI: " + hints);
        return hints;
    }

    public static Map<DecodeHintType, Object> parseDecodeHints(Intent intent) {
        Bundle extras = intent.getExtras();
        if (extras == null || extras.isEmpty()) {
            return null;
        }
        Map<DecodeHintType, Object> hints = new EnumMap<>(DecodeHintType.class);
        DecodeHintType[] arr$ = DecodeHintType.values();
        for (DecodeHintType hintType : arr$) {
            if (hintType != DecodeHintType.CHARACTER_SET && hintType != DecodeHintType.NEED_RESULT_POINT_CALLBACK && hintType != DecodeHintType.POSSIBLE_FORMATS) {
                String hintName = hintType.name();
                if (extras.containsKey(hintName)) {
                    if (hintType.getValueType().equals(Void.class)) {
                        hints.put(hintType, Boolean.TRUE);
                    } else {
                        Object hintData = extras.get(hintName);
                        if (hintType.getValueType().isInstance(hintData)) {
                            hints.put(hintType, hintData);
                        } else {
                            Log.w(TAG, "Ignoring hint " + hintType + " because it is not assignable from " + hintData);
                        }
                    }
                }
            }
        }
        Log.i(TAG, "Hints from the Intent: " + hints);
        return hints;
    }
}
