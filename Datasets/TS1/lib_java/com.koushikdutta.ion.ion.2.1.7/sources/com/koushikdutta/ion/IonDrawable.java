package com.koushikdutta.ion;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Looper;
import android.os.SystemClock;
import android.text.TextUtils;
import android.widget.ImageView;
import com.koushikdutta.async.future.FutureCallback;
import com.koushikdutta.async.util.FileCache;
import com.koushikdutta.ion.bitmap.BitmapInfo;
import com.koushikdutta.ion.gif.GifDecoder;
import com.koushikdutta.ion.gif.GifFrame;
import java.lang.ref.WeakReference;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/IonDrawable.class */
class IonDrawable extends LayerDrawable {
    private static final double LOG_2 = Math.log(2.0d);
    private static final int TILE_DIM = 256;
    private static final long FADE_DURATION = 200;
    private static final int DEFAULT_PAINT_FLAGS = 6;
    private Paint paint;
    private BitmapInfo info;
    private int placeholderResource;
    private Drawable placeholder;
    private int errorResource;
    private Drawable error;
    private Resources resources;
    private ResponseServedFrom servedFrom;
    private boolean fadeIn;
    private int resizeWidth;
    private int resizeHeight;
    private boolean repeatAnimation;
    private Ion ion;
    private BitmapFetcher bitmapFetcher;
    private IonDrawableCallback callback;
    private FutureCallback<IonDrawable> loadCallback;
    private IonGifDecoder gifDecoder;
    private Drawable bitmapDrawable;
    private int textureDim;
    private int maxLevel;
    private BitmapDrawableFactory bitmapDrawableFactory;
    private final Drawable NULL_PLACEHOLDER;
    private final Drawable NULL_BITMAPINFO;
    private final Drawable NULL_ERROR;
    private FutureCallback<BitmapInfo> tileCallback;

    public FutureCallback<IonDrawable> getLoadCallback() {
        return this.loadCallback;
    }

    public IonDrawable setLoadCallback(FutureCallback<IonDrawable> loadCallback) {
        this.loadCallback = loadCallback;
        return this;
    }

    public IonDrawable ion(Ion ion) {
        if (ion == null) {
            throw new AssertionError("null ion");
        }
        this.ion = ion;
        return this;
    }

    public Drawable getCurrentDrawable() {
        if (this.info == null && this.placeholderResource != 0) {
            return this.resources.getDrawable(this.placeholderResource);
        }
        if (this.info != null) {
            if (this.info.bitmap != null) {
                return new BitmapDrawable(this.resources, this.info.bitmap);
            }
            if (this.info.gifDecoder != null) {
                GifFrame last = this.info.gifDecoder.getLastFrame();
                if (last != null) {
                    return new BitmapDrawable(this.resources, last.image);
                }
                if (this.placeholderResource != 0) {
                    return this.resources.getDrawable(this.placeholderResource);
                }
                return null;
            }
        }
        if (this.errorResource != 0) {
            return this.resources.getDrawable(this.errorResource);
        }
        return null;
    }

    public BitmapInfo getBitmapInfo() {
        return this.info;
    }

    /* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/IonDrawable$IonDrawableCallback.class */
    static class IonDrawableCallback implements FutureCallback<BitmapInfo> {
        private WeakReference<IonDrawable> ionDrawableRef;
        private String bitmapKey;
        private Ion ion;
        static final /* synthetic */ boolean $assertionsDisabled;

        static {
            $assertionsDisabled = !IonDrawable.class.desiredAssertionStatus();
        }

        public IonDrawableCallback(IonDrawable drawable) {
            this.ionDrawableRef = new WeakReference<>(drawable);
        }

        public void register(Ion ion, String bitmapKey) {
            String previousKey = this.bitmapKey;
            Ion previousIon = this.ion;
            if (TextUtils.equals(previousKey, bitmapKey) && this.ion == ion) {
                return;
            }
            this.ion = ion;
            this.bitmapKey = bitmapKey;
            if (ion != null) {
                ion.bitmapsPending.add(bitmapKey, this);
            }
            unregister(previousIon, previousKey);
        }

