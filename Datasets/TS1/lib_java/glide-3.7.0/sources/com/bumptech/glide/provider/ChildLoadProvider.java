package com.bumptech.glide.provider;

import com.bumptech.glide.load.Encoder;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.ResourceEncoder;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.resource.transcode.ResourceTranscoder;
import java.io.File;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/provider/ChildLoadProvider.class */
public class ChildLoadProvider<A, T, Z, R> implements LoadProvider<A, T, Z, R>, Cloneable {
    private final LoadProvider<A, T, Z, R> parent;
    private ResourceDecoder<File, Z> cacheDecoder;
    private ResourceDecoder<T, Z> sourceDecoder;
    private ResourceEncoder<Z> encoder;
    private ResourceTranscoder<Z, R> transcoder;
    private Encoder<T> sourceEncoder;

    public ChildLoadProvider(LoadProvider<A, T, Z, R> parent) {
        this.parent = parent;
    }

    @Override // com.bumptech.glide.provider.LoadProvider
    public ModelLoader<A, T> getModelLoader() {
        return this.parent.getModelLoader();
    }

    public void setCacheDecoder(ResourceDecoder<File, Z> cacheDecoder) {
        this.cacheDecoder = cacheDecoder;
    }

    public void setSourceDecoder(ResourceDecoder<T, Z> sourceDecoder) {
        this.sourceDecoder = sourceDecoder;
    }

    public void setEncoder(ResourceEncoder<Z> encoder) {
        this.encoder = encoder;
    }

    public void setTranscoder(ResourceTranscoder<Z, R> transcoder) {
        this.transcoder = transcoder;
    }

    public void setSourceEncoder(Encoder<T> sourceEncoder) {
        this.sourceEncoder = sourceEncoder;
    }

    @Override // com.bumptech.glide.provider.DataLoadProvider
    public ResourceDecoder<File, Z> getCacheDecoder() {
        if (this.cacheDecoder != null) {
            return this.cacheDecoder;
        }
        return this.parent.getCacheDecoder();
    }

    @Override // com.bumptech.glide.provider.DataLoadProvider
    public ResourceDecoder<T, Z> getSourceDecoder() {
        if (this.sourceDecoder != null) {
            return this.sourceDecoder;
        }
        return this.parent.getSourceDecoder();
    }

    @Override // com.bumptech.glide.provider.DataLoadProvider
    public Encoder<T> getSourceEncoder() {
        if (this.sourceEncoder != null) {
            return this.sourceEncoder;
        }
        return this.parent.getSourceEncoder();
    }

    @Override // com.bumptech.glide.provider.DataLoadProvider
    public ResourceEncoder<Z> getEncoder() {
        if (this.encoder != null) {
            return this.encoder;
        }
        return this.parent.getEncoder();
    }

    @Override // com.bumptech.glide.provider.LoadProvider
    public ResourceTranscoder<Z, R> getTranscoder() {
        if (this.transcoder != null) {
            return this.transcoder;
        }
        return this.parent.getTranscoder();
    }

    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public ChildLoadProvider<A, T, Z, R> m46clone() {
        try {
            return (ChildLoadProvider) super.clone();
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException(e);
        }
    }
}
