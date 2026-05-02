package org.osmdroid.views.overlay;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.os.Build;
import android.util.DisplayMetrics;
import android.view.WindowManager;
import java.lang.reflect.Field;
import org.osmdroid.DefaultResourceProxyImpl;
import org.osmdroid.ResourceProxy;
import org.osmdroid.api.IGeoPoint;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.util.constants.GeoConstants;
import org.osmdroid.views.MapView;
import org.osmdroid.views.Projection;
import org.osmdroid.views.util.constants.MapViewConstants;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/overlay/ScaleBarOverlay.class */
public class ScaleBarOverlay extends Overlay implements GeoConstants {
    private static final Rect sTextBoundsRect = new Rect();
    int xOffset;
    int yOffset;
    int minZoom;
    UnitsOfMeasure unitsOfMeasure;
    boolean latitudeBar;
    boolean longitudeBar;
    private final Context context;
    protected final Path barPath;
    protected final Rect latitudeBarRect;
    protected final Rect longitudeBarRect;
    private int lastZoomLevel;
    private float lastLatitude;
    public float xdpi;
    public float ydpi;
    public int screenWidth;
    public int screenHeight;
    private final ResourceProxy resourceProxy;
    private Paint barPaint;
    private Paint bgPaint;
    private Paint textPaint;
    private boolean centred;
    private boolean adjustLength;
    private float maxLength;

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure.class */
    public enum UnitsOfMeasure {
        metric,
        imperial,
        nautical
    }

    public ScaleBarOverlay(Context context) {
        this(context, new DefaultResourceProxyImpl(context));
    }

    public ScaleBarOverlay(Context context, ResourceProxy pResourceProxy) {
        super(pResourceProxy);
        this.xOffset = 10;
        this.yOffset = 10;
        this.minZoom = 0;
        this.unitsOfMeasure = UnitsOfMeasure.metric;
        this.latitudeBar = true;
        this.longitudeBar = false;
        this.barPath = new Path();
        this.latitudeBarRect = new Rect();
        this.longitudeBarRect = new Rect();
        this.lastZoomLevel = -1;
        this.lastLatitude = 0.0f;
        this.centred = false;
        this.adjustLength = false;
        this.resourceProxy = pResourceProxy;
        this.context = context;
        DisplayMetrics dm = context.getResources().getDisplayMetrics();
        this.barPaint = new Paint();
        this.barPaint.setColor(-16777216);
        this.barPaint.setAntiAlias(true);
        this.barPaint.setStyle(Paint.Style.STROKE);
        this.barPaint.setAlpha(255);
        this.barPaint.setStrokeWidth(2.0f * dm.density);
        this.bgPaint = null;
        this.textPaint = new Paint();
        this.textPaint.setColor(-16777216);
        this.textPaint.setAntiAlias(true);
        this.textPaint.setStyle(Paint.Style.FILL);
        this.textPaint.setAlpha(255);
        this.textPaint.setTextSize(10.0f * dm.density);
        this.xdpi = dm.xdpi;
        this.ydpi = dm.ydpi;
        this.screenWidth = dm.widthPixels;
        this.screenHeight = dm.heightPixels;
        String manufacturer = null;
        try {
            Field field = Build.class.getField("MANUFACTURER");
            manufacturer = (String) field.get(null);
        } catch (Exception e) {
        }
        if ("motorola".equals(manufacturer) && "DROIDX".equals(Build.MODEL)) {
            WindowManager windowManager = (WindowManager) this.context.getSystemService("window");
            if (windowManager.getDefaultDisplay().getOrientation() > 0) {
                this.xdpi = (float) (this.screenWidth / 3.75d);
                this.ydpi = (float) (this.screenHeight / 2.1d);
            } else {
                this.xdpi = (float) (this.screenWidth / 2.1d);
                this.ydpi = (float) (this.screenHeight / 3.75d);
            }
        } else if ("motorola".equals(manufacturer) && "Droid".equals(Build.MODEL)) {
            this.xdpi = 264.0f;
            this.ydpi = 264.0f;
        }
        this.maxLength = 2.54f;
    }

    public void setMinZoom(int zoom) {
        this.minZoom = zoom;
    }

    public void setScaleBarOffset(int x, int y) {
        this.xOffset = x;
        this.yOffset = y;
    }

