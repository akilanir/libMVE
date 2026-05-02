package org.osmdroid.events;

import android.os.Handler;
import android.util.Log;
import org.osmdroid.api.IMapView;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/events/DelayedMapListener.class */
public class DelayedMapListener implements MapListener {
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

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/events/DelayedMapListener$CallbackTask.class */
    private class CallbackTask implements Runnable {
        private final MapEvent event;

        public CallbackTask(MapEvent event) {
            this.event = event;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.event instanceof ScrollEvent) {
                DelayedMapListener.this.wrappedListener.onScroll((ScrollEvent) this.event);
            } else if (this.event instanceof ZoomEvent) {
                DelayedMapListener.this.wrappedListener.onZoom((ZoomEvent) this.event);
            } else {
                Log.d(IMapView.LOGTAG, "Unknown event received: " + this.event);
            }
        }
    }
}
