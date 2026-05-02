package com.bumptech.glide;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.animation.Animation;
import android.widget.ImageView;
import com.bumptech.glide.gifdecoder.GifDecoder;
import com.bumptech.glide.load.Encoder;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.MultiTransformation;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.ResourceEncoder;
import com.bumptech.glide.load.Transformation;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.bumptech.glide.load.resource.UnitTransformation;
import com.bumptech.glide.load.resource.transcode.ResourceTranscoder;
import com.bumptech.glide.manager.Lifecycle;
import com.bumptech.glide.manager.RequestTracker;
import com.bumptech.glide.provider.ChildLoadProvider;
import com.bumptech.glide.provider.LoadProvider;
import com.bumptech.glide.request.FutureTarget;
import com.bumptech.glide.request.GenericRequest;
import com.bumptech.glide.request.Request;
import com.bumptech.glide.request.RequestCoordinator;
import com.bumptech.glide.request.RequestFutureTarget;
import com.bumptech.glide.request.RequestListener;
import com.bumptech.glide.request.ThumbnailRequestCoordinator;
import com.bumptech.glide.request.animation.GlideAnimationFactory;
import com.bumptech.glide.request.animation.NoAnimation;
import com.bumptech.glide.request.animation.ViewAnimationFactory;
import com.bumptech.glide.request.animation.ViewPropertyAnimation;
import com.bumptech.glide.request.animation.ViewPropertyAnimationFactory;
import com.bumptech.glide.request.target.PreloadTarget;
import com.bumptech.glide.request.target.Target;
import com.bumptech.glide.signature.EmptySignature;
import com.bumptech.glide.util.Util;
import java.io.File;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/GenericRequestBuilder.class */
public class GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> implements Cloneable {
    protected final Class<ModelType> modelClass;
    protected final Context context;
    protected final Glide glide;
    protected final Class<TranscodeType> transcodeClass;
    protected final RequestTracker requestTracker;
    protected final Lifecycle lifecycle;
    private ChildLoadProvider<ModelType, DataType, ResourceType, TranscodeType> loadProvider;
    private ModelType model;
    private Key signature;
    private boolean isModelSet;
    private int placeholderId;
    private int errorId;
    private RequestListener<? super ModelType, TranscodeType> requestListener;
    private Float thumbSizeMultiplier;
    private GenericRequestBuilder<?, ?, ?, TranscodeType> thumbnailRequestBuilder;
    private Float sizeMultiplier;
    private Drawable placeholderDrawable;
    private Drawable errorPlaceholder;
    private Priority priority;
    private boolean isCacheable;
    private GlideAnimationFactory<TranscodeType> animationFactory;
    private int overrideHeight;
    private int overrideWidth;
    private DiskCacheStrategy diskCacheStrategy;
    private Transformation<ResourceType> transformation;
    private boolean isTransformationSet;
    private boolean isThumbnailBuilt;

    GenericRequestBuilder(LoadProvider<ModelType, DataType, ResourceType, TranscodeType> loadProvider, Class<TranscodeType> transcodeClass, GenericRequestBuilder<ModelType, ?, ?, ?> other) {
        this(other.context, other.modelClass, loadProvider, transcodeClass, other.glide, other.requestTracker, other.lifecycle);
        this.model = other.model;
        this.isModelSet = other.isModelSet;
        this.signature = other.signature;
        this.diskCacheStrategy = other.diskCacheStrategy;
        this.isCacheable = other.isCacheable;
    }

