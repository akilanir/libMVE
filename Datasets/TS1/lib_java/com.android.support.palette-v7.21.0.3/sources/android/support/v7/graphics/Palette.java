package android.support.v7.graphics;

import android.graphics.Bitmap;
import android.graphics.Color;
import android.os.AsyncTask;
import android.support.v4.os.AsyncTaskCompat;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/* loaded from: com.android.support.palette-v7.21.0.3.jar:android/support/v7/graphics/Palette.class */
public final class Palette {
    private static final int CALCULATE_BITMAP_MIN_DIMENSION = 100;
    private static final int DEFAULT_CALCULATE_NUMBER_COLORS = 16;
    private static final float TARGET_DARK_LUMA = 0.26f;
    private static final float MAX_DARK_LUMA = 0.45f;
    private static final float MIN_LIGHT_LUMA = 0.55f;
    private static final float TARGET_LIGHT_LUMA = 0.74f;
    private static final float MIN_NORMAL_LUMA = 0.3f;
    private static final float TARGET_NORMAL_LUMA = 0.5f;
    private static final float MAX_NORMAL_LUMA = 0.7f;
    private static final float TARGET_MUTED_SATURATION = 0.3f;
    private static final float MAX_MUTED_SATURATION = 0.4f;
    private static final float TARGET_VIBRANT_SATURATION = 1.0f;
    private static final float MIN_VIBRANT_SATURATION = 0.35f;
    private static final float WEIGHT_SATURATION = 3.0f;
    private static final float WEIGHT_LUMA = 6.0f;
    private static final float WEIGHT_POPULATION = 1.0f;
    private static final float MIN_CONTRAST_TITLE_TEXT = 3.0f;
    private static final float MIN_CONTRAST_BODY_TEXT = 4.5f;
    private final List<Swatch> mSwatches;
    private final int mHighestPopulation = findMaxPopulation();
    private Swatch mVibrantSwatch = findColor(TARGET_NORMAL_LUMA, 0.3f, MAX_NORMAL_LUMA, 1.0f, MIN_VIBRANT_SATURATION, 1.0f);
    private Swatch mLightVibrantSwatch = findColor(TARGET_LIGHT_LUMA, MIN_LIGHT_LUMA, 1.0f, 1.0f, MIN_VIBRANT_SATURATION, 1.0f);
    private Swatch mDarkVibrantSwatch = findColor(TARGET_DARK_LUMA, 0.0f, MAX_DARK_LUMA, 1.0f, MIN_VIBRANT_SATURATION, 1.0f);
    private Swatch mMutedSwatch = findColor(TARGET_NORMAL_LUMA, 0.3f, MAX_NORMAL_LUMA, 0.3f, 0.0f, MAX_MUTED_SATURATION);
    private Swatch mLightMutedColor = findColor(TARGET_LIGHT_LUMA, MIN_LIGHT_LUMA, 1.0f, 0.3f, 0.0f, MAX_MUTED_SATURATION);
    private Swatch mDarkMutedSwatch = findColor(TARGET_DARK_LUMA, 0.0f, MAX_DARK_LUMA, 0.3f, 0.0f, MAX_MUTED_SATURATION);

    /* loaded from: com.android.support.palette-v7.21.0.3.jar:android/support/v7/graphics/Palette$PaletteAsyncListener.class */
    public interface PaletteAsyncListener {
        void onGenerated(Palette palette);
    }

    public static Palette generate(Bitmap bitmap) {
        return generate(bitmap, DEFAULT_CALCULATE_NUMBER_COLORS);
    }

    public static Palette generate(Bitmap bitmap, int numColors) {
        checkBitmapParam(bitmap);
        checkNumberColorsParam(numColors);
        Bitmap scaledBitmap = scaleBitmapDown(bitmap);
        ColorCutQuantizer quantizer = ColorCutQuantizer.fromBitmap(scaledBitmap, numColors);
        if (scaledBitmap != bitmap) {
            scaledBitmap.recycle();
        }
        return new Palette(quantizer.getQuantizedColors());
    }

