package org.osmdroid.views.overlay;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Point;
import org.osmdroid.DefaultResourceProxyImpl;
import org.osmdroid.ResourceProxy;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.views.MapView;
import org.osmdroid.views.Projection;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/views/overlay/SimpleLocationOverlay.class */
public class SimpleLocationOverlay extends Overlay {
    protected final Paint mPaint;
    protected final Bitmap PERSON_ICON;
    protected final Point PERSON_HOTSPOT;
    protected GeoPoint mLocation;
    private final Point screenCoords;

    public SimpleLocationOverlay(Context ctx) {
        this(ctx, new DefaultResourceProxyImpl(ctx));
    }

    public SimpleLocationOverlay(Context ctx, ResourceProxy pResourceProxy) {
        super(pResourceProxy);
        this.mPaint = new Paint();
        this.PERSON_HOTSPOT = new Point(24, 39);
        this.screenCoords = new Point();
        this.PERSON_ICON = this.mResourceProxy.getBitmap(ResourceProxy.bitmap.person);
    }

    public void setLocation(GeoPoint mp) {
        this.mLocation = mp;
    }

    public GeoPoint getMyLocation() {
        return this.mLocation;
    }

    @Override // org.osmdroid.views.overlay.Overlay
    public void draw(Canvas c, MapView osmv, boolean shadow) {
        if (!shadow && this.mLocation != null) {
            Projection pj = osmv.getProjection();
            pj.toPixels(this.mLocation, this.screenCoords);
            c.drawBitmap(this.PERSON_ICON, this.screenCoords.x - this.PERSON_HOTSPOT.x, this.screenCoords.y - this.PERSON_HOTSPOT.y, this.mPaint);
        }
    }
}
