package de.robv.android.xposed;

import android.annotation.SuppressLint;
import android.app.ActivityThread;
import android.app.AndroidAppHelper;
import android.app.LoadedApk;
import android.content.ComponentName;
import android.content.pm.ApplicationInfo;
import android.content.res.CompatibilityInfo;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.content.res.XResources;
import android.os.Build;
import android.os.Process;
import android.util.Log;
import com.android.internal.os.RuntimeInit;
import com.android.internal.os.ZygoteInit;
import dalvik.system.PathClassLoader;
import de.robv.android.xposed.IXposedHookCmdInit;
import de.robv.android.xposed.IXposedHookInitPackageResources;
import de.robv.android.xposed.IXposedHookLoadPackage;
import de.robv.android.xposed.IXposedHookZygoteInit;
import de.robv.android.xposed.XC_MethodHook;
import de.robv.android.xposed.XC_MethodHook.Unhook;
import de.robv.android.xposed.callbacks.XC_InitPackageResources;
import de.robv.android.xposed.callbacks.XC_InitPackageResources.Unhook;
import de.robv.android.xposed.callbacks.XC_LoadPackage;
import de.robv.android.xposed.callbacks.XC_LoadPackage.Unhook;
import de.robv.android.xposed.callbacks.XCallback;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Member;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.text.DateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/XposedBridge.class */
public final class XposedBridge {
    public static final String INSTALLER_PACKAGE_NAME = "de.robv.android.xposed.installer";
    public static int XPOSED_BRIDGE_VERSION;
    private static final int MAX_LOGFILE_SIZE = 20480;

    @SuppressLint({"SdCardPath"})
    public static final String BASE_DIR = "/data/data/de.robv.android.xposed.installer/";
    private static PrintWriter logWriter = null;
    private static boolean disableHooks = false;
    public static boolean disableResources = false;
    private static final Object[] EMPTY_ARRAY = new Object[0];
    public static final ClassLoader BOOTCLASSLOADER = ClassLoader.getSystemClassLoader();
    private static final Map<Member, CopyOnWriteSortedSet<XC_MethodHook>> sHookedMethodCallbacks = new HashMap();
    private static final CopyOnWriteSortedSet<XC_LoadPackage> sLoadedPackageCallbacks = new CopyOnWriteSortedSet<>();
    private static final CopyOnWriteSortedSet<XC_InitPackageResources> sInitPackageResourcesCallbacks = new CopyOnWriteSortedSet<>();

    private static native String getStartClassName();

    private static native boolean initNative();

    private static native synchronized void hookMethodNative(Member member, Class<?> cls, int i, Object obj);

    private static native Object invokeOriginalMethodNative(Member member, int i, Class<?>[] clsArr, Class<?> cls, Object obj, Object[] objArr) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException;

    @Deprecated
    private static native synchronized void hookMethodNative(Class<?> cls, int i);

    @Deprecated
    private static native Object invokeOriginalMethodNative(Member member, Class<?>[] clsArr, Class<?> cls, Object obj, Object[] objArr) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException;

    private static native void setObjectClassNative(Object obj, Class<?> cls);

    static native void dumpObjectNative(Object obj);

    private static native Object cloneToSubclassNative(Object obj, Class<?> cls);