    public static AsyncTask<Bitmap, Void, Palette> generateAsync(Bitmap bitmap, PaletteAsyncListener listener) {
        return generateAsync(bitmap, DEFAULT_CALCULATE_NUMBER_COLORS, listener);
    }

    public static AsyncTask<Bitmap, Void, Palette> generateAsync(Bitmap bitmap, final int numColors, final PaletteAsyncListener listener) {
        checkBitmapParam(bitmap);
        checkNumberColorsParam(numColors);
        checkAsyncListenerParam(listener);
        return AsyncTaskCompat.executeParallel(new AsyncTask<Bitmap, Void, Palette>() { // from class: android.support.v7.graphics.Palette.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Palette doInBackground(Bitmap... params) {
                return Palette.generate(params[0], numColors);
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public void onPostExecute(Palette colorExtractor) {
                listener.onGenerated(colorExtractor);
            }
        }, new Bitmap[]{bitmap});
    }

    private Palette(List<Swatch> swatches) {
        this.mSwatches = swatches;
        generateEmptySwatches();
    }

    public List<Swatch> getSwatches() {
        return Collections.unmodifiableList(this.mSwatches);
    }

    public Swatch getVibrantSwatch() {
        return this.mVibrantSwatch;
    }

    public Swatch getLightVibrantSwatch() {
        return this.mLightVibrantSwatch;
    }

    public Swatch getDarkVibrantSwatch() {
        return this.mDarkVibrantSwatch;
    }

    public Swatch getMutedSwatch() {
        return this.mMutedSwatch;
    }

    public Swatch getLightMutedSwatch() {
        return this.mLightMutedColor;
    }

    public Swatch getDarkMutedSwatch() {
        return this.mDarkMutedSwatch;
    }

    public int getVibrantColor(int defaultColor) {
        return this.mVibrantSwatch != null ? this.mVibrantSwatch.getRgb() : defaultColor;
    }

    public int getLightVibrantColor(int defaultColor) {
        return this.mLightVibrantSwatch != null ? this.mLightVibrantSwatch.getRgb() : defaultColor;
    }

    public int getDarkVibrantColor(int defaultColor) {
        return this.mDarkVibrantSwatch != null ? this.mDarkVibrantSwatch.getRgb() : defaultColor;
    }

    public int getMutedColor(int defaultColor) {
        return this.mMutedSwatch != null ? this.mMutedSwatch.getRgb() : defaultColor;
    }

    public int getLightMutedColor(int defaultColor) {
        return this.mLightMutedColor != null ? this.mLightMutedColor.getRgb() : defaultColor;
    }

    public int getDarkMutedColor(int defaultColor) {
        return this.mDarkMutedSwatch != null ? this.mDarkMutedSwatch.getRgb() : defaultColor;
    }

    private boolean isAlreadySelected(Swatch swatch) {
        return this.mVibrantSwatch == swatch || this.mDarkVibrantSwatch == swatch || this.mLightVibrantSwatch == swatch || this.mMutedSwatch == swatch || this.mDarkMutedSwatch == swatch || this.mLightMutedColor == swatch;
    }

    private Swatch findColor(float targetLuma, float minLuma, float maxLuma, float targetSaturation, float minSaturation, float maxSaturation) {
        Swatch max = null;
        float maxValue = 0.0f;
        for (Swatch swatch : this.mSwatches) {
            float sat = swatch.getHsl()[1];
            float luma = swatch.getHsl()[2];
            if (sat >= minSaturation && sat <= maxSaturation && luma >= minLuma && luma <= maxLuma && !isAlreadySelected(swatch)) {
                float thisValue = createComparisonValue(sat, targetSaturation, luma, targetLuma, swatch.getPopulation(), this.mHighestPopulation);
                if (max == null || thisValue > maxValue) {
                    max = swatch;
                    maxValue = thisValue;
                }
            }
        }
        return max;
    }

