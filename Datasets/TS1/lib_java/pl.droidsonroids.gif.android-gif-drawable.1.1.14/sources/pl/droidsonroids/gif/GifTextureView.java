package pl.droidsonroids.gif;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.graphics.SurfaceTexture;
import android.os.Parcelable;
import android.support.annotation.FloatRange;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.Surface;
import android.view.TextureView;
import android.widget.ImageView;
import java.io.IOException;
import java.lang.ref.WeakReference;
import pl.droidsonroids.gif.InputSource;

@TargetApi(14)
/* loaded from: pl.droidsonroids.gif.android-gif-drawable.1.1.14.jar:pl/droidsonroids/gif/GifTextureView.class */
public class GifTextureView extends TextureView {
    private ImageView.ScaleType mScaleType;
    private final Matrix mTransform;
    private InputSource mInputSource;
    private boolean mFreezesAnimation;
    private RenderThread mRenderThread;
    private float mSpeedFactor;
    private static final ImageView.ScaleType[] sScaleTypeArray = {ImageView.ScaleType.MATRIX, ImageView.ScaleType.FIT_XY, ImageView.ScaleType.FIT_START, ImageView.ScaleType.FIT_CENTER, ImageView.ScaleType.FIT_END, ImageView.ScaleType.CENTER, ImageView.ScaleType.CENTER_CROP, ImageView.ScaleType.CENTER_INSIDE};

    public GifTextureView(Context context) {
        super(context);
        this.mScaleType = ImageView.ScaleType.FIT_CENTER;
        this.mTransform = new Matrix();
        this.mSpeedFactor = 1.0f;
        init(null, 0, 0);
    }