    private static void main(String[] args) {
        String startClassName = getStartClassName();
        try {
            try {
                File logFile = new File("/data/data/de.robv.android.xposed.installer/log/error.log");
                if (startClassName == null && logFile.length() > 20480) {
                    logFile.renameTo(new File("/data/data/de.robv.android.xposed.installer/log/error.log.old"));
                }
                logWriter = new PrintWriter(new FileWriter(logFile, true));
                logFile.setReadable(true, false);
                logFile.setWritable(true, false);
            } catch (Throwable t) {
                log("Errors during Xposed initialization");
                log(t);
                disableHooks = true;
            }
        } catch (IOException e) {
        }
        String date = DateFormat.getDateTimeInstance().format(new Date());
        determineXposedVersion();
        log("-----------------\n" + date + " UTC\nLoading Xposed v" + XPOSED_BRIDGE_VERSION + " (for " + (startClassName == null ? "Zygote" : startClassName) + ")...");
        if (startClassName == null) {
            log("Running ROM '" + Build.DISPLAY + "' with fingerprint '" + Build.FINGERPRINT + "'");
        }
        if (initNative()) {
            if (startClassName == null) {
                initXbridgeZygote();
            }
            loadModules(startClassName);
        } else {
            log("Errors during native Xposed initialization");
        }
        if (startClassName == null) {
            ZygoteInit.main(args);
        } else {
            RuntimeInit.main(args);
        }
    }

    private static void determineXposedVersion() throws IOException {
        ZipEntry entry;
        ZipInputStream is = new ZipInputStream(new FileInputStream("/data/data/de.robv.android.xposed.installer/bin/XposedBridge.jar"));
        do {
            try {
                entry = is.getNextEntry();
                if (entry == null) {
                    throw new RuntimeException("could not find assets/VERSION in /data/data/de.robv.android.xposed.installer/bin/XposedBridge.jar");
                }
            } catch (Throwable th) {
                try {
                    is.close();
                } catch (Exception e) {
                }
                throw th;
            }
        } while (!entry.getName().equals("assets/VERSION"));
        BufferedReader br = new BufferedReader(new InputStreamReader(is));
        String version = br.readLine();
        br.close();
        XPOSED_BRIDGE_VERSION = extractIntPart(version);
        if (XPOSED_BRIDGE_VERSION == 0) {
            throw new RuntimeException("could not parse XposedBridge version from \"" + version + "\"");
        }
        try {
            is.close();
        } catch (Exception e2) {
        }
    }

    private static int extractIntPart(String str) {
        char c;
        int result = 0;
        int length = str.length();
        for (int offset = 0; offset < length && '0' <= (c = str.charAt(offset)) && c <= '9'; offset++) {
            result = (result * 10) + (c - '0');
        }
        return result;
    }

