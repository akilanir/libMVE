package com.davemorrissey.labs.subscaleview.decoder;

import android.support.annotation.NonNull;

/* loaded from: com.davemorrissey.labs.subsampling-scale-image-view.3.5.0.jar:com/davemorrissey/labs/subscaleview/decoder/CompatDecoderFactory.class */
public class CompatDecoderFactory<T> implements DecoderFactory<T> {
    private Class<? extends T> clazz;

    public CompatDecoderFactory(@NonNull Class<? extends T> clazz) {
        this.clazz = clazz;
    }

    @Override // com.davemorrissey.labs.subscaleview.decoder.DecoderFactory
    public T make() throws IllegalAccessException, InstantiationException {
        return this.clazz.newInstance();
    }
}
