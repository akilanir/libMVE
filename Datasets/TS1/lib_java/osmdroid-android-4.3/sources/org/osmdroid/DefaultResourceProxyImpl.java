package org.osmdroid;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.util.DisplayMetrics;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import org.osmdroid.ResourceProxy;
import org.osmdroid.views.MapView;
import org.osmdroid.views.overlay.ItemizedOverlayWithFocus;
import org.osmdroid.views.util.constants.MapViewConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/DefaultResourceProxyImpl.class */
public class DefaultResourceProxyImpl implements ResourceProxy, MapViewConstants {
    private static final Logger logger = LoggerFactory.getLogger(DefaultResourceProxyImpl.class);
    private Resources mResources;
    private DisplayMetrics mDisplayMetrics;

    public DefaultResourceProxyImpl(Context pContext) {
        if (pContext != null) {
            this.mResources = pContext.getResources();
            this.mDisplayMetrics = this.mResources.getDisplayMetrics();
        }
    }

    /* renamed from: org.osmdroid.DefaultResourceProxyImpl$1, reason: invalid class name */
    /* loaded from: osmdroid-android-4.3.jar:org/osmdroid/DefaultResourceProxyImpl$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$org$osmdroid$ResourceProxy$string = new int[ResourceProxy.string.values().length];

        static {
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.mapnik.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.cyclemap.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.public_transport.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.cloudmade_standard.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.cloudmade_small.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.mapquest_osm.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.mapquest_aerial.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.bing.ordinal()] = 8;
            } catch (NoSuchFieldError e8) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.mapbox.ordinal()] = 9;
            } catch (NoSuchFieldError e9) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.fiets_nl.ordinal()] = 10;
            } catch (NoSuchFieldError e10) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.base_nl.ordinal()] = 11;
            } catch (NoSuchFieldError e11) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.roads_nl.ordinal()] = 12;
            } catch (NoSuchFieldError e12) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.unknown.ordinal()] = 13;
            } catch (NoSuchFieldError e13) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.format_distance_meters.ordinal()] = 14;
            } catch (NoSuchFieldError e14) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.format_distance_kilometers.ordinal()] = 15;
            } catch (NoSuchFieldError e15) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.format_distance_miles.ordinal()] = 16;
            } catch (NoSuchFieldError e16) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.format_distance_nautical_miles.ordinal()] = 17;
            } catch (NoSuchFieldError e17) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.format_distance_feet.ordinal()] = 18;
            } catch (NoSuchFieldError e18) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.online_mode.ordinal()] = 19;
            } catch (NoSuchFieldError e19) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.offline_mode.ordinal()] = 20;
            } catch (NoSuchFieldError e20) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.my_location.ordinal()] = 21;
            } catch (NoSuchFieldError e21) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.compass.ordinal()] = 22;
            } catch (NoSuchFieldError e22) {
            }
            try {
                $SwitchMap$org$osmdroid$ResourceProxy$string[ResourceProxy.string.map_mode.ordinal()] = 23;
            } catch (NoSuchFieldError e23) {
            }
        }
    }

    @Override // org.osmdroid.ResourceProxy
    public String getString(ResourceProxy.string pResId) {
        switch (AnonymousClass1.$SwitchMap$org$osmdroid$ResourceProxy$string[pResId.ordinal()]) {
            case 1:
                return "Mapnik";
            case 2:
                return "Cycle Map";
            case 3:
                return "Public transport";
            case 4:
                return "CloudMade (Standard tiles)";
            case MapView.LayoutParams.CENTER /* 5 */:
                return "CloudMade (small tiles)";
            case MapView.LayoutParams.CENTER_RIGHT /* 6 */:
                return "Mapquest";
            case MapView.LayoutParams.BOTTOM_LEFT /* 7 */:
                return "Mapquest Aerial";
            case 8:
                return "Bing";
            case 9:
                return "MapBox";
            case MapViewConstants.ANIMATION_SMOOTHNESS_DEFAULT /* 10 */:
                return "OpenFietsKaart overlay";
            case 11:
                return "Netherlands base overlay";
            case ItemizedOverlayWithFocus.DESCRIPTION_LINE_HEIGHT /* 12 */:
                return "Netherlands roads overlay";
            case 13:
                return "Unknown";
            case 14:
                return "%s m";
            case 15:
                return "%s km";
            case 16:
                return "%s mi";
            case 17:
                return "%s nm";
            case 18:
                return "%s ft";
            case 19:
                return "Online mode";
            case 20:
                return "Offline mode";
            case 21:
                return "My location";
            case 22:
                return "Compass";
            case 23:
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
                logger.error("OutOfMemoryError getting bitmap resource: " + pResId);
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
