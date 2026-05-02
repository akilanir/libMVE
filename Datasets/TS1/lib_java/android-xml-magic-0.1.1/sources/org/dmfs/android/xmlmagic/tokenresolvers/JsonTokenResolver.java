package org.dmfs.android.xmlmagic.tokenresolvers;

import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/tokenresolvers/JsonTokenResolver.class */
public class JsonTokenResolver implements ITokenResolver {
    private final JSONObject mJsonObject;

    public JsonTokenResolver(JSONObject jSONObject) {
        this.mJsonObject = jSONObject;
    }

    @Override // org.dmfs.android.xmlmagic.tokenresolvers.ITokenResolver
    public CharSequence resolveToken(String str) {
        JSONObject optJSONObject;
        if (str == null || !str.startsWith("@json:")) {
            return null;
        }
        String substring = str.substring(6);
        if (this.mJsonObject.has(substring)) {
            return getAsString(this.mJsonObject, substring);
        }
        JSONObject jSONObject = this.mJsonObject;
        do {
            int indexOf = substring.indexOf(46);
            if (indexOf <= 0 || (optJSONObject = this.mJsonObject.optJSONObject(substring.substring(0, indexOf))) == null) {
                return null;
            }
            substring = substring.substring(indexOf + 1);
        } while (!optJSONObject.has(substring));
        return getAsString(optJSONObject, substring);
    }

    private String getAsString(JSONObject jSONObject, String str) {
        try {
            return jSONObject.getString(str);
        } catch (JSONException e) {
            return "";
        }
    }
}
