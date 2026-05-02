package pl.droidsonroids.gif;

import java.lang.Thread;

/* loaded from: pl.droidsonroids.gif.android-gif-drawable.1.1.14.jar:pl/droidsonroids/gif/SafeRunnable.class */
abstract class SafeRunnable implements Runnable {
    final GifDrawable mGifDrawable;

    abstract void doWork();

    SafeRunnable(GifDrawable gifDrawable) {
        this.mGifDrawable = gifDrawable;
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            if (!this.mGifDrawable.isRecycled()) {
                doWork();
            }
        } catch (Throwable throwable) {
            Thread.UncaughtExceptionHandler uncaughtExceptionHandler = Thread.getDefaultUncaughtExceptionHandler();
            if (uncaughtExceptionHandler != null) {
                uncaughtExceptionHandler.uncaughtException(Thread.currentThread(), throwable);
            }
            throw throwable;
        }
    }
}
