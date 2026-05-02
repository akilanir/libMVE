package pl.droidsonroids.gif;

import android.content.ContentResolver;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.SystemClock;
import android.support.annotation.DrawableRes;
import android.support.annotation.FloatRange;
import android.support.annotation.IntRange;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RawRes;
import android.widget.MediaController;
import java.io.File;
import java.io.FileDescriptor;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.Locale;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: pl.droidsonroids.gif.android-gif-drawable.1.1.14.jar:pl/droidsonroids/gif/GifDrawable.class */
public class GifDrawable extends Drawable implements Animatable, MediaController.MediaPlayerControl {
    final ScheduledThreadPoolExecutor mExecutor;
    volatile boolean mIsRunning;
    long mNextFrameRenderTime;
    private final Rect mDstRect;
    protected final Paint mPaint;
    final Bitmap mBuffer;
    final GifInfoHandle mNativeInfoHandle;
    final ConcurrentLinkedQueue<AnimationListener> mListeners;
    private ColorStateList mTint;
    private PorterDuffColorFilter mTintFilter;
    private PorterDuff.Mode mTintMode;
    final boolean mIsRenderingTriggeredOnDraw;
    final InvalidationHandler mInvalidationHandler;
    private final RenderTask mRenderTask;
    private final Rect mSrcRect;
    ScheduledFuture<?> mSchedule;
    private int mScaledWidth;
    private int mScaledHeight;
    private float mCornerRadius;
    private final RectF mDstRectF;

    public GifDrawable(@NonNull Resources res, @RawRes @DrawableRes int id) throws Resources.NotFoundException, IOException {
        this(res.openRawResourceFd(id));
        float densityScale = GifViewUtils.getDensityScale(res, id);
        this.mScaledHeight = (int) (this.mNativeInfoHandle.getHeight() * densityScale);
        this.mScaledWidth = (int) (this.mNativeInfoHandle.getWidth() * densityScale);
    }

    public GifDrawable(@NonNull AssetManager assets, @NonNull String assetName) throws IOException {
        this(assets.openFd(assetName));
    }

    public GifDrawable(@NonNull String filePath) throws IOException {
        this(new GifInfoHandle(filePath, false), null, null, true);
    }

    public GifDrawable(@NonNull File file) throws IOException {
        this(file.getPath());
    }

    public GifDrawable(@NonNull InputStream stream) throws IOException {
        this(new GifInfoHandle(stream, false), null, null, true);
    }

    public GifDrawable(@NonNull AssetFileDescriptor afd) throws IOException {
        this(new GifInfoHandle(afd, false), null, null, true);
    }

    public GifDrawable(@NonNull FileDescriptor fd) throws IOException {
        this(new GifInfoHandle(fd, 0L, false), null, null, true);
    }

    public GifDrawable(@NonNull byte[] bytes) throws IOException {
        this(new GifInfoHandle(bytes, false), null, null, true);
    }

    public GifDrawable(@NonNull ByteBuffer buffer) throws IOException {
        this(new GifInfoHandle(buffer, false), null, null, true);
    }

    public GifDrawable(@Nullable ContentResolver resolver, @NonNull Uri uri) throws IOException {
        this(GifInfoHandle.openUri(resolver, uri, false), null, null, true);
    }

    GifDrawable(GifInfoHandle gifInfoHandle, GifDrawable oldDrawable, ScheduledThreadPoolExecutor executor, boolean isRenderingTriggeredOnDraw) {
        this.mIsRunning = true;
        this.mNextFrameRenderTime = Long.MIN_VALUE;
        this.mDstRect = new Rect();
        this.mPaint = new Paint(6);
        this.mListeners = new ConcurrentLinkedQueue<>();
        this.mRenderTask = new RenderTask(this);
        this.mDstRectF = new RectF();
        this.mIsRenderingTriggeredOnDraw = isRenderingTriggeredOnDraw;
        this.mExecutor = executor != null ? executor : GifRenderingExecutor.getInstance();
        this.mNativeInfoHandle = gifInfoHandle;
        Bitmap oldBitmap = null;
        if (oldDrawable != null) {
            synchronized (oldDrawable.mNativeInfoHandle) {
                if (!oldDrawable.mNativeInfoHandle.isRecycled() && oldDrawable.mNativeInfoHandle.getHeight() >= this.mNativeInfoHandle.getHeight() && oldDrawable.mNativeInfoHandle.getWidth() >= this.mNativeInfoHandle.getWidth()) {
                    oldDrawable.shutdown();
                    oldBitmap = oldDrawable.mBuffer;
                    oldBitmap.eraseColor(0);
                }
            }
        }
        if (oldBitmap == null) {
            this.mBuffer = Bitmap.createBitmap(this.mNativeInfoHandle.getWidth(), this.mNativeInfoHandle.getHeight(), Bitmap.Config.ARGB_8888);
        } else {
            this.mBuffer = oldBitmap;
        }
        this.mSrcRect = new Rect(0, 0, this.mNativeInfoHandle.getWidth(), this.mNativeInfoHandle.getHeight());
        this.mInvalidationHandler = new InvalidationHandler(this);
        this.mRenderTask.doWork();
        this.mScaledWidth = this.mNativeInfoHandle.getWidth();
        this.mScaledHeight = this.mNativeInfoHandle.getHeight();
    }

