package android.support.graphics.drawable;

import android.content.res.TypedArray;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: com.android.support.support-vector-drawable.23.4.0.jar:android/support/graphics/drawable/TypedArrayUtils.class */
class TypedArrayUtils {
    private static final String NAMESPACE = "http://schemas.android.com/apk/res/android";

    TypedArrayUtils() {
    }

    public static boolean hasAttribute(XmlPullParser parser, String attrName) {
        return parser.getAttributeValue(NAMESPACE, attrName) != null;
    }

    public static float getNamedFloat(TypedArray a, XmlPullParser parser, String attrName, int resId, float defaultValue) {
        boolean hasAttr = hasAttribute(parser, attrName);
        if (!hasAttr) {
            return defaultValue;
        }
        return a.getFloat(resId, defaultValue);
    }

    public static boolean getNamedBoolean(TypedArray a, XmlPullParser parser, String attrName, int resId, boolean defaultValue) {
        boolean hasAttr = hasAttribute(parser, attrName);
        if (!hasAttr) {
            return defaultValue;
        }
        return a.getBoolean(resId, defaultValue);
    }

    public static int getNamedInt(TypedArray a, XmlPullParser parser, String attrName, int resId, int defaultValue) {
        boolean hasAttr = hasAttribute(parser, attrName);
        if (!hasAttr) {
            return defaultValue;
        }
        return a.getInt(resId, defaultValue);
    }

    public static int getNamedColor(TypedArray a, XmlPullParser parser, String attrName, int resId, int defaultValue) {
        boolean hasAttr = hasAttribute(parser, attrName);
        if (!hasAttr) {
            return defaultValue;
        }
        return a.getColor(resId, defaultValue);
    }
}
