package com.google.zxing;

/* loaded from: core-3.2.0.jar:com/google/zxing/PlanarYUVLuminanceSource.class */
public final class PlanarYUVLuminanceSource extends LuminanceSource {
    private static final int THUMBNAIL_SCALE_FACTOR = 2;
    private final byte[] yuvData;
    private final int dataWidth;
    private final int dataHeight;
    private final int left;
    private final int top;

    public PlanarYUVLuminanceSource(byte[] yuvData, int dataWidth, int dataHeight, int left, int top, int width, int height, boolean reverseHorizontal) {
        super(width, height);
        if (left + width > dataWidth || top + height > dataHeight) {
            throw new IllegalArgumentException("Crop rectangle does not fit within image data.");
        }
        this.yuvData = yuvData;
        this.dataWidth = dataWidth;
        this.dataHeight = dataHeight;
        this.left = left;
        this.top = top;
        if (reverseHorizontal) {
            reverseHorizontal(width, height);
        }
    }

    @Override // com.google.zxing.LuminanceSource
    public byte[] getRow(int y, byte[] row) {
        if (y < 0 || y >= getHeight()) {
            throw new IllegalArgumentException("Requested row is outside the image: " + y);
        }
        int width = getWidth();
        if (row == null || row.length < width) {
            row = new byte[width];
        }
        int offset = ((y + this.top) * this.dataWidth) + this.left;
        System.arraycopy(this.yuvData, offset, row, 0, width);
        return row;
    }

    @Override // com.google.zxing.LuminanceSource
    public byte[] getMatrix() {
        int width = getWidth();
        int height = getHeight();
        if (width == this.dataWidth && height == this.dataHeight) {
            return this.yuvData;
        }
        int area = width * height;
        byte[] matrix = new byte[area];
        int inputOffset = (this.top * this.dataWidth) + this.left;
        if (width == this.dataWidth) {
            System.arraycopy(this.yuvData, inputOffset, matrix, 0, area);
            return matrix;
        }
        byte[] yuv = this.yuvData;
        for (int y = 0; y < height; y++) {
            int outputOffset = y * width;
            System.arraycopy(yuv, inputOffset, matrix, outputOffset, width);
            inputOffset += this.dataWidth;
        }
        return matrix;
    }

    @Override // com.google.zxing.LuminanceSource
    public boolean isCropSupported() {
        return true;
    }

    @Override // com.google.zxing.LuminanceSource
    public LuminanceSource crop(int left, int top, int width, int height) {
        return new PlanarYUVLuminanceSource(this.yuvData, this.dataWidth, this.dataHeight, this.left + left, this.top + top, width, height, false);
    }

    public int[] renderThumbnail() {
        int width = getWidth() / THUMBNAIL_SCALE_FACTOR;
        int height = getHeight() / THUMBNAIL_SCALE_FACTOR;
        int[] pixels = new int[width * height];
        byte[] yuv = this.yuvData;
        int inputOffset = (this.top * this.dataWidth) + this.left;
        for (int y = 0; y < height; y++) {
            int outputOffset = y * width;
            for (int x = 0; x < width; x++) {
                int grey = yuv[inputOffset + (x * THUMBNAIL_SCALE_FACTOR)] & 255;
                pixels[outputOffset + x] = (-16777216) | (grey * 65793);
            }
            inputOffset += this.dataWidth * THUMBNAIL_SCALE_FACTOR;
        }
        return pixels;
    }

    public int getThumbnailWidth() {
        return getWidth() / THUMBNAIL_SCALE_FACTOR;
    }

    public int getThumbnailHeight() {
        return getHeight() / THUMBNAIL_SCALE_FACTOR;
    }

    private void reverseHorizontal(int width, int height) {
        byte[] yuvData = this.yuvData;
        int y = 0;
        int i = this.top * this.dataWidth;
        int i2 = this.left;
        while (true) {
            int rowStart = i + i2;
            if (y < height) {
                int middle = rowStart + (width / THUMBNAIL_SCALE_FACTOR);
                int x1 = rowStart;
                int x2 = (rowStart + width) - 1;
                while (x1 < middle) {
                    byte temp = yuvData[x1];
                    yuvData[x1] = yuvData[x2];
                    yuvData[x2] = temp;
                    x1++;
                    x2--;
                }
                y++;
                i = rowStart;
                i2 = this.dataWidth;
            } else {
                return;
            }
        }
    }
}
