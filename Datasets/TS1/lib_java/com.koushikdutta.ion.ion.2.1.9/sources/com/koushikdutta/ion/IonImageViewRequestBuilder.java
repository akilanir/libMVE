package com.koushikdutta.ion;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Looper;
import android.view.animation.Animation;
import android.widget.ImageView;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.ion.ContextReference;
import com.koushikdutta.ion.bitmap.BitmapInfo;
import com.koushikdutta.ion.bitmap.LocallyCachedStatus;
import com.koushikdutta.ion.bitmap.PostProcess;
import com.koushikdutta.ion.bitmap.Transform;
import com.koushikdutta.ion.builder.AnimateGifMode;
import com.koushikdutta.ion.builder.Builders;
import com.koushikdutta.ion.builder.ImageViewFutureBuilder;
import com.koushikdutta.ion.future.ImageViewFuture;
import com.koushikdutta.ion.loader.MediaFile;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/IonImageViewRequestBuilder.class */
public class IonImageViewRequestBuilder extends IonBitmapRequestBuilder implements Builders.IV.F, ImageViewFutureBuilder {
    Drawable placeholderDrawable;
    int placeholderResource;
    Drawable errorDrawable;
    int errorResource;
    Animation inAnimation;
    Animation loadAnimation;
    int loadAnimationResource;
    int inAnimationResource;
    ContextReference.ImageViewContextReference imageViewPostRef;
    boolean fadeIn;
    boolean crossfade;
    BitmapDrawableFactory bitmapDrawableFactory;
    static final /* synthetic */ boolean $assertionsDisabled;

    @Override // com.koushikdutta.ion.IonBitmapRequestBuilder, com.koushikdutta.ion.builder.ImageViewBuilder
    public /* bridge */ /* synthetic */ IonBitmapRequestBuilder deepZoom() {
        return super.deepZoom();
    }

    @Override // com.koushikdutta.ion.IonBitmapRequestBuilder, com.koushikdutta.ion.builder.ImageViewBuilder
    public /* bridge */ /* synthetic */ IonBitmapRequestBuilder animateGif(AnimateGifMode x0) {
        return super.animateGif(x0);
    }

    @Override // com.koushikdutta.ion.IonBitmapRequestBuilder, com.koushikdutta.ion.builder.BitmapBuilder
    public /* bridge */ /* synthetic */ IonBitmapRequestBuilder smartSize(boolean x0) {
        return super.smartSize(x0);
    }

    @Override // com.koushikdutta.ion.IonBitmapRequestBuilder, com.koushikdutta.ion.builder.BitmapBuilder
    public /* bridge */ /* synthetic */ IonBitmapRequestBuilder resizeHeight(int x0) {
        return super.resizeHeight(x0);
    }

    @Override // com.koushikdutta.ion.IonBitmapRequestBuilder, com.koushikdutta.ion.builder.BitmapBuilder
    public /* bridge */ /* synthetic */ IonBitmapRequestBuilder resizeWidth(int x0) {
        return super.resizeWidth(x0);
    }

    @Override // com.koushikdutta.ion.IonBitmapRequestBuilder, com.koushikdutta.ion.builder.BitmapBuilder
    public /* bridge */ /* synthetic */ IonBitmapRequestBuilder resize(int x0, int x1) {
        return super.resize(x0, x1);
    }

    @Override // com.koushikdutta.ion.IonBitmapRequestBuilder, com.koushikdutta.ion.builder.BitmapBuilder
    public /* bridge */ /* synthetic */ IonBitmapRequestBuilder centerInside() {
        return super.centerInside();
    }

    @Override // com.koushikdutta.ion.IonBitmapRequestBuilder, com.koushikdutta.ion.builder.BitmapBuilder
    public /* bridge */ /* synthetic */ IonBitmapRequestBuilder fitCenter() {
        return super.fitCenter();
    }

