package com.bumptech.glide;

import com.bumptech.glide.RequestManager;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.resource.gif.GifDrawable;
import com.bumptech.glide.load.resource.transcode.GifDrawableBytesTranscoder;
import com.bumptech.glide.load.resource.transcode.ResourceTranscoder;
import com.bumptech.glide.provider.DataLoadProvider;
import com.bumptech.glide.provider.FixedLoadProvider;
import java.io.InputStream;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/GifTypeRequest.class */
public class GifTypeRequest<ModelType> extends GifRequestBuilder<ModelType> {
    private final ModelLoader<ModelType, InputStream> streamModelLoader;
    private final RequestManager.OptionsApplier optionsApplier;

    private static <A, R> FixedLoadProvider<A, InputStream, GifDrawable, R> buildProvider(Glide glide, ModelLoader<A, InputStream> streamModelLoader, Class<R> transcodeClass, ResourceTranscoder<GifDrawable, R> transcoder) {
        if (streamModelLoader == null) {
            return null;
        }
        if (transcoder == null) {
            transcoder = glide.buildTranscoder(GifDrawable.class, transcodeClass);
        }
        DataLoadProvider<InputStream, GifDrawable> dataLoadProvider = glide.buildDataProvider(InputStream.class, GifDrawable.class);
        return new FixedLoadProvider<>(streamModelLoader, transcoder, dataLoadProvider);
    }

    GifTypeRequest(GenericRequestBuilder<ModelType, ?, ?, ?> other, ModelLoader<ModelType, InputStream> streamModelLoader, RequestManager.OptionsApplier optionsApplier) {
        super(buildProvider(other.glide, streamModelLoader, GifDrawable.class, null), GifDrawable.class, other);
        this.streamModelLoader = streamModelLoader;
        this.optionsApplier = optionsApplier;
        crossFade();
    }

    public <R> GenericRequestBuilder<ModelType, InputStream, GifDrawable, R> transcode(ResourceTranscoder<GifDrawable, R> transcoder, Class<R> transcodeClass) {
        FixedLoadProvider<ModelType, InputStream, GifDrawable, R> provider = buildProvider(this.glide, this.streamModelLoader, transcodeClass, transcoder);
        return this.optionsApplier.apply(new GenericRequestBuilder(provider, transcodeClass, this));
    }

    public GenericRequestBuilder<ModelType, InputStream, GifDrawable, byte[]> toBytes() {
        return (GenericRequestBuilder<ModelType, InputStream, GifDrawable, byte[]>) transcode(new GifDrawableBytesTranscoder(), byte[].class);
    }
}
