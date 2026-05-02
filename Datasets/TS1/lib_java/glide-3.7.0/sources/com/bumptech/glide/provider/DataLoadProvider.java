package com.bumptech.glide.provider;

import com.bumptech.glide.load.Encoder;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.ResourceEncoder;
import java.io.File;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/provider/DataLoadProvider.class */
public interface DataLoadProvider<T, Z> {
    ResourceDecoder<File, Z> getCacheDecoder();

    ResourceDecoder<T, Z> getSourceDecoder();

    Encoder<T> getSourceEncoder();

    ResourceEncoder<Z> getEncoder();
}
