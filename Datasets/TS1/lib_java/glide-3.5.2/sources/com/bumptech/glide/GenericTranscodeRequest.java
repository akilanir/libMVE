package com.bumptech.glide;

import android.content.Context;
import com.bumptech.glide.RequestManager;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.resource.transcode.ResourceTranscoder;
import com.bumptech.glide.load.resource.transcode.UnitTranscoder;
import com.bumptech.glide.manager.Lifecycle;
import com.bumptech.glide.manager.RequestTracker;
import com.bumptech.glide.provider.DataLoadProvider;
import com.bumptech.glide.provider.FixedLoadProvider;
import com.bumptech.glide.provider.LoadProvider;
import com.bumptech.glide.request.FutureTarget;
import com.bumptech.glide.request.target.Target;
import java.io.File;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/GenericTranscodeRequest.class */
public class GenericTranscodeRequest<ModelType, DataType, ResourceType> extends GenericRequestBuilder<ModelType, DataType, ResourceType, ResourceType> implements DownloadOptions {
    private final ModelLoader<ModelType, DataType> modelLoader;
    private final Class<DataType> dataClass;
    private final Class<ResourceType> resourceClass;
    private final RequestManager.OptionsApplier optionsApplier;

    private static <A, T, Z, R> LoadProvider<A, T, Z, R> build(Glide glide, ModelLoader<A, T> modelLoader, Class<T> dataClass, Class<Z> resourceClass, ResourceTranscoder<Z, R> transcoder) {
        DataLoadProvider<T, Z> dataLoadProvider = glide.buildDataProvider(dataClass, resourceClass);
        return new FixedLoadProvider(modelLoader, transcoder, dataLoadProvider);
    }

    GenericTranscodeRequest(Class<ResourceType> transcodeClass, GenericRequestBuilder<ModelType, ?, ?, ?> other, ModelLoader<ModelType, DataType> modelLoader, Class<DataType> dataClass, Class<ResourceType> resourceClass, RequestManager.OptionsApplier optionsApplier) {
        super(build(other.glide, modelLoader, dataClass, resourceClass, UnitTranscoder.get()), transcodeClass, other);
        this.modelLoader = modelLoader;
        this.dataClass = dataClass;
        this.resourceClass = resourceClass;
        this.optionsApplier = optionsApplier;
    }

    GenericTranscodeRequest(Context context, Glide glide, Class<ModelType> modelClass, ModelLoader<ModelType, DataType> modelLoader, Class<DataType> dataClass, Class<ResourceType> resourceClass, RequestTracker requestTracker, Lifecycle lifecycle, RequestManager.OptionsApplier optionsApplier) {
        super(context, modelClass, build(glide, modelLoader, dataClass, resourceClass, UnitTranscoder.get()), resourceClass, glide, requestTracker, lifecycle);
        this.modelLoader = modelLoader;
        this.dataClass = dataClass;
        this.resourceClass = resourceClass;
        this.optionsApplier = optionsApplier;
    }

    public <TranscodeType> GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> transcode(ResourceTranscoder<ResourceType, TranscodeType> transcoder, Class<TranscodeType> transcodeClass) {
        LoadProvider<ModelType, DataType, ResourceType, TranscodeType> loadProvider = build(this.glide, this.modelLoader, this.dataClass, this.resourceClass, transcoder);
        return this.optionsApplier.apply(new GenericRequestBuilder(loadProvider, transcodeClass, this));
    }

    @Override // com.bumptech.glide.DownloadOptions
    public <Y extends Target<File>> Y downloadOnly(Y y) {
        return (Y) getDownloadOnlyRequest().into((GenericRequestBuilder<ModelType, DataType, File, File>) y);
    }

    @Override // com.bumptech.glide.DownloadOptions
    public FutureTarget<File> downloadOnly(int width, int height) {
        return getDownloadOnlyRequest().into(width, height);
    }

    private GenericRequestBuilder<ModelType, DataType, File, File> getDownloadOnlyRequest() {
        ResourceTranscoder<File, File> transcoder = UnitTranscoder.get();
        DataLoadProvider<DataType, File> dataLoadProvider = this.glide.buildDataProvider(this.dataClass, File.class);
        FixedLoadProvider<ModelType, DataType, File, File> fixedLoadProvider = new FixedLoadProvider<>(this.modelLoader, transcoder, dataLoadProvider);
        return this.optionsApplier.apply(new GenericRequestBuilder(fixedLoadProvider, File.class, this)).priority(Priority.LOW).diskCacheStrategy(DiskCacheStrategy.SOURCE).skipMemoryCache(true);
    }
}
