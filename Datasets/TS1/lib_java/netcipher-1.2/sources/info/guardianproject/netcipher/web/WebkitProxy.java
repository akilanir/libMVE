package info.guardianproject.netcipher.web;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Parcelable;
import android.util.ArrayMap;
import android.util.Log;
import android.webkit.WebView;
import info.guardianproject.netcipher.client.StrongHttpsClient;
import info.guardianproject.netcipher.proxy.OrbotHelper;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.InetSocketAddress;
import java.net.Socket;
import org.apache.http.HttpHost;

/* loaded from: netcipher-1.2.jar:info/guardianproject/netcipher/web/WebkitProxy.class */
public class WebkitProxy {
    private static final String DEFAULT_HOST = "localhost";
    private static final int DEFAULT_PORT = 8118;
    private static final int DEFAULT_SOCKS_PORT = 9050;
    private static final int REQUEST_CODE = 0;
    private static final String TAG = "OrbotHelpher";

    public static boolean setProxy(String appClass, Context ctx, WebView wView, String host, int port) throws Exception {
        setSystemProperties(host, port);
        boolean worked = false;
        if (Build.VERSION.SDK_INT < 13) {
            setProxyUpToHC(wView, host, port);
        } else if (Build.VERSION.SDK_INT < 19) {
            worked = setWebkitProxyICS(ctx, host, port);
        } else if (Build.VERSION.SDK_INT < 20) {
            worked = setKitKatProxy(appClass, ctx, host, port);
            if (!worked) {
                worked = setWebkitProxyICS(ctx, host, port);
            }
        } else if (Build.VERSION.SDK_INT >= 21) {
            worked = setWebkitProxyLollipop(ctx, host, port);
        }
        return worked;
    }

    private static void setSystemProperties(String host, int port) {
        System.setProperty("proxyHost", host);
        System.setProperty("proxyPort", port + "");
        System.setProperty("http.proxyHost", host);
        System.setProperty("http.proxyPort", port + "");
        System.setProperty("https.proxyHost", host);
        System.setProperty("https.proxyPort", port + "");
        System.setProperty("socks.proxyHost", host);
        System.setProperty("socks.proxyPort", "9050");
        System.setProperty("socksProxyHost", host);
        System.setProperty("socksProxyPort", "9050");
    }

    private static boolean setWebkitProxyGingerbread(Context ctx, String host, int port) throws Exception {
        Object requestQueueObject = getRequestQueue(ctx);
        if (requestQueueObject != null) {
            HttpHost httpHost = new HttpHost(host, port, StrongHttpsClient.TYPE_HTTP);
            setDeclaredField(requestQueueObject, "mProxyHost", httpHost);
            return true;
        }
        return false;
    }

    private static boolean setProxyUpToHC(WebView webview, String host, int port) {
        Log.d(TAG, "Setting proxy with <= 3.2 API.");
        HttpHost proxyServer = new HttpHost(host, port);
        try {
            Class networkClass = Class.forName("android.webkit.Network");
            if (networkClass == null) {
                Log.e(TAG, "failed to get class for android.webkit.Network");
                return false;
            }
            Method getInstanceMethod = networkClass.getMethod("getInstance", Context.class);
            if (getInstanceMethod == null) {
                Log.e(TAG, "failed to get getInstance method");
            }
            Object network = getInstanceMethod.invoke(networkClass, webview.getContext());
            if (network == null) {
                Log.e(TAG, "error getting network: network is null");
                return false;
            }
            try {
                Field requestQueueField = networkClass.getDeclaredField("mRequestQueue");
                Object requestQueue = getFieldValueSafely(requestQueueField, network);
                if (requestQueue == null) {
                    Log.e(TAG, "Request queue is null");
                    return false;
                }
                try {
                    Class requestQueueClass = Class.forName("android.net.http.RequestQueue");
                    Field proxyHostField = requestQueueClass.getDeclaredField("mProxyHost");
                    boolean temp = proxyHostField.isAccessible();
                    try {
                        try {
                            proxyHostField.setAccessible(true);
                            proxyHostField.set(requestQueue, proxyServer);
                            proxyHostField.setAccessible(temp);
                        } catch (Exception e) {
                            Log.e(TAG, "error setting proxy host");
                            proxyHostField.setAccessible(temp);
                        }
                        Log.d(TAG, "Setting proxy with <= 3.2 API successful!");
                        return true;
                    } catch (Throwable th) {
                        proxyHostField.setAccessible(temp);
                        throw th;
                    }
                } catch (Exception e2) {
                    Log.e(TAG, "error getting proxy host field");
                    return false;
                }
            } catch (Exception e3) {
                Log.e(TAG, "error getting field value");
                return false;
            }
        } catch (Exception ex) {
            Log.e(TAG, "error getting network: " + ex);
            return false;
        }
    }

