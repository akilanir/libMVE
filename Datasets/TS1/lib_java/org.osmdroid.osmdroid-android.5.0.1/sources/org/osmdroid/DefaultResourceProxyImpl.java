package org.osmdroid;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.util.DisplayMetrics;
import android.util.Log;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import org.osmdroid.ResourceProxy;
import org.osmdroid.api.IMapView;
import org.osmdroid.views.MapView;
import org.osmdroid.views.util.constants.MapViewConstants;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/DefaultResourceProxyImpl.class */
public class DefaultResourceProxyImpl implements ResourceProxy, MapViewConstants {
    private Resources mResources;
    private DisplayMetrics mDisplayMetrics;

    public DefaultResourceProxyImpl(Context pContext) {
        if (pContext != null) {
            this.mResources = pContext.getResources();
            this.mDisplayMetrics = this.mResources.getDisplayMetrics();
        }
    }

    /* renamed from: org.osmdroid.DefaultResourceProxyImpl$1, reason: invalid class name */
    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/DefaultResourceProxyImpl$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$org$osmdroid$ResourceProxy$string = new int[ResourceProxy.string.values().length];

        static {
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.unknown.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.format_distance_meters.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.format_distance_kilometers.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.format_distance_miles.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.format_distance_nautical_miles.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.format_distance_feet.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.online_mode.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.offline_mode.ordinal()] = 8;
            } catch (NoSuchFieldError e8) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.my_location.ordinal()] = 9;
            } catch (NoSuchFieldError e9) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.compass.ordinal()] = 10;
            } catch (NoSuchFieldError e10) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.map_mode.ordinal()] = 11;
            } catch (NoSuchFieldError e11) {
            }
        }
    }

    @Override // org.osmdroid.ResourceProxy
    public String getString(ResourceProxy.string pResId) {
        switch (AnonymousClass1.$SwitchMap$org$osmdroid$ResourceProxy$string[pResId.ordinal()]) {
            case 1:
                return "Unknown";
            case 2:
                return "%s m";
            case 3:
                return "%s km";
            case 4:
                return "%s mi";
            case MapView.LayoutParams.CENTER /* 5 */:
                return "%s nm";
            case MapView.LayoutParams.CENTER_RIGHT /* 6 */:
                return "%s ft";
            case MapView.LayoutParams.BOTTOM_LEFT /* 7 */:
                return "Online mode";
            case 8:
                return "Offline mode";
            case 9:
                return "My location";
            case MapViewConstants.ANIMATION_SMOOTHNESS_DEFAULT /* 10 */:
                return "Compass";
            case 11:
                return "Map mode";
            default:
                throw new IllegalArgumentException();
        }
    }

    @Override // org.osmdroid.ResourceProxy
    public String getString(ResourceProxy.string pResId, Object... formatArgs) {
        return String.format(getString(pResId), formatArgs);
    }

    @Override // org.osmdroid.ResourceProxy
    public Bitmap getBitmap(ResourceProxy.bitmap pResId) {
        InputStream is = null;
        try {
            try {
                String resName = pResId.name() + ".png";
                InputStream is2 = ResourceProxy.class.getResourceAsStream(resName);
                if (is2 == null) {
                    throw new IllegalArgumentException("Resource not found: " + resName);
                }
                BitmapFactory.Options options = null;
                if (this.mDisplayMetrics != null) {
                    options = getBitmapOptions();
                }
                Bitmap decodeStream = BitmapFactory.decodeStream(is2, null, options);
                if (is2 != null) {
                    try {
                        is2.close();
                    } catch (IOException e) {
                    }
                }
                return decodeStream;
            } catch (OutOfMemoryError e2) {
                Log.e(IMapView.LOGTAG, "OutOfMemoryError getting bitmap resource: " + pResId);
                System.gc();
                throw e2;
            }
        } catch (Throwable th) {
            if (0 != 0) {
                try {
                    is.close();
                } catch (IOException e3) {
                }
            }
            throw th;
        }
    }

    private BitmapFactory.Options getBitmapOptions() {
        try {
            Field density = DisplayMetrics.class.getDeclaredField("DENSITY_DEFAULT");
            Field inDensity = BitmapFactory.Options.class.getDeclaredField("inDensity");
            Field inTargetDensity = BitmapFactory.Options.class.getDeclaredField("inTargetDensity");
            Field targetDensity = DisplayMetrics.class.getDeclaredField("densityDpi");
            BitmapFactory.Options options = new BitmapFactory.Options();
            inDensity.setInt(options, density.getInt(null));
            inTargetDensity.setInt(options, targetDensity.getInt(this.mDisplayMetrics));
            return options;
        } catch (IllegalAccessException | NoSuchFieldException e) {
            return null;
        }
    }

    @Override // org.osmdroid.ResourceProxy
    public Drawable getDrawable(ResourceProxy.bitmap pResId) {
        return this.mResources != null ? new BitmapDrawable(this.mResources, getBitmap(pResId)) : new BitmapDrawable(getBitmap(pResId));
    }

    @Override // org.osmdroid.ResourceProxy
    public float getDisplayMetricsDensity() {
        return this.mDisplayMetrics.density;
    }
}
