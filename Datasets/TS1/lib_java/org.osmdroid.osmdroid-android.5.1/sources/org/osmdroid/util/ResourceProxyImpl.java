package org.osmdroid.util;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Drawable;
import java.lang.reflect.Field;
import org.osmdroid.DefaultResourceProxyImpl;
import org.osmdroid.ResourceProxy;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/util/ResourceProxyImpl.class */
public class ResourceProxyImpl extends DefaultResourceProxyImpl {
    private final Resources mResources;
    private final String mResourceNameBase;

    public ResourceProxyImpl(Context aContext) {
        super(aContext);
        this.mResources = aContext.getResources();
        this.mResourceNameBase = aContext.getPackageName() + ".R$";
    }

    @Override // org.osmdroid.DefaultResourceProxyImpl, org.osmdroid.ResourceProxy
    public String getString(ResourceProxy.string pResId) {
        int id = getId("string", pResId.name());
        return id != 0 ? this.mResources.getString(id) : super.getString(pResId);
    }

    @Override // org.osmdroid.DefaultResourceProxyImpl, org.osmdroid.ResourceProxy
    public String getString(ResourceProxy.string pResId, Object... formatArgs) {
        int id = getId("string", pResId.name());
        return id != 0 ? this.mResources.getString(id, formatArgs) : super.getString(pResId, formatArgs);
    }

    @Override // org.osmdroid.DefaultResourceProxyImpl, org.osmdroid.ResourceProxy
    public Bitmap getBitmap(ResourceProxy.bitmap pResId) {
        int id = getId("drawable", pResId.name());
        return id != 0 ? BitmapFactory.decodeResource(this.mResources, id) : super.getBitmap(pResId);
    }

    @Override // org.osmdroid.DefaultResourceProxyImpl, org.osmdroid.ResourceProxy
    public Drawable getDrawable(ResourceProxy.bitmap pResId) {
        int id = getId("drawable", pResId.name());
        return id != 0 ? this.mResources.getDrawable(id) : super.getDrawable(pResId);
    }

    private int getId(String aType, String aName) {
        try {
            Class<?> cls = Class.forName(this.mResourceNameBase + aType);
            Field field = cls.getDeclaredField(aName);
            return field.getInt(null);
        } catch (Exception e) {
            return 0;
        }
    }
}