    private static Object getFieldValueSafely(Field field, Object classInstance) throws IllegalArgumentException, IllegalAccessException {
        boolean oldAccessibleValue = field.isAccessible();
        field.setAccessible(true);
        Object result = field.get(classInstance);
        field.setAccessible(oldAccessibleValue);
        return result;
    }

    private static boolean setWebkitProxyICS(Context ctx, String host, int port) {
        try {
            Class webViewCoreClass = Class.forName("android.webkit.WebViewCore");
            Class proxyPropertiesClass = Class.forName("android.net.ProxyProperties");
            if (webViewCoreClass != null && proxyPropertiesClass != null) {
                Method m = webViewCoreClass.getDeclaredMethod("sendStaticMessage", Integer.TYPE, Object.class);
                Constructor c = proxyPropertiesClass.getConstructor(String.class, Integer.TYPE, String.class);
                if (m != null && c != null) {
                    m.setAccessible(true);
                    c.setAccessible(true);
                    Object properties = c.newInstance(host, Integer.valueOf(port), null);
                    m.invoke(null, 193, properties);
                    return true;
                }
                return false;
            }
            return false;
        } catch (Error e) {
            Log.e("ProxySettings", "Exception setting WebKit proxy through android.webkit.Network: " + e.toString());
            return false;
        } catch (Exception e2) {
            Log.e("ProxySettings", "Exception setting WebKit proxy through android.net.ProxyProperties: " + e2.toString());
            return false;
        }
    }

    @TargetApi(19)
    public static boolean resetKitKatProxy(String appClass, Context appContext) {
        return setKitKatProxy(appClass, appContext, null, 0);
    }

    @TargetApi(19)
    private static boolean setKitKatProxy(String appClass, Context appContext, String host, int port) {
        if (host != null) {
            System.setProperty("http.proxyHost", host);
            System.setProperty("http.proxyPort", port + "");
            System.setProperty("https.proxyHost", host);
            System.setProperty("https.proxyPort", port + "");
        }
        try {
            Class applictionCls = Class.forName(appClass);
            Field loadedApkField = applictionCls.getField("mLoadedApk");
            loadedApkField.setAccessible(true);
            Object loadedApk = loadedApkField.get(appContext);
            Class loadedApkCls = Class.forName("android.app.LoadedApk");
            Field receiversField = loadedApkCls.getDeclaredField("mReceivers");
            receiversField.setAccessible(true);
            ArrayMap receivers = (ArrayMap) receiversField.get(loadedApk);
            for (Object receiverMap : receivers.values()) {
                for (Object rec : ((ArrayMap) receiverMap).keySet()) {
                    Class clazz = rec.getClass();
                    if (clazz.getName().contains("ProxyChangeListener")) {
                        Method onReceiveMethod = clazz.getDeclaredMethod("onReceive", Context.class, Intent.class);
                        Intent intent = new Intent("android.intent.action.PROXY_CHANGE");
                        if (host != null) {
                            Class cls = Class.forName("android.net.ProxyProperties");
                            Constructor constructor = cls.getConstructor(String.class, Integer.TYPE, String.class);
                            constructor.setAccessible(true);
                            Object proxyProperties = constructor.newInstance(host, Integer.valueOf(port), null);
                            intent.putExtra("proxy", (Parcelable) proxyProperties);
                        }
                        onReceiveMethod.invoke(rec, appContext, intent);
                    }
                }
            }
            return true;
        } catch (ClassNotFoundException e) {
            StringWriter sw = new StringWriter();
            e.printStackTrace(new PrintWriter(sw));
            String exceptionAsString = sw.toString();
            Log.v(TAG, e.getMessage());
            Log.v(TAG, exceptionAsString);
            return false;
        } catch (IllegalAccessException e2) {
            StringWriter sw2 = new StringWriter();
            e2.printStackTrace(new PrintWriter(sw2));
            String exceptionAsString2 = sw2.toString();
            Log.v(TAG, e2.getMessage());
            Log.v(TAG, exceptionAsString2);
            return false;
        } catch (IllegalArgumentException e3) {
            StringWriter sw3 = new StringWriter();
            e3.printStackTrace(new PrintWriter(sw3));
            String exceptionAsString3 = sw3.toString();
            Log.v(TAG, e3.getMessage());
            Log.v(TAG, exceptionAsString3);
            return false;
        } catch (InstantiationException e4) {
            StringWriter sw4 = new StringWriter();
            e4.printStackTrace(new PrintWriter(sw4));
            String exceptionAsString4 = sw4.toString();
            Log.v(TAG, e4.getMessage());
            Log.v(TAG, exceptionAsString4);
            return false;
        } catch (NoSuchFieldException e5) {
            StringWriter sw5 = new StringWriter();
            e5.printStackTrace(new PrintWriter(sw5));
            String exceptionAsString5 = sw5.toString();
            Log.v(TAG, e5.getMessage());
            Log.v(TAG, exceptionAsString5);
            return false;
        } catch (NoSuchMethodException e6) {
            StringWriter sw6 = new StringWriter();
            e6.printStackTrace(new PrintWriter(sw6));
            String exceptionAsString6 = sw6.toString();
            Log.v(TAG, e6.getMessage());
            Log.v(TAG, exceptionAsString6);
            return false;
        } catch (InvocationTargetException e7) {
            StringWriter sw7 = new StringWriter();
            e7.printStackTrace(new PrintWriter(sw7));
            String exceptionAsString7 = sw7.toString();
            Log.v(TAG, e7.getMessage());
            Log.v(TAG, exceptionAsString7);
            return false;
        }
    }