    private void generateEmptySwatches() {
        if (this.mVibrantSwatch == null && this.mDarkVibrantSwatch != null) {
            float[] newHsl = copyHslValues(this.mDarkVibrantSwatch);
            newHsl[2] = 0.5f;
            this.mVibrantSwatch = new Swatch(ColorUtils.HSLtoRGB(newHsl), 0);
        }
        if (this.mDarkVibrantSwatch == null && this.mVibrantSwatch != null) {
            float[] newHsl2 = copyHslValues(this.mVibrantSwatch);
            newHsl2[2] = 0.26f;
            this.mDarkVibrantSwatch = new Swatch(ColorUtils.HSLtoRGB(newHsl2), 0);
        }
    }

    private int findMaxPopulation() {
        int population = 0;
        for (Swatch swatch : this.mSwatches) {
            population = Math.max(population, swatch.getPopulation());
        }
        return population;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Palette palette = (Palette) o;
        if (this.mSwatches != null) {
            if (!this.mSwatches.equals(palette.mSwatches)) {
                return false;
            }
        } else if (palette.mSwatches != null) {
            return false;
        }
        if (this.mDarkMutedSwatch != null) {
            if (!this.mDarkMutedSwatch.equals(palette.mDarkMutedSwatch)) {
                return false;
            }
        } else if (palette.mDarkMutedSwatch != null) {
            return false;
        }
        if (this.mDarkVibrantSwatch != null) {
            if (!this.mDarkVibrantSwatch.equals(palette.mDarkVibrantSwatch)) {
                return false;
            }
        } else if (palette.mDarkVibrantSwatch != null) {
            return false;
        }
        if (this.mLightMutedColor != null) {
            if (!this.mLightMutedColor.equals(palette.mLightMutedColor)) {
                return false;
            }
        } else if (palette.mLightMutedColor != null) {
            return false;
        }
        if (this.mLightVibrantSwatch != null) {
            if (!this.mLightVibrantSwatch.equals(palette.mLightVibrantSwatch)) {
                return false;
            }
        } else if (palette.mLightVibrantSwatch != null) {
            return false;
        }
        if (this.mMutedSwatch != null) {
            if (!this.mMutedSwatch.equals(palette.mMutedSwatch)) {
                return false;
            }
        } else if (palette.mMutedSwatch != null) {
            return false;
        }
        if (this.mVibrantSwatch != null) {
            if (!this.mVibrantSwatch.equals(palette.mVibrantSwatch)) {
                return false;
            }
            return true;
        }
        if (palette.mVibrantSwatch != null) {
            return false;
        }
        return true;
    }

    public int hashCode() {
        int result = this.mSwatches != null ? this.mSwatches.hashCode() : 0;
        return (31 * ((31 * ((31 * ((31 * ((31 * ((31 * result) + (this.mVibrantSwatch != null ? this.mVibrantSwatch.hashCode() : 0))) + (this.mMutedSwatch != null ? this.mMutedSwatch.hashCode() : 0))) + (this.mDarkVibrantSwatch != null ? this.mDarkVibrantSwatch.hashCode() : 0))) + (this.mDarkMutedSwatch != null ? this.mDarkMutedSwatch.hashCode() : 0))) + (this.mLightVibrantSwatch != null ? this.mLightVibrantSwatch.hashCode() : 0))) + (this.mLightMutedColor != null ? this.mLightMutedColor.hashCode() : 0);
    }

    private static Bitmap scaleBitmapDown(Bitmap bitmap) {
        int minDimension = Math.min(bitmap.getWidth(), bitmap.getHeight());
        if (minDimension <= CALCULATE_BITMAP_MIN_DIMENSION) {
            return bitmap;
        }
        float scaleRatio = 100.0f / minDimension;
        return Bitmap.createScaledBitmap(bitmap, Math.round(bitmap.getWidth() * scaleRatio), Math.round(bitmap.getHeight() * scaleRatio), false);
    }

    private static float createComparisonValue(float saturation, float targetSaturation, float luma, float targetLuma, int population, int highestPopulation) {
        return weightedMean(invertDiff(saturation, targetSaturation), 3.0f, invertDiff(luma, targetLuma), WEIGHT_LUMA, population / highestPopulation, 1.0f);
    }