    public void recycle() {
        shutdown();
        this.mBuffer.recycle();
    }

    private void shutdown() {
        this.mIsRunning = false;
        this.mInvalidationHandler.removeMessages(-1);
        this.mNativeInfoHandle.recycle();
    }

    public boolean isRecycled() {
        return this.mNativeInfoHandle.isRecycled();
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return this.mScaledHeight;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return this.mScaledWidth;
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(@IntRange(from = 0, to = 255) int alpha) {
        this.mPaint.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(@Nullable ColorFilter cf) {
        this.mPaint.setColorFilter(cf);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -2;
    }

    @Override // android.graphics.drawable.Animatable, android.widget.MediaController.MediaPlayerControl
    public void start() {
        synchronized (this) {
            if (this.mIsRunning) {
                return;
            }
            this.mIsRunning = true;
            long lastFrameRemainder = this.mNativeInfoHandle.restoreRemainder();
            startAnimation(lastFrameRemainder);
        }
    }

    void startAnimation(long lastFrameRemainder) {
        if (this.mIsRenderingTriggeredOnDraw) {
            this.mNextFrameRenderTime = 0L;
            this.mInvalidationHandler.sendEmptyMessageAtTime(-1, 0L);
        } else {
            waitForPendingRenderTask();
            this.mSchedule = this.mExecutor.schedule(this.mRenderTask, Math.max(lastFrameRemainder, 0L), TimeUnit.MILLISECONDS);
        }
    }

    public void reset() {
        this.mExecutor.execute(new SafeRunnable(this) { // from class: pl.droidsonroids.gif.GifDrawable.1
            @Override // pl.droidsonroids.gif.SafeRunnable
            public void doWork() {
                if (GifDrawable.this.mNativeInfoHandle.reset()) {
                    GifDrawable.this.start();
                }
            }
        });
    }

    @Override // android.graphics.drawable.Animatable
    public void stop() {
        synchronized (this) {
            if (this.mIsRunning) {
                this.mIsRunning = false;
                waitForPendingRenderTask();
                this.mNativeInfoHandle.saveRemainder();
            }
        }
    }

    private void waitForPendingRenderTask() {
        if (this.mSchedule != null) {
            this.mSchedule.cancel(false);
        }
        this.mInvalidationHandler.removeMessages(-1);
    }

    @Override // android.graphics.drawable.Animatable
    public boolean isRunning() {
        return this.mIsRunning;
    }

    @Nullable
    public String getComment() {
        return this.mNativeInfoHandle.getComment();
    }

    public int getLoopCount() {
        return this.mNativeInfoHandle.getLoopCount();
    }

    public void setLoopCount(@IntRange(from = 0, to = 65535) int loopCount) {
        this.mNativeInfoHandle.setLoopCount(loopCount);
    }

    public String toString() {
        return String.format(Locale.ENGLISH, "GIF: size: %dx%d, frames: %d, error: %d", Integer.valueOf(this.mNativeInfoHandle.getWidth()), Integer.valueOf(this.mNativeInfoHandle.getHeight()), Integer.valueOf(this.mNativeInfoHandle.getNumberOfFrames()), Integer.valueOf(this.mNativeInfoHandle.getNativeErrorCode()));
    }

    public int getNumberOfFrames() {
        return this.mNativeInfoHandle.getNumberOfFrames();
    }

    @NonNull
    public GifError getError() {
        return GifError.fromCode(this.mNativeInfoHandle.getNativeErrorCode());
    }

    @Nullable
    public static GifDrawable createFromResource(@NonNull Resources res, @RawRes @DrawableRes int resourceId) {
        try {
            return new GifDrawable(res, resourceId);
        } catch (IOException e) {
            return null;
        }
    }

    public void setSpeed(@FloatRange(from = 0.0d, fromInclusive = false) float factor) {
        this.mNativeInfoHandle.setSpeedFactor(factor);
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public void pause() {
        stop();
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public int getDuration() {
        return this.mNativeInfoHandle.getDuration();
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public int getCurrentPosition() {
        return this.mNativeInfoHandle.getCurrentPosition();
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public void seekTo(@IntRange(from = 0, to = 2147483647L) final int position) {
        if (position < 0) {
            throw new IllegalArgumentException("Position is not positive");
        }
        this.mExecutor.execute(new SafeRunnable(this) { // from class: pl.droidsonroids.gif.GifDrawable.2
            @Override // pl.droidsonroids.gif.SafeRunnable
            public void doWork() {
                GifDrawable.this.mNativeInfoHandle.seekToTime(position, GifDrawable.this.mBuffer);
                this.mGifDrawable.mInvalidationHandler.sendEmptyMessageAtTime(-1, 0L);
            }
        });
    }

    public void seekToFrame(@IntRange(from = 0, to = 2147483647L) final int frameIndex) {
        if (frameIndex < 0) {
            throw new IndexOutOfBoundsException("Frame index is not positive");
        }
        this.mExecutor.execute(new SafeRunnable(this) { // from class: pl.droidsonroids.gif.GifDrawable.3
            @Override // pl.droidsonroids.gif.SafeRunnable
            public void doWork() {
                GifDrawable.this.mNativeInfoHandle.seekToFrame(frameIndex, GifDrawable.this.mBuffer);
                GifDrawable.this.mInvalidationHandler.sendEmptyMessageAtTime(-1, 0L);
            }
        });
    }

    public Bitmap seekToFrameAndGet(@IntRange(from = 0, to = 2147483647L) int frameIndex) {
        Bitmap bitmap;
        if (frameIndex < 0) {
            throw new IndexOutOfBoundsException("Frame index is not positive");
        }
        synchronized (this.mNativeInfoHandle) {
            this.mNativeInfoHandle.seekToFrame(frameIndex, this.mBuffer);
            bitmap = getCurrentFrame();
        }
        this.mInvalidationHandler.sendEmptyMessageAtTime(-1, 0L);
        return bitmap;
    }

    public Bitmap seekToPositionAndGet(@IntRange(from = 0, to = 2147483647L) int position) {
        Bitmap bitmap;
        if (position < 0) {
            throw new IllegalArgumentException("Position is not positive");
        }
        synchronized (this.mNativeInfoHandle) {
            this.mNativeInfoHandle.seekToTime(position, this.mBuffer);
            bitmap = getCurrentFrame();
        }
        this.mInvalidationHandler.sendEmptyMessageAtTime(-1, 0L);
        return bitmap;
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public boolean isPlaying() {
        return this.mIsRunning;
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public int getBufferPercentage() {
        return 100;
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public boolean canPause() {
        return true;
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public boolean canSeekBackward() {
        return getNumberOfFrames() > 1;
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public boolean canSeekForward() {
        return getNumberOfFrames() > 1;
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public int getAudioSessionId() {
        return 0;
    }

    public int getFrameByteCount() {
        return this.mBuffer.getRowBytes() * this.mBuffer.getHeight();
    }

    public long getAllocationByteCount() {
        long byteCount;
        long byteCount2 = this.mNativeInfoHandle.getAllocationByteCount();
        if (Build.VERSION.SDK_INT >= 19) {
            byteCount = byteCount2 + this.mBuffer.getAllocationByteCount();
        } else {
            byteCount = byteCount2 + (this.mBuffer.getRowBytes() * this.mBuffer.getHeight());
        }
        return byteCount;
    }

    public long getInputSourceByteCount() {
        return this.mNativeInfoHandle.getSourceLength();
    }

    public void getPixels(@NonNull int[] pixels) {
        this.mBuffer.getPixels(pixels, 0, this.mNativeInfoHandle.getWidth(), 0, 0, this.mNativeInfoHandle.getWidth(), this.mNativeInfoHandle.getHeight());
    }

    public int getPixel(int x, int y) {
        if (x >= this.mNativeInfoHandle.getWidth()) {
            throw new IllegalArgumentException("x must be < width");
        }
        if (y >= this.mNativeInfoHandle.getHeight()) {
            throw new IllegalArgumentException("y must be < height");
        }
        return this.mBuffer.getPixel(x, y);
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        this.mDstRect.set(bounds);
        this.mDstRectF.set(this.mDstRect);
        Shader shader = this.mPaint.getShader();
        if (shader != null) {
            Matrix shaderMatrix = new Matrix();
            shaderMatrix.setTranslate(this.mDstRectF.left, this.mDstRectF.top);
            shaderMatrix.preScale(this.mDstRectF.width() / this.mBuffer.getWidth(), this.mDstRectF.height() / this.mBuffer.getHeight());
            shader.setLocalMatrix(shaderMatrix);
            this.mPaint.setShader(shader);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        boolean clearColorFilter;
        if (this.mTintFilter != null && this.mPaint.getColorFilter() == null) {
            this.mPaint.setColorFilter(this.mTintFilter);
            clearColorFilter = true;
        } else {
            clearColorFilter = false;
        }
        if (this.mPaint.getShader() == null) {
            canvas.drawBitmap(this.mBuffer, this.mSrcRect, this.mDstRect, this.mPaint);
        } else {
            canvas.drawRoundRect(this.mDstRectF, this.mCornerRadius, this.mCornerRadius, this.mPaint);
        }
        if (clearColorFilter) {
            this.mPaint.setColorFilter(null);
        }
        if (this.mIsRenderingTriggeredOnDraw && this.mIsRunning && this.mNextFrameRenderTime != Long.MIN_VALUE) {
            long renderDelay = Math.max(0L, this.mNextFrameRenderTime - SystemClock.uptimeMillis());
            this.mNextFrameRenderTime = Long.MIN_VALUE;
            this.mExecutor.remove(this.mRenderTask);
            this.mSchedule = this.mExecutor.schedule(this.mRenderTask, renderDelay, TimeUnit.MILLISECONDS);
        }
    }

    @NonNull
    public final Paint getPaint() {
        return this.mPaint;
    }

    @Override // android.graphics.drawable.Drawable
    public int getAlpha() {
        return this.mPaint.getAlpha();
    }

    @Override // android.graphics.drawable.Drawable
    public void setFilterBitmap(boolean filter) {
        this.mPaint.setFilterBitmap(filter);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    @Deprecated
    public void setDither(boolean dither) {
        this.mPaint.setDither(dither);
        invalidateSelf();
    }

    public void addAnimationListener(@NonNull AnimationListener listener) {
        this.mListeners.add(listener);
    }

    public boolean removeAnimationListener(AnimationListener listener) {
        return this.mListeners.remove(listener);
    }

    @Override // android.graphics.drawable.Drawable
    public ColorFilter getColorFilter() {
        return this.mPaint.getColorFilter();
    }

    public Bitmap getCurrentFrame() {
        return this.mBuffer.copy(this.mBuffer.getConfig(), this.mBuffer.isMutable());
    }

    private PorterDuffColorFilter updateTintFilter(ColorStateList tint, PorterDuff.Mode tintMode) {
        if (tint == null || tintMode == null) {
            return null;
        }
        int color = tint.getColorForState(getState(), 0);
        return new PorterDuffColorFilter(color, tintMode);
    }

    @Override // android.graphics.drawable.Drawable
    public void setTintList(ColorStateList tint) {
        this.mTint = tint;
        this.mTintFilter = updateTintFilter(tint, this.mTintMode);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public void setTintMode(@NonNull PorterDuff.Mode tintMode) {
        this.mTintMode = tintMode;
        this.mTintFilter = updateTintFilter(this.mTint, tintMode);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    protected boolean onStateChange(int[] stateSet) {
        if (this.mTint != null && this.mTintMode != null) {
            this.mTintFilter = updateTintFilter(this.mTint, this.mTintMode);
            return true;
        }
        return false;
    }

    @Override // android.graphics.drawable.Drawable
    public boolean isStateful() {
        return super.isStateful() || (this.mTint != null && this.mTint.isStateful());
    }

    @Override // android.graphics.drawable.Drawable
    public boolean setVisible(boolean visible, boolean restart) {
        boolean changed = super.setVisible(visible, restart);
        if (!this.mIsRenderingTriggeredOnDraw) {
            if (visible) {
                if (restart) {
                    reset();
                }
                if (changed) {
                    start();
                }
            } else if (changed) {
                stop();
            }
        }
        return changed;
    }

    public int getCurrentFrameIndex() {
        return this.mNativeInfoHandle.getCurrentFrameIndex();
    }

    public int getCurrentLoop() {
        int currentLoop = this.mNativeInfoHandle.getCurrentLoop();
        if (currentLoop == 0 || currentLoop < this.mNativeInfoHandle.getLoopCount()) {
            return currentLoop;
        }
        return currentLoop - 1;
    }

    public boolean isAnimationCompleted() {
        return this.mNativeInfoHandle.isAnimationCompleted();
    }

    public int getFrameDuration(@IntRange(from = 0) int index) {
        return this.mNativeInfoHandle.getFrameDuration(index);
    }

    public void setCornerRadius(@FloatRange(from = 0.0d) float cornerRadius) {
        Shader bitmapShader;
        this.mCornerRadius = cornerRadius;
        if (cornerRadius > 0.0f) {
            bitmapShader = new BitmapShader(this.mBuffer, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
        } else {
            bitmapShader = null;
        }
        this.mPaint.setShader(bitmapShader);
    }

    @FloatRange(from = 0.0d)
    public float getCornerRadius() {
        return this.mCornerRadius;
    }
}