    public void setLineWidth(float width) {
        this.barPaint.setStrokeWidth(width);
    }

    public void setTextSize(float size) {
        this.textPaint.setTextSize(size);
    }

    public void setUnitsOfMeasure(UnitsOfMeasure unitsOfMeasure) {
        this.unitsOfMeasure = unitsOfMeasure;
        this.lastZoomLevel = -1;
    }

    public UnitsOfMeasure getUnitsOfMeasure() {
        return this.unitsOfMeasure;
    }

    public void drawLatitudeScale(boolean latitude) {
        this.latitudeBar = latitude;
        this.lastZoomLevel = -1;
    }

    public void drawLongitudeScale(boolean longitude) {
        this.longitudeBar = longitude;
        this.lastZoomLevel = -1;
    }

    public void setCentred(boolean centred) {
        this.centred = centred;
        this.lastZoomLevel = -1;
    }

    public Paint getBarPaint() {
        return this.barPaint;
    }

    public void setBarPaint(Paint pBarPaint) {
        if (pBarPaint == null) {
            throw new IllegalArgumentException("pBarPaint argument cannot be null");
        }
        this.barPaint = pBarPaint;
        this.lastZoomLevel = -1;
    }

    public Paint getTextPaint() {
        return this.textPaint;
    }

    public void setTextPaint(Paint pTextPaint) {
        if (pTextPaint == null) {
            throw new IllegalArgumentException("pTextPaint argument cannot be null");
        }
        this.textPaint = pTextPaint;
        this.lastZoomLevel = -1;
    }

    public void setBackgroundPaint(Paint pBgPaint) {
        this.bgPaint = pBgPaint;
        this.lastZoomLevel = -1;
    }

    public void setEnableAdjustLength(boolean adjustLength) {
        this.adjustLength = adjustLength;
        this.lastZoomLevel = -1;
    }

    public void setMaxLength(float pMaxLengthInCm) {
        this.maxLength = pMaxLengthInCm;
        this.lastZoomLevel = -1;
    }

    @Override // org.osmdroid.views.overlay.Overlay
    protected void draw(Canvas c, MapView mapView, boolean shadow) {
        int zoomLevel;
        Projection projection;
        if (shadow || mapView.isAnimating() || (zoomLevel = mapView.getZoomLevel()) < this.minZoom || (projection = mapView.getProjection()) == null) {
            return;
        }
        IGeoPoint center = projection.fromPixels(this.screenWidth / 2, this.screenHeight / 2, null);
        if (zoomLevel != this.lastZoomLevel || ((int) (center.getLatitudeE6() / 1000000.0d)) != ((int) (this.lastLatitude / 1000000.0d))) {
            this.lastZoomLevel = zoomLevel;
            this.lastLatitude = center.getLatitudeE6();
            rebuildBarPath(projection);
        }
        int offsetX = this.xOffset;
        int offsetY = this.yOffset;
        if (this.centred && this.latitudeBar) {
            offsetX += (-this.latitudeBarRect.width()) / 2;
        }
        if (this.centred && this.longitudeBar) {
            offsetY += (-this.longitudeBarRect.height()) / 2;
        }
        c.save();
        c.concat(projection.getInvertedScaleRotateCanvasMatrix());
        c.translate(offsetX, offsetY);
        if (this.latitudeBar && this.bgPaint != null) {
            c.drawRect(this.latitudeBarRect, this.bgPaint);
        }
        if (this.longitudeBar && this.bgPaint != null) {
            int offsetTop = this.latitudeBar ? this.latitudeBarRect.height() : 0;
            c.drawRect(this.longitudeBarRect.left, this.longitudeBarRect.top + offsetTop, this.longitudeBarRect.right, this.longitudeBarRect.bottom, this.bgPaint);
        }
        c.drawPath(this.barPath, this.barPaint);
        if (this.latitudeBar) {
            drawLatitudeText(c, projection);
        }
        if (this.longitudeBar) {
            drawLongitudeText(c, projection);
        }
        c.restore();
    }

    public void disableScaleBar() {
        setEnabled(false);
    }

    public void enableScaleBar() {
        setEnabled(true);
    }

