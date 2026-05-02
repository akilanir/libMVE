package org.osmdroid.events;

import android.os.Handler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/events/DelayedMapListener.class */
public class DelayedMapListener implements MapListener {
    private static final Logger logger = LoggerFactory.getLogger(DelayedMapListener.class);
    protected static final int DEFAULT_DELAY = 100;
    MapListener wrappedListener;
    protected long delay;
    protected Handler handler;
    protected CallbackTask callback;

    public DelayedMapListener(MapListener wrappedListener, long delay) {
        this.wrappedListener = wrappedListener;
        this.delay = delay;
        this.handler = new Handler();
        this.callback = null;
    }

    public DelayedMapListener(MapListener wrappedListener) {
        this(wrappedListener, 100L);
    }

    @Override // org.osmdroid.events.MapListener
    public boolean onScroll(ScrollEvent event) {
        dispatch(event);
        return true;
    }

    @Override // org.osmdroid.events.MapListener
    public boolean onZoom(ZoomEvent event) {
        dispatch(event);
        return true;
    }

    protected void dispatch(MapEvent event) {
        if (this.callback != null) {
            this.handler.removeCallbacks(this.callback);
        }
        this.callback = new CallbackTask(event);
        this.handler.postDelayed(this.callback, this.delay);
    }

    /* loaded from: osmdroid-android-4.3.jar:org/osmdroid/events/DelayedMapListener$CallbackTask.class */
    private class CallbackTask implements Runnable {
        private final MapEvent event;

        public CallbackTask(MapEvent event) {
            this.event = event;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.event instanceof ScrollEvent) {
                DelayedMapListener.this.wrappedListener.onScroll((ScrollEvent) this.event);
            } else if (!(this.event instanceof ZoomEvent)) {
                DelayedMapListener.logger.debug("Unknown event received: " + this.event);
            } else {
                DelayedMapListener.this.wrappedListener.onZoom((ZoomEvent) this.event);
            }
        }
    }
}
