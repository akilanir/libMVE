package com.bumptech.glide.load.engine.prefill;

import android.graphics.Bitmap;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/prefill/PreFillType.class */
public final class PreFillType {
    static final Bitmap.Config DEFAULT_CONFIG = Bitmap.Config.RGB_565;
    private final int width;
    private final int height;
    private final Bitmap.Config config;
    private final int weight;

    PreFillType(int width, int height, Bitmap.Config config, int weight) {
        if (config == null) {
            throw new NullPointerException("Config must not be null");
        }
        this.width = width;
        this.height = height;
        this.config = config;
        this.weight = weight;
    }

    int getWidth() {
        return this.width;
    }

    int getHeight() {
        return this.height;
    }

    Bitmap.Config getConfig() {
        return this.config;
    }

    int getWeight() {
        return this.weight;
    }

    public boolean equals(Object o) {
        if (o instanceof PreFillType) {
            PreFillType other = (PreFillType) o;
            return this.height == other.height && this.width == other.width && this.weight == other.weight && this.config == other.config;
        }
        return false;
    }

    public int hashCode() {
        int result = this.width;
        return (31 * ((31 * ((31 * result) + this.height)) + this.config.hashCode())) + this.weight;
    }

    public String toString() {
        return "PreFillSize{width=" + this.width + ", height=" + this.height + ", config=" + this.config + ", weight=" + this.weight + '}';
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/prefill/PreFillType$Builder.class */
    public static class Builder {
        private final int width;
        private final int height;
        private Bitmap.Config config;
        private int weight;

        public Builder(int size) {
            this(size, size);
        }

        public Builder(int width, int height) {
            this.weight = 1;
            if (width <= 0) {
                throw new IllegalArgumentException("Width must be > 0");
            }
            if (height <= 0) {
                throw new IllegalArgumentException("Height must be > 0");
            }
            this.width = width;
            this.height = height;
        }

        public Builder setConfig(Bitmap.Config config) {
            this.config = config;
            return this;
        }

        Bitmap.Config getConfig() {
            return this.config;
        }

        public Builder setWeight(int weight) {
            if (weight <= 0) {
                throw new IllegalArgumentException("Weight must be > 0");
            }
            this.weight = weight;
            return this;
        }

        PreFillType build() {
            return new PreFillType(this.width, this.height, this.config, this.weight);
        }
    }
}