    private void drawLatitudeText(Canvas canvas, Projection projection) {
        int xdpcm = (int) (this.xdpi / 2.54d);
        int xLen = (int) (this.maxLength * xdpcm);
        IGeoPoint p1 = projection.fromPixels((this.screenWidth / 2) - (xLen / 2), this.yOffset, null);
        IGeoPoint p2 = projection.fromPixels((this.screenWidth / 2) + (xLen / 2), this.yOffset, null);
        int xMeters = ((GeoPoint) p1).distanceTo(p2);
        double xMetersAdjusted = this.adjustLength ? adjustScaleBarLength(xMeters) : xMeters;
        int xBarLengthPixels = (int) ((xLen * xMetersAdjusted) / xMeters);
        String xMsg = scaleBarLengthText((int) xMetersAdjusted);
        this.textPaint.getTextBounds(xMsg, 0, xMsg.length(), sTextBoundsRect);
        int xTextSpacing = (int) (sTextBoundsRect.height() / 5.0d);
        float x = (xBarLengthPixels / 2) - (sTextBoundsRect.width() / 2);
        float y = sTextBoundsRect.height() + xTextSpacing;
        canvas.drawText(xMsg, x, y, this.textPaint);
    }

    private void drawLongitudeText(Canvas canvas, Projection projection) {
        int ydpcm = (int) (this.ydpi / 2.54d);
        int yLen = (int) (this.maxLength * ydpcm);
        IGeoPoint p1 = projection.fromPixels(this.screenWidth / 2, (this.screenHeight / 2) - (yLen / 2), null);
        IGeoPoint p2 = projection.fromPixels(this.screenWidth / 2, (this.screenHeight / 2) + (yLen / 2), null);
        int yMeters = ((GeoPoint) p1).distanceTo(p2);
        double yMetersAdjusted = this.adjustLength ? adjustScaleBarLength(yMeters) : yMeters;
        int yBarLengthPixels = (int) ((yLen * yMetersAdjusted) / yMeters);
        String yMsg = scaleBarLengthText((int) yMetersAdjusted);
        this.textPaint.getTextBounds(yMsg, 0, yMsg.length(), sTextBoundsRect);
        int yTextSpacing = (int) (sTextBoundsRect.height() / 5.0d);
        float x = sTextBoundsRect.height() + yTextSpacing;
        float y = (yBarLengthPixels / 2) + (sTextBoundsRect.width() / 2);
        canvas.save();
        canvas.rotate(-90.0f, x, y);
        canvas.drawText(yMsg, x, y, this.textPaint);
        canvas.restore();
    }

    private void rebuildBarPath(Projection projection) {
        int xdpcm = (int) (this.xdpi / 2.54d);
        int ydpcm = (int) (this.ydpi / 2.54d);
        int xLen = (int) (this.maxLength * xdpcm);
        int yLen = (int) (this.maxLength * ydpcm);
        IGeoPoint p1 = projection.fromPixels((this.screenWidth / 2) - (xLen / 2), this.yOffset, null);
        IGeoPoint p2 = projection.fromPixels((this.screenWidth / 2) + (xLen / 2), this.yOffset, null);
        int xMeters = ((GeoPoint) p1).distanceTo(p2);
        double xMetersAdjusted = this.adjustLength ? adjustScaleBarLength(xMeters) : xMeters;
        int xBarLengthPixels = (int) ((xLen * xMetersAdjusted) / xMeters);
        IGeoPoint p12 = projection.fromPixels(this.screenWidth / 2, (this.screenHeight / 2) - (yLen / 2), null);
        IGeoPoint p22 = projection.fromPixels(this.screenWidth / 2, (this.screenHeight / 2) + (yLen / 2), null);
        int yMeters = ((GeoPoint) p12).distanceTo(p22);
        double yMetersAdjusted = this.adjustLength ? adjustScaleBarLength(yMeters) : yMeters;
        int yBarLengthPixels = (int) ((yLen * yMetersAdjusted) / yMeters);
        String xMsg = scaleBarLengthText((int) xMetersAdjusted);
        Rect xTextRect = new Rect();
        this.textPaint.getTextBounds(xMsg, 0, xMsg.length(), xTextRect);
        int xTextSpacing = (int) (xTextRect.height() / 5.0d);
        String yMsg = scaleBarLengthText((int) yMetersAdjusted);
        Rect yTextRect = new Rect();
        this.textPaint.getTextBounds(yMsg, 0, yMsg.length(), yTextRect);
        int yTextSpacing = (int) (yTextRect.height() / 5.0d);
        this.barPath.rewind();
        if (this.latitudeBar) {
            this.barPath.moveTo(xBarLengthPixels, xTextRect.height() + (xTextSpacing * 2));
            this.barPath.lineTo(xBarLengthPixels, 0.0f);
            this.barPath.lineTo(0.0f, 0.0f);
            if (!this.longitudeBar) {
                this.barPath.lineTo(0.0f, xTextRect.height() + (xTextSpacing * 2));
            }
            this.latitudeBarRect.set(0, 0, xBarLengthPixels, xTextRect.height() + (xTextSpacing * 2));
        }
        if (this.longitudeBar) {
            if (!this.latitudeBar) {
                this.barPath.moveTo(yTextRect.height() + (yTextSpacing * 2), 0.0f);
                this.barPath.lineTo(0.0f, 0.0f);
            }
            this.barPath.lineTo(0.0f, yBarLengthPixels);
            this.barPath.lineTo(yTextRect.height() + (yTextSpacing * 2), yBarLengthPixels);
            this.longitudeBarRect.set(0, 0, yTextRect.height() + (yTextSpacing * 2), yBarLengthPixels);
        }
    }

