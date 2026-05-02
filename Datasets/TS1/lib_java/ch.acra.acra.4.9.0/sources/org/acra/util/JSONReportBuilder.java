package org.acra.util;

import android.support.annotation.NonNull;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.Locale;
import org.acra.ACRA;
import org.acra.ReportField;
import org.acra.collector.CrashReportData;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/util/JSONReportBuilder.class */
public final class JSONReportBuilder {
    private JSONReportBuilder() {
    }

    @NonNull
    public static JSONObject buildJSONReport(@NonNull CrashReportData errorContent) throws JSONReportException {
        JSONObject jsonReport = new JSONObject();
        BufferedReader reader = null;
        for (ReportField key : errorContent.keySet()) {
            try {
                try {
                    if (key.containsKeyValuePairs()) {
                        JSONObject subObject = new JSONObject();
                        String strContent = errorContent.getProperty(key);
                        reader = new BufferedReader(new StringReader(strContent), 1024);
                        while (true) {
                            try {
                                String line = reader.readLine();
                                if (line == null) {
                                    break;
                                }
                                addJSONFromProperty(subObject, line);
                            } catch (IOException e) {
                                ACRA.log.w(ACRA.LOG_TAG, "Error while converting " + key.name() + " to JSON.", e);
                            }
                        }
                        jsonReport.accumulate(key.name(), subObject);
                    } else {
                        jsonReport.accumulate(key.name(), guessType(errorContent.getProperty(key)));
                    }
                } catch (JSONException e2) {
                    throw new JSONReportException("Could not create JSON object for key " + key, e2);
                }
            } finally {
                IOUtils.safeClose(reader);
            }
        }
        return jsonReport;
    }

    private static void addJSONFromProperty(@NonNull JSONObject destination, @NonNull String propertyString) throws JSONException {
        int equalsIndex = propertyString.indexOf(61);
        if (equalsIndex > 0) {
            String currentKey = propertyString.substring(0, equalsIndex).trim();
            String currentValue = propertyString.substring(equalsIndex + 1).trim();
            Object value = guessType(currentValue);
            if (value instanceof String) {
                value = ((String) value).replaceAll("\\\\n", "\n");
            }
            String[] splitKey = currentKey.split("\\.");
            if (splitKey.length > 1) {
                addJSONSubTree(destination, splitKey, value);
                return;
            } else {
                destination.accumulate(currentKey, value);
                return;
            }
        }
        destination.put(propertyString.trim(), true);
    }

    @NonNull
    private static Object guessType(@NonNull String value) {
        if ("true".equalsIgnoreCase(value)) {
            return true;
        }
        if ("false".equalsIgnoreCase(value)) {
            return false;
        }
        if (value.matches("(?:^|\\s)([1-9](?:\\d*|(?:\\d{0,2})(?:,\\d{3})*)(?:\\.\\d*[1-9])?|0?\\.\\d*[1-9]|0)(?:\\s|$)")) {
            NumberFormat format = NumberFormat.getInstance(Locale.US);
            try {
                return format.parse(value);
            } catch (ParseException e) {
            }
        }
        return value;
    }

    private static void addJSONSubTree(@NonNull JSONObject destination, @NonNull String[] keys, Object value) throws JSONException {
        for (int i = 0; i < keys.length; i++) {
            String subKey = keys[i];
            if (i < keys.length - 1) {
                JSONObject intermediate = null;
                if (destination.isNull(subKey)) {
                    intermediate = new JSONObject();
                    destination.accumulate(subKey, intermediate);
                } else {
                    Object target = destination.get(subKey);
                    if (target instanceof JSONObject) {
                        intermediate = destination.getJSONObject(subKey);
                    } else if (target instanceof JSONArray) {
                        JSONArray wildCard = destination.getJSONArray(subKey);
                        for (int j = 0; j < wildCard.length(); j++) {
                            intermediate = wildCard.optJSONObject(j);
                            if (intermediate != null) {
                                break;
                            }
                        }
                    }
                    if (intermediate == null) {
                        ACRA.log.w(ACRA.LOG_TAG, "Unknown json subtree type, see issue #186");
                        return;
                    }
                }
                destination = intermediate;
            } else {
                destination.accumulate(subKey, value);
            }
        }
    }

    /* loaded from: ch.acra.acra.4.9.0.jar:org/acra/util/JSONReportBuilder$JSONReportException.class */
    public static class JSONReportException extends Exception {
        private static final long serialVersionUID = -694684023635442219L;

        public JSONReportException(String message, Throwable e) {
            super(message, e);
        }
    }
}