    @Override // com.koushikdutta.ion.IonBitmapRequestBuilder, com.koushikdutta.ion.builder.BitmapBuilder
    public /* bridge */ /* synthetic */ IonBitmapRequestBuilder fitXY() {
        return super.fitXY();
    }

    @Override // com.koushikdutta.ion.IonBitmapRequestBuilder, com.koushikdutta.ion.builder.BitmapBuilder
    public /* bridge */ /* synthetic */ IonBitmapRequestBuilder centerCrop() {
        return super.centerCrop();
    }

    @Override // com.koushikdutta.ion.IonBitmapRequestBuilder, com.koushikdutta.ion.builder.BitmapFutureBuilder
    public /* bridge */ /* synthetic */ Future asBitmap() {
        return super.asBitmap();
    }

    @Override // com.koushikdutta.ion.IonBitmapRequestBuilder, com.koushikdutta.ion.builder.BitmapFutureBuilder
    public /* bridge */ /* synthetic */ BitmapInfo asCachedBitmap() {
        return super.asCachedBitmap();
    }

    @Override // com.koushikdutta.ion.IonBitmapRequestBuilder, com.koushikdutta.ion.builder.BitmapFutureBuilder
    public /* bridge */ /* synthetic */ void removeCachedBitmap() {
        super.removeCachedBitmap();
    }

    @Override // com.koushikdutta.ion.IonBitmapRequestBuilder, com.koushikdutta.ion.builder.BitmapFutureBuilder
    public /* bridge */ /* synthetic */ LocallyCachedStatus isLocallyCached() {
        return super.isLocallyCached();
    }

    @Override // com.koushikdutta.ion.IonBitmapRequestBuilder
    public /* bridge */ /* synthetic */ String computeBitmapKey(String x0) {
        return super.computeBitmapKey(x0);
    }

    @Override // com.koushikdutta.ion.IonBitmapRequestBuilder
    public /* bridge */ /* synthetic */ void addDefaultTransform() {
        super.addDefaultTransform();
    }

    @Override // com.koushikdutta.ion.IonBitmapRequestBuilder, com.koushikdutta.ion.builder.BitmapBuilder
    public /* bridge */ /* synthetic */ IonBitmapRequestBuilder postProcess(PostProcess x0) {
        return super.postProcess(x0);
    }

    @Override // com.koushikdutta.ion.IonBitmapRequestBuilder, com.koushikdutta.ion.builder.BitmapBuilder
    public /* bridge */ /* synthetic */ IonBitmapRequestBuilder transform(Transform x0) {
        return super.transform(x0);
    }

    static {
        $assertionsDisabled = !IonImageViewRequestBuilder.class.desiredAssertionStatus();
    }

    public IonImageViewRequestBuilder(IonRequestBuilder builder) {
        super(builder);
        this.fadeIn = true;
        this.bitmapDrawableFactory = BitmapDrawableFactory.DEFAULT;
    }

    public IonImageViewRequestBuilder(Ion ion) {
        super(ion);
        this.fadeIn = true;
        this.bitmapDrawableFactory = BitmapDrawableFactory.DEFAULT;
    }

    @Override // com.koushikdutta.ion.IonBitmapRequestBuilder
    void reset() {
        super.reset();
        this.fadeIn = true;
        this.crossfade = false;
        this.imageViewPostRef = null;
        this.placeholderDrawable = null;
        this.bitmapDrawableFactory = BitmapDrawableFactory.DEFAULT;
        this.placeholderResource = 0;
        this.errorDrawable = null;
        this.errorResource = 0;
        this.inAnimation = null;
        this.inAnimationResource = 0;
        this.loadAnimation = null;
        this.loadAnimationResource = 0;
    }

    @Override // com.koushikdutta.ion.IonBitmapRequestBuilder
    protected IonRequestBuilder ensureBuilder() {
        if (this.builder == null) {
            this.builder = new IonRequestBuilder(ContextReference.fromContext(this.imageViewPostRef.getContext().getApplicationContext()), this.ion);
        }
        return this.builder;
    }

