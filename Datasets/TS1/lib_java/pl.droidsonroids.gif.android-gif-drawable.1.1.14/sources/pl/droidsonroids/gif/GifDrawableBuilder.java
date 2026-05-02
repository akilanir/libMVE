package pl.droidsonroids.gif;

import android.content.ContentResolver;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.content.res.Resources;
import android.net.Uri;
import java.io.File;
import java.io.FileDescriptor;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import pl.droidsonroids.gif.InputSource;

/* loaded from: pl.droidsonroids.gif.android-gif-drawable.1.1.14.jar:pl/droidsonroids/gif/GifDrawableBuilder.class */
public class GifDrawableBuilder {
    private InputSource mInputSource;
    private GifDrawable mOldDrawable;
    private ScheduledThreadPoolExecutor mExecutor;
    private int mSampleSize = 1;
    private boolean mIsRenderingTriggeredOnDraw = true;

    public void sampleSize(int sampleSize) {
        this.mSampleSize = sampleSize;
    }

    public GifDrawable build() throws IOException {
        if (this.mInputSource == null) {
            throw new NullPointerException("Source is not set");
        }
        return this.mInputSource.build(this.mOldDrawable, this.mExecutor, this.mIsRenderingTriggeredOnDraw, this.mSampleSize);
    }

    public GifDrawableBuilder with(GifDrawable drawable) {
        this.mOldDrawable = drawable;
        return this;
    }

    public GifDrawableBuilder threadPoolSize(int threadPoolSize) {
        this.mExecutor = new ScheduledThreadPoolExecutor(threadPoolSize);
        return this;
    }

    public GifDrawableBuilder taskExecutor(ScheduledThreadPoolExecutor executor) {
        this.mExecutor = executor;
        return this;
    }

    public GifDrawableBuilder setRenderingTriggeredOnDraw(boolean isRenderingTriggeredOnDraw) {
        this.mIsRenderingTriggeredOnDraw = isRenderingTriggeredOnDraw;
        return this;
    }

    public GifDrawableBuilder from(InputStream inputStream) {
        this.mInputSource = new InputSource.InputStreamSource(inputStream);
        return this;
    }

    public GifDrawableBuilder from(AssetFileDescriptor assetFileDescriptor) {
        this.mInputSource = new InputSource.AssetFileDescriptorSource(assetFileDescriptor);
        return this;
    }

    public GifDrawableBuilder from(FileDescriptor fileDescriptor) {
        this.mInputSource = new InputSource.FileDescriptorSource(fileDescriptor);
        return this;
    }

    public GifDrawableBuilder from(AssetManager assetManager, String assetName) {
        this.mInputSource = new InputSource.AssetSource(assetManager, assetName);
        return this;
    }

    public GifDrawableBuilder from(ContentResolver contentResolver, Uri uri) {
        this.mInputSource = new InputSource.UriSource(contentResolver, uri);
        return this;
    }

    public GifDrawableBuilder from(File file) {
        this.mInputSource = new InputSource.FileSource(file);
        return this;
    }

    public GifDrawableBuilder from(String filePath) {
        this.mInputSource = new InputSource.FileSource(filePath);
        return this;
    }

    public GifDrawableBuilder from(byte[] bytes) {
        this.mInputSource = new InputSource.ByteArraySource(bytes);
        return this;
    }

    public GifDrawableBuilder from(ByteBuffer byteBuffer) {
        this.mInputSource = new InputSource.DirectByteBufferSource(byteBuffer);
        return this;
    }

    public GifDrawableBuilder from(Resources resources, int resourceId) {
        this.mInputSource = new InputSource.ResourcesSource(resources, resourceId);
        return this;
    }
}
