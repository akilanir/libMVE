package android.content.res;

import android.content.pm.PackageParser;
import android.content.res.Resources;
import android.graphics.Movie;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.util.SparseArray;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import de.robv.android.xposed.XC_MethodHook;
import de.robv.android.xposed.XposedBridge;
import de.robv.android.xposed.XposedHelpers;
import de.robv.android.xposed.callbacks.XC_LayoutInflated;
import de.robv.android.xposed.callbacks.XC_LayoutInflated.Unhook;
import de.robv.android.xposed.callbacks.XCallback;
import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.WeakHashMap;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: XposedBridgeApi-54.jar:android/content/res/XResources.class */
public class XResources extends MiuiResources {
    private byte[] mReplacementsCache;
    private static final String EXTRA_XML_INSTANCE_DETAILS = "xmlInstanceDetails";
    private boolean mIsObjectInited;
    private String mResDir;
    private String mPackageName;
    private static final SparseArray<HashMap<String, Object>> sReplacements = new SparseArray<>();
    private static final SparseArray<HashMap<String, ResourceNames>> sResourceNames = new SparseArray<>();
    private static final byte[] sSystemReplacementsCache = new byte[256];
    private static final HashMap<String, byte[]> sReplacementsCacheMap = new HashMap<>();
    private static final SparseArray<ColorStateList> sColorStateListCache = new SparseArray<>(0);
    private static final SparseArray<HashMap<String, XposedBridge.CopyOnWriteSortedSet<XC_LayoutInflated>>> sLayoutCallbacks = new SparseArray<>();
    private static final WeakHashMap<XmlResourceParser, XMLInstanceDetails> sXmlInstanceDetails = new WeakHashMap<>();
    private static final ThreadLocal<LinkedList<XC_MethodHook.MethodHookParam>> sIncludedLayouts = new ThreadLocal<LinkedList<XC_MethodHook.MethodHookParam>>() { // from class: android.content.res.XResources.1
        /* JADX INFO: Access modifiers changed from: protected */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.lang.ThreadLocal
        public LinkedList<XC_MethodHook.MethodHookParam> initialValue() {
            return new LinkedList<>();
        }
    };
    private static final HashMap<String, Long> sResDirLastModified = new HashMap<>();
    private static final HashMap<String, String> sResDirPackageNames = new HashMap<>();
    private static ThreadLocal<Object> sLatestResKey = null;

    private static native void rewriteXmlReferencesNative(int i, XResources xResources, Resources resources);

