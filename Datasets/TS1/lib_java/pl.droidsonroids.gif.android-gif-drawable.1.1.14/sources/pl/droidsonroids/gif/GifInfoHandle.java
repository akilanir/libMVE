package pl.droidsonroids.gif;

import android.content.ContentResolver;
import android.content.res.AssetFileDescriptor;
import android.graphics.Bitmap;
import android.net.Uri;
import android.support.annotation.FloatRange;
import android.support.annotation.IntRange;
import android.view.Surface;
import java.io.FileDescriptor;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;

/* loaded from: pl.droidsonroids.gif.android-gif-drawable.1.1.14.jar:pl/droidsonroids/gif/GifInfoHandle.class */
final class GifInfoHandle {
    private volatile long gifInfoPtr;
    static final GifInfoHandle NULL_INFO = new GifInfoHandle();

    static native long openFd(FileDescriptor fileDescriptor, long j, boolean z) throws GifIOException;

    static native long openByteArray(byte[] bArr, boolean z) throws GifIOException;

    static native long openDirectByteBuffer(ByteBuffer byteBuffer, boolean z) throws GifIOException;

    static native long openStream(InputStream inputStream, boolean z) throws GifIOException;

    static native long openFile(String str, boolean z) throws GifIOException;

    private static native long renderFrame(long j, Bitmap bitmap);

    private static native void bindSurface(long j, Surface surface, long[] jArr, boolean z);

    private static native void free(long j);

    private static native boolean reset(long j);

    private static native void setSpeedFactor(long j, float f);

    private static native String getComment(long j);

    private static native int getLoopCount(long j);

    private static native void setLoopCount(long j, int i);

    private static native long getSourceLength(long j);

    private static native int getDuration(long j);

    private static native int getCurrentPosition(long j);

    private static native void seekToTime(long j, int i, Bitmap bitmap);

    private static native void seekToFrame(long j, int i, Bitmap bitmap);

    private static native void saveRemainder(long j);

    private static native long restoreRemainder(long j);

    private static native long getAllocationByteCount(long j);

    private static native int getNativeErrorCode(long j);

    private static native int getCurrentFrameIndex(long j);

    private static native int getCurrentLoop(long j);

    private static native void postUnbindSurface(long j);

    private static native boolean isAnimationCompleted(long j);

    private static native long[] getSavedState(long j);

    private static native int restoreSavedState(long j, long[] jArr, Bitmap bitmap);

    private static native int getFrameDuration(long j, int i);

    private static native int setSampleSize(long j, int i);

    private static native int getWidth(long j);

    private static native int getHeight(long j);

    private static native int getNumberOfFrames(long j);

    static {
        LibraryLoader.loadLibrary(null, "pl_droidsonroids_gif");
    }

    private GifInfoHandle() {
    }

    GifInfoHandle(FileDescriptor fd, long offset, boolean justDecodeMetaData) throws GifIOException {
        this.gifInfoPtr = openFd(fd, offset, justDecodeMetaData);
    }

    GifInfoHandle(byte[] bytes, boolean justDecodeMetaData) throws GifIOException {
        this.gifInfoPtr = openByteArray(bytes, justDecodeMetaData);
    }

    GifInfoHandle(ByteBuffer buffer, boolean justDecodeMetaData) throws GifIOException {
        this.gifInfoPtr = openDirectByteBuffer(buffer, justDecodeMetaData);
    }

    GifInfoHandle(String filePath, boolean justDecodeMetaData) throws GifIOException {
        this.gifInfoPtr = openFile(filePath, justDecodeMetaData);
    }

    GifInfoHandle(InputStream stream, boolean justDecodeMetaData) throws GifIOException {
        if (!stream.markSupported()) {
            throw new IllegalArgumentException("InputStream does not support marking");
        }
        this.gifInfoPtr = openStream(stream, justDecodeMetaData);
    }

    GifInfoHandle(AssetFileDescriptor afd, boolean justDecodeMetaData) throws IOException {
        try {
            this.gifInfoPtr = openFd(afd.getFileDescriptor(), afd.getStartOffset(), justDecodeMetaData);
        } finally {
            afd.close();
        }
    }

    static GifInfoHandle openUri(ContentResolver resolver, Uri uri, boolean justDecodeMetaData) throws IOException {
        if ("file".equals(uri.getScheme())) {
            return new GifInfoHandle(uri.getPath(), justDecodeMetaData);
        }
        return new GifInfoHandle(resolver.openAssetFileDescriptor(uri, "r"), justDecodeMetaData);
    }