    private static float[] copyHslValues(Swatch color) {
        float[] newHsl = new float[3];
        System.arraycopy(color.getHsl(), 0, newHsl, 0, 3);
        return newHsl;
    }

    private static float invertDiff(float value, float targetValue) {
        return 1.0f - Math.abs(value - targetValue);
    }

    private static float weightedMean(float... values) {
        float sum = 0.0f;
        float sumWeight = 0.0f;
        for (int i = 0; i < values.length; i += 2) {
            float value = values[i];
            float weight = values[i + 1];
            sum += value * weight;
            sumWeight += weight;
        }
        return sum / sumWeight;
    }

    private static void checkBitmapParam(Bitmap bitmap) {
        if (bitmap == null) {
            throw new IllegalArgumentException("bitmap can not be null");
        }
        if (bitmap.isRecycled()) {
            throw new IllegalArgumentException("bitmap can not be recycled");
        }
    }

    private static void checkNumberColorsParam(int numColors) {
        if (numColors < 1) {
            throw new IllegalArgumentException("numColors must be 1 of greater");
        }
    }

    private static void checkAsyncListenerParam(PaletteAsyncListener listener) {
        if (listener == null) {
            throw new IllegalArgumentException("listener can not be null");
        }
    }

    /* loaded from: com.android.support.palette-v7.21.0.3.jar:android/support/v7/graphics/Palette$Swatch.class */
    public static final class Swatch {
        private final int mRed;
        private final int mGreen;
        private final int mBlue;
        private final int mRgb;
        private final int mPopulation;
        private boolean mGeneratedTextColors;
        private int mTitleTextColor;
        private int mBodyTextColor;
        private float[] mHsl;

        Swatch(int rgbColor, int population) {
            this.mRed = Color.red(rgbColor);
            this.mGreen = Color.green(rgbColor);
            this.mBlue = Color.blue(rgbColor);
            this.mRgb = rgbColor;
            this.mPopulation = population;
        }

        Swatch(int red, int green, int blue, int population) {
            this.mRed = red;
            this.mGreen = green;
            this.mBlue = blue;
            this.mRgb = Color.rgb(red, green, blue);
            this.mPopulation = population;
        }

        public int getRgb() {
            return this.mRgb;
        }

        public float[] getHsl() {
            if (this.mHsl == null) {
                this.mHsl = new float[3];
                ColorUtils.RGBtoHSL(this.mRed, this.mGreen, this.mBlue, this.mHsl);
            }
            return this.mHsl;
        }

        public int getPopulation() {
            return this.mPopulation;
        }

        public int getTitleTextColor() {
            ensureTextColorsGenerated();
            return this.mTitleTextColor;
        }

        public int getBodyTextColor() {
            ensureTextColorsGenerated();
            return this.mBodyTextColor;
        }

        private void ensureTextColorsGenerated() {
            if (!this.mGeneratedTextColors) {
                this.mTitleTextColor = ColorUtils.getTextColorForBackground(this.mRgb, 3.0f);
                this.mBodyTextColor = ColorUtils.getTextColorForBackground(this.mRgb, Palette.MIN_CONTRAST_BODY_TEXT);
                this.mGeneratedTextColors = true;
            }
        }

        public String toString() {
            return getClass().getSimpleName() + " [RGB: #" + Integer.toHexString(getRgb()) + "] [HSL: " + Arrays.toString(getHsl()) + "] [Population: " + this.mPopulation + "] [Title Text: #" + Integer.toHexString(this.mTitleTextColor) + "] [Body Text: #" + Integer.toHexString(this.mBodyTextColor) + ']';
        }

        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (o == null || getClass() != o.getClass()) {
                return false;
            }
            Swatch swatch = (Swatch) o;
            return this.mPopulation == swatch.mPopulation && this.mRgb == swatch.mRgb;
        }

        public int hashCode() {
            return (31 * this.mRgb) + this.mPopulation;
        }
    }
}