    private static void initXbridgeZygote() throws Throwable {
        final HashSet<String> loadedPackagesInProcess = new HashSet<>(1);
        XposedHelpers.findAndHookMethod(ActivityThread.class, "handleBindApplication", "android.app.ActivityThread.AppBindData", new XC_MethodHook() { // from class: de.robv.android.xposed.XposedBridge.1
            @Override // de.robv.android.xposed.XC_MethodHook
            protected void beforeHookedMethod(XC_MethodHook.MethodHookParam param) throws Throwable {
                ActivityThread activityThread = (ActivityThread) param.thisObject;
                ApplicationInfo appInfo = (ApplicationInfo) XposedHelpers.getObjectField(param.args[0], "appInfo");
                ComponentName instrumentationName = (ComponentName) XposedHelpers.getObjectField(param.args[0], "instrumentationName");
                if (instrumentationName != null) {
                    XposedBridge.log("Instrumentation detected, disabling framework for " + appInfo.packageName);
                    XposedBridge.disableHooks = true;
                    return;
                }
                CompatibilityInfo compatInfo = (CompatibilityInfo) XposedHelpers.getObjectField(param.args[0], "compatInfo");
                if (appInfo.sourceDir == null) {
                    return;
                }
                XposedHelpers.setObjectField(activityThread, "mBoundApplication", param.args[0]);
                loadedPackagesInProcess.add(appInfo.packageName);
                LoadedApk loadedApk = activityThread.getPackageInfoNoCheck(appInfo, compatInfo);
                XResources.setPackageNameForResDir(appInfo.packageName, loadedApk.getResDir());
                XC_LoadPackage.LoadPackageParam lpparam = new XC_LoadPackage.LoadPackageParam(XposedBridge.sLoadedPackageCallbacks);
                lpparam.packageName = appInfo.packageName;
                lpparam.processName = (String) XposedHelpers.getObjectField(param.args[0], "processName");
                lpparam.classLoader = loadedApk.getClassLoader();
                lpparam.appInfo = appInfo;
                lpparam.isFirstApplication = true;
                XC_LoadPackage.callAll(lpparam);
                if (!appInfo.packageName.equals(XposedBridge.INSTALLER_PACKAGE_NAME)) {
                    return;
                }
                XposedBridge.hookXposedInstaller(lpparam.classLoader);
            }
        });
        XposedHelpers.findAndHookMethod("com.android.server.ServerThread", null, Build.VERSION.SDK_INT < 19 ? "run" : "initAndLoop", new XC_MethodHook() { // from class: de.robv.android.xposed.XposedBridge.2
            @Override // de.robv.android.xposed.XC_MethodHook
            protected void beforeHookedMethod(XC_MethodHook.MethodHookParam param) throws Throwable {
                loadedPackagesInProcess.add("android");
                XC_LoadPackage.LoadPackageParam lpparam = new XC_LoadPackage.LoadPackageParam(XposedBridge.sLoadedPackageCallbacks);
                lpparam.packageName = "android";
                lpparam.processName = "android";
                lpparam.classLoader = XposedBridge.BOOTCLASSLOADER;
                lpparam.appInfo = null;
                lpparam.isFirstApplication = true;
                XC_LoadPackage.callAll(lpparam);
            }
        });
        hookAllConstructors(LoadedApk.class, new XC_MethodHook() { // from class: de.robv.android.xposed.XposedBridge.3
            @Override // de.robv.android.xposed.XC_MethodHook
            protected void afterHookedMethod(XC_MethodHook.MethodHookParam param) throws Throwable {
                LoadedApk loadedApk = (LoadedApk) param.thisObject;
                String packageName = loadedApk.getPackageName();
                XResources.setPackageNameForResDir(packageName, loadedApk.getResDir());
                if (packageName.equals("android") || !loadedPackagesInProcess.add(packageName) || !Boolean.valueOf(XposedHelpers.getBooleanField(loadedApk, "mIncludeCode")).booleanValue()) {
                    return;
                }
                XC_LoadPackage.LoadPackageParam lpparam = new XC_LoadPackage.LoadPackageParam(XposedBridge.sLoadedPackageCallbacks);
                lpparam.packageName = packageName;
                lpparam.processName = AndroidAppHelper.currentProcessName();
                lpparam.classLoader = loadedApk.getClassLoader();
                lpparam.appInfo = loadedApk.getApplicationInfo();
                lpparam.isFirstApplication = false;
                XC_LoadPackage.callAll(lpparam);
            }
        });
        XposedHelpers.findAndHookMethod("android.app.ApplicationPackageManager", null, "getResourcesForApplication", ApplicationInfo.class, new XC_MethodHook() { // from class: de.robv.android.xposed.XposedBridge.4
            @Override // de.robv.android.xposed.XC_MethodHook
            protected void beforeHookedMethod(XC_MethodHook.MethodHookParam param) throws Throwable {
                ApplicationInfo app = (ApplicationInfo) param.args[0];
                XResources.setPackageNameForResDir(app.packageName, app.uid == Process.myUid() ? app.sourceDir : app.publicSourceDir);
            }
        });
        if (!new File("/data/data/de.robv.android.xposed.installer/conf/disable_resources").exists()) {
            hookResources();
        } else {
            disableResources = true;
        }
    }

