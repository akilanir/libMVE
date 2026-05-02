package org.piwik.sdk;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import org.json.JSONArray;
import org.json.JSONObject;
import org.piwik.sdk.tools.Logy;

/* loaded from: org.piwik.sdk.piwik-sdk.0.0.3.jar:org/piwik/sdk/CustomVariables.class */
public class CustomVariables extends HashMap<String, JSONArray> {
    private static final String LOGGER_TAG = "PIWIK:CustomVariables";
    private static final int MAX_VARIABLES = 5;
    protected static final int MAX_LENGTH = 200;

    public CustomVariables() {
        super(MAX_VARIABLES);
    }

    public JSONArray put(int index, String name, String value) {
        if (index > 0 && index <= MAX_VARIABLES) {
            if ((name != null) & (value != null)) {
                if (name.length() > MAX_LENGTH) {
                    Logy.w(LOGGER_TAG, String.format("Name is too long %s", name));
                    name = name.substring(0, MAX_LENGTH);
                }
                if (value.length() > MAX_LENGTH) {
                    Logy.w(LOGGER_TAG, String.format("Value is too long %s", value));
                    value = value.substring(0, MAX_LENGTH);
                }
                return put(Integer.toString(index), new JSONArray((Collection) Arrays.asList(name, value)));
            }
        }
        Logy.d(LOGGER_TAG, "Index is out of range or name/value is null");
        return null;
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public JSONArray put(String index, JSONArray values) {
        if (values.length() == 2 && index != null) {
            return (JSONArray) super.put((CustomVariables) index, (String) values);
        }
        Logy.d(LOGGER_TAG, "value length should be equal 2");
        return null;
    }

    @Override // java.util.AbstractMap
    public String toString() {
        if (size() == 0) {
            return null;
        }
        return new JSONObject(this).toString();
    }
}