    public GifTextureView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mScaleType = ImageView.ScaleType.FIT_CENTER;
        this.mTransform = new Matrix();
        this.mSpeedFactor = 1.0f;
        init(attrs, 0, 0);
    }

    public GifTextureView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mScaleType = ImageView.ScaleType.FIT_CENTER;
        this.mTransform = new Matrix();
        this.mSpeedFactor = 1.0f;
        init(attrs, defStyleAttr, 0);
    }

    @TargetApi(21)
    public GifTextureView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mScaleType = ImageView.ScaleType.FIT_CENTER;
        this.mTransform = new Matrix();
        this.mSpeedFactor = 1.0f;
        init(attrs, defStyleAttr, defStyleRes);
    }

    private void init(AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        if (attrs != null) {
            int scaleTypeIndex = attrs.getAttributeIntValue("http://schemas.android.com/apk/res/android", "scaleType", -1);
            if (scaleTypeIndex >= 0 && scaleTypeIndex < sScaleTypeArray.length) {
                this.mScaleType = sScaleTypeArray[scaleTypeIndex];
            }
            TypedArray textureViewAttributes = getContext().obtainStyledAttributes(attrs, R.styleable.GifTextureView, defStyleAttr, defStyleRes);
            this.mInputSource = findSource(textureViewAttributes);
            super.setOpaque(textureViewAttributes.getBoolean(R.styleable.GifTextureView_isOpaque, false));
            textureViewAttributes.recycle();
            this.mFreezesAnimation = GifViewUtils.isFreezingAnimation(this, attrs, defStyleAttr, defStyleRes);
        } else {
            super.setOpaque(false);
        }
        if (!isInEditMode()) {
            LibraryLoader.loadLibrary(getContext(), "pl_droidsonroids_gif_surface");
            this.mRenderThread = new RenderThread(this);
            if (this.mInputSource != null) {
                this.mRenderThread.start();
            }
        }
    }

    @Override // android.view.TextureView
    public void setSurfaceTextureListener(TextureView.SurfaceTextureListener listener) {
        throw new UnsupportedOperationException("Changing SurfaceTextureListener is not supported");
    }

    @Override // android.view.TextureView
    public TextureView.SurfaceTextureListener getSurfaceTextureListener() {
        return null;
    }

    @Override // android.view.TextureView
    public void setSurfaceTexture(SurfaceTexture surfaceTexture) {
        throw new UnsupportedOperationException("Changing SurfaceTexture is not supported");
    }

    private static InputSource findSource(TypedArray textureViewAttributes) {
        TypedValue value = new TypedValue();
        if (!textureViewAttributes.getValue(R.styleable.GifTextureView_gifSource, value)) {
            return null;
        }
        if (value.resourceId != 0) {
            String resourceTypeName = textureViewAttributes.getResources().getResourceTypeName(value.resourceId);
            if (GifViewUtils.SUPPORTED_RESOURCE_TYPE_NAMES.contains(resourceTypeName)) {
                return new InputSource.ResourcesSource(textureViewAttributes.getResources(), value.resourceId);
            }
            if (!"string".equals(resourceTypeName)) {
                throw new IllegalArgumentException("Expected string, drawable, mipmap or raw resource type. '" + resourceTypeName + "' is not supported");
            }
        }
        return new InputSource.AssetSource(textureViewAttributes.getResources().getAssets(), value.string.toString());
    }

    /* loaded from: pl.droidsonroids.gif.android-gif-drawable.1.1.14.jar:pl/droidsonroids/gif/GifTextureView$RenderThread.class */
    private static class RenderThread extends Thread implements TextureView.SurfaceTextureListener {
        final ConditionVariable isSurfaceValid;
        private GifInfoHandle mGifInfoHandle;
        private IOException mIOException;
        long[] mSavedState;
        private final WeakReference<GifTextureView> mGifTextureViewReference;

        RenderThread(GifTextureView gifTextureView) {
            super("GifRenderThread");
            this.isSurfaceValid = new ConditionVariable();
            this.mGifInfoHandle = GifInfoHandle.NULL_INFO;
            this.mGifTextureViewReference = new WeakReference<>(gifTextureView);
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            try {
                GifTextureView gifTextureView = this.mGifTextureViewReference.get();
                if (gifTextureView == null) {
                    return;
                }
                this.mGifInfoHandle = gifTextureView.mInputSource.open();
                final GifTextureView gifTextureView2 = this.mGifTextureViewReference.get();
                if (gifTextureView2 != null) {
                    gifTextureView2.setSuperSurfaceTextureListener(this);
                    boolean isSurfaceAvailable = gifTextureView2.isAvailable();
                    this.isSurfaceValid.set(isSurfaceAvailable);
                    if (isSurfaceAvailable) {
                        gifTextureView2.post(new Runnable() { // from class: pl.droidsonroids.gif.GifTextureView.RenderThread.1
                            @Override // java.lang.Runnable
                            public void run() {
                                gifTextureView2.updateTextureViewSize(RenderThread.this.mGifInfoHandle);
                            }
                        });
                    }
                    this.mGifInfoHandle.setSpeedFactor(gifTextureView2.mSpeedFactor);
                    while (!isInterrupted()) {
                        try {
                            this.isSurfaceValid.block();
                            SurfaceTexture surfaceTexture = gifTextureView2.getSurfaceTexture();
                            if (surfaceTexture != null) {
                                Surface surface = new Surface(surfaceTexture);
                                try {
                                    this.mGifInfoHandle.bindSurface(surface, this.mSavedState, gifTextureView2.isOpaque());
                                    surface.release();
                                } catch (Throwable th) {
                                    surface.release();
                                    throw th;
                                }
                            }
                        } catch (InterruptedException e) {
                        }
                    }
                    this.mGifInfoHandle.recycle();
                    this.mGifInfoHandle = GifInfoHandle.NULL_INFO;
                    return;
                }
                this.mGifInfoHandle.recycle();
            } catch (IOException ex) {
                this.mIOException = ex;
            }
        }

        @Override // android.view.TextureView.SurfaceTextureListener
        public void onSurfaceTextureAvailable(SurfaceTexture surface, int width, int height) {
            GifTextureView gifTextureView = this.mGifTextureViewReference.get();
            if (gifTextureView != null) {
                gifTextureView.updateTextureViewSize(this.mGifInfoHandle);
            }
            this.isSurfaceValid.open();
        }

        @Override // android.view.TextureView.SurfaceTextureListener
        public void onSurfaceTextureSizeChanged(SurfaceTexture surface, int width, int height) {
        }

        @Override // android.view.TextureView.SurfaceTextureListener
        public boolean onSurfaceTextureDestroyed(SurfaceTexture surface) {
            this.isSurfaceValid.close();
            this.mGifInfoHandle.postUnbindSurface();
            return false;
        }

        @Override // android.view.TextureView.SurfaceTextureListener
        public void onSurfaceTextureUpdated(SurfaceTexture surface) {
        }

        void dispose(@NonNull GifTextureView gifTextureView) {
            this.isSurfaceValid.close();
            gifTextureView.setSuperSurfaceTextureListener(null);
            this.mGifInfoHandle.postUnbindSurface();
            interrupt();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSuperSurfaceTextureListener(RenderThread renderThread) {
        super.setSurfaceTextureListener(renderThread);
    }

    @Override // android.view.TextureView
    public void setOpaque(boolean opaque) {
        if (opaque != isOpaque()) {
            super.setOpaque(opaque);
            setInputSource(this.mInputSource);
        }
    }

    @Override // android.view.View
    protected void onDetachedFromWindow() {
        this.mRenderThread.dispose(this);
        super.onDetachedFromWindow();
        SurfaceTexture surfaceTexture = getSurfaceTexture();
        if (surfaceTexture != null) {
            surfaceTexture.release();
        }
    }

    public synchronized void setInputSource(@Nullable InputSource inputSource) {
        this.mRenderThread.dispose(this);
        this.mInputSource = inputSource;
        this.mRenderThread = new RenderThread(this);
        if (inputSource != null) {
            this.mRenderThread.start();
        }
    }

    public void setSpeed(@FloatRange(from = 0.0d, fromInclusive = false) float factor) {
        this.mSpeedFactor = factor;
        this.mRenderThread.mGifInfoHandle.setSpeedFactor(factor);
    }

    @Nullable
    public IOException getIOException() {
        return this.mRenderThread.mIOException != null ? this.mRenderThread.mIOException : GifIOException.fromCode(this.mRenderThread.mGifInfoHandle.getNativeErrorCode());
    }

    public void setScaleType(@NonNull ImageView.ScaleType scaleType) {
        this.mScaleType = scaleType;
        updateTextureViewSize(this.mRenderThread.mGifInfoHandle);
    }

    public ImageView.ScaleType getScaleType() {
        return this.mScaleType;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateTextureViewSize(GifInfoHandle gifInfoHandle) {
        float scaleRef;
        Matrix transform = new Matrix();
        float viewWidth = getWidth();
        float viewHeight = getHeight();
        float scaleX = gifInfoHandle.getWidth() / viewWidth;
        float scaleY = gifInfoHandle.getHeight() / viewHeight;
        RectF src = new RectF(0.0f, 0.0f, gifInfoHandle.getWidth(), gifInfoHandle.getHeight());
        RectF dst = new RectF(0.0f, 0.0f, viewWidth, viewHeight);
        switch (AnonymousClass1.$SwitchMap$android$widget$ImageView$ScaleType[this.mScaleType.ordinal()]) {
            case 1:
                transform.setScale(scaleX, scaleY, viewWidth / 2.0f, viewHeight / 2.0f);
                break;
            case 2:
                float scaleRef2 = 1.0f / Math.min(scaleX, scaleY);
                transform.setScale(scaleRef2 * scaleX, scaleRef2 * scaleY, viewWidth / 2.0f, viewHeight / 2.0f);
                break;
            case 3:
                if (gifInfoHandle.getWidth() <= viewWidth && gifInfoHandle.getHeight() <= viewHeight) {
                    scaleRef = 1.0f;
                } else {
                    scaleRef = Math.min(1.0f / scaleX, 1.0f / scaleY);
                }
                transform.setScale(scaleRef * scaleX, scaleRef * scaleY, viewWidth / 2.0f, viewHeight / 2.0f);
                break;
            case 4:
                transform.setRectToRect(src, dst, Matrix.ScaleToFit.CENTER);
                transform.preScale(scaleX, scaleY);
                break;
            case 5:
                transform.setRectToRect(src, dst, Matrix.ScaleToFit.END);
                transform.preScale(scaleX, scaleY);
                break;
            case 6:
                transform.setRectToRect(src, dst, Matrix.ScaleToFit.START);
                transform.preScale(scaleX, scaleY);
                break;
            case 7:
                return;
            case 8:
                transform.set(this.mTransform);
                transform.preScale(scaleX, scaleY);
                break;
        }
        super.setTransform(transform);
    }

    /* renamed from: pl.droidsonroids.gif.GifTextureView$1, reason: invalid class name */
    /* loaded from: pl.droidsonroids.gif.android-gif-drawable.1.1.14.jar:pl/droidsonroids/gif/GifTextureView$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$android$widget$ImageView$ScaleType = new int[ImageView.ScaleType.values().length];

        static {
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.CENTER.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.CENTER_CROP.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.CENTER_INSIDE.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_CENTER.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_END.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_START.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.FIT_XY.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$android$widget$ImageView$ScaleType[ImageView.ScaleType.MATRIX.ordinal()] = 8;
            } catch (NoSuchFieldError e8) {
            }
        }
    }

    public void setImageMatrix(Matrix matrix) {
        setTransform(matrix);
    }

    @Override // android.view.TextureView
    public void setTransform(Matrix transform) {
        this.mTransform.set(transform);
        updateTextureViewSize(this.mRenderThread.mGifInfoHandle);
    }

    @Override // android.view.TextureView
    public Matrix getTransform(Matrix transform) {
        if (transform == null) {
            transform = new Matrix();
        }
        transform.set(this.mTransform);
        return transform;
    }

    @Override // android.view.View
    public Parcelable onSaveInstanceState() {
        this.mRenderThread.mSavedState = this.mRenderThread.mGifInfoHandle.getSavedState();
        return new GifViewSavedState(super.onSaveInstanceState(), this.mFreezesAnimation ? this.mRenderThread.mSavedState : null);
    }

    @Override // android.view.View
    public void onRestoreInstanceState(Parcelable state) {
        GifViewSavedState ss = (GifViewSavedState) state;
        super.onRestoreInstanceState(ss.getSuperState());
        this.mRenderThread.mSavedState = ss.mStates[0];
    }

    public void setFreezesAnimation(boolean freezesAnimation) {
        this.mFreezesAnimation = freezesAnimation;
    }
}