        private void unregister(Ion ion, String key) {
            if (key == null) {
                return;
            }
            if (ion.bitmapsPending.removeItem(key, this)) {
                Object owner = ion.bitmapsPending.tag(key);
                if (owner instanceof TransformBitmap) {
                    TransformBitmap info = (TransformBitmap) owner;
                    ion.bitmapsPending.remove(info.key);
                    if (ion.bitmapsPending.removeItem(info.downloadKey, info)) {
                        owner = ion.bitmapsPending.tag(info.downloadKey);
                    }
                }
                if (owner instanceof DeferredLoadBitmap) {
                    DeferredLoadBitmap defer = (DeferredLoadBitmap) owner;
                    ion.bitmapsPending.remove(defer.key);
                }
            }
            ion.processDeferred();
        }

        public void onCompleted(Exception e, BitmapInfo result) {
            if (!$assertionsDisabled && Thread.currentThread() != Looper.getMainLooper().getThread()) {
                throw new AssertionError();
            }
            if (!$assertionsDisabled && result == null) {
                throw new AssertionError();
            }
            IonDrawable drawable = this.ionDrawableRef.get();
            if (drawable == null) {
                return;
            }
            drawable.setBitmap(result, result.servedFrom).updateLayers();
            FutureCallback<IonDrawable> callback = drawable.loadCallback;
            if (callback != null) {
                callback.onCompleted(e, drawable);
            }
        }
    }