    @TargetApi(21)
    public static boolean resetLollipopProxy(String appClass, Context appContext) {
        return setWebkitProxyLollipop(appContext, null, 0);
    }

    @TargetApi(21)
    private static boolean setWebkitProxyLollipop(Context appContext, String host, int port) {
        System.setProperty("http.proxyHost", host);
        System.setProperty("http.proxyPort", port + "");
        System.setProperty("https.proxyHost", host);
        System.setProperty("https.proxyPort", port + "");
        try {
            Class applictionClass = Class.forName("android.app.Application");
            Field mLoadedApkField = applictionClass.getDeclaredField("mLoadedApk");
            mLoadedApkField.setAccessible(true);
            Object mloadedApk = mLoadedApkField.get(appContext);
            Class loadedApkClass = Class.forName("android.app.LoadedApk");
            Field mReceiversField = loadedApkClass.getDeclaredField("mReceivers");
            mReceiversField.setAccessible(true);
            ArrayMap receivers = (ArrayMap) mReceiversField.get(mloadedApk);
            for (Object receiverMap : receivers.values()) {
                for (Object receiver : ((ArrayMap) receiverMap).keySet()) {
                    Class clazz = receiver.getClass();
                    if (clazz.getName().contains("ProxyChangeListener")) {
                        Method onReceiveMethod = clazz.getDeclaredMethod("onReceive", Context.class, Intent.class);
                        Intent intent = new Intent("android.intent.action.PROXY_CHANGE");
                        onReceiveMethod.invoke(receiver, appContext, intent);
                    }
                }
            }
            return true;
        } catch (ClassNotFoundException e) {
            Log.d("ProxySettings", "Exception setting WebKit proxy on Lollipop through ProxyChangeListener: " + e.toString());
            return false;
        } catch (IllegalAccessException e2) {
            Log.d("ProxySettings", "Exception setting WebKit proxy on Lollipop through ProxyChangeListener: " + e2.toString());
            return false;
        } catch (NoSuchFieldException e3) {
            Log.d("ProxySettings", "Exception setting WebKit proxy on Lollipop through ProxyChangeListener: " + e3.toString());
            return false;
        } catch (NoSuchMethodException e4) {
            Log.d("ProxySettings", "Exception setting WebKit proxy on Lollipop through ProxyChangeListener: " + e4.toString());
            return false;
        } catch (InvocationTargetException e5) {
            Log.d("ProxySettings", "Exception setting WebKit proxy on Lollipop through ProxyChangeListener: " + e5.toString());
            return false;
        }
    }

    private static boolean sendProxyChangedIntent(Context ctx, String host, int port) {
        Constructor c;
        try {
            Class proxyPropertiesClass = Class.forName("android.net.ProxyProperties");
            if (proxyPropertiesClass != null && (c = proxyPropertiesClass.getConstructor(String.class, Integer.TYPE, String.class)) != null) {
                c.setAccessible(true);
                Object properties = c.newInstance(host, Integer.valueOf(port), null);
                Intent intent = new Intent("android.intent.action.PROXY_CHANGE");
                intent.putExtra("proxy", (Parcelable) properties);
                ctx.sendBroadcast(intent);
            }
            return false;
        } catch (Error e) {
            Log.e("ProxySettings", "Exception sending Intent ", e);
            return false;
        } catch (Exception e2) {
            Log.e("ProxySettings", "Exception sending Intent ", e2);
            return false;
        }
    }

    public static void resetProxy(String appClass, Context ctx) throws Exception {
        System.clearProperty("http.proxyHost");
        System.clearProperty("http.proxyPort");
        System.clearProperty("https.proxyHost");
        System.clearProperty("https.proxyPort");
        if (Build.VERSION.SDK_INT < 14) {
            resetProxyForGingerBread(ctx);
        } else if (Build.VERSION.SDK_INT < 19) {
            resetProxyForICS();
        } else {
            resetKitKatProxy(appClass, ctx);
        }
    }

