package retrofit.android;

import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.Executor;

/* loaded from: retrofit-1.9.0.jar:retrofit/android/MainThreadExecutor.class */
public final class MainThreadExecutor implements Executor {
    private final Handler handler = new Handler(Looper.getMainLooper());

    @Override // java.util.concurrent.Executor
    public void execute(Runnable r) {
        this.handler.post(r);
    }
}
