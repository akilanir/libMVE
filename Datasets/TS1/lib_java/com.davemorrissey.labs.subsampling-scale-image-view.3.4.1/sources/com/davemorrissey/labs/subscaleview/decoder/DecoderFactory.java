package com.davemorrissey.labs.subscaleview.decoder;

/* loaded from: com.davemorrissey.labs.subsampling-scale-image-view.3.4.1.jar:com/davemorrissey/labs/subscaleview/decoder/DecoderFactory.class */
public interface DecoderFactory<T> {
    T make() throws IllegalAccessException, InstantiationException;
}