    GenericRequestBuilder(Context context, Class<ModelType> modelClass, LoadProvider<ModelType, DataType, ResourceType, TranscodeType> loadProvider, Class<TranscodeType> transcodeClass, Glide glide, RequestTracker requestTracker, Lifecycle lifecycle) {
        this.signature = EmptySignature.obtain();
        this.sizeMultiplier = Float.valueOf(1.0f);
        this.priority = null;
        this.isCacheable = true;
        this.animationFactory = NoAnimation.getFactory();
        this.overrideHeight = -1;
        this.overrideWidth = -1;
        this.diskCacheStrategy = DiskCacheStrategy.RESULT;
        this.transformation = UnitTransformation.get();
        this.context = context;
        this.modelClass = modelClass;
        this.transcodeClass = transcodeClass;
        this.glide = glide;
        this.requestTracker = requestTracker;
        this.lifecycle = lifecycle;
        this.loadProvider = loadProvider != null ? new ChildLoadProvider<>(loadProvider) : null;
        if (context == null) {
            throw new NullPointerException("Context can't be null");
        }
        if (modelClass != null && loadProvider == null) {
            throw new NullPointerException("LoadProvider must not be null");
        }
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> thumbnail(GenericRequestBuilder<?, ?, ?, TranscodeType> thumbnailRequest) {
        if (equals(thumbnailRequest)) {
            throw new IllegalArgumentException("You cannot set a request as a thumbnail for itself. Consider using clone() on the request you are passing to thumbnail()");
        }
        this.thumbnailRequestBuilder = thumbnailRequest;
        return this;
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> thumbnail(float sizeMultiplier) {
        if (sizeMultiplier < 0.0f || sizeMultiplier > 1.0f) {
            throw new IllegalArgumentException("sizeMultiplier must be between 0 and 1");
        }
        this.thumbSizeMultiplier = Float.valueOf(sizeMultiplier);
        return this;
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> sizeMultiplier(float sizeMultiplier) {
        if (sizeMultiplier < 0.0f || sizeMultiplier > 1.0f) {
            throw new IllegalArgumentException("sizeMultiplier must be between 0 and 1");
        }
        this.sizeMultiplier = Float.valueOf(sizeMultiplier);
        return this;
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> decoder(ResourceDecoder<DataType, ResourceType> decoder) {
        if (this.loadProvider != null) {
            this.loadProvider.setSourceDecoder(decoder);
        }
        return this;
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> cacheDecoder(ResourceDecoder<File, ResourceType> cacheDecoder) {
        if (this.loadProvider != null) {
            this.loadProvider.setCacheDecoder(cacheDecoder);
        }
        return this;
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> sourceEncoder(Encoder<DataType> sourceEncoder) {
        if (this.loadProvider != null) {
            this.loadProvider.setSourceEncoder(sourceEncoder);
        }
        return this;
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> diskCacheStrategy(DiskCacheStrategy strategy) {
        this.diskCacheStrategy = strategy;
        return this;
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> encoder(ResourceEncoder<ResourceType> encoder) {
        if (this.loadProvider != null) {
            this.loadProvider.setEncoder(encoder);
        }
        return this;
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> priority(Priority priority) {
        this.priority = priority;
        return this;
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> transform(Transformation<ResourceType>... transformations) {
        this.isTransformationSet = true;
        if (transformations.length == 1) {
            this.transformation = transformations[0];
        } else {
            this.transformation = new MultiTransformation(transformations);
        }
        return this;
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> dontTransform() {
        Transformation<ResourceType> transformation = UnitTransformation.get();
        return transform(transformation);
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> transcoder(ResourceTranscoder<ResourceType, TranscodeType> transcoder) {
        if (this.loadProvider != null) {
            this.loadProvider.setTranscoder(transcoder);
        }
        return this;
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> dontAnimate() {
        GlideAnimationFactory<TranscodeType> animation = NoAnimation.getFactory();
        return animate(animation);
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> animate(int animationId) {
        return animate(new ViewAnimationFactory(this.context, animationId));
    }

    @Deprecated
    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> animate(Animation animation) {
        return animate(new ViewAnimationFactory(animation));
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> animate(ViewPropertyAnimation.Animator animator) {
        return animate(new ViewPropertyAnimationFactory(animator));
    }

    GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> animate(GlideAnimationFactory<TranscodeType> animationFactory) {
        if (animationFactory == null) {
            throw new NullPointerException("Animation factory must not be null!");
        }
        this.animationFactory = animationFactory;
        return this;
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> placeholder(int resourceId) {
        this.placeholderId = resourceId;
        return this;
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> placeholder(Drawable drawable) {
        this.placeholderDrawable = drawable;
        return this;
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> error(int resourceId) {
        this.errorId = resourceId;
        return this;
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> error(Drawable drawable) {
        this.errorPlaceholder = drawable;
        return this;
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> listener(RequestListener<? super ModelType, TranscodeType> requestListener) {
        this.requestListener = requestListener;
        return this;
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> skipMemoryCache(boolean skip) {
        this.isCacheable = !skip;
        return this;
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> override(int width, int height) {
        if (!Util.isValidDimensions(width, height)) {
            throw new IllegalArgumentException("Width and height must be Target#SIZE_ORIGINAL or > 0");
        }
        this.overrideWidth = width;
        this.overrideHeight = height;
        return this;
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> signature(Key signature) {
        if (signature == null) {
            throw new NullPointerException("Signature must not be null");
        }
        this.signature = signature;
        return this;
    }

    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> load(ModelType model) {
        this.model = model;
        this.isModelSet = true;
        return this;
    }

    @Override // 
    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> mo0clone() {
        try {
            GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType> clone = (GenericRequestBuilder) super.clone();
            clone.loadProvider = this.loadProvider != null ? this.loadProvider.m40clone() : null;
            return clone;
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException(e);
        }
    }

    public <Y extends Target<TranscodeType>> Y into(Y target) {
        Util.assertMainThread();
        if (target == null) {
            throw new IllegalArgumentException("You must pass in a non null Target");
        }
        if (!this.isModelSet) {
            throw new IllegalArgumentException("You must first set a model (try #load())");
        }
        Request previous = target.getRequest();
        if (previous != null) {
            previous.clear();
            this.requestTracker.removeRequest(previous);
            previous.recycle();
        }
        Request request = buildRequest(target);
        target.setRequest(request);
        this.lifecycle.addListener(target);
        this.requestTracker.runRequest(request);
        return target;
    }

    public Target<TranscodeType> into(ImageView view) {
        Util.assertMainThread();
        if (view == null) {
            throw new IllegalArgumentException("You must pass in a non null View");
        }
        if (!this.isTransformationSet && view.getScaleType() != null) {
            switch (AnonymousClass2.$SwitchMap$android$widget$ImageView$ScaleType[view.getScaleType().ordinal()]) {
                case 1:
                    applyCenterCrop();
                    break;
                case 2:
                case GifDecoder.STATUS_PARTIAL_DECODE /* 3 */:
                case 4:
                    applyFitCenter();
                    break;
            }
        }
        return into((GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType>) this.glide.buildImageViewTarget(view, this.transcodeClass));
    }

    /* renamed from: com.bumptech.glide.GenericRequestBuilder$2, reason: invalid class name */
    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/GenericRequestBuilder$2.class */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] $SwitchMap$android$widget$ImageView$ScaleType = new int[ImageView.ScaleType.values().length];

        static {
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.CENTER_CROP.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_CENTER.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_START.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_END.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
        }
    }

    public FutureTarget<TranscodeType> into(int width, int height) {
        final RequestFutureTarget<ModelType, TranscodeType> target = new RequestFutureTarget<>(this.glide.getMainHandler(), width, height);
        this.glide.getMainHandler().post(new Runnable() { // from class: com.bumptech.glide.GenericRequestBuilder.1
            @Override // java.lang.Runnable
            public void run() {
                if (!target.isCancelled()) {
                    GenericRequestBuilder.this.into((GenericRequestBuilder) target);
                }
            }
        });
        return target;
    }

    public Target<TranscodeType> preload(int width, int height) {
        PreloadTarget<TranscodeType> target = PreloadTarget.obtain(width, height);
        return into((GenericRequestBuilder<ModelType, DataType, ResourceType, TranscodeType>) target);
    }

    public Target<TranscodeType> preload() {
        return preload(Target.SIZE_ORIGINAL, Target.SIZE_ORIGINAL);
    }

    void applyCenterCrop() {
    }

    void applyFitCenter() {
    }

    private Priority getThumbnailPriority() {
        Priority result;
        if (this.priority == Priority.LOW) {
            result = Priority.NORMAL;
        } else if (this.priority == Priority.NORMAL) {
            result = Priority.HIGH;
        } else {
            result = Priority.IMMEDIATE;
        }
        return result;
    }

    private Request buildRequest(Target<TranscodeType> target) {
        if (this.priority == null) {
            this.priority = Priority.NORMAL;
        }
        this.isThumbnailBuilt = false;
        return buildRequestRecursive(target, null);
    }

    private Request buildRequestRecursive(Target<TranscodeType> target, ThumbnailRequestCoordinator parentCoordinator) {
        if (this.thumbnailRequestBuilder != null) {
            if (this.isThumbnailBuilt) {
                throw new IllegalStateException("You cannot use a request as both the main request and a thumbnail, consider using clone() on the request(s) passed to thumbnail()");
            }
            if (this.thumbnailRequestBuilder.animationFactory.equals(NoAnimation.getFactory())) {
                this.thumbnailRequestBuilder.animationFactory = this.animationFactory;
            }
            if (this.thumbnailRequestBuilder.priority == null) {
                this.thumbnailRequestBuilder.priority = getThumbnailPriority();
            }
            if (Util.isValidDimensions(this.overrideWidth, this.overrideHeight) && !Util.isValidDimensions(this.thumbnailRequestBuilder.overrideWidth, this.thumbnailRequestBuilder.overrideHeight)) {
                this.thumbnailRequestBuilder.override(this.overrideWidth, this.overrideHeight);
            }
            ThumbnailRequestCoordinator coordinator = new ThumbnailRequestCoordinator(parentCoordinator);
            Request fullRequest = obtainRequest(target, this.sizeMultiplier.floatValue(), this.priority, coordinator);
            this.isThumbnailBuilt = true;
            Request thumbRequest = this.thumbnailRequestBuilder.buildRequestRecursive(target, coordinator);
            coordinator.setRequests(fullRequest, thumbRequest);
            return coordinator;
        }
        if (this.thumbSizeMultiplier != null) {
            ThumbnailRequestCoordinator coordinator2 = new ThumbnailRequestCoordinator(parentCoordinator);
            Request fullRequest2 = obtainRequest(target, this.sizeMultiplier.floatValue(), this.priority, coordinator2);
            Request thumbnailRequest = obtainRequest(target, this.thumbSizeMultiplier.floatValue(), getThumbnailPriority(), coordinator2);
            coordinator2.setRequests(fullRequest2, thumbnailRequest);
            return coordinator2;
        }
        return obtainRequest(target, this.sizeMultiplier.floatValue(), this.priority, parentCoordinator);
    }

    private Request obtainRequest(Target<TranscodeType> target, float sizeMultiplier, Priority priority, RequestCoordinator requestCoordinator) {
        return GenericRequest.obtain(this.loadProvider, this.model, this.signature, this.context, priority, target, sizeMultiplier, this.placeholderDrawable, this.placeholderId, this.errorPlaceholder, this.errorId, this.requestListener, requestCoordinator, this.glide.getEngine(), this.transformation, this.transcodeClass, this.isCacheable, this.animationFactory, this.overrideWidth, this.overrideHeight, this.diskCacheStrategy);
    }
}
