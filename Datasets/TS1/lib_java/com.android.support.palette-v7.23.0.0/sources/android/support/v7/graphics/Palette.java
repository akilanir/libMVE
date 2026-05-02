package android.support.v7.graphics;

import android.graphics.Bitmap;
import android.graphics.Color;
import android.os.AsyncTask;
import android.support.annotation.ColorInt;
import android.support.annotation.Nullable;
import android.support.v4.graphics.ColorUtils;
import android.support.v4.os.AsyncTaskCompat;
import android.util.TimingLogger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/* loaded from: com.android.support.palette-v7.23.0.0.jar:android/support/v7/graphics/Palette.class */
public final class Palette {
    private static final int DEFAULT_RESIZE_BITMAP_MAX_DIMENSION = 192;
    private static final int DEFAULT_CALCULATE_NUMBER_COLORS = 16;
    private static final float MIN_CONTRAST_TITLE_TEXT = 3.0f;
    private static final float MIN_CONTRAST_BODY_TEXT = 4.5f;
    private static final String LOG_TAG = "Palette";
    private static final boolean LOG_TIMINGS = false;
    private final List<Swatch> mSwatches;
    private final Generator mGenerator;
    private static final Filter DEFAULT_FILTER = new Filter() { // from class: android.support.v7.graphics.Palette.1
        private static final float BLACK_MAX_LIGHTNESS = 0.05f;
        private static final float WHITE_MIN_LIGHTNESS = 0.95f;

        @Override // android.support.v7.graphics.Palette.Filter
        public boolean isAllowed(int rgb, float[] hsl) {
            return (isWhite(hsl) || isBlack(hsl) || isNearRedILine(hsl)) ? false : true;
        }

        private boolean isBlack(float[] hslColor) {
            return hslColor[2] <= BLACK_MAX_LIGHTNESS;
        }

        private boolean isWhite(float[] hslColor) {
            return hslColor[2] >= WHITE_MIN_LIGHTNESS;
        }

        private boolean isNearRedILine(float[] hslColor) {
            return hslColor[0] >= 10.0f && hslColor[0] <= 37.0f && hslColor[1] <= 0.82f;
        }
    };

    /* loaded from: com.android.support.palette-v7.23.0.0.jar:android/support/v7/graphics/Palette$Filter.class */
    public interface Filter {
        boolean isAllowed(int i, float[] fArr);
    }

    /* loaded from: com.android.support.palette-v7.23.0.0.jar:android/support/v7/graphics/Palette$PaletteAsyncListener.class */
    public interface PaletteAsyncListener {
        void onGenerated(Palette palette);
    }

    public static Builder from(Bitmap bitmap) {
        return new Builder(bitmap);
    }

    public static Palette from(List<Swatch> swatches) {
        return new Builder(swatches).generate();
    }

    @Deprecated
    public static Palette generate(Bitmap bitmap) {
        return from(bitmap).generate();
    }

    @Deprecated
    public static Palette generate(Bitmap bitmap, int numColors) {
        return from(bitmap).maximumColorCount(numColors).generate();
    }

    @Deprecated
    public static AsyncTask<Bitmap, Void, Palette> generateAsync(Bitmap bitmap, PaletteAsyncListener listener) {
        return from(bitmap).generate(listener);
    }

    @Deprecated
    public static AsyncTask<Bitmap, Void, Palette> generateAsync(Bitmap bitmap, int numColors, PaletteAsyncListener listener) {
        return from(bitmap).maximumColorCount(numColors).generate(listener);
    }

    private Palette(List<Swatch> swatches, Generator generator) {
        this.mSwatches = swatches;
        this.mGenerator = generator;
    }

    public List<Swatch> getSwatches() {
        return Collections.unmodifiableList(this.mSwatches);
    }

    @Nullable
    public Swatch getVibrantSwatch() {
        return this.mGenerator.getVibrantSwatch();
    }

    @Nullable
    public Swatch getLightVibrantSwatch() {
        return this.mGenerator.getLightVibrantSwatch();
    }

    @Nullable
    public Swatch getDarkVibrantSwatch() {
        return this.mGenerator.getDarkVibrantSwatch();
    }

    @Nullable
    public Swatch getMutedSwatch() {
        return this.mGenerator.getMutedSwatch();
    }

    @Nullable
    public Swatch getLightMutedSwatch() {
        return this.mGenerator.getLightMutedSwatch();
    }

    @Nullable
    public Swatch getDarkMutedSwatch() {
        return this.mGenerator.getDarkMutedSwatch();
    }

    @ColorInt
    public int getVibrantColor(@ColorInt int defaultColor) {
        Swatch swatch = getVibrantSwatch();
        return swatch != null ? swatch.getRgb() : defaultColor;
    }

    @ColorInt
    public int getLightVibrantColor(@ColorInt int defaultColor) {
        Swatch swatch = getLightVibrantSwatch();
        return swatch != null ? swatch.getRgb() : defaultColor;
    }