    /* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/IonDrawable$IonGifDecoder.class */
    class IonGifDecoder {
        GifDecoder gifDecoder;
        Exception exception;
        GifFrame currentFrame;
        long nextFrameRender;
        Runnable loader = new Runnable() { // from class: com.koushikdutta.ion.IonDrawable.IonGifDecoder.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    IonGifDecoder.this.gifDecoder.nextFrame();
                } catch (Exception e) {
                    IonGifDecoder.this.exception = e;
                } catch (OutOfMemoryError e2) {
                    IonGifDecoder.this.exception = new Exception(e2);
                }
                Ion.mainHandler.post(IonGifDecoder.this.postLoad);
            }
        };
        Runnable postLoad = new Runnable() { // from class: com.koushikdutta.ion.IonDrawable.IonGifDecoder.2
            @Override // java.lang.Runnable
            public void run() {
                IonGifDecoder.this.isLoading = false;
                IonDrawable.this.invalidateSelf();
            }
        };
        boolean isLoading;

        public IonGifDecoder(BitmapInfo info) {
            this.gifDecoder = info.gifDecoder.mutate();
            this.currentFrame = this.gifDecoder.getLastFrame();
        }

        long getDelay() {
            if (this.currentFrame == null) {
                return 100L;
            }
            long delay = this.currentFrame.delay;
            if (delay == 0) {
                delay = 100;
            }
            return delay;
        }

        public GifFrame getCurrentFrame() {
            long now = System.currentTimeMillis();
            if (this.nextFrameRender == 0) {
                this.nextFrameRender = now + getDelay();
                scheduleNextFrame();
            }
            if (now >= this.nextFrameRender) {
                if (this.gifDecoder.getLastFrame() != this.currentFrame) {
                    this.currentFrame = this.gifDecoder.getLastFrame();
                    if (now > this.nextFrameRender + getDelay()) {
                        this.nextFrameRender = now + getDelay();
                    } else {
                        this.nextFrameRender += getDelay();
                    }
                }
                scheduleNextFrame();
            }
            return this.currentFrame;
        }

        public synchronized void scheduleNextFrame() {
            if (this.isLoading || this.exception != null) {
                return;
            }
            if (this.gifDecoder.getStatus() == -1 && IonDrawable.this.repeatAnimation) {
                this.gifDecoder.restart();
            }
            this.isLoading = true;
            Ion.getBitmapLoadExecutorService().execute(this.loader);
        }
    }

    public IonDrawable setFadeIn(boolean fadeIn) {
        this.fadeIn = fadeIn;
        return this;
    }

    public IonDrawable setBitmapFetcher(BitmapFetcher bitmapFetcher) {
        this.bitmapFetcher = bitmapFetcher;
        if (this.ion == null) {
            throw new AssertionError("null ion");
        }
        return this;
    }

    public IonDrawable setBitmapDrawableFactory(BitmapDrawableFactory factory) {
        this.bitmapDrawableFactory = factory;
        return this;
    }

    public void cancel() {
        this.callback.register(null, null);
        this.bitmapFetcher = null;
    }

    public IonDrawable(Resources resources) {
        super(new Drawable[]{new BitmapDrawable((Bitmap) null), new BitmapDrawable((Bitmap) null), new BitmapDrawable((Bitmap) null)});
        this.tileCallback = new FutureCallback<BitmapInfo>() { // from class: com.koushikdutta.ion.IonDrawable.1
            public void onCompleted(Exception e, BitmapInfo result) {
                IonDrawable.this.invalidateSelf();
            }
        };
        setId(0, 0);
        setId(1, 1);
        setId(2, 2);
        this.NULL_PLACEHOLDER = getDrawable(0);
        this.NULL_BITMAPINFO = getDrawable(1);
        this.NULL_ERROR = getDrawable(2);
        this.resources = resources;
        this.paint = new Paint(6);
        this.callback = new IonDrawableCallback(this);
    }

    public IonDrawable updateLayers() {
        tryGetPlaceholderResource();
        if (this.placeholder == null) {
            setDrawableByLayerId(0, this.NULL_PLACEHOLDER);
        } else {
            setDrawableByLayerId(0, this.placeholder);
        }
        if (this.info == null) {
            setDrawableByLayerId(1, this.NULL_BITMAPINFO);
            setDrawableByLayerId(2, this.NULL_ERROR);
            return this;
        }
        if (this.info.bitmap == null && this.info.decoder == null && this.info.gifDecoder == null) {
            setDrawableByLayerId(1, this.NULL_BITMAPINFO);
            tryGetErrorResource();
            if (this.error == null) {
                setDrawableByLayerId(2, this.NULL_ERROR);
            } else {
                setDrawableByLayerId(2, this.error);
            }
            return this;
        }
        if (this.info.decoder == null && this.info.gifDecoder == null) {
            tryGetBitmapResource();
            setDrawableByLayerId(1, this.bitmapDrawable);
        } else {
            setDrawableByLayerId(1, this.NULL_BITMAPINFO);
        }
        setDrawableByLayerId(2, this.NULL_ERROR);
        return this;
    }

    public IonDrawable setBitmap(BitmapInfo info, ResponseServedFrom servedFrom) {
        if (this.info == info) {
            return this;
        }
        cancel();
        this.servedFrom = servedFrom;
        this.info = info;
        this.gifDecoder = null;
        this.bitmapDrawable = null;
        invalidateSelf();
        if (info == null) {
            return this;
        }
        if (info.decoder != null) {
            double wlevel = info.originalSize.x / 256.0d;
            double hlevel = info.originalSize.y / 256.0d;
            double level = Math.max(wlevel, hlevel);
            this.maxLevel = (int) Math.ceil(Math.log(level) / LOG_2);
            this.textureDim = TILE_DIM << this.maxLevel;
        } else if (info.gifDecoder != null) {
            this.gifDecoder = new IonGifDecoder(info);
        }
        return this;
    }

    public IonDrawable setRepeatAnimation(boolean repeatAnimation) {
        this.repeatAnimation = repeatAnimation;
        return this;
    }

    public IonDrawable setSize(int resizeWidth, int resizeHeight) {
        if (this.resizeWidth == resizeWidth && this.resizeHeight == resizeHeight) {
            return this;
        }
        this.resizeWidth = resizeWidth;
        this.resizeHeight = resizeHeight;
        invalidateSelf();
        return this;
    }

    public IonDrawable setError(int resource, Drawable drawable) {
        if ((drawable != null && drawable == this.error) || (resource != 0 && resource == this.errorResource)) {
            return this;
        }
        this.errorResource = resource;
        this.error = drawable;
        return this;
    }

    public IonDrawable setPlaceholder(int resource, Drawable drawable) {
        if ((drawable != null && drawable == this.placeholder) || (resource != 0 && resource == this.placeholderResource)) {
            return this;
        }
        this.placeholderResource = resource;
        this.placeholder = drawable;
        return this;
    }

    private Drawable tryGetErrorResource() {
        if (this.error != null) {
            return this.error;
        }
        if (this.errorResource == 0) {
            return null;
        }
        this.error = this.resources.getDrawable(this.errorResource);
        return this.error;
    }

    private Drawable tryGetBitmapResource() {
        if (this.bitmapDrawable != null) {
            return this.bitmapDrawable;
        }
        if (this.info == null || this.info.gifDecoder != null || this.info.decoder != null || this.info.bitmap == null) {
            return null;
        }
        this.bitmapDrawable = this.bitmapDrawableFactory.fromBitmap(this.resources, this.info.bitmap);
        return this.bitmapDrawable;
    }

    private Drawable tryGetPlaceholderResource() {
        if (this.placeholder != null) {
            return this.placeholder;
        }
        if (this.placeholderResource == 0) {
            return null;
        }
        this.placeholder = this.resources.getDrawable(this.placeholderResource);
        return this.placeholder;
    }

    @Override // android.graphics.drawable.LayerDrawable, android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        Drawable error;
        if (this.info != null) {
            if (this.info.decoder != null) {
                return this.info.originalSize.x;
            }
            if (this.info.bitmap != null) {
                return this.info.bitmap.getScaledWidth(this.resources.getDisplayMetrics().densityDpi);
            }
        }
        if (this.gifDecoder != null) {
            return this.gifDecoder.gifDecoder.getWidth();
        }
        if (this.resizeWidth > 0) {
            return this.resizeWidth;
        }
        if (this.info != null && (error = tryGetErrorResource()) != null) {
            return error.getIntrinsicWidth();
        }
        Drawable placeholder = tryGetPlaceholderResource();
        if (placeholder != null) {
            return placeholder.getIntrinsicWidth();
        }
        return -1;
    }

    @Override // android.graphics.drawable.LayerDrawable, android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        Drawable error;
        if (this.info != null) {
            if (this.info.decoder != null) {
                return this.info.originalSize.y;
            }
            if (this.info.bitmap != null) {
                return this.info.bitmap.getScaledHeight(this.resources.getDisplayMetrics().densityDpi);
            }
        }
        if (this.gifDecoder != null) {
            return this.gifDecoder.gifDecoder.getHeight();
        }
        if (this.resizeHeight > 0) {
            return this.resizeHeight;
        }
        if (this.info != null && (error = tryGetErrorResource()) != null) {
            return error.getIntrinsicHeight();
        }
        Drawable placeholder = tryGetPlaceholderResource();
        if (placeholder != null) {
            return placeholder.getIntrinsicHeight();
        }
        return -1;
    }

    @Override // android.graphics.drawable.LayerDrawable, android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        if (this.info == null) {
            super.draw(canvas);
            if (this.bitmapFetcher != null) {
                if (this.bitmapFetcher.sampleWidth == 0 && this.bitmapFetcher.sampleHeight == 0) {
                    if (canvas.getWidth() != 1) {
                        this.bitmapFetcher.sampleWidth = canvas.getWidth();
                    }
                    if (canvas.getHeight() != 1) {
                        this.bitmapFetcher.sampleHeight = canvas.getHeight();
                    }
                    this.bitmapFetcher.recomputeDecodeKey();
                    BitmapInfo found = this.ion.bitmapCache.get(this.bitmapFetcher.bitmapKey);
                    if (found != null) {
                        this.bitmapFetcher = null;
                        this.callback.onCompleted((Exception) null, found);
                        return;
                    }
                }
                this.callback.register(this.ion, this.bitmapFetcher.bitmapKey);
                if (BitmapFetcher.shouldDeferImageView(this.ion)) {
                    this.bitmapFetcher.defer();
                } else {
                    this.bitmapFetcher.execute();
                }
                this.bitmapFetcher = null;
                return;
            }
            return;
        }
        if (this.info.decoder != null) {
            drawDeepZoom(canvas);
            return;
        }
        if (this.info.drawTime == 0) {
            this.info.drawTime = SystemClock.uptimeMillis();
        }
        long destAlpha = 255;
        if (this.fadeIn) {
            long destAlpha2 = ((SystemClock.uptimeMillis() - this.info.drawTime) << 8) / FADE_DURATION;
            destAlpha = Math.min(destAlpha2, 255L);
        }
        if (destAlpha == 255) {
            if (this.placeholder != null) {
                this.placeholder = null;
                setDrawableByLayerId(0, this.NULL_PLACEHOLDER);
            }
        } else if (this.placeholder != null) {
            invalidateSelf();
        }
        if (this.info.gifDecoder != null) {
            super.draw(canvas);
            GifFrame frame = this.gifDecoder.getCurrentFrame();
            if (frame != null) {
                this.paint.setAlpha((int) destAlpha);
                canvas.drawBitmap(frame.image, (Rect) null, getBounds(), this.paint);
                this.paint.setAlpha(255);
                invalidateSelf();
                return;
            }
            return;
        }
        if (this.info.bitmap != null) {
            if (this.bitmapDrawable != null) {
                this.bitmapDrawable.setAlpha((int) destAlpha);
            }
        } else if (this.error != null) {
            this.error.setAlpha((int) destAlpha);
        }
        super.draw(canvas);
    }

    private void drawDeepZoom(Canvas canvas) {
        int sampleSize;
        int subSampleSize;
        Rect clip = canvas.getClipBounds();
        Rect bounds = getBounds();
        float zoom = canvas.getWidth() / clip.width();
        float zoomWidth = zoom * bounds.width();
        float zoomHeight = zoom * bounds.height();
        double wlevel = Math.log(zoomWidth / 256.0f) / LOG_2;
        double hlevel = Math.log(zoomHeight / 256.0f) / LOG_2;
        double maxLevel = Math.max(wlevel, hlevel);
        int visibleLeft = Math.max(0, clip.left);
        int visibleRight = Math.min(bounds.width(), clip.right);
        int visibleTop = Math.max(0, clip.top);
        int visibleBottom = Math.min(bounds.height(), clip.bottom);
        int level = Math.max(Math.min(this.maxLevel, (int) Math.floor(maxLevel)), 0);
        int levelTiles = 1 << level;
        int textureTileDim = this.textureDim / levelTiles;
        if (this.info.bitmap != null) {
            canvas.drawBitmap(this.info.bitmap, (Rect) null, getBounds(), this.paint);
        } else {
            this.paint.setColor(-16777216);
            canvas.drawRect(getBounds(), this.paint);
        }
        int i = 1;
        while (true) {
            sampleSize = i;
            if (textureTileDim / sampleSize <= TILE_DIM) {
                break;
            } else {
                i = sampleSize << 1;
            }
        }
        for (int y = 0; y < levelTiles; y++) {
            int top = textureTileDim * y;
            int bottom = Math.min(textureTileDim * (y + 1), bounds.bottom);
            if (bottom >= visibleTop) {
                if (top <= visibleBottom) {
                    for (int x = 0; x < levelTiles; x++) {
                        int left = textureTileDim * x;
                        int right = Math.min(textureTileDim * (x + 1), bounds.right);
                        if (right >= visibleLeft) {
                            if (left > visibleRight) {
                                break;
                            }
                            Rect texRect = new Rect(left, top, right, bottom);
                            String tileKey = FileCache.toKeyString(new Object[]{this.info.key, ",", Integer.valueOf(level), ",", Integer.valueOf(x), ",", Integer.valueOf(y)});
                            BitmapInfo tile = this.ion.bitmapCache.get(tileKey);
                            if (tile != null && tile.bitmap != null) {
                                canvas.drawBitmap(tile.bitmap, (Rect) null, texRect, this.paint);
                            } else {
                                if (this.ion.bitmapsPending.tag(tileKey) == null) {
                                    new LoadBitmapRegion(this.ion, tileKey, this.info.decoder, texRect, sampleSize);
                                }
                                this.ion.bitmapsPending.add(tileKey, this.tileCallback);
                                int parentLeft = 0;
                                int parentTop = 0;
                                int parentUp = 1;
                                int parentLevel = level - 1;
                                if (x % 2 == 1) {
                                    parentLeft = 0 + 1;
                                }
                                if (y % 2 == 1) {
                                    parentTop = 0 + 1;
                                }
                                int parentX = x >> 1;
                                int i2 = y;
                                while (true) {
                                    int parentY = i2 >> 1;
                                    if (parentLevel < 0) {
                                        break;
                                    }
                                    tile = this.ion.bitmapCache.get(FileCache.toKeyString(new Object[]{this.info.key, ",", Integer.valueOf(parentLevel), ",", Integer.valueOf(parentX), ",", Integer.valueOf(parentY)}));
                                    if (tile != null && tile.bitmap != null) {
                                        break;
                                    }
                                    if (parentX % 2 == 1) {
                                        parentLeft += 1 << parentUp;
                                    }
                                    if (parentY % 2 == 1) {
                                        parentTop += 1 << parentUp;
                                    }
                                    parentLevel--;
                                    parentUp++;
                                    parentX >>= 1;
                                    i2 = parentY;
                                }
                                if (tile != null && tile.bitmap != null) {
                                    int subLevelTiles = 1 << parentLevel;
                                    int subtileDim = this.textureDim / subLevelTiles;
                                    int i3 = 1;
                                    while (true) {
                                        subSampleSize = i3;
                                        if (subtileDim / subSampleSize <= TILE_DIM) {
                                            break;
                                        } else {
                                            i3 = subSampleSize << 1;
                                        }
                                    }
                                    int subTextureDim = (subtileDim / subSampleSize) >> parentUp;
                                    int sourceLeft = subTextureDim * parentLeft;
                                    int sourceTop = subTextureDim * parentTop;
                                    Rect sourceRect = new Rect(sourceLeft, sourceTop, sourceLeft + subTextureDim, sourceTop + subTextureDim);
                                    canvas.drawBitmap(tile.bitmap, sourceRect, texRect, this.paint);
                                }
                            }
                        }
                    }
                } else {
                    return;
                }
            }
        }
    }

    @Override // android.graphics.drawable.LayerDrawable, android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        super.setAlpha(alpha);
        this.paint.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.LayerDrawable, android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        super.setColorFilter(cf);
        this.paint.setColorFilter(cf);
    }

    @Override // android.graphics.drawable.LayerDrawable, android.graphics.drawable.Drawable
    public int getOpacity() {
        if (this.info == null || this.info.bitmap == null || this.info.bitmap.hasAlpha() || this.paint.getAlpha() < 255) {
            return -3;
        }
        return super.getOpacity();
    }

    static IonDrawable getOrCreateIonDrawable(ImageView imageView) {
        IonDrawable ret;
        Drawable current = imageView.getDrawable();
        if (current == null || !(current instanceof IonDrawable)) {
            ret = new IonDrawable(imageView.getResources());
        } else {
            ret = (IonDrawable) current;
        }
        imageView.setImageDrawable(null);
        return ret;
    }
}