    private double adjustScaleBarLength(double length) {
        double length2;
        long pow = 0;
        boolean feet = false;
        if (this.unitsOfMeasure == UnitsOfMeasure.imperial) {
            if (length >= 321.8688d) {
                length /= 1609.344d;
            } else {
                length *= 3.2808399d;
                feet = true;
            }
        } else if (this.unitsOfMeasure == UnitsOfMeasure.nautical) {
            if (length >= 370.4d) {
                length /= 1852.0d;
            } else {
                length *= 3.2808399d;
                feet = true;
            }
        }
        while (length >= 10.0d) {
            pow++;
            length /= 10.0d;
        }
        while (length < 1.0d && length > 0.0d) {
            pow--;
            length *= 10.0d;
        }
        if (length < 2.0d) {
            length2 = 1.0d;
        } else if (length < 5.0d) {
            length2 = 2.0d;
        } else {
            length2 = 5.0d;
        }
        if (feet) {
            length2 /= 3.2808399d;
        } else if (this.unitsOfMeasure == UnitsOfMeasure.imperial) {
            length2 *= 1609.344d;
        } else if (this.unitsOfMeasure == UnitsOfMeasure.nautical) {
            length2 *= 1852.0d;
        }
        return length2 * Math.pow(10.0d, pow);
    }

    protected String scaleBarLengthText(int meters) {
        switch (this.unitsOfMeasure) {
            case metric:
            default:
                return meters >= 5000 ? this.resourceProxy.getString(ResourceProxy.string.format_distance_kilometers, Integer.valueOf(meters / MapViewConstants.ANIMATION_DURATION_DEFAULT)) : meters >= 200 ? this.resourceProxy.getString(ResourceProxy.string.format_distance_kilometers, Double.valueOf(((int) (meters / 100.0d)) / 10.0d)) : this.resourceProxy.getString(ResourceProxy.string.format_distance_meters, Integer.valueOf(meters));
            case imperial:
                return ((double) meters) >= 8046.72d ? this.resourceProxy.getString(ResourceProxy.string.format_distance_miles, Integer.valueOf((int) (meters / 1609.344d))) : ((double) meters) >= 321.8688d ? this.resourceProxy.getString(ResourceProxy.string.format_distance_miles, Double.valueOf(((int) (meters / 160.9344d)) / 10.0d)) : this.resourceProxy.getString(ResourceProxy.string.format_distance_feet, Integer.valueOf((int) (meters * 3.2808399d)));
            case nautical:
                return ((double) meters) >= 9260.0d ? this.resourceProxy.getString(ResourceProxy.string.format_distance_nautical_miles, Integer.valueOf((int) (meters / 1852.0d))) : ((double) meters) >= 370.4d ? this.resourceProxy.getString(ResourceProxy.string.format_distance_nautical_miles, Double.valueOf(((int) (meters / 185.2d)) / 10.0d)) : this.resourceProxy.getString(ResourceProxy.string.format_distance_feet, Integer.valueOf((int) (meters * 3.2808399d)));
        }
    }
}
