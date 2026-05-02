package android.content.res;

import android.app.AndroidAppHelper;
import android.util.DisplayMetrics;

/* loaded from: XposedBridgeApi-54.jar:android/content/res/XModuleResources.class */
public class XModuleResources extends Resources {
    private XModuleResources(AssetManager assets, DisplayMetrics metrics, Configuration config) {
        super(assets, metrics, config);
    }

    public static XModuleResources createInstance(String modulePath, XResources origRes) {
        XModuleResources res;
        if (modulePath == null) {
            throw new IllegalArgumentException("modulePath must not be null");
        }
        AssetManager assets = new AssetManager();
        assets.addAssetPath(modulePath);
        if (origRes != null) {
            res = new XModuleResources(assets, origRes.getDisplayMetrics(), origRes.getConfiguration());
        } else {
            res = new XModuleResources(assets, null, null);
        }
        AndroidAppHelper.addActiveResource(modulePath, res.hashCode(), false, res);
        return res;
    }

    public XResForwarder fwd(int id) {
        return new XResForwarder(this, id);
    }
}
