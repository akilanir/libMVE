package android.support.v7.content.res;

import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.graphics.ColorUtils;
import android.support.v7.appcompat.R;
import android.util.AttributeSet;
import android.util.StateSet;
import android.util.Xml;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.android.support.appcompat-v7.24.0.0.jar:android/support/v7/content/res/AppCompatColorStateListInflater.class */
final class AppCompatColorStateListInflater {
    private static final int DEFAULT_COLOR = -65536;

    private AppCompatColorStateListInflater() {
    }

    @NonNull
    public static ColorStateList createFromXml(@NonNull Resources r, @NonNull XmlPullParser parser, @Nullable Resources.Theme theme) throws XmlPullParserException, IOException {
        int type;
        AttributeSet attrs = Xml.asAttributeSet(parser);
        do {
            type = parser.next();
            if (type == 2) {
                break;
            }
        } while (type != 1);
        if (type != 2) {
            throw new XmlPullParserException("No start tag found");
        }
        return createFromXmlInner(r, parser, attrs, theme);
    }

    @NonNull
    private static ColorStateList createFromXmlInner(@NonNull Resources r, @NonNull XmlPullParser parser, @NonNull AttributeSet attrs, @Nullable Resources.Theme theme) throws XmlPullParserException, IOException {
        String name = parser.getName();
        if (!name.equals("selector")) {
            throw new XmlPullParserException(parser.getPositionDescription() + ": invalid color state list tag " + name);
        }
        return inflate(r, parser, attrs, theme);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v15, types: [int[], int[][], java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v53, types: [java.lang.Object[]] */
    /* JADX WARN: Type inference failed for: r0v55, types: [int[][]] */
    private static ColorStateList inflate(@NonNull Resources r, @NonNull XmlPullParser parser, @NonNull AttributeSet attrs, @Nullable Resources.Theme theme) throws XmlPullParserException, IOException {
        int depth;
        int innerDepth = parser.getDepth() + 1;
        int[] iArr = new int[20];
        int[] colorList = new int[iArr.length];
        int listSize = 0;
        while (true) {
            int type = parser.next();
            if (type == 1 || ((depth = parser.getDepth()) < innerDepth && type == 3)) {
                break;
            }
            if (type == 2 && depth <= innerDepth && parser.getName().equals("item")) {
                TypedArray a = obtainAttributes(r, theme, attrs, R.styleable.ColorStateListItem);
                int baseColor = a.getColor(R.styleable.ColorStateListItem_android_color, -65281);
                float alphaMod = 1.0f;
                if (a.hasValue(R.styleable.ColorStateListItem_android_alpha)) {
                    alphaMod = a.getFloat(R.styleable.ColorStateListItem_android_alpha, 1.0f);
                } else if (a.hasValue(R.styleable.ColorStateListItem_alpha)) {
                    alphaMod = a.getFloat(R.styleable.ColorStateListItem_alpha, 1.0f);
                }
                a.recycle();
                int j = 0;
                int numAttrs = attrs.getAttributeCount();
                int[] stateSpec = new int[numAttrs];
                for (int i = 0; i < numAttrs; i++) {
                    int stateResId = attrs.getAttributeNameResource(i);
                    if (stateResId != 16843173 && stateResId != 16843551 && stateResId != R.attr.alpha) {
                        int i2 = j;
                        j++;
                        stateSpec[i2] = attrs.getAttributeBooleanValue(i, false) ? stateResId : -stateResId;
                    }
                }
                int[] stateSpec2 = StateSet.trimStateSet(stateSpec, j);
                int color = modulateColorAlpha(baseColor, alphaMod);
                if (listSize == 0 || stateSpec2.length == 0) {
                }
                colorList = GrowingArrayUtils.append(colorList, listSize, color);
                iArr = (int[][]) GrowingArrayUtils.append((int[][]) iArr, listSize, stateSpec2);
                listSize++;
            }
        }
        int[] colors = new int[listSize];
        ?? r0 = new int[listSize];
        System.arraycopy(colorList, 0, colors, 0, listSize);
        System.arraycopy(iArr, 0, r0, 0, listSize);
        return new ColorStateList(r0, colors);
    }

    private static TypedArray obtainAttributes(Resources res, Resources.Theme theme, AttributeSet set, int[] attrs) {
        return theme == null ? res.obtainAttributes(set, attrs) : theme.obtainStyledAttributes(set, attrs, 0, 0);
    }

    private static int modulateColorAlpha(int color, float alphaMod) {
        return ColorUtils.setAlphaComponent(color, Math.round(Color.alpha(color) * alphaMod));
    }
}