    private static void hookResources() throws Throwable {
        Class<?> classGTLR;
        Class<?> classResKey;
        final ThreadLocal<Object> latestResKey = new ThreadLocal<>();
        if (Build.VERSION.SDK_INT <= 18) {
            classGTLR = ActivityThread.class;
            classResKey = Class.forName("android.app.ActivityThread$ResourcesKey");
        } else {
            classGTLR = Class.forName("android.app.ResourcesManager");
            classResKey = Class.forName("android.content.res.ResourcesKey");
        }
        hookAllConstructors(classResKey, new XC_MethodHook() { // from class: de.robv.android.xposed.XposedBridge.5
            @Override // de.robv.android.xposed.XC_MethodHook
            protected void afterHookedMethod(XC_MethodHook.MethodHookParam param) throws Throwable {
                latestResKey.set(param.thisObject);
            }
        });
        hookAllMethods(classGTLR, "getTopLevelResources", new XC_MethodHook() { // from class: de.robv.android.xposed.XposedBridge.6
            @Override // de.robv.android.xposed.XC_MethodHook
            protected void beforeHookedMethod(XC_MethodHook.MethodHookParam param) throws Throwable {
                latestResKey.set(null);
            }

            /* JADX WARN: Multi-variable type inference failed */
            /* JADX WARN: Type inference failed for: r0v26 */
            /* JADX WARN: Type inference failed for: r0v27, types: [java.lang.Throwable] */
            /* JADX WARN: Type inference failed for: r0v34 */
            @Override // de.robv.android.xposed.XC_MethodHook
            protected void afterHookedMethod(XC_MethodHook.MethodHookParam param) throws Throwable {
                Object key = latestResKey.get();
                if (key == null) {
                    return;
                }
                latestResKey.set(null);
                Object result = param.getResult();
                if (result == null || (result instanceof XResources)) {
                    return;
                }
                XResources newRes = (XResources) XposedBridge.cloneToSubclass(result, XResources.class);
                String resDir = (String) XposedHelpers.getObjectField(key, "mResDir");
                newRes.initObject(resDir);
                Map<Object, WeakReference<Resources>> mActiveResources = (Map) XposedHelpers.getObjectField(param.thisObject, "mActiveResources");
                Object lockObject = Build.VERSION.SDK_INT <= 18 ? XposedHelpers.getObjectField(param.thisObject, "mPackages") : param.thisObject;
                ?? r0 = lockObject;
                synchronized (r0) {
                    WeakReference<Resources> existing = mActiveResources.get(key);
                    if (existing != null && existing.get() != null && existing.get().getAssets() != newRes.getAssets()) {
                        existing.get().getAssets().close();
                    }
                    mActiveResources.put(key, new WeakReference<>(newRes));
                    r0 = r0;
                    if (newRes.isFirstLoad()) {
                        String packageName = newRes.getPackageName();
                        XC_InitPackageResources.InitPackageResourcesParam resparam = new XC_InitPackageResources.InitPackageResourcesParam(XposedBridge.sInitPackageResourcesCallbacks);
                        resparam.packageName = packageName;
                        resparam.res = newRes;
                        XCallback.callAll(resparam);
                    }
                    param.setResult(newRes);
                }
            }
        });
        hookAllConstructors(TypedArray.class, new XC_MethodHook() { // from class: de.robv.android.xposed.XposedBridge.7
            @Override // de.robv.android.xposed.XC_MethodHook
            protected void afterHookedMethod(XC_MethodHook.MethodHookParam param) throws Throwable {
                TypedArray typedArray = (TypedArray) param.thisObject;
                Resources res = typedArray.getResources();
                if (!(res instanceof XResources)) {
                    return;
                }
                XposedBridge.setObjectClass(param.thisObject, XResources.XTypedArray.class);
                ((XResources.XTypedArray) typedArray).initObject((XResources) res);
            }
        });
        XResources systemRes = (XResources) cloneToSubclass(Resources.getSystem(), XResources.class);
        systemRes.initObject(null);
        XposedHelpers.setStaticObjectField(Resources.class, "mSystem", systemRes);
        XResources.init(latestResKey);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void hookXposedInstaller(ClassLoader classLoader) {
        try {
            XposedHelpers.findAndHookMethod("de.robv.android.xposed.installer.XposedApp", classLoader, "getActiveXposedVersion", XC_MethodReplacement.returnConstant(Integer.valueOf(XPOSED_BRIDGE_VERSION)));
        } catch (Throwable t) {
            log(t);
        }
    }

    private static void loadModules(String startClassName) throws IOException {
        BufferedReader apks = new BufferedReader(new FileReader("/data/data/de.robv.android.xposed.installer/conf/modules.list"));
        while (true) {
            String apk = apks.readLine();
            if (apk != null) {
                loadModule(apk, startClassName);
            } else {
                apks.close();
                return;
            }
        }
    }

    private static void loadModule(String apk, String startClassName) {
        log("Loading modules from " + apk);
        if (!new File(apk).exists()) {
            log("  File does not exist");
            return;
        }
        ClassLoader mcl = new PathClassLoader(apk, BOOTCLASSLOADER);
        InputStream is = mcl.getResourceAsStream("assets/xposed_init");
        if (is == null) {
            log("assets/xposed_init not found in the APK");
            return;
        }
        BufferedReader moduleClassesReader = new BufferedReader(new InputStreamReader(is));
        while (true) {
            try {
                try {
                    String moduleClassName = moduleClassesReader.readLine();
                    if (moduleClassName != null) {
                        String moduleClassName2 = moduleClassName.trim();
                        if (!moduleClassName2.isEmpty() && !moduleClassName2.startsWith("#")) {
                            try {
                                log("  Loading class " + moduleClassName2);
                                Class<?> moduleClass = mcl.loadClass(moduleClassName2);
                                if (!IXposedMod.class.isAssignableFrom(moduleClass)) {
                                    log("    This class doesn't implement any sub-interface of IXposedMod, skipping it");
                                } else if (disableResources && IXposedHookInitPackageResources.class.isAssignableFrom(moduleClass)) {
                                    log("    This class requires resource-related hooks (which are disabled), skipping it.");
                                } else {
                                    Object moduleInstance = moduleClass.newInstance();
                                    if (startClassName == null) {
                                        if (moduleInstance instanceof IXposedHookZygoteInit) {
                                            IXposedHookZygoteInit.StartupParam param = new IXposedHookZygoteInit.StartupParam();
                                            param.modulePath = apk;
                                            ((IXposedHookZygoteInit) moduleInstance).initZygote(param);
                                        }
                                        if (moduleInstance instanceof IXposedHookLoadPackage) {
                                            hookLoadPackage(new IXposedHookLoadPackage.Wrapper((IXposedHookLoadPackage) moduleInstance));
                                        }
                                        if (moduleInstance instanceof IXposedHookInitPackageResources) {
                                            hookInitPackageResources(new IXposedHookInitPackageResources.Wrapper((IXposedHookInitPackageResources) moduleInstance));
                                        }
                                    } else if (moduleInstance instanceof IXposedHookCmdInit) {
                                        IXposedHookCmdInit.StartupParam param2 = new IXposedHookCmdInit.StartupParam();
                                        param2.modulePath = apk;
                                        param2.startClassName = startClassName;
                                        ((IXposedHookCmdInit) moduleInstance).initCmdApp(param2);
                                    }
                                }
                            } catch (Throwable t) {
                                log(t);
                            }
                        }
                    } else {
                        try {
                            is.close();
                            return;
                        } catch (IOException e) {
                            return;
                        }
                    }
                } catch (IOException e2) {
                    log(e2);
                    try {
                        is.close();
                        return;
                    } catch (IOException e3) {
                        return;
                    }
                }
            } catch (Throwable th) {
                try {
                    is.close();
                } catch (IOException e4) {
                }
                throw th;
            }
        }
    }

    public static synchronized void log(String text) {
        Log.i("Xposed", text);
        if (logWriter != null) {
            logWriter.println(text);
            logWriter.flush();
        }
    }

    public static synchronized void log(Throwable t) {
        Log.i("Xposed", Log.getStackTraceString(t));
        if (logWriter != null) {
            t.printStackTrace(logWriter);
            logWriter.flush();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v10, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v15 */
    /* JADX WARN: Type inference failed for: r0v9, types: [java.util.Map<java.lang.reflect.Member, de.robv.android.xposed.XposedBridge$CopyOnWriteSortedSet<de.robv.android.xposed.XC_MethodHook>>] */
    public static XC_MethodHook.Unhook hookMethod(Member hookMethod, XC_MethodHook callback) {
        Class[] parameterTypes;
        Class<?> returnType;
        if (!(hookMethod instanceof Method) && !(hookMethod instanceof Constructor)) {
            throw new IllegalArgumentException("Only methods and constructors can be hooked: " + hookMethod.toString());
        }
        if (hookMethod.getDeclaringClass().isInterface()) {
            throw new IllegalArgumentException("Cannot hook interfaces: " + hookMethod.toString());
        }
        if (Modifier.isAbstract(hookMethod.getModifiers())) {
            throw new IllegalArgumentException("Cannot hook abstract methods: " + hookMethod.toString());
        }
        boolean newMethod = false;
        ?? r0 = sHookedMethodCallbacks;
        synchronized (r0) {
            CopyOnWriteSortedSet<XC_MethodHook> callbacks = sHookedMethodCallbacks.get(hookMethod);
            if (callbacks == null) {
                callbacks = new CopyOnWriteSortedSet<>();
                sHookedMethodCallbacks.put(hookMethod, callbacks);
                newMethod = true;
            }
            r0 = r0;
            callbacks.add(callback);
            if (newMethod) {
                Class<?> declaringClass = hookMethod.getDeclaringClass();
                int slot = XposedHelpers.getIntField(hookMethod, "slot");
                if (hookMethod instanceof Method) {
                    parameterTypes = ((Method) hookMethod).getParameterTypes();
                    returnType = ((Method) hookMethod).getReturnType();
                } else {
                    parameterTypes = ((Constructor) hookMethod).getParameterTypes();
                    returnType = null;
                }
                AdditionalHookInfo additionalInfo = new AdditionalHookInfo(callbacks, parameterTypes, returnType, null);
                hookMethodNative(hookMethod, declaringClass, slot, additionalInfo);
            }
            callback.getClass();
            return callback.new Unhook(hookMethod);
        }
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Throwable, java.util.Map<java.lang.reflect.Member, de.robv.android.xposed.XposedBridge$CopyOnWriteSortedSet<de.robv.android.xposed.XC_MethodHook>>] */
    public static void unhookMethod(Member hookMethod, XC_MethodHook callback) {
        synchronized (sHookedMethodCallbacks) {
            CopyOnWriteSortedSet<XC_MethodHook> callbacks = sHookedMethodCallbacks.get(hookMethod);
            if (callbacks == null) {
                return;
            }
            callbacks.remove(callback);
        }
    }

    public static Set<XC_MethodHook.Unhook> hookAllMethods(Class<?> hookClass, String methodName, XC_MethodHook callback) {
        Set<XC_MethodHook.Unhook> unhooks = new HashSet<>();
        for (Member method : hookClass.getDeclaredMethods()) {
            if (method.getName().equals(methodName)) {
                unhooks.add(hookMethod(method, callback));
            }
        }
        return unhooks;
    }

    public static Set<XC_MethodHook.Unhook> hookAllConstructors(Class<?> hookClass, XC_MethodHook callback) {
        Set<XC_MethodHook.Unhook> unhooks = new HashSet<>();
        for (Member constructor : hookClass.getDeclaredConstructors()) {
            unhooks.add(hookMethod(constructor, callback));
        }
        return unhooks;
    }

    private static Object handleHookedMethod(Member method, int originalMethodId, Object additionalInfoObj, Object thisObject, Object[] args) throws Throwable {
        AdditionalHookInfo additionalInfo = (AdditionalHookInfo) additionalInfoObj;
        if (disableHooks) {
            try {
                return invokeOriginalMethodNative(method, originalMethodId, additionalInfo.parameterTypes, additionalInfo.returnType, thisObject, args);
            } catch (InvocationTargetException e) {
                throw e.getCause();
            }
        }
        Object[] callbacksSnapshot = additionalInfo.callbacks.getSnapshot();
        int callbacksLength = callbacksSnapshot.length;
        if (callbacksLength == 0) {
            try {
                return invokeOriginalMethodNative(method, originalMethodId, additionalInfo.parameterTypes, additionalInfo.returnType, thisObject, args);
            } catch (InvocationTargetException e2) {
                throw e2.getCause();
            }
        }
        XC_MethodHook.MethodHookParam param = new XC_MethodHook.MethodHookParam();
        param.method = method;
        param.thisObject = thisObject;
        param.args = args;
        int beforeIdx = 0;
        while (true) {
            try {
                ((XC_MethodHook) callbacksSnapshot[beforeIdx]).beforeHookedMethod(param);
            } catch (Throwable t) {
                log(t);
                param.setResult(null);
                param.returnEarly = false;
            }
            if (param.returnEarly) {
                beforeIdx++;
                break;
            }
            beforeIdx++;
            if (beforeIdx >= callbacksLength) {
                break;
            }
        }
        if (!param.returnEarly) {
            try {
                param.setResult(invokeOriginalMethodNative(method, originalMethodId, additionalInfo.parameterTypes, additionalInfo.returnType, param.thisObject, param.args));
            } catch (InvocationTargetException e3) {
                param.setThrowable(e3.getCause());
            }
        }
        int afterIdx = beforeIdx - 1;
        do {
            Object lastResult = param.getResult();
            Throwable lastThrowable = param.getThrowable();
            try {
                ((XC_MethodHook) callbacksSnapshot[afterIdx]).afterHookedMethod(param);
            } catch (Throwable t2) {
                log(t2);
                if (lastThrowable == null) {
                    param.setResult(lastResult);
                } else {
                    param.setThrowable(lastThrowable);
                }
            }
            afterIdx--;
        } while (afterIdx >= 0);
        if (param.hasThrowable()) {
            throw param.getThrowable();
        }
        return param.getResult();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0, types: [de.robv.android.xposed.XposedBridge$CopyOnWriteSortedSet<de.robv.android.xposed.callbacks.XC_LoadPackage>] */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v4 */
    public static XC_LoadPackage.Unhook hookLoadPackage(XC_LoadPackage callback) {
        ?? r0 = sLoadedPackageCallbacks;
        synchronized (r0) {
            sLoadedPackageCallbacks.add(callback);
            r0 = r0;
            callback.getClass();
            return callback.new Unhook();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0, types: [de.robv.android.xposed.XposedBridge$CopyOnWriteSortedSet<de.robv.android.xposed.callbacks.XC_LoadPackage>] */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v4 */
    public static void unhookLoadPackage(XC_LoadPackage callback) {
        ?? r0 = sLoadedPackageCallbacks;
        synchronized (r0) {
            sLoadedPackageCallbacks.remove(callback);
            r0 = r0;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0, types: [de.robv.android.xposed.XposedBridge$CopyOnWriteSortedSet<de.robv.android.xposed.callbacks.XC_InitPackageResources>] */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v4 */
    public static XC_InitPackageResources.Unhook hookInitPackageResources(XC_InitPackageResources callback) {
        ?? r0 = sInitPackageResourcesCallbacks;
        synchronized (r0) {
            sInitPackageResourcesCallbacks.add(callback);
            r0 = r0;
            callback.getClass();
            return callback.new Unhook();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0, types: [de.robv.android.xposed.XposedBridge$CopyOnWriteSortedSet<de.robv.android.xposed.callbacks.XC_InitPackageResources>] */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v4 */
    public static void unhookInitPackageResources(XC_InitPackageResources callback) {
        ?? r0 = sInitPackageResourcesCallbacks;
        synchronized (r0) {
            sInitPackageResourcesCallbacks.remove(callback);
            r0 = r0;
        }
    }

    public static Object invokeOriginalMethod(Member method, Object thisObject, Object[] args) throws NullPointerException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Class[] parameterTypes;
        Class<?> returnType;
        if (args == null) {
            args = EMPTY_ARRAY;
        }
        if (method instanceof Method) {
            parameterTypes = ((Method) method).getParameterTypes();
            returnType = ((Method) method).getReturnType();
        } else if (method instanceof Constructor) {
            parameterTypes = ((Constructor) method).getParameterTypes();
            returnType = null;
        } else {
            throw new IllegalArgumentException("method must be of type Method or Constructor");
        }
        return invokeOriginalMethodNative(method, 0, parameterTypes, returnType, thisObject, args);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void setObjectClass(Object obj, Class<?> clazz) {
        if (obj == null) {
            return;
        }
        if (clazz != XResources.XTypedArray.class) {
            throw new IllegalArgumentException("Target class " + clazz + " is not allowed");
        }
        if (obj.getClass() != clazz.getSuperclass()) {
            throw new IllegalArgumentException("Cannot transfer object from " + obj.getClass() + " to " + clazz);
        }
        setObjectClassNative(obj, clazz);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Object cloneToSubclass(Object obj, Class<?> targetClazz) {
        if (obj == null) {
            return null;
        }
        if (!obj.getClass().isAssignableFrom(targetClazz)) {
            throw new ClassCastException(targetClazz + " doesn't extend " + obj.getClass());
        }
        return cloneToSubclassNative(obj, targetClazz);
    }

    /* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet.class */
    public static class CopyOnWriteSortedSet<E> {
        private volatile transient Object[] elements = XposedBridge.EMPTY_ARRAY;

        public synchronized boolean add(E e) {
            int index = indexOf(e);
            if (index >= 0) {
                return false;
            }
            Object[] newElements = new Object[this.elements.length + 1];
            System.arraycopy(this.elements, 0, newElements, 0, this.elements.length);
            newElements[this.elements.length] = e;
            Arrays.sort(newElements);
            this.elements = newElements;
            return true;
        }

        public synchronized boolean remove(E e) {
            int index = indexOf(e);
            if (index == -1) {
                return false;
            }
            Object[] newElements = new Object[this.elements.length - 1];
            System.arraycopy(this.elements, 0, newElements, 0, index);
            System.arraycopy(this.elements, index + 1, newElements, index, (this.elements.length - index) - 1);
            this.elements = newElements;
            return true;
        }

        private int indexOf(Object o) {
            for (int i = 0; i < this.elements.length; i++) {
                if (o.equals(this.elements[i])) {
                    return i;
                }
            }
            return -1;
        }

        public Object[] getSnapshot() {
            return this.elements;
        }
    }

    /* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/XposedBridge$AdditionalHookInfo.class */
    private static class AdditionalHookInfo {
        final CopyOnWriteSortedSet<XC_MethodHook> callbacks;
        final Class<?>[] parameterTypes;
        final Class<?> returnType;

        private AdditionalHookInfo(CopyOnWriteSortedSet<XC_MethodHook> callbacks, Class<?>[] clsArr, Class<?> returnType) {
            this.callbacks = callbacks;
            this.parameterTypes = clsArr;
            this.returnType = returnType;
        }

        /* synthetic */ AdditionalHookInfo(CopyOnWriteSortedSet copyOnWriteSortedSet, Class[] clsArr, Class cls, AdditionalHookInfo additionalHookInfo) {
            this(copyOnWriteSortedSet, clsArr, cls);
        }
    }
}
