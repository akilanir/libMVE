package ch.qos.logback.core.rolling.helper;

import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.ScheduledExecutorService;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/rolling/helper/AsynchronousCompressor.class */
public class AsynchronousCompressor {
    Compressor compressor;

    public AsynchronousCompressor(Compressor compressor) {
        this.compressor = compressor;
    }

    public Future<?> compressAsynchronously(String str, String str2, String str3) {
        ScheduledExecutorService newScheduledThreadPool = Executors.newScheduledThreadPool(1);
        Future<?> submit = newScheduledThreadPool.submit(new CompressionRunnable(this.compressor, str, str2, str3));
        newScheduledThreadPool.shutdown();
        return submit;
    }
}
