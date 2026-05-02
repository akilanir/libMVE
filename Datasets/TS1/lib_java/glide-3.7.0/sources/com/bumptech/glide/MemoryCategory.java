package com.bumptech.glide;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/MemoryCategory.class */
public enum MemoryCategory {
    LOW(0.5f),
    NORMAL(1.0f),
    HIGH(1.5f);

    private float multiplier;

    MemoryCategory(float multiplier) {
        this.multiplier = multiplier;
    }

    public float getMultiplier() {
        return this.multiplier;
    }
}
