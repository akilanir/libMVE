package com.bumptech.glide.util;

import com.bumptech.glide.ListPreloader;
import java.util.Arrays;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/util/FixedPreloadSizeProvider.class */
public class FixedPreloadSizeProvider<T> implements ListPreloader.PreloadSizeProvider<T> {
    private final int[] size;

    public FixedPreloadSizeProvider(int width, int height) {
        this.size = new int[]{width, height};
    }

    @Override // com.bumptech.glide.ListPreloader.PreloadSizeProvider
    public int[] getPreloadSize(T item, int adapterPosition, int itemPosition) {
        return Arrays.copyOf(this.size, this.size.length);
    }
}
