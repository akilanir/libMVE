package android.support.v7.graphics;

import android.support.v4.graphics.ColorUtils;
import android.support.v7.graphics.Palette;
import java.util.List;

/* loaded from: com.android.support.palette-v7.23.0.0.jar:android/support/v7/graphics/DefaultGenerator.class */
class DefaultGenerator extends Palette.Generator {
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
    private List<Palette.Swatch> mSwatches;
    private int mHighestPopulation;
    private Palette.Swatch mVibrantSwatch;
    private Palette.Swatch mMutedSwatch;
    private Palette.Swatch mDarkVibrantSwatch;
    private Palette.Swatch mDarkMutedSwatch;
    private Palette.Swatch mLightVibrantSwatch;
    private Palette.Swatch mLightMutedSwatch;

    DefaultGenerator() {
    }

    @Override // android.support.v7.graphics.Palette.Generator
    public void generate(List<Palette.Swatch> swatches) {
        this.mSwatches = swatches;
        this.mHighestPopulation = findMaxPopulation();
        generateVariationColors();
        generateEmptySwatches();
    }

    @Override // android.support.v7.graphics.Palette.Generator
    public Palette.Swatch getVibrantSwatch() {
        return this.mVibrantSwatch;
    }

    @Override // android.support.v7.graphics.Palette.Generator
    public Palette.Swatch getLightVibrantSwatch() {
        return this.mLightVibrantSwatch;
    }

    @Override // android.support.v7.graphics.Palette.Generator
    public Palette.Swatch getDarkVibrantSwatch() {
        return this.mDarkVibrantSwatch;
    }

    @Override // android.support.v7.graphics.Palette.Generator
    public Palette.Swatch getMutedSwatch() {
        return this.mMutedSwatch;
    }

    @Override // android.support.v7.graphics.Palette.Generator
    public Palette.Swatch getLightMutedSwatch() {
        return this.mLightMutedSwatch;
    }

    @Override // android.support.v7.graphics.Palette.Generator
    public Palette.Swatch getDarkMutedSwatch() {
        return this.mDarkMutedSwatch;
    }

    private void generateVariationColors() {
        this.mVibrantSwatch = findColorVariation(TARGET_NORMAL_LUMA, 0.3f, MAX_NORMAL_LUMA, 1.0f, MIN_VIBRANT_SATURATION, 1.0f);
        this.mLightVibrantSwatch = findColorVariation(TARGET_LIGHT_LUMA, MIN_LIGHT_LUMA, 1.0f, 1.0f, MIN_VIBRANT_SATURATION, 1.0f);
        this.mDarkVibrantSwatch = findColorVariation(TARGET_DARK_LUMA, 0.0f, MAX_DARK_LUMA, 1.0f, MIN_VIBRANT_SATURATION, 1.0f);
        this.mMutedSwatch = findColorVariation(TARGET_NORMAL_LUMA, 0.3f, MAX_NORMAL_LUMA, 0.3f, 0.0f, MAX_MUTED_SATURATION);
        this.mLightMutedSwatch = findColorVariation(TARGET_LIGHT_LUMA, MIN_LIGHT_LUMA, 1.0f, 0.3f, 0.0f, MAX_MUTED_SATURATION);
        this.mDarkMutedSwatch = findColorVariation(TARGET_DARK_LUMA, 0.0f, MAX_DARK_LUMA, 0.3f, 0.0f, MAX_MUTED_SATURATION);
    }

    private void generateEmptySwatches() {
        if (this.mVibrantSwatch == null && this.mDarkVibrantSwatch != null) {
            float[] newHsl = copyHslValues(this.mDarkVibrantSwatch);
            newHsl[2] = 0.5f;
            this.mVibrantSwatch = new Palette.Swatch(ColorUtils.HSLToColor(newHsl), 0);
        }
        if (this.mDarkVibrantSwatch == null && this.mVibrantSwatch != null) {
            float[] newHsl2 = copyHslValues(this.mVibrantSwatch);
            newHsl2[2] = 0.26f;
            this.mDarkVibrantSwatch = new Palette.Swatch(ColorUtils.HSLToColor(newHsl2), 0);
        }
    }

    private int findMaxPopulation() {
        int population = 0;
        for (Palette.Swatch swatch : this.mSwatches) {
            population = Math.max(population, swatch.getPopulation());
        }
        return population;
    }

    private Palette.Swatch findColorVariation(float targetLuma, float minLuma, float maxLuma, float targetSaturation, float minSaturation, float maxSaturation) {
        Palette.Swatch max = null;
        float maxValue = 0.0f;
        for (Palette.Swatch swatch : this.mSwatches) {
            float sat = swatch.getHsl()[1];
            float luma = swatch.getHsl()[2];
            if (sat >= minSaturation && sat <= maxSaturation && luma >= minLuma && luma <= maxLuma && !isAlreadySelected(swatch)) {
                float value = createComparisonValue(sat, targetSaturation, luma, targetLuma, swatch.getPopulation(), this.mHighestPopulation);
                if (max == null || value > maxValue) {
                    max = swatch;
                    maxValue = value;
                }
            }
        }
        return max;
    }

    private boolean isAlreadySelected(Palette.Swatch swatch) {
        return this.mVibrantSwatch == swatch || this.mDarkVibrantSwatch == swatch || this.mLightVibrantSwatch == swatch || this.mMutedSwatch == swatch || this.mDarkMutedSwatch == swatch || this.mLightMutedSwatch == swatch;
    }

    private static float createComparisonValue(float saturation, float targetSaturation, float luma, float targetLuma, int population, int maxPopulation) {
        return createComparisonValue(saturation, targetSaturation, WEIGHT_SATURATION, luma, targetLuma, WEIGHT_LUMA, population, maxPopulation, 1.0f);
    }

    private static float createComparisonValue(float saturation, float targetSaturation, float saturationWeight, float luma, float targetLuma, float lumaWeight, int population, int maxPopulation, float populationWeight) {
        return weightedMean(invertDiff(saturation, targetSaturation), saturationWeight, invertDiff(luma, targetLuma), lumaWeight, population / maxPopulation, populationWeight);
    }

    private static float[] copyHslValues(Palette.Swatch color) {
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
}