    @ColorInt
    public int getDarkVibrantColor(@ColorInt int defaultColor) {
        Swatch swatch = getDarkVibrantSwatch();
        return swatch != null ? swatch.getRgb() : defaultColor;
    }

    @ColorInt
    public int getMutedColor(@ColorInt int defaultColor) {
        Swatch swatch = getMutedSwatch();
        return swatch != null ? swatch.getRgb() : defaultColor;
    }

    @ColorInt
    public int getLightMutedColor(@ColorInt int defaultColor) {
        Swatch swatch = getLightMutedSwatch();
        return swatch != null ? swatch.getRgb() : defaultColor;
    }

    @ColorInt
    public int getDarkMutedColor(@ColorInt int defaultColor) {
        Swatch swatch = getDarkMutedSwatch();
        return swatch != null ? swatch.getRgb() : defaultColor;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Bitmap scaleBitmapDown(Bitmap bitmap, int targetMaxDimension) {
        int maxDimension = Math.max(bitmap.getWidth(), bitmap.getHeight());
        if (maxDimension <= targetMaxDimension) {
            return bitmap;
        }
        float scaleRatio = targetMaxDimension / maxDimension;
        return Bitmap.createScaledBitmap(bitmap, Math.round(bitmap.getWidth() * scaleRatio), Math.round(bitmap.getHeight() * scaleRatio), false);
    }

    /* loaded from: com.android.support.palette-v7.23.0.0.jar:android/support/v7/graphics/Palette$Swatch.class */
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

        public Swatch(@ColorInt int color, int population) {
            this.mRed = Color.red(color);
            this.mGreen = Color.green(color);
            this.mBlue = Color.blue(color);
            this.mRgb = color;
            this.mPopulation = population;
        }

        Swatch(int red, int green, int blue, int population) {
            this.mRed = red;
            this.mGreen = green;
            this.mBlue = blue;
            this.mRgb = Color.rgb(red, green, blue);
            this.mPopulation = population;
        }

        @ColorInt
        public int getRgb() {
            return this.mRgb;
        }

        public float[] getHsl() {
            if (this.mHsl == null) {
                this.mHsl = new float[3];
                ColorUtils.RGBToHSL(this.mRed, this.mGreen, this.mBlue, this.mHsl);
            }
            return this.mHsl;
        }

        public int getPopulation() {
            return this.mPopulation;
        }

        @ColorInt
        public int getTitleTextColor() {
            ensureTextColorsGenerated();
            return this.mTitleTextColor;
        }

        @ColorInt
        public int getBodyTextColor() {
            ensureTextColorsGenerated();
            return this.mBodyTextColor;
        }

        private void ensureTextColorsGenerated() {
            if (!this.mGeneratedTextColors) {
                int lightBodyAlpha = ColorUtils.calculateMinimumAlpha(-1, this.mRgb, Palette.MIN_CONTRAST_BODY_TEXT);
                int lightTitleAlpha = ColorUtils.calculateMinimumAlpha(-1, this.mRgb, Palette.MIN_CONTRAST_TITLE_TEXT);
                if (lightBodyAlpha != -1 && lightTitleAlpha != -1) {
                    this.mBodyTextColor = ColorUtils.setAlphaComponent(-1, lightBodyAlpha);
                    this.mTitleTextColor = ColorUtils.setAlphaComponent(-1, lightTitleAlpha);
                    this.mGeneratedTextColors = true;
                    return;
                }
                int darkBodyAlpha = ColorUtils.calculateMinimumAlpha(-16777216, this.mRgb, Palette.MIN_CONTRAST_BODY_TEXT);
                int darkTitleAlpha = ColorUtils.calculateMinimumAlpha(-16777216, this.mRgb, Palette.MIN_CONTRAST_TITLE_TEXT);
                if (darkBodyAlpha != -1 && darkBodyAlpha != -1) {
                    this.mBodyTextColor = ColorUtils.setAlphaComponent(-16777216, darkBodyAlpha);
                    this.mTitleTextColor = ColorUtils.setAlphaComponent(-16777216, darkTitleAlpha);
                    this.mGeneratedTextColors = true;
                } else {
                    this.mBodyTextColor = lightBodyAlpha != -1 ? ColorUtils.setAlphaComponent(-1, lightBodyAlpha) : ColorUtils.setAlphaComponent(-16777216, darkBodyAlpha);
                    this.mTitleTextColor = lightTitleAlpha != -1 ? ColorUtils.setAlphaComponent(-1, lightTitleAlpha) : ColorUtils.setAlphaComponent(-16777216, darkTitleAlpha);
                    this.mGeneratedTextColors = true;
                }
            }
        }

        public String toString() {
            return getClass().getSimpleName() + " [RGB: #" + Integer.toHexString(getRgb()) + "] [HSL: " + Arrays.toString(getHsl()) + "] [Population: " + this.mPopulation + "] [Title Text: #" + Integer.toHexString(getTitleTextColor()) + "] [Body Text: #" + Integer.toHexString(getBodyTextColor()) + ']';
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

    /* loaded from: com.android.support.palette-v7.23.0.0.jar:android/support/v7/graphics/Palette$Builder.class */
    public static final class Builder {
        private List<Swatch> mSwatches;
        private Bitmap mBitmap;
        private int mMaxColors;
        private int mResizeMaxDimension;
        private final List<Filter> mFilters;
        private Generator mGenerator;

        public Builder(Bitmap bitmap) {
            this();
            if (bitmap == null || bitmap.isRecycled()) {
                throw new IllegalArgumentException("Bitmap is not valid");
            }
            this.mBitmap = bitmap;
        }

        public Builder(List<Swatch> swatches) {
            this();
            if (swatches == null || swatches.isEmpty()) {
                throw new IllegalArgumentException("List of Swatches is not valid");
            }
            this.mSwatches = swatches;
        }

        private Builder() {
            this.mMaxColors = Palette.DEFAULT_CALCULATE_NUMBER_COLORS;
            this.mResizeMaxDimension = Palette.DEFAULT_RESIZE_BITMAP_MAX_DIMENSION;
            this.mFilters = new ArrayList();
            this.mFilters.add(Palette.DEFAULT_FILTER);
        }

        Builder generator(Generator generator) {
            this.mGenerator = generator;
            return this;
        }

        public Builder maximumColorCount(int colors) {
            this.mMaxColors = colors;
            return this;
        }

        public Builder resizeBitmapSize(int maxDimension) {
            this.mResizeMaxDimension = maxDimension;
            return this;
        }

        public Builder clearFilters() {
            this.mFilters.clear();
            return this;
        }

        public Builder addFilter(Filter filter) {
            if (filter != null) {
                this.mFilters.add(filter);
            }
            return this;
        }

        public Palette generate() {
            List<Swatch> swatches;
            TimingLogger logger = null;
            if (this.mBitmap != null) {
                if (this.mResizeMaxDimension > 0) {
                    Bitmap scaledBitmap = Palette.scaleBitmapDown(this.mBitmap, this.mResizeMaxDimension);
                    if (0 != 0) {
                        logger.addSplit("Processed Bitmap");
                    }
                    int width = scaledBitmap.getWidth();
                    int height = scaledBitmap.getHeight();
                    int[] pixels = new int[width * height];
                    scaledBitmap.getPixels(pixels, 0, width, 0, 0, width, height);
                    ColorCutQuantizer quantizer = new ColorCutQuantizer(pixels, this.mMaxColors, this.mFilters.isEmpty() ? null : (Filter[]) this.mFilters.toArray(new Filter[this.mFilters.size()]));
                    if (scaledBitmap != this.mBitmap) {
                        scaledBitmap.recycle();
                    }
                    swatches = quantizer.getQuantizedColors();
                    if (0 != 0) {
                        logger.addSplit("Color quantization completed");
                    }
                } else {
                    throw new IllegalArgumentException("Minimum dimension size for resizing should should be >= 1");
                }
            } else {
                swatches = this.mSwatches;
            }
            if (this.mGenerator == null) {
                this.mGenerator = new DefaultGenerator();
            }
            this.mGenerator.generate(swatches);
            if (0 != 0) {
                logger.addSplit("Generator.generate() completed");
            }
            Palette p = new Palette(swatches, this.mGenerator);
            if (0 != 0) {
                logger.addSplit("Created Palette");
                logger.dumpToLog();
            }
            return p;
        }

        public AsyncTask<Bitmap, Void, Palette> generate(final PaletteAsyncListener listener) {
            if (listener == null) {
                throw new IllegalArgumentException("listener can not be null");
            }
            return AsyncTaskCompat.executeParallel(new AsyncTask<Bitmap, Void, Palette>() { // from class: android.support.v7.graphics.Palette.Builder.1
                /* JADX INFO: Access modifiers changed from: protected */
                @Override // android.os.AsyncTask
                public Palette doInBackground(Bitmap... params) {
                    return Builder.this.generate();
                }

                /* JADX INFO: Access modifiers changed from: protected */
                @Override // android.os.AsyncTask
                public void onPostExecute(Palette colorExtractor) {
                    listener.onGenerated(colorExtractor);
                }
            }, new Bitmap[]{this.mBitmap});
        }
    }

    /* loaded from: com.android.support.palette-v7.23.0.0.jar:android/support/v7/graphics/Palette$Generator.class */
    static abstract class Generator {
        public abstract void generate(List<Swatch> list);

        Generator() {
        }

        public Swatch getVibrantSwatch() {
            return null;
        }

        public Swatch getLightVibrantSwatch() {
            return null;
        }

        public Swatch getDarkVibrantSwatch() {
            return null;
        }

        public Swatch getMutedSwatch() {
            return null;
        }

        public Swatch getLightMutedSwatch() {
            return null;
        }

        public Swatch getDarkMutedSwatch() {
            return null;
        }
    }
}
