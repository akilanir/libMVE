package com.koushikdutta.ion;

import android.graphics.drawable.Drawable;
import android.view.animation.Animation;
import android.widget.ImageView;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.async.future.FutureCallback;
import com.koushikdutta.async.future.SimpleFuture;
import com.koushikdutta.async.future.TransformFuture;
import com.koushikdutta.ion.ContextReference;
import com.koushikdutta.ion.bitmap.BitmapInfo;
import com.koushikdutta.ion.future.ImageViewFuture;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/ImageViewFutureImpl.class */
class ImageViewFutureImpl extends TransformFuture<ImageView, IonDrawable> implements ImageViewFuture {
    public static final ImageViewFutureImpl FUTURE_IMAGEVIEW_NULL_URI = new ImageViewFutureImpl() { // from class: com.koushikdutta.ion.ImageViewFutureImpl.1
        {
            setComplete(new NullPointerException("uri"));
        }

        @Override // com.koushikdutta.ion.ImageViewFutureImpl
        protected /* bridge */ /* synthetic */ void transform(Object x0) throws Exception {
            super.transform((IonDrawable) x0);
        }
    };
    private ScaleMode scaleMode;
    private Animation inAnimation;
    private int inAnimationResource;
    private ContextReference.ImageViewContextReference imageViewRef;

    ImageViewFutureImpl() {
    }

    public static ImageViewFutureImpl getOrCreateImageViewFuture(ContextReference.ImageViewContextReference imageViewRef, IonDrawable drawable) {
        ImageViewFutureImpl ret;
        if (drawable.getLoadCallback() instanceof ImageViewFutureImpl) {
            ret = (ImageViewFutureImpl) drawable.getLoadCallback();
        } else {
            ret = new ImageViewFutureImpl();
        }
        drawable.setLoadCallback(ret);
        ret.imageViewRef = imageViewRef;
        return ret;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // 
    public void transform(IonDrawable result) throws Exception {
        ImageView imageView = (ImageView) this.imageViewRef.get();
        if (null != this.imageViewRef.isAlive() || imageView == null) {
            cancelSilently();
            return;
        }
        if (imageView.getDrawable() != result) {
            cancelSilently();
            return;
        }
        BitmapInfo info = result.getBitmapInfo();
        if (info != null && info.exception == null) {
            applyScaleMode(imageView, this.scaleMode);
        }
        IonBitmapRequestBuilder.doAnimation(imageView, this.inAnimation, this.inAnimationResource);
        imageView.setImageDrawable(null);
        imageView.setImageDrawable(result);
        setComplete(imageView);
    }

    @Override // com.koushikdutta.ion.future.ImageViewFuture
    public Future<ImageViewBitmapInfo> withBitmapInfo() {
        final SimpleFuture<ImageViewBitmapInfo> ret = new SimpleFuture<>();
        setCallback(new FutureCallback<ImageView>() { // from class: com.koushikdutta.ion.ImageViewFutureImpl.2
            public void onCompleted(Exception e, ImageView result) {
                ImageViewBitmapInfo val = new ImageViewBitmapInfo();
                Drawable d = null;
                if (result != null) {
                    d = result.getDrawable();
                }
                if (d instanceof IonDrawable) {
                    IonDrawable id = (IonDrawable) d;
                    val.info = id.getBitmapInfo();
                }
                val.exception = e;
                val.imageView = result;
                ret.setComplete(val);
            }
        });
        ret.setParent(this);
        return ret;
    }

    public ImageViewFutureImpl setInAnimation(Animation inAnimation, int inAnimationResource) {
        this.inAnimation = inAnimation;
        this.inAnimationResource = inAnimationResource;
        return this;
    }

    public ImageViewFutureImpl setScaleMode(ScaleMode scaleMode) {
        this.scaleMode = scaleMode;
        return this;
    }

    public static void applyScaleMode(ImageView imageView, ScaleMode scaleMode) {
        if (scaleMode == null) {
        }
        switch (scaleMode) {
            case CenterCrop:
                imageView.setScaleType(ImageView.ScaleType.CENTER_CROP);
                break;
            case FitCenter:
                imageView.setScaleType(ImageView.ScaleType.FIT_CENTER);
                break;
            case CenterInside:
                imageView.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
                break;
            case FitXY:
                imageView.setScaleType(ImageView.ScaleType.FIT_XY);
                break;
        }
    }
}