    private XResources() {
        super(null, null, null);
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v11 */
    /* JADX WARN: Type inference failed for: r0v6, types: [java.util.HashMap<java.lang.String, byte[]>] */
    /* JADX WARN: Type inference failed for: r0v7, types: [java.lang.Throwable] */
    public void initObject(String resDir) {
        if (this.mIsObjectInited) {
            throw new IllegalStateException("Object has already been initialized");
        }
        this.mResDir = resDir;
        this.mPackageName = getPackageName(resDir);
        if (resDir != null) {
            ?? r0 = sReplacementsCacheMap;
            synchronized (r0) {
                this.mReplacementsCache = sReplacementsCacheMap.get(resDir);
                if (this.mReplacementsCache == null) {
                    this.mReplacementsCache = new byte[128];
                    sReplacementsCacheMap.put(resDir, this.mReplacementsCache);
                }
                r0 = r0;
            }
        }
        this.mIsObjectInited = true;
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [android.util.SparseArray<java.util.HashMap<java.lang.String, java.lang.Object>>, java.lang.Throwable] */
    public boolean isFirstLoad() {
        synchronized (sReplacements) {
            if (this.mResDir == null) {
                return false;
            }
            Long lastModification = Long.valueOf(new File(this.mResDir).lastModified());
            Long oldModified = sResDirLastModified.get(this.mResDir);
            if (lastModification.equals(oldModified)) {
                return false;
            }
            sResDirLastModified.put(this.mResDir, lastModification);
            if (oldModified == null) {
                return true;
            }
            for (int i = 0; i < sReplacements.size(); i++) {
                sReplacements.valueAt(i).remove(this.mResDir);
            }
            Arrays.fill(this.mReplacementsCache, (byte) 0);
            return true;
        }
    }

    public String getResDir() {
        return this.mResDir;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0, types: [java.util.HashMap<java.lang.String, java.lang.String>] */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v4 */
    public static void setPackageNameForResDir(String packageName, String resDir) {
        ?? r0 = sResDirPackageNames;
        synchronized (r0) {
            sResDirPackageNames.put(resDir, packageName);
            r0 = r0;
        }
    }

    public String getPackageName() {
        return this.mPackageName;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.util.HashMap<java.lang.String, java.lang.String>] */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v6 */
    private static String getPackageName(String resDir) {
        if (resDir == null) {
            return "android";
        }
        ?? r0 = sResDirPackageNames;
        synchronized (r0) {
            String packageName = sResDirPackageNames.get(resDir);
            r0 = r0;
            if (packageName != null) {
                return packageName;
            }
            PackageParser.PackageLite pkgInfo = PackageParser.parsePackageLite(resDir, 0);
            if (pkgInfo != null && pkgInfo.packageName != null) {
                Log.w("Xposed", "Package name for " + resDir + " had to be retrieved via parser");
                String packageName2 = pkgInfo.packageName;
                setPackageNameForResDir(packageName2, resDir);
                return packageName2;
            }
            throw new IllegalStateException("Could not determine package name for " + resDir);
        }
    }

    public static String getPackageNameDuringConstruction() {
        Object key = sLatestResKey.get();
        if (key == null) {
            throw new IllegalStateException("This method can only be called during getTopLevelResources()");
        }
        String resDir = (String) XposedHelpers.getObjectField(key, "mResDir");
        return getPackageName(resDir);
    }

    public static void init(ThreadLocal<Object> latestResKey) throws Exception {
        sLatestResKey = latestResKey;
        XposedHelpers.findAndHookMethod(LayoutInflater.class, "inflate", XmlPullParser.class, ViewGroup.class, Boolean.TYPE, new XC_MethodHook() { // from class: android.content.res.XResources.2
            /* JADX WARN: Multi-variable type inference failed */
            /* JADX WARN: Type inference failed for: r0v2, types: [java.util.WeakHashMap] */
            /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Throwable] */
            /* JADX WARN: Type inference failed for: r0v7 */
            @Override // de.robv.android.xposed.XC_MethodHook
            protected void afterHookedMethod(XC_MethodHook.MethodHookParam param) throws Throwable {
                if (!param.hasThrowable()) {
                    ?? r0 = XResources.sXmlInstanceDetails;
                    synchronized (r0) {
                        XMLInstanceDetails details = (XMLInstanceDetails) XResources.sXmlInstanceDetails.get(param.args[0]);
                        r0 = r0;
                        if (details != null) {
                            XC_LayoutInflated.LayoutInflatedParam liparam = new XC_LayoutInflated.LayoutInflatedParam(details.callbacks);
                            liparam.view = (View) param.getResult();
                            liparam.resNames = details.resNames;
                            liparam.variant = details.variant;
                            liparam.res = details.res;
                            XCallback.callAll(liparam);
                        }
                    }
                }
            }
        });
        XposedHelpers.findAndHookMethod(LayoutInflater.class, "parseInclude", XmlPullParser.class, View.class, AttributeSet.class, new XC_MethodHook() { // from class: android.content.res.XResources.3
            @Override // de.robv.android.xposed.XC_MethodHook
            protected void beforeHookedMethod(XC_MethodHook.MethodHookParam param) throws Throwable {
                ((LinkedList) XResources.sIncludedLayouts.get()).push(param);
            }

            @Override // de.robv.android.xposed.XC_MethodHook
            protected void afterHookedMethod(XC_MethodHook.MethodHookParam param) throws Throwable {
                XMLInstanceDetails details;
                ((LinkedList) XResources.sIncludedLayouts.get()).pop();
                if (!param.hasThrowable() && (details = (XMLInstanceDetails) param.getObjectExtra(XResources.EXTRA_XML_INSTANCE_DETAILS)) != null) {
                    XC_LayoutInflated.LayoutInflatedParam liparam = new XC_LayoutInflated.LayoutInflatedParam(details.callbacks);
                    ViewGroup group = (ViewGroup) param.args[1];
                    liparam.view = group.getChildAt(group.getChildCount() - 1);
                    liparam.resNames = details.resNames;
                    liparam.variant = details.variant;
                    liparam.res = details.res;
                    XCallback.callAll(liparam);
                }
            }
        });
    }

    /* loaded from: XposedBridgeApi-54.jar:android/content/res/XResources$ResourceNames.class */
    public static class ResourceNames {
        public final int id;
        public final String pkg;
        public final String name;
        public final String type;
        public final String fullName;

        private ResourceNames(int id, String pkg, String name, String type) {
            this.id = id;
            this.pkg = pkg;
            this.name = name;
            this.type = type;
            this.fullName = String.valueOf(pkg) + ":" + type + "/" + name;
        }

        /* synthetic */ ResourceNames(int i, String str, String str2, String str3, ResourceNames resourceNames) {
            this(i, str, str2, str3);
        }

        public boolean equals(String pkg, String name, String type, int id) {
            if (pkg != null && !pkg.equals(this.pkg)) {
                return false;
            }
            if (name != null && !name.equals(this.name)) {
                return false;
            }
            if (type == null || type.equals(this.type)) {
                return id == 0 || id == this.id;
            }
            return false;
        }
    }

    private ResourceNames getResourceNames(int id) {
        return new ResourceNames(id, getResourcePackageName(id), getResourceTypeName(id), getResourceEntryName(id), null);
    }

    private static ResourceNames getSystemResourceNames(int id) {
        Resources sysRes = getSystem();
        return new ResourceNames(id, sysRes.getResourcePackageName(id), sysRes.getResourceTypeName(id), sysRes.getResourceEntryName(id), null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v11 */
    /* JADX WARN: Type inference failed for: r0v2, types: [android.util.SparseArray<java.util.HashMap<java.lang.String, android.content.res.XResources$ResourceNames>>, java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v7 */
    /* JADX WARN: Type inference failed for: r0v8, types: [java.lang.Throwable] */
    private static void putResourceNames(String resDir, ResourceNames resNames) {
        int id = resNames.id;
        synchronized (sResourceNames) {
            HashMap<String, ResourceNames> inner = sResourceNames.get(id);
            if (inner == null) {
                inner = new HashMap<>();
                sResourceNames.put(id, inner);
            }
            ?? r0 = inner;
            synchronized (r0) {
                inner.put(resDir, resNames);
                r0 = r0;
            }
        }
    }

    public void setReplacement(int id, Object replacement) {
        setReplacement(id, replacement, this);
    }

    public void setReplacement(String fullName, Object replacement) {
        int id = getIdentifier(fullName, null, null);
        if (id == 0) {
            throw new Resources.NotFoundException(fullName);
        }
        setReplacement(id, replacement, this);
    }

    public void setReplacement(String pkg, String type, String name, Object replacement) {
        int id = getIdentifier(name, type, pkg);
        if (id == 0) {
            throw new Resources.NotFoundException(String.valueOf(pkg) + ":" + type + "/" + name);
        }
        setReplacement(id, replacement, this);
    }

    public static void setSystemWideReplacement(int id, Object replacement) {
        setReplacement(id, replacement, null);
    }

    public static void setSystemWideReplacement(String fullName, Object replacement) {
        int id = getSystem().getIdentifier(fullName, null, null);
        if (id == 0) {
            throw new Resources.NotFoundException(fullName);
        }
        setReplacement(id, replacement, null);
    }

    public static void setSystemWideReplacement(String pkg, String type, String name, Object replacement) {
        int id = getSystem().getIdentifier(name, type, pkg);
        if (id == 0) {
            throw new Resources.NotFoundException(String.valueOf(pkg) + ":" + type + "/" + name);
        }
        setReplacement(id, replacement, null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v13, types: [byte[]] */
    /* JADX WARN: Type inference failed for: r0v14, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v17 */
    /* JADX WARN: Type inference failed for: r0v18, types: [android.util.SparseArray<java.util.HashMap<java.lang.String, java.lang.Object>>] */
    /* JADX WARN: Type inference failed for: r0v19, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v26 */
    /* JADX WARN: Type inference failed for: r0v33, types: [byte[]] */
    /* JADX WARN: Type inference failed for: r0v34, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v36 */
    private static void setReplacement(int id, Object replacement, XResources res) {
        String resDir = res != null ? res.mResDir : null;
        if (id == 0) {
            throw new IllegalArgumentException("id 0 is not an allowed resource identifier");
        }
        if (resDir == null && id >= 2130706432) {
            throw new IllegalArgumentException("ids >= 0x7f000000 are app specific and cannot be set for the framework");
        }
        if (replacement instanceof Drawable) {
            throw new IllegalArgumentException("Drawable replacements are deprecated since Xposed 2.1. Use DrawableLoader instead.");
        }
        if (id < 2130706432) {
            int cacheKey = ((id & 458752) >> 11) | ((id & 248) >> 3);
            ?? r0 = sSystemReplacementsCache;
            synchronized (r0) {
                byte[] bArr = sSystemReplacementsCache;
                bArr[cacheKey] = (byte) (bArr[cacheKey] | (1 << (id & 7)));
                r0 = r0;
            }
        } else {
            int cacheKey2 = ((id & 458752) >> 12) | ((id & 120) >> 3);
            ?? r02 = res.mReplacementsCache;
            synchronized (r02) {
                byte[] bArr2 = res.mReplacementsCache;
                bArr2[cacheKey2] = (byte) (bArr2[cacheKey2] | (1 << (id & 7)));
                r02 = r02;
            }
        }
        ?? r03 = sReplacements;
        synchronized (r03) {
            HashMap<String, Object> inner = sReplacements.get(id);
            if (inner == null) {
                inner = new HashMap<>();
                sReplacements.put(id, inner);
            }
            inner.put(resDir, replacement);
            r03 = r03;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v13, types: [android.util.SparseArray<java.util.HashMap<java.lang.String, java.lang.Object>>] */
    /* JADX WARN: Type inference failed for: r0v14, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v17, types: [java.lang.Throwable, java.util.HashMap] */
    /* JADX WARN: Type inference failed for: r0v18 */
    public Object getReplacement(int id) {
        if (id <= 0) {
            return null;
        }
        if (id < 2130706432) {
            int cacheKey = ((id & 458752) >> 11) | ((id & 248) >> 3);
            if ((sSystemReplacementsCache[cacheKey] & (1 << (id & 7))) == 0) {
                return null;
            }
        } else if (this.mResDir != null) {
            int cacheKey2 = ((id & 458752) >> 12) | ((id & 120) >> 3);
            if ((this.mReplacementsCache[cacheKey2] & (1 << (id & 7))) == 0) {
                return null;
            }
        }
        ?? r0 = sReplacements;
        synchronized (r0) {
            ?? r02 = (HashMap) sReplacements.get(id);
            r0 = r0;
            if (r02 == 0) {
                return null;
            }
            synchronized (r02) {
                Object result = r02.get(this.mResDir);
                if (result != null || this.mResDir == null) {
                    return result;
                }
                return r02.get(null);
            }
        }
    }

    @Override // android.content.res.Resources
    public XmlResourceParser getAnimation(int id) throws Resources.NotFoundException {
        Object replacement = getReplacement(id);
        if (replacement instanceof XResForwarder) {
            Resources repRes = ((XResForwarder) replacement).getResources();
            int repId = ((XResForwarder) replacement).getId();
            boolean loadedFromCache = isXmlCached(repRes, repId);
            XmlResourceParser result = repRes.getAnimation(repId);
            if (!loadedFromCache) {
                int parseState = XposedHelpers.getIntField(result, "mParseState");
                rewriteXmlReferencesNative(parseState, this, repRes);
            }
            return result;
        }
        return super.getAnimation(id);
    }

    @Override // android.content.res.Resources
    public boolean getBoolean(int id) throws Resources.NotFoundException {
        Object replacement = getReplacement(id);
        if (replacement instanceof Boolean) {
            return ((Boolean) replacement).booleanValue();
        }
        if (replacement instanceof XResForwarder) {
            Resources repRes = ((XResForwarder) replacement).getResources();
            int repId = ((XResForwarder) replacement).getId();
            return repRes.getBoolean(repId);
        }
        return super.getBoolean(id);
    }

    @Override // android.content.res.Resources
    public int getColor(int id) throws Resources.NotFoundException {
        Object replacement = getReplacement(id);
        if (replacement instanceof Integer) {
            return ((Integer) replacement).intValue();
        }
        if (replacement instanceof XResForwarder) {
            Resources repRes = ((XResForwarder) replacement).getResources();
            int repId = ((XResForwarder) replacement).getId();
            return repRes.getColor(repId);
        }
        return super.getColor(id);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v21, types: [android.util.SparseArray<android.content.res.ColorStateList>] */
    /* JADX WARN: Type inference failed for: r0v22, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v27, types: [android.content.res.ColorStateList] */
    @Override // android.content.res.Resources
    public ColorStateList getColorStateList(int id) throws Resources.NotFoundException {
        Object replacement = getReplacement(id);
        if (replacement instanceof ColorStateList) {
            return (ColorStateList) replacement;
        }
        if (replacement instanceof Integer) {
            int color = ((Integer) replacement).intValue();
            ?? r0 = sColorStateListCache;
            synchronized (r0) {
                ColorStateList result = sColorStateListCache.get(color);
                if (result == null) {
                    result = ColorStateList.valueOf(color);
                    sColorStateListCache.put(color, result);
                }
                r0 = result;
            }
            return r0;
        }
        if (replacement instanceof XResForwarder) {
            Resources repRes = ((XResForwarder) replacement).getResources();
            int repId = ((XResForwarder) replacement).getId();
            return repRes.getColorStateList(repId);
        }
        return super.getColorStateList(id);
    }

    @Override // android.content.res.Resources
    public float getDimension(int id) throws Resources.NotFoundException {
        Object replacement = getReplacement(id);
        if (replacement instanceof DimensionReplacement) {
            return ((DimensionReplacement) replacement).getDimension(getDisplayMetrics());
        }
        if (replacement instanceof XResForwarder) {
            Resources repRes = ((XResForwarder) replacement).getResources();
            int repId = ((XResForwarder) replacement).getId();
            return repRes.getDimension(repId);
        }
        return super.getDimension(id);
    }

    @Override // android.content.res.Resources
    public int getDimensionPixelOffset(int id) throws Resources.NotFoundException {
        Object replacement = getReplacement(id);
        if (replacement instanceof DimensionReplacement) {
            return ((DimensionReplacement) replacement).getDimensionPixelOffset(getDisplayMetrics());
        }
        if (replacement instanceof XResForwarder) {
            Resources repRes = ((XResForwarder) replacement).getResources();
            int repId = ((XResForwarder) replacement).getId();
            return repRes.getDimensionPixelOffset(repId);
        }
        return super.getDimensionPixelOffset(id);
    }

    @Override // android.content.res.Resources
    public int getDimensionPixelSize(int id) throws Resources.NotFoundException {
        Object replacement = getReplacement(id);
        if (replacement instanceof DimensionReplacement) {
            return ((DimensionReplacement) replacement).getDimensionPixelSize(getDisplayMetrics());
        }
        if (replacement instanceof XResForwarder) {
            Resources repRes = ((XResForwarder) replacement).getResources();
            int repId = ((XResForwarder) replacement).getId();
            return repRes.getDimensionPixelSize(repId);
        }
        return super.getDimensionPixelSize(id);
    }

    @Override // android.content.res.Resources
    public Drawable getDrawable(int id) throws Resources.NotFoundException {
        Object replacement = getReplacement(id);
        if (replacement instanceof DrawableLoader) {
            try {
                Drawable result = ((DrawableLoader) replacement).newDrawable(this, id);
                if (result != null) {
                    return result;
                }
            } catch (Throwable t) {
                XposedBridge.log(t);
            }
        } else {
            if (replacement instanceof Integer) {
                return new ColorDrawable(((Integer) replacement).intValue());
            }
            if (replacement instanceof XResForwarder) {
                Resources repRes = ((XResForwarder) replacement).getResources();
                int repId = ((XResForwarder) replacement).getId();
                return repRes.getDrawable(repId);
            }
        }
        return super.getDrawable(id);
    }

    @Override // android.content.res.Resources
    public Drawable getDrawableForDensity(int id, int density) throws Resources.NotFoundException {
        Object replacement = getReplacement(id);
        if (replacement instanceof DrawableLoader) {
            try {
                Drawable result = ((DrawableLoader) replacement).newDrawableForDensity(this, id, density);
                if (result != null) {
                    return result;
                }
            } catch (Throwable t) {
                XposedBridge.log(t);
            }
        } else {
            if (replacement instanceof Integer) {
                return new ColorDrawable(((Integer) replacement).intValue());
            }
            if (replacement instanceof XResForwarder) {
                Resources repRes = ((XResForwarder) replacement).getResources();
                int repId = ((XResForwarder) replacement).getId();
                return repRes.getDrawableForDensity(repId, density);
            }
        }
        return super.getDrawableForDensity(id, density);
    }

    @Override // android.content.res.Resources
    public float getFraction(int id, int base, int pbase) {
        Object replacement = getReplacement(id);
        if (replacement instanceof XResForwarder) {
            Resources repRes = ((XResForwarder) replacement).getResources();
            int repId = ((XResForwarder) replacement).getId();
            return repRes.getFraction(repId, base, pbase);
        }
        return super.getFraction(id, base, pbase);
    }

    @Override // android.content.res.Resources
    public int getInteger(int id) throws Resources.NotFoundException {
        Object replacement = getReplacement(id);
        if (replacement instanceof Integer) {
            return ((Integer) replacement).intValue();
        }
        if (replacement instanceof XResForwarder) {
            Resources repRes = ((XResForwarder) replacement).getResources();
            int repId = ((XResForwarder) replacement).getId();
            return repRes.getInteger(repId);
        }
        return super.getInteger(id);
    }

    @Override // android.content.res.Resources
    public int[] getIntArray(int id) throws Resources.NotFoundException {
        Object replacement = getReplacement(id);
        if (replacement instanceof int[]) {
            return (int[]) replacement;
        }
        if (replacement instanceof XResForwarder) {
            Resources repRes = ((XResForwarder) replacement).getResources();
            int repId = ((XResForwarder) replacement).getId();
            return repRes.getIntArray(repId);
        }
        return super.getIntArray(id);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v11 */
    /* JADX WARN: Type inference failed for: r0v14 */
    /* JADX WARN: Type inference failed for: r0v15, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v20 */
    /* JADX WARN: Type inference failed for: r0v33, types: [java.lang.Throwable, java.util.WeakHashMap<android.content.res.XmlResourceParser, android.content.res.XResources$XMLInstanceDetails>] */
    /* JADX WARN: Type inference failed for: r0v34, types: [android.util.SparseArray<java.util.HashMap<java.lang.String, android.content.res.XResources$ResourceNames>>, java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v41 */
    /* JADX WARN: Type inference failed for: r0v42, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v52 */
    /* JADX WARN: Type inference failed for: r0v6, types: [android.util.SparseArray<java.util.HashMap<java.lang.String, de.robv.android.xposed.XposedBridge$CopyOnWriteSortedSet<de.robv.android.xposed.callbacks.XC_LayoutInflated>>>] */
    /* JADX WARN: Type inference failed for: r0v7, types: [java.lang.Throwable] */
    @Override // android.content.res.Resources
    public XmlResourceParser getLayout(int id) throws Resources.NotFoundException {
        XmlResourceParser result;
        Object replacement = getReplacement(id);
        if (replacement instanceof XResForwarder) {
            Resources repRes = ((XResForwarder) replacement).getResources();
            int repId = ((XResForwarder) replacement).getId();
            boolean loadedFromCache = isXmlCached(repRes, repId);
            result = repRes.getLayout(repId);
            if (!loadedFromCache) {
                int parseState = XposedHelpers.getIntField(result, "mParseState");
                rewriteXmlReferencesNative(parseState, this, repRes);
            }
        } else {
            result = super.getLayout(id);
        }
        ?? r0 = sLayoutCallbacks;
        synchronized (r0) {
            HashMap<String, XposedBridge.CopyOnWriteSortedSet<XC_LayoutInflated>> inner = sLayoutCallbacks.get(id);
            r0 = r0;
            if (inner != null) {
                ?? r02 = inner;
                synchronized (r02) {
                    XposedBridge.CopyOnWriteSortedSet<XC_LayoutInflated> callbacks = inner.get(this.mResDir);
                    if (callbacks == null && this.mResDir != null) {
                        callbacks = inner.get(null);
                    }
                    r02 = r02;
                    if (callbacks != null) {
                        String variant = "layout";
                        TypedValue value = (TypedValue) XposedHelpers.getObjectField(this, "mTmpValue");
                        getValue(id, value, true);
                        if (value.type == 3) {
                            String[] components = value.string.toString().split("/", 3);
                            if (components.length == 3) {
                                variant = components[1];
                            } else {
                                XposedBridge.log("Unexpected resource path \"" + value.string.toString() + "\" for resource id 0x" + Integer.toHexString(id));
                            }
                        } else {
                            XposedBridge.log(new Resources.NotFoundException("Could not find file name for resource id 0x") + Integer.toHexString(id));
                        }
                        synchronized (sXmlInstanceDetails) {
                            synchronized (sResourceNames) {
                                HashMap<String, ResourceNames> resNamesInner = sResourceNames.get(id);
                                if (resNamesInner != null) {
                                    ?? r03 = resNamesInner;
                                    synchronized (r03) {
                                        XMLInstanceDetails details = new XMLInstanceDetails(this, resNamesInner.get(this.mResDir), variant, callbacks, null);
                                        sXmlInstanceDetails.put(result, details);
                                        XC_MethodHook.MethodHookParam top = sIncludedLayouts.get().peek();
                                        if (top != null) {
                                            top.setObjectExtra(EXTRA_XML_INSTANCE_DETAILS, details);
                                        }
                                        r03 = r03;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return result;
        }
    }

    @Override // android.content.res.Resources
    public Movie getMovie(int id) throws Resources.NotFoundException {
        Object replacement = getReplacement(id);
        if (replacement instanceof XResForwarder) {
            Resources repRes = ((XResForwarder) replacement).getResources();
            int repId = ((XResForwarder) replacement).getId();
            return repRes.getMovie(repId);
        }
        return super.getMovie(id);
    }

    @Override // android.content.res.Resources
    public CharSequence getQuantityText(int id, int quantity) throws Resources.NotFoundException {
        Object replacement = getReplacement(id);
        if (replacement instanceof XResForwarder) {
            Resources repRes = ((XResForwarder) replacement).getResources();
            int repId = ((XResForwarder) replacement).getId();
            return repRes.getQuantityText(repId, quantity);
        }
        return super.getQuantityText(id, quantity);
    }

    @Override // android.content.res.Resources
    public String[] getStringArray(int id) throws Resources.NotFoundException {
        Object replacement = getReplacement(id);
        if (replacement instanceof String[]) {
            return (String[]) replacement;
        }
        if (replacement instanceof XResForwarder) {
            Resources repRes = ((XResForwarder) replacement).getResources();
            int repId = ((XResForwarder) replacement).getId();
            return repRes.getStringArray(repId);
        }
        return super.getStringArray(id);
    }

    @Override // android.content.res.Resources
    public CharSequence getText(int id) throws Resources.NotFoundException {
        Object replacement = getReplacement(id);
        if (replacement instanceof CharSequence) {
            return (CharSequence) replacement;
        }
        if (replacement instanceof XResForwarder) {
            Resources repRes = ((XResForwarder) replacement).getResources();
            int repId = ((XResForwarder) replacement).getId();
            return repRes.getText(repId);
        }
        return super.getText(id);
    }

    @Override // android.content.res.Resources
    public CharSequence getText(int id, CharSequence def) {
        Object replacement = getReplacement(id);
        if (replacement instanceof CharSequence) {
            return (CharSequence) replacement;
        }
        if (replacement instanceof XResForwarder) {
            Resources repRes = ((XResForwarder) replacement).getResources();
            int repId = ((XResForwarder) replacement).getId();
            return repRes.getText(repId, def);
        }
        return super.getText(id, def);
    }

    @Override // android.content.res.Resources
    public CharSequence[] getTextArray(int id) throws Resources.NotFoundException {
        Object replacement = getReplacement(id);
        if (replacement instanceof CharSequence[]) {
            return (CharSequence[]) replacement;
        }
        if (replacement instanceof XResForwarder) {
            Resources repRes = ((XResForwarder) replacement).getResources();
            int repId = ((XResForwarder) replacement).getId();
            return repRes.getTextArray(repId);
        }
        return super.getTextArray(id);
    }

    @Override // android.content.res.Resources
    public XmlResourceParser getXml(int id) throws Resources.NotFoundException {
        Object replacement = getReplacement(id);
        if (replacement instanceof XResForwarder) {
            Resources repRes = ((XResForwarder) replacement).getResources();
            int repId = ((XResForwarder) replacement).getId();
            boolean loadedFromCache = isXmlCached(repRes, repId);
            XmlResourceParser result = repRes.getXml(repId);
            if (!loadedFromCache) {
                int parseState = XposedHelpers.getIntField(result, "mParseState");
                rewriteXmlReferencesNative(parseState, this, repRes);
            }
            return result;
        }
        return super.getXml(id);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v2, types: [int[], java.lang.Throwable] */
    private static boolean isXmlCached(Resources res, int id) {
        ?? r0 = (int[]) XposedHelpers.getObjectField(res, "mCachedXmlBlockIds");
        synchronized (r0) {
            for (char c : r0) {
                if (c == id) {
                    return true;
                }
            }
            return false;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0050  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static int translateResId(int r7, android.content.res.XResources r8, android.content.res.Resources r9) {
        /*
            r0 = r9
            r1 = r7
            java.lang.String r0 = r0.getResourceEntryName(r1)     // Catch: java.lang.Exception -> Lbf
            r10 = r0
            r0 = r9
            r1 = r7
            java.lang.String r0 = r0.getResourceTypeName(r1)     // Catch: java.lang.Exception -> Lbf
            r11 = r0
            r0 = r8
            java.lang.String r0 = r0.mPackageName     // Catch: java.lang.Exception -> Lbf
            r12 = r0
            r0 = 0
            r13 = r0
            r0 = r8
            r1 = r10
            r2 = r11
            r3 = r12
            int r0 = r0.getIdentifier(r1, r2, r3)     // Catch: android.content.res.Resources.NotFoundException -> L24 java.lang.Exception -> Lbf
            r13 = r0
            goto L26
        L24:
            r14 = move-exception
        L26:
            r0 = 0
            r14 = r0
            android.util.TypedValue r0 = new android.util.TypedValue     // Catch: android.content.res.Resources.NotFoundException -> L56 java.lang.Exception -> Lbf
            r1 = r0
            r1.<init>()     // Catch: android.content.res.Resources.NotFoundException -> L56 java.lang.Exception -> Lbf
            r15 = r0
            r0 = r9
            r1 = r7
            r2 = r15
            r3 = 0
            r0.getValue(r1, r2, r3)     // Catch: android.content.res.Resources.NotFoundException -> L56 java.lang.Exception -> Lbf
            r0 = r15
            int r0 = r0.type     // Catch: android.content.res.Resources.NotFoundException -> L56 java.lang.Exception -> Lbf
            r1 = 18
            if (r0 != r1) goto L50
            r0 = r15
            int r0 = r0.data     // Catch: android.content.res.Resources.NotFoundException -> L56 java.lang.Exception -> Lbf
            if (r0 != 0) goto L50
            r0 = 0
            goto L51
        L50:
            r0 = 1
        L51:
            r14 = r0
            goto L58
        L56:
            r15 = move-exception
        L58:
            r0 = r14
            if (r0 != 0) goto L91
            r0 = r13
            if (r0 != 0) goto L91
            r0 = r11
            java.lang.String r1 = "id"
            boolean r0 = r0.equals(r1)     // Catch: java.lang.Exception -> Lbf
            if (r0 != 0) goto L91
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch: java.lang.Exception -> Lbf
            r1 = r0
            r2 = r11
            java.lang.String r2 = java.lang.String.valueOf(r2)     // Catch: java.lang.Exception -> Lbf
            r1.<init>(r2)     // Catch: java.lang.Exception -> Lbf
            java.lang.String r1 = "/"
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch: java.lang.Exception -> Lbf
            r1 = r10
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch: java.lang.Exception -> Lbf
            java.lang.String r1 = " is neither defined in module nor in original resources"
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch: java.lang.Exception -> Lbf
            java.lang.String r0 = r0.toString()     // Catch: java.lang.Exception -> Lbf
            de.robv.android.xposed.XposedBridge.log(r0)     // Catch: java.lang.Exception -> Lbf
            r0 = 0
            return r0
        L91:
            r0 = r13
            if (r0 != 0) goto L9d
            r0 = r9
            r1 = r7
            int r0 = getFakeResId(r0, r1)     // Catch: java.lang.Exception -> Lbf
            r13 = r0
        L9d:
            r0 = r14
            if (r0 == 0) goto Lbc
            r0 = r11
            java.lang.String r1 = "id"
            boolean r0 = r0.equals(r1)     // Catch: java.lang.Exception -> Lbf
            if (r0 != 0) goto Lbc
            r0 = r8
            r1 = r13
            android.content.res.XResForwarder r2 = new android.content.res.XResForwarder     // Catch: java.lang.Exception -> Lbf
            r3 = r2
            r4 = r9
            r5 = r7
            r3.<init>(r4, r5)     // Catch: java.lang.Exception -> Lbf
            r0.setReplacement(r1, r2)     // Catch: java.lang.Exception -> Lbf
        Lbc:
            r0 = r13
            return r0
        Lbf:
            r10 = move-exception
            r0 = r10
            de.robv.android.xposed.XposedBridge.log(r0)
            r0 = r7
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: android.content.res.XResources.translateResId(int, android.content.res.XResources, android.content.res.Resources):int");
    }

    public static int getFakeResId(String resName) {
        return 2113929216 | (resName.hashCode() & 16777215);
    }

    public static int getFakeResId(Resources res, int id) {
        return getFakeResId(res.getResourceName(id));
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v2, types: [android.util.SparseArray<java.util.HashMap<java.lang.String, java.lang.Object>>] */
    /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v6 */
    public int addResource(Resources res, int id) {
        int fakeId = getFakeResId(res, id);
        ?? r0 = sReplacements;
        synchronized (r0) {
            if (sReplacements.indexOfKey(fakeId) < 0) {
                setReplacement(fakeId, new XResForwarder(res, id));
            }
            r0 = r0;
            return fakeId;
        }
    }

    private static int translateAttrId(String attrName, XResources origRes) {
        String origPackage = origRes.mPackageName;
        int origAttrId = 0;
        try {
            origAttrId = origRes.getIdentifier(attrName, "attr", origPackage);
        } catch (Resources.NotFoundException e) {
            XposedBridge.log("Attribute " + attrName + " not found in original resources");
        }
        return origAttrId;
    }

    /* loaded from: XposedBridgeApi-54.jar:android/content/res/XResources$XTypedArray.class */
    public static class XTypedArray extends TypedArray {
        private boolean mIsObjectInited;
        private XResources mRes;

        private XTypedArray() {
            super(null, null, null, 0);
            throw new UnsupportedOperationException();
        }

        public void initObject(XResources res) {
            if (this.mIsObjectInited) {
                throw new IllegalStateException("Object has already been initialized");
            }
            this.mRes = res;
            this.mIsObjectInited = true;
        }

        @Override // android.content.res.TypedArray
        public boolean getBoolean(int index, boolean defValue) {
            Object replacement = this.mRes.getReplacement(getResourceId(index, 0));
            if (replacement instanceof Boolean) {
                return ((Boolean) replacement).booleanValue();
            }
            if (replacement instanceof XResForwarder) {
                Resources repRes = ((XResForwarder) replacement).getResources();
                int repId = ((XResForwarder) replacement).getId();
                return repRes.getBoolean(repId);
            }
            return super.getBoolean(index, defValue);
        }

        @Override // android.content.res.TypedArray
        public int getColor(int index, int defValue) {
            Object replacement = this.mRes.getReplacement(getResourceId(index, 0));
            if (replacement instanceof Integer) {
                return ((Integer) replacement).intValue();
            }
            if (replacement instanceof XResForwarder) {
                Resources repRes = ((XResForwarder) replacement).getResources();
                int repId = ((XResForwarder) replacement).getId();
                return repRes.getColor(repId);
            }
            return super.getColor(index, defValue);
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v22, types: [android.util.SparseArray] */
        /* JADX WARN: Type inference failed for: r0v23, types: [java.lang.Throwable] */
        /* JADX WARN: Type inference failed for: r0v28, types: [android.content.res.ColorStateList] */
        @Override // android.content.res.TypedArray
        public ColorStateList getColorStateList(int index) {
            Object replacement = this.mRes.getReplacement(getResourceId(index, 0));
            if (replacement instanceof ColorStateList) {
                return (ColorStateList) replacement;
            }
            if (replacement instanceof Integer) {
                int color = ((Integer) replacement).intValue();
                ?? r0 = XResources.sColorStateListCache;
                synchronized (r0) {
                    ColorStateList result = (ColorStateList) XResources.sColorStateListCache.get(color);
                    if (result == null) {
                        result = ColorStateList.valueOf(color);
                        XResources.sColorStateListCache.put(color, result);
                    }
                    r0 = result;
                }
                return r0;
            }
            if (replacement instanceof XResForwarder) {
                Resources repRes = ((XResForwarder) replacement).getResources();
                int repId = ((XResForwarder) replacement).getId();
                return repRes.getColorStateList(repId);
            }
            return super.getColorStateList(index);
        }

        @Override // android.content.res.TypedArray
        public float getDimension(int index, float defValue) {
            Object replacement = this.mRes.getReplacement(getResourceId(index, 0));
            if (replacement instanceof XResForwarder) {
                Resources repRes = ((XResForwarder) replacement).getResources();
                int repId = ((XResForwarder) replacement).getId();
                return repRes.getDimension(repId);
            }
            return super.getDimension(index, defValue);
        }

        @Override // android.content.res.TypedArray
        public int getDimensionPixelOffset(int index, int defValue) {
            Object replacement = this.mRes.getReplacement(getResourceId(index, 0));
            if (replacement instanceof XResForwarder) {
                Resources repRes = ((XResForwarder) replacement).getResources();
                int repId = ((XResForwarder) replacement).getId();
                return repRes.getDimensionPixelOffset(repId);
            }
            return super.getDimensionPixelOffset(index, defValue);
        }

        @Override // android.content.res.TypedArray
        public int getDimensionPixelSize(int index, int defValue) {
            Object replacement = this.mRes.getReplacement(getResourceId(index, 0));
            if (replacement instanceof XResForwarder) {
                Resources repRes = ((XResForwarder) replacement).getResources();
                int repId = ((XResForwarder) replacement).getId();
                return repRes.getDimensionPixelSize(repId);
            }
            return super.getDimensionPixelSize(index, defValue);
        }

        @Override // android.content.res.TypedArray
        public Drawable getDrawable(int index) {
            int resId = getResourceId(index, 0);
            Object replacement = this.mRes.getReplacement(resId);
            if (replacement instanceof DrawableLoader) {
                try {
                    Drawable result = ((DrawableLoader) replacement).newDrawable(this.mRes, resId);
                    if (result != null) {
                        return result;
                    }
                } catch (Throwable t) {
                    XposedBridge.log(t);
                }
            } else {
                if (replacement instanceof Integer) {
                    return new ColorDrawable(((Integer) replacement).intValue());
                }
                if (replacement instanceof XResForwarder) {
                    Resources repRes = ((XResForwarder) replacement).getResources();
                    int repId = ((XResForwarder) replacement).getId();
                    return repRes.getDrawable(repId);
                }
            }
            return super.getDrawable(index);
        }

        @Override // android.content.res.TypedArray
        public float getFloat(int index, float defValue) {
            Object replacement = this.mRes.getReplacement(getResourceId(index, 0));
            if (replacement instanceof XResForwarder) {
                Resources repRes = ((XResForwarder) replacement).getResources();
                int repId = ((XResForwarder) replacement).getId();
                return repRes.getDimension(repId);
            }
            return super.getFloat(index, defValue);
        }

        @Override // android.content.res.TypedArray
        public float getFraction(int index, int base, int pbase, float defValue) {
            Object replacement = this.mRes.getReplacement(getResourceId(index, 0));
            if (replacement instanceof XResForwarder) {
                Resources repRes = ((XResForwarder) replacement).getResources();
                int repId = ((XResForwarder) replacement).getId();
                return repRes.getFraction(repId, base, pbase);
            }
            return super.getFraction(index, base, pbase, defValue);
        }

        @Override // android.content.res.TypedArray
        public int getInt(int index, int defValue) {
            Object replacement = this.mRes.getReplacement(getResourceId(index, 0));
            if (replacement instanceof Integer) {
                return ((Integer) replacement).intValue();
            }
            if (replacement instanceof XResForwarder) {
                Resources repRes = ((XResForwarder) replacement).getResources();
                int repId = ((XResForwarder) replacement).getId();
                return repRes.getInteger(repId);
            }
            return super.getInt(index, defValue);
        }

        @Override // android.content.res.TypedArray
        public int getInteger(int index, int defValue) {
            Object replacement = this.mRes.getReplacement(getResourceId(index, 0));
            if (replacement instanceof Integer) {
                return ((Integer) replacement).intValue();
            }
            if (replacement instanceof XResForwarder) {
                Resources repRes = ((XResForwarder) replacement).getResources();
                int repId = ((XResForwarder) replacement).getId();
                return repRes.getInteger(repId);
            }
            return super.getInteger(index, defValue);
        }

        @Override // android.content.res.TypedArray
        public int getLayoutDimension(int index, int defValue) {
            Object replacement = this.mRes.getReplacement(getResourceId(index, 0));
            if (replacement instanceof XResForwarder) {
                Resources repRes = ((XResForwarder) replacement).getResources();
                int repId = ((XResForwarder) replacement).getId();
                return repRes.getDimensionPixelSize(repId);
            }
            return super.getLayoutDimension(index, defValue);
        }

        @Override // android.content.res.TypedArray
        public int getLayoutDimension(int index, String name) {
            Object replacement = this.mRes.getReplacement(getResourceId(index, 0));
            if (replacement instanceof XResForwarder) {
                Resources repRes = ((XResForwarder) replacement).getResources();
                int repId = ((XResForwarder) replacement).getId();
                return repRes.getDimensionPixelSize(repId);
            }
            return super.getLayoutDimension(index, name);
        }

        @Override // android.content.res.TypedArray
        public String getString(int index) {
            Object replacement = this.mRes.getReplacement(getResourceId(index, 0));
            if (replacement instanceof CharSequence) {
                return replacement.toString();
            }
            if (replacement instanceof XResForwarder) {
                Resources repRes = ((XResForwarder) replacement).getResources();
                int repId = ((XResForwarder) replacement).getId();
                return repRes.getString(repId);
            }
            return super.getString(index);
        }

        @Override // android.content.res.TypedArray
        public CharSequence getText(int index) {
            Object replacement = this.mRes.getReplacement(getResourceId(index, 0));
            if (replacement instanceof CharSequence) {
                return (CharSequence) replacement;
            }
            if (replacement instanceof XResForwarder) {
                Resources repRes = ((XResForwarder) replacement).getResources();
                int repId = ((XResForwarder) replacement).getId();
                return repRes.getText(repId);
            }
            return super.getText(index);
        }

        @Override // android.content.res.TypedArray
        public CharSequence[] getTextArray(int index) {
            Object replacement = this.mRes.getReplacement(getResourceId(index, 0));
            if (replacement instanceof CharSequence[]) {
                return (CharSequence[]) replacement;
            }
            if (replacement instanceof XResForwarder) {
                Resources repRes = ((XResForwarder) replacement).getResources();
                int repId = ((XResForwarder) replacement).getId();
                return repRes.getTextArray(repId);
            }
            return super.getTextArray(index);
        }
    }

    /* loaded from: XposedBridgeApi-54.jar:android/content/res/XResources$DrawableLoader.class */
    public static abstract class DrawableLoader {
        public abstract Drawable newDrawable(XResources xResources, int i) throws Throwable;

        public Drawable newDrawableForDensity(XResources res, int id, int density) throws Throwable {
            return newDrawable(res, id);
        }
    }

    /* loaded from: XposedBridgeApi-54.jar:android/content/res/XResources$DimensionReplacement.class */
    public static class DimensionReplacement {
        private final float mValue;
        private final int mUnit;

        public DimensionReplacement(float value, int unit) {
            this.mValue = value;
            this.mUnit = unit;
        }

        public float getDimension(DisplayMetrics metrics) {
            return TypedValue.applyDimension(this.mUnit, this.mValue, metrics);
        }

        public int getDimensionPixelOffset(DisplayMetrics metrics) {
            return (int) TypedValue.applyDimension(this.mUnit, this.mValue, metrics);
        }

        public int getDimensionPixelSize(DisplayMetrics metrics) {
            float f = TypedValue.applyDimension(this.mUnit, this.mValue, metrics);
            int res = (int) (f + 0.5f);
            if (res != 0) {
                return res;
            }
            if (this.mValue == 0.0f) {
                return 0;
            }
            return this.mValue > 0.0f ? 1 : -1;
        }
    }

    /* loaded from: XposedBridgeApi-54.jar:android/content/res/XResources$XMLInstanceDetails.class */
    private class XMLInstanceDetails {
        public final ResourceNames resNames;
        public final String variant;
        public final XposedBridge.CopyOnWriteSortedSet<XC_LayoutInflated> callbacks;
        public final XResources res;

        private XMLInstanceDetails(ResourceNames resNames, String variant, XposedBridge.CopyOnWriteSortedSet<XC_LayoutInflated> callbacks) {
            this.res = XResources.this;
            this.resNames = resNames;
            this.variant = variant;
            this.callbacks = callbacks;
        }

        /* synthetic */ XMLInstanceDetails(XResources xResources, ResourceNames resourceNames, String str, XposedBridge.CopyOnWriteSortedSet copyOnWriteSortedSet, XMLInstanceDetails xMLInstanceDetails) {
            this(resourceNames, str, copyOnWriteSortedSet);
        }
    }

    public XC_LayoutInflated.Unhook hookLayout(int id, XC_LayoutInflated callback) {
        return hookLayoutInternal(this.mResDir, id, getResourceNames(id), callback);
    }

    public XC_LayoutInflated.Unhook hookLayout(String fullName, XC_LayoutInflated callback) {
        int id = getIdentifier(fullName, null, null);
        if (id == 0) {
            throw new Resources.NotFoundException(fullName);
        }
        return hookLayout(id, callback);
    }

    public XC_LayoutInflated.Unhook hookLayout(String pkg, String type, String name, XC_LayoutInflated callback) {
        int id = getIdentifier(name, type, pkg);
        if (id == 0) {
            throw new Resources.NotFoundException(String.valueOf(pkg) + ":" + type + "/" + name);
        }
        return hookLayout(id, callback);
    }

    public static XC_LayoutInflated.Unhook hookSystemWideLayout(int id, XC_LayoutInflated callback) {
        if (id >= 2130706432) {
            throw new IllegalArgumentException("ids >= 0x7f000000 are app specific and cannot be set for the framework");
        }
        return hookLayoutInternal(null, id, getSystemResourceNames(id), callback);
    }

    public static XC_LayoutInflated.Unhook hookSystemWideLayout(String fullName, XC_LayoutInflated callback) {
        int id = getSystem().getIdentifier(fullName, null, null);
        if (id == 0) {
            throw new Resources.NotFoundException(fullName);
        }
        return hookSystemWideLayout(id, callback);
    }

    public static XC_LayoutInflated.Unhook hookSystemWideLayout(String pkg, String type, String name, XC_LayoutInflated callback) {
        int id = getSystem().getIdentifier(name, type, pkg);
        if (id == 0) {
            throw new Resources.NotFoundException(String.valueOf(pkg) + ":" + type + "/" + name);
        }
        return hookSystemWideLayout(id, callback);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [android.util.SparseArray<java.util.HashMap<java.lang.String, de.robv.android.xposed.XposedBridge$CopyOnWriteSortedSet<de.robv.android.xposed.callbacks.XC_LayoutInflated>>>] */
    /* JADX WARN: Type inference failed for: r0v14 */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v7 */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r0v9, types: [java.lang.Throwable] */
    private static XC_LayoutInflated.Unhook hookLayoutInternal(String resDir, int id, ResourceNames resNames, XC_LayoutInflated callback) {
        if (id == 0) {
            throw new IllegalArgumentException("id 0 is not an allowed resource identifier");
        }
        ?? r0 = sLayoutCallbacks;
        synchronized (r0) {
            HashMap<String, XposedBridge.CopyOnWriteSortedSet<XC_LayoutInflated>> inner = sLayoutCallbacks.get(id);
            if (inner == null) {
                inner = new HashMap<>();
                sLayoutCallbacks.put(id, inner);
            }
            r0 = r0;
            ?? r02 = inner;
            synchronized (r02) {
                XposedBridge.CopyOnWriteSortedSet<XC_LayoutInflated> callbacks = inner.get(resDir);
                if (callbacks == null) {
                    callbacks = new XposedBridge.CopyOnWriteSortedSet<>();
                    inner.put(resDir, callbacks);
                }
                r02 = r02;
                callbacks.add(callback);
                putResourceNames(resDir, resNames);
                callback.getClass();
                return callback.new Unhook(resDir, id);
            }
        }
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [android.util.SparseArray<java.util.HashMap<java.lang.String, de.robv.android.xposed.XposedBridge$CopyOnWriteSortedSet<de.robv.android.xposed.callbacks.XC_LayoutInflated>>>, java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Throwable, java.util.HashMap] */
    public static void unhookLayout(String resDir, int id, XC_LayoutInflated callback) {
        synchronized (sLayoutCallbacks) {
            ?? r0 = (HashMap) sLayoutCallbacks.get(id);
            if (r0 == 0) {
                return;
            }
            synchronized (r0) {
                XposedBridge.CopyOnWriteSortedSet<XC_LayoutInflated> callbacks = (XposedBridge.CopyOnWriteSortedSet) r0.get(resDir);
                if (callbacks == null) {
                    return;
                }
                callbacks.remove(callback);
            }
        }
    }
}