    private static void resetProxyForICS() throws Exception {
        Method m;
        try {
            Class webViewCoreClass = Class.forName("android.webkit.WebViewCore");
            Class proxyPropertiesClass = Class.forName("android.net.ProxyProperties");
            if (webViewCoreClass != null && proxyPropertiesClass != null && (m = webViewCoreClass.getDeclaredMethod("sendStaticMessage", Integer.TYPE, Object.class)) != null) {
                m.setAccessible(true);
                m.invoke(null, 193, null);
            }
        } catch (Error e) {
            Log.e("ProxySettings", "Exception setting WebKit proxy through android.webkit.Network: " + e.toString());
            throw e;
        } catch (Exception e2) {
            Log.e("ProxySettings", "Exception setting WebKit proxy through android.net.ProxyProperties: " + e2.toString());
            throw e2;
        }
    }

    private static void resetProxyForGingerBread(Context ctx) throws Exception {
        Object requestQueueObject = getRequestQueue(ctx);
        if (requestQueueObject != null) {
            setDeclaredField(requestQueueObject, "mProxyHost", null);
        }
    }

    public static Object getRequestQueue(Context ctx) throws Exception {
        Object networkObj;
        Object ret = null;
        Class networkClass = Class.forName("android.webkit.Network");
        if (networkClass != null && (networkObj = invokeMethod(networkClass, "getInstance", new Object[]{ctx}, Context.class)) != null) {
            ret = getDeclaredField(networkObj, "mRequestQueue");
        }
        return ret;
    }

    private static Object getDeclaredField(Object obj, String name) throws SecurityException, NoSuchFieldException, IllegalArgumentException, IllegalAccessException {
        Field f = obj.getClass().getDeclaredField(name);
        f.setAccessible(true);
        Object out = f.get(obj);
        return out;
    }

    private static void setDeclaredField(Object obj, String name, Object value) throws SecurityException, NoSuchFieldException, IllegalArgumentException, IllegalAccessException {
        Field f = obj.getClass().getDeclaredField(name);
        f.setAccessible(true);
        f.set(obj, value);
    }

    private static Object invokeMethod(Object object, String methodName, Object[] params, Class... types) throws Exception {
        Object out;
        Class c = object instanceof Class ? (Class) object : object.getClass();
        if (types != null) {
            Method method = c.getMethod(methodName, types);
            out = method.invoke(object, params);
        } else {
            Method method2 = c.getMethod(methodName, new Class[0]);
            out = method2.invoke(object, new Object[0]);
        }
        return out;
    }

    public static Socket getSocket(Context context, String proxyHost, int proxyPort) throws IOException {
        Socket sock = new Socket();
        sock.connect(new InetSocketAddress(proxyHost, proxyPort), 10000);
        return sock;
    }

    public static Socket getSocket(Context context) throws IOException {
        return getSocket(context, DEFAULT_HOST, DEFAULT_SOCKS_PORT);
    }

    public static AlertDialog initOrbot(Activity activity, CharSequence stringTitle, CharSequence stringMessage, CharSequence stringButtonYes, CharSequence stringButtonNo, CharSequence stringDesiredBarcodeFormats) {
        Intent intentScan = new Intent(OrbotHelper.ACTION_START_TOR);
        intentScan.addCategory("android.intent.category.DEFAULT");
        try {
            activity.startActivityForResult(intentScan, 0);
            return null;
        } catch (ActivityNotFoundException e) {
            return showDownloadDialog(activity, stringTitle, stringMessage, stringButtonYes, stringButtonNo);
        }
    }

    private static AlertDialog showDownloadDialog(final Activity activity, CharSequence stringTitle, CharSequence stringMessage, CharSequence stringButtonYes, CharSequence stringButtonNo) {
        AlertDialog.Builder downloadDialog = new AlertDialog.Builder(activity);
        downloadDialog.setTitle(stringTitle);
        downloadDialog.setMessage(stringMessage);
        downloadDialog.setPositiveButton(stringButtonYes, new DialogInterface.OnClickListener() { // from class: info.guardianproject.netcipher.web.WebkitProxy.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                Uri uri = Uri.parse("market://search?q=pname:org.torproject.android");
                Intent intent = new Intent("android.intent.action.VIEW", uri);
                activity.startActivity(intent);
            }
        });
        downloadDialog.setNegativeButton(stringButtonNo, new DialogInterface.OnClickListener() { // from class: info.guardianproject.netcipher.web.WebkitProxy.2
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
            }
        });
        return downloadDialog.show();
    }
}
