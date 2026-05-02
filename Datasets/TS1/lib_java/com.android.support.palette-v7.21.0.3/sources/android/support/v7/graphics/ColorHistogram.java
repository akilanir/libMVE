package android.support.v7.graphics;

import java.util.Arrays;

/* loaded from: com.android.support.palette-v7.21.0.3.jar:android/support/v7/graphics/ColorHistogram.class */
final class ColorHistogram {
    private final int[] mColors;
    private final int[] mColorCounts;
    private final int mNumberColors;

    ColorHistogram(int[] pixels) {
        Arrays.sort(pixels);
        this.mNumberColors = countDistinctColors(pixels);
        this.mColors = new int[this.mNumberColors];
        this.mColorCounts = new int[this.mNumberColors];
        countFrequencies(pixels);
    }

    int getNumberOfColors() {
        return this.mNumberColors;
    }

    int[] getColors() {
        return this.mColors;
    }

    int[] getColorCounts() {
        return this.mColorCounts;
    }

    private static int countDistinctColors(int[] pixels) {
        if (pixels.length < 2) {
            return pixels.length;
        }
        int colorCount = 1;
        int currentColor = pixels[0];
        for (int i = 1; i < pixels.length; i++) {
            if (pixels[i] != currentColor) {
                currentColor = pixels[i];
                colorCount++;
            }
        }
        return colorCount;
    }

    private void countFrequencies(int[] pixels) {
        if (pixels.length == 0) {
            return;
        }
        int currentColorIndex = 0;
        int currentColor = pixels[0];
        this.mColors[0] = currentColor;
        this.mColorCounts[0] = 1;
        if (pixels.length == 1) {
            return;
        }
        for (int i = 1; i < pixels.length; i++) {
            if (pixels[i] == currentColor) {
                int[] iArr = this.mColorCounts;
                int i2 = currentColorIndex;
                iArr[i2] = iArr[i2] + 1;
            } else {
                currentColor = pixels[i];
                currentColorIndex++;
                this.mColors[currentColorIndex] = currentColor;
                this.mColorCounts[currentColorIndex] = 1;
            }
        }
    }
}
