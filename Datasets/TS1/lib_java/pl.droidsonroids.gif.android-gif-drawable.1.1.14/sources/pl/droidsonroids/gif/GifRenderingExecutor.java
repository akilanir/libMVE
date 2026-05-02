package pl.droidsonroids.gif;

import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.ThreadPoolExecutor;

/* loaded from: pl.droidsonroids.gif.android-gif-drawable.1.1.14.jar:pl/droidsonroids/gif/GifRenderingExecutor.class */
final class GifRenderingExecutor extends ScheduledThreadPoolExecutor {
    private static volatile GifRenderingExecutor instance = null;

    private GifRenderingExecutor() {
        super(1, new ThreadPoolExecutor.DiscardPolicy());
    }

    public static GifRenderingExecutor getInstance() {
        if (instance == null) {
            synchronized (GifRenderingExecutor.class) {
                if (instance == null) {
                    instance = new GifRenderingExecutor();
                }
            }
        }
        return instance;
    }
}