    @Override // com.koushikdutta.ion.builder.LoadImageViewFutureBuilder
    public ImageViewFuture load(String uri) {
        ensureBuilder();
        this.builder.load2(uri);
        return intoImageView((ImageView) this.imageViewPostRef.get());
    }

    @Override // com.koushikdutta.ion.builder.LoadImageViewFutureBuilder
    public Future<ImageView> load(String method, String url) {
        ensureBuilder();
        this.builder.load2(method, url);
        return intoImageView((ImageView) this.imageViewPostRef.get());
    }

    IonImageViewRequestBuilder withImageView(ImageView imageView) {
        if (this.imageViewPostRef == null || this.imageViewPostRef.get() != imageView) {
            this.imageViewPostRef = new ContextReference.ImageViewContextReference(imageView);
        }
        return this;
    }

    private IonDrawable setIonDrawable(ImageView imageView, BitmapFetcher bitmapFetcher, ResponseServedFrom servedFrom) {
        BitmapInfo info = null;
        if (bitmapFetcher != null) {
            info = bitmapFetcher.info;
        }
        if (info != null) {
            bitmapFetcher = null;
        }
        IonDrawable ret = IonDrawable.getOrCreateIonDrawable(imageView).ion(this.ion).setBitmap(info, servedFrom).setBitmapFetcher(bitmapFetcher).setRepeatAnimation(this.animateGifMode == AnimateGifMode.ANIMATE).setSize(this.resizeWidth, this.resizeHeight).setError(this.errorResource, this.errorDrawable).setPlaceholder(this.placeholderResource, this.placeholderDrawable).setFadeIn(this.fadeIn || this.crossfade).setBitmapDrawableFactory(this.bitmapDrawableFactory).updateLayers();
        imageView.setImageDrawable(ret);
        return ret;
    }

    @Override // com.koushikdutta.ion.builder.ImageViewBuilder
    public IonBitmapRequestBuilder fadeIn(boolean fadeIn) {
        this.fadeIn = fadeIn;
        return this;
    }

    @TargetApi(MediaFile.FILE_TYPE_EC3)
    private static boolean getAdjustViewBounds_16(ImageView imageView) {
        return imageView.getAdjustViewBounds();
    }

    private static boolean getAdjustViewBounds(ImageView imageView) {
        return Build.VERSION.SDK_INT >= 16 && getAdjustViewBounds_16(imageView);
    }

    @Override // com.koushikdutta.ion.builder.ImageViewFutureBuilder
    public ImageViewFuture intoImageView(ImageView imageView) {
        if (!$assertionsDisabled && Thread.currentThread() != Looper.getMainLooper().getThread()) {
            throw new AssertionError();
        }
        if (imageView == null) {
            throw new NullPointerException("imageView");
        }
        if (this.builder.uri == null) {
            setIonDrawable(imageView, null, ResponseServedFrom.LOADED_FROM_NETWORK).cancel();
            return ImageViewFutureImpl.FUTURE_IMAGEVIEW_NULL_URI;
        }
        withImageView(imageView);
        if (this.crossfade) {
            Drawable drawable = imageView.getDrawable();
            if (drawable instanceof IonDrawable) {
                IonDrawable ionDrawable = (IonDrawable) drawable;
                drawable = ionDrawable.getCurrentDrawable();
            }
            placeholder(drawable);
        }
        int sampleWidth = this.resizeWidth;
        int sampleHeight = this.resizeHeight;
        if (this.resizeHeight == 0 && this.resizeWidth == 0 && !getAdjustViewBounds(imageView)) {
            sampleWidth = imageView.getMeasuredWidth();
            sampleHeight = imageView.getMeasuredHeight();
        } else {
            addDefaultTransform();
        }
        BitmapFetcher bitmapFetcher = executeCache(sampleWidth, sampleHeight);
        if (bitmapFetcher.info != null) {
            doAnimation(imageView, null, 0);
            IonDrawable drawable2 = setIonDrawable(imageView, bitmapFetcher, ResponseServedFrom.LOADED_FROM_MEMORY);
            drawable2.cancel();
            ImageViewFutureImpl imageViewFuture = ImageViewFutureImpl.getOrCreateImageViewFuture(this.imageViewPostRef, drawable2).setInAnimation(this.inAnimation, this.inAnimationResource).setScaleMode(this.scaleMode);
            ImageViewFutureImpl.applyScaleMode(imageView, this.scaleMode);
            imageViewFuture.reset();
            imageViewFuture.setComplete(bitmapFetcher.info.exception, imageView);
            return imageViewFuture;
        }
        IonDrawable drawable3 = setIonDrawable(imageView, bitmapFetcher, ResponseServedFrom.LOADED_FROM_NETWORK);
        doAnimation(imageView, this.loadAnimation, this.loadAnimationResource);
        ImageViewFutureImpl imageViewFuture2 = ImageViewFutureImpl.getOrCreateImageViewFuture(this.imageViewPostRef, drawable3).setInAnimation(this.inAnimation, this.inAnimationResource).setScaleMode(this.scaleMode);
        imageViewFuture2.reset();
        return imageViewFuture2;
    }

