package com.koushikdutta.ion;

import android.graphics.Bitmap;
import android.os.Build;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import com.koushikdutta.async.AsyncServer;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.async.future.SimpleFuture;
import com.koushikdutta.async.util.FileCache;
import com.koushikdutta.ion.TransformBitmap;
import com.koushikdutta.ion.bitmap.BitmapInfo;
import com.koushikdutta.ion.bitmap.LocallyCachedStatus;
import com.koushikdutta.ion.bitmap.PostProcess;
import com.koushikdutta.ion.bitmap.Transform;
import com.koushikdutta.ion.builder.AnimateGifMode;
import com.koushikdutta.ion.builder.BitmapFutureBuilder;
import com.koushikdutta.ion.builder.Builders;
import java.util.ArrayList;
import java.util.List;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/IonBitmapRequestBuilder.class */
abstract class IonBitmapRequestBuilder implements BitmapFutureBuilder, Builders.Any.BF {
    private static final SimpleFuture<Bitmap> FUTURE_BITMAP_NULL_URI;
    IonRequestBuilder builder;
    Ion ion;
    ArrayList<Transform> transforms;
    ScaleMode scaleMode;
    int resizeWidth;
    int resizeHeight;
    AnimateGifMode animateGifMode = AnimateGifMode.ANIMATE;
    boolean deepZoom;
    ArrayList<PostProcess> postProcess;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !IonBitmapRequestBuilder.class.desiredAssertionStatus();
        FUTURE_BITMAP_NULL_URI = new SimpleFuture<Bitmap>() { // from class: com.koushikdutta.ion.IonBitmapRequestBuilder.1
            {
                setComplete(new NullPointerException("uri"));
            }
        };
    }

    void reset() {
        this.ion = null;
        this.transforms = null;
        this.scaleMode = null;
        this.resizeWidth = 0;
        this.resizeHeight = 0;
        this.animateGifMode = AnimateGifMode.ANIMATE;
        this.builder = null;
        this.deepZoom = false;
        this.postProcess = null;
    }

    public IonBitmapRequestBuilder(IonRequestBuilder builder) {
        this.builder = builder;
        this.ion = builder.ion;
    }

    public IonBitmapRequestBuilder(Ion ion) {
        this.ion = ion;
    }

    static void doAnimation(ImageView imageView, Animation animation, int animationResource) {
        if (imageView == null) {
            return;
        }
        if (animation == null && animationResource != 0) {
            animation = AnimationUtils.loadAnimation(imageView.getContext(), animationResource);
        }
        if (animation == null) {
            imageView.setAnimation(null);
        } else {
            imageView.startAnimation(animation);
        }
    }

    protected IonRequestBuilder ensureBuilder() {
        return this.builder;
    }

    @Override // com.koushikdutta.ion.builder.BitmapBuilder
    public IonBitmapRequestBuilder transform(Transform transform) {
        if (transform == null) {
            return this;
        }
        if (this.transforms == null) {
            this.transforms = new ArrayList<>();
        }
        this.transforms.add(transform);
        return this;
    }

    @Override // com.koushikdutta.ion.builder.BitmapBuilder
    public IonBitmapRequestBuilder postProcess(PostProcess postProcess) {
        if (this.postProcess == null) {
            this.postProcess = new ArrayList<>();
        }
        this.postProcess.add(postProcess);
        return transform((Transform) new TransformBitmap.PostProcessNullTransform(postProcess.key()));
    }

    private String computeDecodeKey() {
        return computeDecodeKey(this.builder, this.resizeWidth, this.resizeHeight, this.animateGifMode != AnimateGifMode.NO_ANIMATE, this.deepZoom);
    }

    public static String computeDecodeKey(IonRequestBuilder builder, int resizeWidth, int resizeHeight, boolean animateGif, boolean deepZoom) {
        String decodeKey = builder.uri + "resize=" + resizeWidth + "," + resizeHeight;
        if (!animateGif) {
            decodeKey = decodeKey + ":noAnimate";
        }
        if (deepZoom) {
            decodeKey = decodeKey + ":deepZoom";
        }
        return FileCache.toKeyString(new Object[]{decodeKey});
    }

    public void addDefaultTransform() {
        if (this.resizeHeight > 0 || this.resizeWidth > 0) {
            if (this.transforms == null) {
                this.transforms = new ArrayList<>();
            }
            this.transforms.add(0, new DefaultTransform(this.resizeWidth, this.resizeHeight, this.scaleMode));
        } else if (this.scaleMode != null) {
            throw new IllegalStateException("Must call resize when using " + this.scaleMode);
        }
    }

    public String computeBitmapKey(String decodeKey) {
        return computeBitmapKey(decodeKey, this.transforms);
    }

    public static String computeBitmapKey(String decodeKey, List<Transform> transforms) {
        if (!$assertionsDisabled && decodeKey == null) {
            throw new AssertionError();
        }
        String bitmapKey = decodeKey;
        if (transforms != null && transforms.size() > 0) {
            for (Transform transform : transforms) {
                bitmapKey = bitmapKey + transform.key();
            }
            bitmapKey = FileCache.toKeyString(new Object[]{bitmapKey});
        }
        return bitmapKey;
    }

    @Override // com.koushikdutta.ion.builder.BitmapFutureBuilder
    public LocallyCachedStatus isLocallyCached() {
        if (this.builder.noCache || this.deepZoom) {
            return LocallyCachedStatus.NOT_CACHED;
        }
        String decodeKey = computeDecodeKey();
        addDefaultTransform();
        String bitmapKey = computeBitmapKey(decodeKey);
        BitmapInfo info = this.builder.ion.bitmapCache.get(bitmapKey);
        if (info != null && info.exception == null) {
            return LocallyCachedStatus.CACHED;
        }
        FileCache fileCache = this.ion.responseCache.getFileCache();
        if (hasTransforms() && fileCache.exists(bitmapKey)) {
            return LocallyCachedStatus.CACHED;
        }
        if (fileCache.exists(decodeKey)) {
            return LocallyCachedStatus.MAYBE_CACHED;
        }
        return LocallyCachedStatus.NOT_CACHED;
    }

    @Override // com.koushikdutta.ion.builder.BitmapFutureBuilder
    public void removeCachedBitmap() {
        String decodeKey = computeDecodeKey();
        addDefaultTransform();
        String bitmapKey = computeBitmapKey(decodeKey);
        this.ion.responseCache.getFileCache().remove(decodeKey);
        this.ion.responseCache.getFileCache().remove(bitmapKey);
        this.builder.ion.bitmapCache.remove(bitmapKey);
        this.builder.ion.bitmapCache.remove(decodeKey);
    }

    @Override // com.koushikdutta.ion.builder.BitmapFutureBuilder
    public BitmapInfo asCachedBitmap() {
        String decodeKey = computeDecodeKey();
        addDefaultTransform();
        String bitmapKey = computeBitmapKey(decodeKey);
        return this.builder.ion.bitmapCache.get(bitmapKey);
    }

    BitmapFetcher executeCache() {
        return executeCache(this.resizeWidth, this.resizeHeight);
    }

    BitmapFetcher executeCache(int sampleWidth, int sampleHeight) {
        BitmapInfo bitmap;
        String decodeKey = computeDecodeKey();
        String bitmapKey = computeBitmapKey(decodeKey);
        BitmapFetcher ret = new BitmapFetcher();
        ret.bitmapKey = bitmapKey;
        ret.decodeKey = decodeKey;
        ret.hasTransforms = hasTransforms();
        ret.sampleWidth = sampleWidth;
        ret.sampleHeight = sampleHeight;
        ret.builder = this.builder;
        ret.transforms = this.transforms;
        ret.animateGif = this.animateGifMode != AnimateGifMode.NO_ANIMATE;
        ret.deepZoom = this.deepZoom;
        ret.postProcess = this.postProcess;
        if (!this.builder.noCache && (bitmap = this.builder.ion.bitmapCache.get(bitmapKey)) != null) {
            ret.info = bitmap;
            return ret;
        }
        return ret;
    }

    @Override // com.koushikdutta.ion.builder.BitmapFutureBuilder
    public Future<Bitmap> asBitmap() {
        if (this.builder.uri == null) {
            return FUTURE_BITMAP_NULL_URI;
        }
        addDefaultTransform();
        final BitmapFetcher bitmapFetcher = executeCache();
        if (bitmapFetcher.info != null) {
            SimpleFuture<Bitmap> ret = new SimpleFuture<>();
            ret.setComplete(bitmapFetcher.info.exception, bitmapFetcher.info.bitmap);
            return ret;
        }
        final BitmapInfoToBitmap ret2 = new BitmapInfoToBitmap(this.builder.contextReference);
        AsyncServer.post(Ion.mainHandler, new Runnable() { // from class: com.koushikdutta.ion.IonBitmapRequestBuilder.2
            @Override // java.lang.Runnable
            public void run() {
                bitmapFetcher.execute();
                IonBitmapRequestBuilder.this.ion.bitmapsPending.add(bitmapFetcher.bitmapKey, ret2);
            }
        });
        return ret2;
    }

    private void checkNoTransforms(String name) {
        if (hasTransforms()) {
            throw new IllegalStateException("Can't apply " + name + " after transform has been called." + name + " is applied to the original resized bitmap.");
        }
    }

    @Override // com.koushikdutta.ion.builder.BitmapBuilder
    public IonBitmapRequestBuilder centerCrop() {
        checkNoTransforms("centerCrop");
        this.scaleMode = ScaleMode.CenterCrop;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.BitmapBuilder
    public IonBitmapRequestBuilder fitXY() {
        checkNoTransforms("fitXY");
        this.scaleMode = ScaleMode.FitXY;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.BitmapBuilder
    public IonBitmapRequestBuilder fitCenter() {
        checkNoTransforms("fitCenter");
        this.scaleMode = ScaleMode.FitCenter;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.BitmapBuilder
    public IonBitmapRequestBuilder centerInside() {
        checkNoTransforms("centerInside");
        this.scaleMode = ScaleMode.CenterInside;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.BitmapBuilder
    public IonBitmapRequestBuilder resize(int width, int height) {
        if (hasTransforms()) {
            throw new IllegalStateException("Can't apply resize after transform has been called.resize is applied to the original bitmap.");
        }
        if (this.deepZoom) {
            throw new IllegalStateException("Can not resize with deepZoom.");
        }
        this.resizeWidth = width;
        this.resizeHeight = height;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.BitmapBuilder
    public IonBitmapRequestBuilder resizeWidth(int width) {
        return resize(width, 0);
    }

    @Override // com.koushikdutta.ion.builder.BitmapBuilder
    public IonBitmapRequestBuilder resizeHeight(int height) {
        return resize(0, height);
    }

    @Override // com.koushikdutta.ion.builder.BitmapBuilder
    public IonBitmapRequestBuilder smartSize(boolean smartSize) {
        if (this.resizeWidth > 0 || this.resizeHeight > 0) {
            throw new IllegalStateException("Can't set smart size after resize has been called.");
        }
        if (this.deepZoom) {
            throw new IllegalStateException("Can not smartSize with deepZoom.");
        }
        if (!smartSize) {
            this.resizeWidth = -1;
            this.resizeHeight = -1;
        } else {
            this.resizeWidth = 0;
            this.resizeHeight = 0;
        }
        return this;
    }

    @Override // com.koushikdutta.ion.builder.ImageViewBuilder
    public IonBitmapRequestBuilder animateGif(AnimateGifMode mode) {
        this.animateGifMode = mode;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.ImageViewBuilder
    public IonBitmapRequestBuilder deepZoom() {
        if (Build.VERSION.SDK_INT < 10) {
            return this;
        }
        this.deepZoom = true;
        if (this.resizeWidth > 0 || this.resizeHeight > 0) {
            throw new IllegalStateException("Can't deepZoom with resize.");
        }
        if (hasTransforms()) {
            throw new IllegalStateException("Can't deepZoom with transforms.");
        }
        this.resizeWidth = 0;
        this.resizeHeight = 0;
        return this;
    }

    boolean hasTransforms() {
        return this.transforms != null && this.transforms.size() > 0;
    }
}
