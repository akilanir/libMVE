package com.rey.material.util;

import android.graphics.Color;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/util/ColorUtil.class */
public class ColorUtil {
    private static int getMiddleValue(int prev, int next, float factor) {
        return Math.round(prev + ((next - prev) * factor));
    }

    public static int getMiddleColor(int prevColor, int curColor, float factor) {
        if (prevColor == curColor) {
            return curColor;
        }
        if (factor == 0.0f) {
            return prevColor;
        }
        if (factor == 1.0f) {
            return curColor;
        }
        int a = getMiddleValue(Color.alpha(prevColor), Color.alpha(curColor), factor);
        int r = getMiddleValue(Color.red(prevColor), Color.red(curColor), factor);
        int g = getMiddleValue(Color.green(prevColor), Color.green(curColor), factor);
        int b = getMiddleValue(Color.blue(prevColor), Color.blue(curColor), factor);
        return Color.argb(a, r, g, b);
    }

    public static int getColor(int baseColor, float alphaPercent) {
        int alpha = Math.round(Color.alpha(baseColor) * alphaPercent);
        return (baseColor & 16777215) | (alpha << 24);
    }
}