    private Drawable getImageViewDrawable() {
        ImageView iv = (ImageView) this.imageViewPostRef.get();
        if (iv == null) {
            return null;
        }
        return iv.getDrawable();
    }

    @Override // com.koushikdutta.ion.builder.Builders.IV.F
    public Bitmap getBitmap() {
        Drawable d = getImageViewDrawable();
        if (d == null) {
            return null;
        }
        if (d instanceof BitmapDrawable) {
            return ((BitmapDrawable) d).getBitmap();
        }
        if (!(d instanceof IonDrawable)) {
            return null;
        }
        IonDrawable id = (IonDrawable) d;
        Drawable d2 = id.getCurrentDrawable();
        if (d2 instanceof BitmapDrawable) {
            return ((BitmapDrawable) d2).getBitmap();
        }
        return null;
    }

    @Override // com.koushikdutta.ion.builder.Builders.IV.F
    public BitmapInfo getBitmapInfo() {
        Drawable d = getImageViewDrawable();
        if (d == null || !(d instanceof IonDrawable)) {
            return null;
        }
        IonDrawable id = (IonDrawable) d;
        return id.getBitmapInfo();
    }

    @Override // com.koushikdutta.ion.builder.ImageViewBuilder
    public IonImageViewRequestBuilder crossfade(boolean crossfade) {
        this.crossfade = crossfade;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.ImageViewBuilder
    public IonImageViewRequestBuilder placeholder(Drawable drawable) {
        this.placeholderDrawable = drawable;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.ImageViewBuilder
    public IonImageViewRequestBuilder placeholder(int resourceId) {
        this.placeholderResource = resourceId;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.ImageViewBuilder
    public IonImageViewRequestBuilder error(Drawable drawable) {
        this.errorDrawable = drawable;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.ImageViewBuilder
    public IonImageViewRequestBuilder error(int resourceId) {
        this.errorResource = resourceId;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.ImageViewBuilder
    public IonImageViewRequestBuilder animateIn(Animation in) {
        this.inAnimation = in;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.ImageViewBuilder
    public IonImageViewRequestBuilder animateLoad(Animation load) {
        this.loadAnimation = load;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.ImageViewBuilder
    public IonImageViewRequestBuilder animateLoad(int animationResource) {
        this.loadAnimationResource = animationResource;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.ImageViewBuilder
    public IonImageViewRequestBuilder animateIn(int animationResource) {
        this.inAnimationResource = animationResource;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.ImageViewBuilder
    public IonImageViewRequestBuilder bitmapDrawableFactory(BitmapDrawableFactory bitmapDrawableFactory) {
        this.bitmapDrawableFactory = bitmapDrawableFactory;
        return this;
    }
}
