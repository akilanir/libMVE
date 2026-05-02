package android.support.v7.graphics;

import android.graphics.Color;
import android.support.v7.palette.BuildConfig;

/* loaded from: com.android.support.palette-v7.21.0.3.jar:android/support/v7/graphics/ColorUtils.class */
final class ColorUtils {
    private static final int MIN_ALPHA_SEARCH_MAX_ITERATIONS = 10;
    private static final int MIN_ALPHA_SEARCH_PRECISION = 10;

    private ColorUtils() {
    }

    private static int compositeColors(int fg, int bg) {
        float alpha1 = Color.alpha(fg) / 255.0f;
        float alpha2 = Color.alpha(bg) / 255.0f;
        float a = (alpha1 + alpha2) * (1.0f - alpha1);
        float r = (Color.red(fg) * alpha1) + (Color.red(bg) * alpha2 * (1.0f - alpha1));
        float g = (Color.green(fg) * alpha1) + (Color.green(bg) * alpha2 * (1.0f - alpha1));
        float b = (Color.blue(fg) * alpha1) + (Color.blue(bg) * alpha2 * (1.0f - alpha1));
        return Color.argb((int) a, (int) r, (int) g, (int) b);
    }

    private static double calculateLuminance(int color) {
        double red = Color.red(color) / 255.0d;
        double red2 = red < 0.03928d ? red / 12.92d : Math.pow((red + 0.055d) / 1.055d, 2.4d);
        double green = Color.green(color) / 255.0d;
        double green2 = green < 0.03928d ? green / 12.92d : Math.pow((green + 0.055d) / 1.055d, 2.4d);
        double blue = Color.blue(color) / 255.0d;
        return (0.2126d * red2) + (0.7152d * green2) + (0.0722d * (blue < 0.03928d ? blue / 12.92d : Math.pow((blue + 0.055d) / 1.055d, 2.4d)));
    }

    private static double calculateContrast(int foreground, int background) {
        if (Color.alpha(background) != 255) {
            throw new IllegalArgumentException("background can not be translucent");
        }
        if (Color.alpha(foreground) < 255) {
            foreground = compositeColors(foreground, background);
        }
        double luminance1 = calculateLuminance(foreground) + 0.05d;
        double luminance2 = calculateLuminance(background) + 0.05d;
        return Math.max(luminance1, luminance2) / Math.min(luminance1, luminance2);
    }

    private static int findMinimumAlpha(int foreground, int background, double minContrastRatio) {
        if (Color.alpha(background) != 255) {
            throw new IllegalArgumentException("background can not be translucent");
        }
        int testForeground = modifyAlpha(foreground, 255);
        double testRatio = calculateContrast(testForeground, background);
        if (testRatio < minContrastRatio) {
            return -1;
        }
        int minAlpha = 0;
        int maxAlpha = 255;
        for (int numIterations = 0; numIterations <= 10 && maxAlpha - minAlpha > 10; numIterations++) {
            int testAlpha = (minAlpha + maxAlpha) / 2;
            int testForeground2 = modifyAlpha(foreground, testAlpha);
            double testRatio2 = calculateContrast(testForeground2, background);
            if (testRatio2 < minContrastRatio) {
                minAlpha = testAlpha;
            } else {
                maxAlpha = testAlpha;
            }
        }
        return maxAlpha;
    }

    static int getTextColorForBackground(int backgroundColor, float minContrastRatio) {
        int whiteMinAlpha = findMinimumAlpha(-1, backgroundColor, minContrastRatio);
        if (whiteMinAlpha >= 0) {
            return modifyAlpha(-1, whiteMinAlpha);
        }
        int blackMinAlpha = findMinimumAlpha(-16777216, backgroundColor, minContrastRatio);
        if (blackMinAlpha >= 0) {
            return modifyAlpha(-16777216, blackMinAlpha);
        }
        return -1;
    }

    static void RGBtoHSL(int r, int g, int b, float[] hsl) {
        float h;
        float s;
        float rf = r / 255.0f;
        float gf = g / 255.0f;
        float bf = b / 255.0f;
        float max = Math.max(rf, Math.max(gf, bf));
        float min = Math.min(rf, Math.min(gf, bf));
        float deltaMaxMin = max - min;
        float l = (max + min) / 2.0f;
        if (max == min) {
            s = 0.0f;
            h = 0.0f;
        } else {
            if (max == rf) {
                h = ((gf - bf) / deltaMaxMin) % 6.0f;
            } else if (max == gf) {
                h = ((bf - rf) / deltaMaxMin) + 2.0f;
            } else {
                h = ((rf - gf) / deltaMaxMin) + 4.0f;
            }
            s = deltaMaxMin / (1.0f - Math.abs((2.0f * l) - 1.0f));
        }
        hsl[0] = (h * 60.0f) % 360.0f;
        hsl[1] = s;
        hsl[2] = l;
    }

    static int HSLtoRGB(float[] hsl) {
        float h = hsl[0];
        float s = hsl[1];
        float l = hsl[2];
        float c = (1.0f - Math.abs((2.0f * l) - 1.0f)) * s;
        float m = l - (0.5f * c);
        float x = c * (1.0f - Math.abs(((h / 60.0f) % 2.0f) - 1.0f));
        int hueSegment = ((int) h) / 60;
        int r = 0;
        int g = 0;
        int b = 0;
        switch (hueSegment) {
            case BuildConfig.DEBUG /* 0 */:
                r = Math.round(255.0f * (c + m));
                g = Math.round(255.0f * (x + m));
                b = Math.round(255.0f * m);
                break;
            case 1:
                r = Math.round(255.0f * (x + m));
                g = Math.round(255.0f * (c + m));
                b = Math.round(255.0f * m);
                break;
            case 2:
                r = Math.round(255.0f * m);
                g = Math.round(255.0f * (c + m));
                b = Math.round(255.0f * (x + m));
                break;
            case 3:
                r = Math.round(255.0f * m);
                g = Math.round(255.0f * (x + m));
                b = Math.round(255.0f * (c + m));
                break;
            case 4:
                r = Math.round(255.0f * (x + m));
                g = Math.round(255.0f * m);
                b = Math.round(255.0f * (c + m));
                break;
            case 5:
            case 6:
                r = Math.round(255.0f * (c + m));
                g = Math.round(255.0f * m);
                b = Math.round(255.0f * (x + m));
                break;
        }
        return Color.rgb(Math.max(0, Math.min(255, r)), Math.max(0, Math.min(255, g)), Math.max(0, Math.min(255, b)));
    }

    static int modifyAlpha(int color, int alpha) {
        return (color & 16777215) | (alpha << 24);
    }
}