    synchronized long renderFrame(Bitmap frameBuffer) {
        return renderFrame(this.gifInfoPtr, frameBuffer);
    }

    void bindSurface(Surface surface, long[] savedState, boolean isOpaque) {
        bindSurface(this.gifInfoPtr, surface, savedState, isOpaque);
    }

    synchronized void recycle() {
        free(this.gifInfoPtr);
        this.gifInfoPtr = 0L;
    }

    synchronized long restoreRemainder() {
        return restoreRemainder(this.gifInfoPtr);
    }

    synchronized boolean reset() {
        return reset(this.gifInfoPtr);
    }

    synchronized void saveRemainder() {
        saveRemainder(this.gifInfoPtr);
    }

    synchronized String getComment() {
        return getComment(this.gifInfoPtr);
    }

    synchronized int getLoopCount() {
        return getLoopCount(this.gifInfoPtr);
    }

    void setLoopCount(@IntRange(from = 0, to = 65535) int loopCount) {
        if (loopCount < 0 || loopCount > 65535) {
            throw new IllegalArgumentException("Loop count of range <0, 65535>");
        }
        synchronized (this) {
            setLoopCount(this.gifInfoPtr, loopCount);
        }
    }

    synchronized long getSourceLength() {
        return getSourceLength(this.gifInfoPtr);
    }

    synchronized int getNativeErrorCode() {
        return getNativeErrorCode(this.gifInfoPtr);
    }

    void setSpeedFactor(@FloatRange(from = 0.0d, fromInclusive = false) float factor) {
        if (factor <= 0.0f || Float.isNaN(factor)) {
            throw new IllegalArgumentException("Speed factor is not positive");
        }
        if (factor < 4.656613E-10f) {
            factor = 4.656613E-10f;
        }
        synchronized (this) {
            setSpeedFactor(this.gifInfoPtr, factor);
        }
    }

    synchronized int getDuration() {
        return getDuration(this.gifInfoPtr);
    }

    synchronized int getCurrentPosition() {
        return getCurrentPosition(this.gifInfoPtr);
    }

    synchronized int getCurrentFrameIndex() {
        return getCurrentFrameIndex(this.gifInfoPtr);
    }

    synchronized int getCurrentLoop() {
        return getCurrentLoop(this.gifInfoPtr);
    }

    synchronized void seekToTime(@IntRange(from = 0, to = 2147483647L) int position, Bitmap buffer) {
        seekToTime(this.gifInfoPtr, position, buffer);
    }

    synchronized void seekToFrame(@IntRange(from = 0, to = 2147483647L) int frameIndex, Bitmap buffer) {
        seekToFrame(this.gifInfoPtr, frameIndex, buffer);
    }

    synchronized long getAllocationByteCount() {
        return getAllocationByteCount(this.gifInfoPtr);
    }

    synchronized boolean isRecycled() {
        return this.gifInfoPtr == 0;
    }

    protected void finalize() throws Throwable {
        try {
            recycle();
        } finally {
            super.finalize();
        }
    }

    synchronized void postUnbindSurface() {
        postUnbindSurface(this.gifInfoPtr);
    }

    synchronized boolean isAnimationCompleted() {
        return isAnimationCompleted(this.gifInfoPtr);
    }

    synchronized long[] getSavedState() {
        return getSavedState(this.gifInfoPtr);
    }

    synchronized int restoreSavedState(long[] savedState, Bitmap mBuffer) {
        return restoreSavedState(this.gifInfoPtr, savedState, mBuffer);
    }

    int getFrameDuration(@IntRange(from = 0) int index) {
        int frameDuration;
        synchronized (this) {
            if (index >= 0) {
                if (index < getNumberOfFrames(this.gifInfoPtr)) {
                    frameDuration = getFrameDuration(this.gifInfoPtr, index);
                }
            }
            throw new IndexOutOfBoundsException("Frame index is out of bounds");
        }
        return frameDuration;
    }

    void setSampleSize(int sampleSize) {
        setSampleSize(this.gifInfoPtr, sampleSize);
    }

    synchronized int getWidth() {
        return getWidth(this.gifInfoPtr);
    }

    synchronized int getHeight() {
        return getHeight(this.gifInfoPtr);
    }

    synchronized int getNumberOfFrames() {
        return getNumberOfFrames(this.gifInfoPtr);
    }
}
