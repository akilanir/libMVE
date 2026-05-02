package org.dmfs.android.colorpicker.palettes;

import android.graphics.Color;

/* loaded from: com.github.dmfs.color-picker.c3b3b52033dc0b33bd831e731ec6f74fb1e8a69a.jar:org/dmfs/android/colorpicker/palettes/ColorFactory.class */
public interface ColorFactory {
    public static final ColorFactory GREY = new ColorLigthnessFactory(0.0f, 0.0f);
    public static final ColorFactory RED = new ColorShadeFactory(0.0f);
    public static final ColorFactory ORANGE = new ColorShadeFactory(37.0f);
    public static final ColorFactory YELLOW = new ColorShadeFactory(60.0f);
    public static final ColorFactory GREEN = new ColorShadeFactory(120.0f);
    public static final ColorFactory CYAN = new ColorShadeFactory(180.0f);
    public static final ColorFactory BLUE = new ColorShadeFactory(240.0f);
    public static final ColorFactory PURPLE = new ColorShadeFactory(280.0f);
    public static final ColorFactory PINK = new ColorShadeFactory(320.0f);
    public static final ColorFactory RAINBOW = new RainbowColorFactory(1.0f, 1.0f);
    public static final ColorFactory PASTEL = new RainbowColorFactory(0.5f, 1.0f);

    int getColor(int i, int i2);

    /* loaded from: com.github.dmfs.color-picker.c3b3b52033dc0b33bd831e731ec6f74fb1e8a69a.jar:org/dmfs/android/colorpicker/palettes/ColorFactory$ColorLigthnessFactory.class */
    public static class ColorLigthnessFactory implements ColorFactory {
        private final float[] mHSL = {0.0f, 0.0f, 0.0f};

        public ColorLigthnessFactory(float hue, float saturation) {
            this.mHSL[0] = hue;
            this.mHSL[1] = saturation;
        }

        @Override // org.dmfs.android.colorpicker.palettes.ColorFactory
        public int getColor(int index, int count) {
            if (count <= 1) {
                return -1;
            }
            float[] hsl = this.mHSL;
            hsl[2] = index / (count - 1);
            return Color.HSVToColor(255, hsl);
        }
    }

    /* loaded from: com.github.dmfs.color-picker.c3b3b52033dc0b33bd831e731ec6f74fb1e8a69a.jar:org/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory.class */
    public static class ColorShadeFactory implements ColorFactory {
        private final float[] mHSL = {0.0f, 0.0f, 0.0f};

        public ColorShadeFactory(float hue) {
            this.mHSL[0] = hue;
        }

        @Override // org.dmfs.android.colorpicker.palettes.ColorFactory
        public int getColor(int index, int count) {
            int index2 = index + 1;
            int count2 = count + 1;
            float[] hsl = this.mHSL;
            if (index2 <= count2 / 2) {
                hsl[1] = 1.0f;
                hsl[2] = (index2 * 2.0f) / count2;
            } else {
                hsl[1] = 2.0f - ((index2 * 2.0f) / count2);
                hsl[2] = 1.0f;
            }
            return Color.HSVToColor(255, hsl);
        }
    }

    /* loaded from: com.github.dmfs.color-picker.c3b3b52033dc0b33bd831e731ec6f74fb1e8a69a.jar:org/dmfs/android/colorpicker/palettes/ColorFactory$RainbowColorFactory.class */
    public static class RainbowColorFactory implements ColorFactory {
        private final float[] mHSL = {0.0f, 0.0f, 0.0f};

        public RainbowColorFactory(float saturation, float lightness) {
            this.mHSL[1] = saturation;
            this.mHSL[2] = lightness;
        }

        @Override // org.dmfs.android.colorpicker.palettes.ColorFactory
        public int getColor(int index, int count) {
            float[] hsl = this.mHSL;
            hsl[0] = (index * 360.0f) / (count + 1);
            return Color.HSVToColor(255, hsl);
        }
    }

    /* loaded from: com.github.dmfs.color-picker.c3b3b52033dc0b33bd831e731ec6f74fb1e8a69a.jar:org/dmfs/android/colorpicker/palettes/ColorFactory$CombinedColorFactory.class */
    public static class CombinedColorFactory implements ColorFactory {
        private final ColorFactory[] mFactories;

        public CombinedColorFactory(ColorFactory... factories) {
            this.mFactories = factories;
        }

        @Override // org.dmfs.android.colorpicker.palettes.ColorFactory
        public int getColor(int index, int count) {
            int factoryCount = this.mFactories.length;
            return this.mFactories[(index * factoryCount) / count].getColor(index % (count / factoryCount), count / factoryCount);
        }
    }
}
