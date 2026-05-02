package com.bumptech.glide;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.view.animation.Animation;
import com.bumptech.glide.load.Encoder;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.ResourceEncoder;
import com.bumptech.glide.load.Transformation;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.bumptech.glide.load.resource.bitmap.BitmapTransformation;
import com.bumptech.glide.load.resource.gif.GifDrawable;
import com.bumptech.glide.load.resource.gif.GifDrawableTransformation;
import com.bumptech.glide.load.resource.transcode.ResourceTranscoder;
import com.bumptech.glide.provider.LoadProvider;
import com.bumptech.glide.request.RequestListener;
import com.bumptech.glide.request.animation.DrawableCrossFadeFactory;
import com.bumptech.glide.request.animation.ViewPropertyAnimation;
import java.io.File;
import java.io.InputStream;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/GifRequestBuilder.class */
public class GifRequestBuilder<ModelType> extends GenericRequestBuilder<ModelType, InputStream, GifDrawable, GifDrawable> implements BitmapOptions, DrawableOptions {
    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.bumptech.glide.GenericRequestBuilder
    public /* bridge */ /* synthetic */ GenericRequestBuilder load(Object obj) {
        return load((GifRequestBuilder<ModelType>) obj);
    }

    GifRequestBuilder(LoadProvider<ModelType, InputStream, GifDrawable, GifDrawable> loadProvider, Class<GifDrawable> transcodeClass, GenericRequestBuilder<ModelType, ?, ?, ?> other) {
        super(loadProvider, transcodeClass, other);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> thumbnail(GenericRequestBuilder<?, ?, ?, GifDrawable> genericRequestBuilder) {
        super.thumbnail((GenericRequestBuilder) genericRequestBuilder);
        return this;
    }

    public GifRequestBuilder<ModelType> thumbnail(GifRequestBuilder<?> thumbnailRequest) {
        super.thumbnail((GenericRequestBuilder) thumbnailRequest);
        return this;
    }

    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> thumbnail(float sizeMultiplier) {
        super.thumbnail(sizeMultiplier);
        return this;
    }

    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> sizeMultiplier(float sizeMultiplier) {
        super.sizeMultiplier(sizeMultiplier);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> decoder(ResourceDecoder<InputStream, GifDrawable> resourceDecoder) {
        super.decoder((ResourceDecoder) resourceDecoder);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> cacheDecoder(ResourceDecoder<File, GifDrawable> resourceDecoder) {
        super.cacheDecoder((ResourceDecoder) resourceDecoder);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> encoder(ResourceEncoder<GifDrawable> resourceEncoder) {
        super.encoder((ResourceEncoder) resourceEncoder);
        return this;
    }

    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> priority(Priority priority) {
        super.priority(priority);
        return this;
    }

    @Override // com.bumptech.glide.BitmapOptions
    public GifRequestBuilder<ModelType> centerCrop() {
        return transformFrame(this.glide.getBitmapCenterCrop());
    }

    @Override // com.bumptech.glide.BitmapOptions
    public GifRequestBuilder<ModelType> fitCenter() {
        return transformFrame(this.glide.getBitmapFitCenter());
    }

    public GifRequestBuilder<ModelType> transformFrame(BitmapTransformation... bitmapTransformations) {
        return transform((Transformation<GifDrawable>[]) toGifTransformations(bitmapTransformations));
    }

    public GifRequestBuilder<ModelType> transformFrame(Transformation<Bitmap>... bitmapTransformations) {
        return transform((Transformation<GifDrawable>[]) toGifTransformations(bitmapTransformations));
    }

    private GifDrawableTransformation[] toGifTransformations(Transformation<Bitmap>[] bitmapTransformations) {
        GifDrawableTransformation[] transformations = new GifDrawableTransformation[bitmapTransformations.length];
        for (int i = 0; i < bitmapTransformations.length; i++) {
            transformations[i] = new GifDrawableTransformation(bitmapTransformations[i], this.glide.getBitmapPool());
        }
        return transformations;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> transform(Transformation<GifDrawable>... transformationArr) {
        super.transform((Transformation[]) transformationArr);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> transcoder(ResourceTranscoder<GifDrawable, GifDrawable> resourceTranscoder) {
        super.transcoder((ResourceTranscoder) resourceTranscoder);
        return this;
    }

    @Override // com.bumptech.glide.DrawableOptions
    public GifRequestBuilder<ModelType> crossFade() {
        super.animate(new DrawableCrossFadeFactory());
        return this;
    }

    @Override // com.bumptech.glide.DrawableOptions
    public GifRequestBuilder<ModelType> crossFade(int duration) {
        super.animate(new DrawableCrossFadeFactory(duration));
        return this;
    }

    @Override // com.bumptech.glide.DrawableOptions
    @Deprecated
    public GifRequestBuilder<ModelType> crossFade(Animation animation, int duration) {
        super.animate(new DrawableCrossFadeFactory(animation, duration));
        return this;
    }

    @Override // com.bumptech.glide.DrawableOptions
    public GifRequestBuilder<ModelType> crossFade(int animationId, int duration) {
        super.animate(new DrawableCrossFadeFactory(this.context, animationId, duration));
        return this;
    }

    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> dontAnimate() {
        super.dontAnimate();
        return this;
    }

    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> animate(int animationId) {
        super.animate(animationId);
        return this;
    }

    @Override // com.bumptech.glide.GenericRequestBuilder
    @Deprecated
    public GifRequestBuilder<ModelType> animate(Animation animation) {
        super.animate(animation);
        return this;
    }

    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> animate(ViewPropertyAnimation.Animator animator) {
        super.animate(animator);
        return this;
    }

    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> placeholder(int resourceId) {
        super.placeholder(resourceId);
        return this;
    }

    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> placeholder(Drawable drawable) {
        super.placeholder(drawable);
        return this;
    }

    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> error(int resourceId) {
        super.error(resourceId);
        return this;
    }

    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> error(Drawable drawable) {
        super.error(drawable);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> listener(RequestListener<? super ModelType, GifDrawable> requestListener) {
        super.listener((RequestListener) requestListener);
        return this;
    }

    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> skipMemoryCache(boolean skip) {
        super.skipMemoryCache(skip);
        return this;
    }

    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> diskCacheStrategy(DiskCacheStrategy strategy) {
        super.diskCacheStrategy(strategy);
        return this;
    }

    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> override(int width, int height) {
        super.override(width, height);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> sourceEncoder(Encoder<InputStream> encoder) {
        super.sourceEncoder((Encoder) encoder);
        return this;
    }

    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> dontTransform() {
        super.dontTransform();
        return this;
    }

    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> signature(Key signature) {
        super.signature(signature);
        return this;
    }

    @Override // com.bumptech.glide.GenericRequestBuilder
    public GifRequestBuilder<ModelType> load(ModelType model) {
        super.load((GifRequestBuilder<ModelType>) model);
        return this;
    }

    @Override // com.bumptech.glide.GenericRequestBuilder
    /* renamed from: clone */
    public GifRequestBuilder<ModelType> mo0clone() {
        return (GifRequestBuilder) super.mo0clone();
    }

    @Override // com.bumptech.glide.GenericRequestBuilder
    void applyFitCenter() {
        fitCenter();
    }

    @Override // com.bumptech.glide.GenericRequestBuilder
    void applyCenterCrop() {
        centerCrop();
    }
}
