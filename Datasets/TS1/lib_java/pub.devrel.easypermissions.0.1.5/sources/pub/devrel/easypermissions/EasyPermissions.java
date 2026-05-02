package pub.devrel.easypermissions;

import android.R;
import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.support.annotation.StringRes;
import android.support.v4.app.ActivityCompat;
import android.support.v4.app.Fragment;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AlertDialog;
import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* loaded from: pub.devrel.easypermissions.0.1.5.jar:pub/devrel/easypermissions/EasyPermissions.class */
public class EasyPermissions {
    private static final String TAG = "EasyPermissions";

    /* loaded from: pub.devrel.easypermissions.0.1.5.jar:pub/devrel/easypermissions/EasyPermissions$PermissionCallbacks.class */
    public interface PermissionCallbacks extends ActivityCompat.OnRequestPermissionsResultCallback {
        void onPermissionsGranted(int i, List<String> list);

        void onPermissionsDenied(int i, List<String> list);
    }

    public static boolean hasPermissions(Context context, String... perms) {
        for (String perm : perms) {
            boolean hasPerm = ContextCompat.checkSelfPermission(context, perm) == 0;
            if (!hasPerm) {
                return false;
            }
        }
        return true;
    }

    public static void requestPermissions(Object object, String rationale, int requestCode, String... perms) {
        requestPermissions(object, rationale, R.string.ok, R.string.cancel, requestCode, perms);
    }

    public static void requestPermissions(final Object object, String rationale, @StringRes int positiveButton, @StringRes int negativeButton, final int requestCode, final String... perms) {
        checkCallingObjectSuitability(object);
        final PermissionCallbacks callbacks = (PermissionCallbacks) object;
        boolean shouldShowRationale = false;
        for (String perm : perms) {
            shouldShowRationale = shouldShowRationale || shouldShowRequestPermissionRationale(object, perm);
        }
        if (shouldShowRationale) {
            AlertDialog dialog = new AlertDialog.Builder(getActivity(object)).setMessage(rationale).setPositiveButton(positiveButton, new DialogInterface.OnClickListener() { // from class: pub.devrel.easypermissions.EasyPermissions.2
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog2, int which) {
                    EasyPermissions.executePermissionsRequest(object, perms, requestCode);
                }
            }).setNegativeButton(negativeButton, new DialogInterface.OnClickListener() { // from class: pub.devrel.easypermissions.EasyPermissions.1
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog2, int which) {
                    callbacks.onPermissionsDenied(requestCode, Arrays.asList(perms));
                }
            }).create();
            dialog.show();
        } else {
            executePermissionsRequest(object, perms, requestCode);
        }
    }

    public static void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults, Object object) {
        checkCallingObjectSuitability(object);
        PermissionCallbacks callbacks = (PermissionCallbacks) object;
        ArrayList<String> granted = new ArrayList<>();
        ArrayList<String> denied = new ArrayList<>();
        for (int i = 0; i < permissions.length; i++) {
            String perm = permissions[i];
            if (grantResults[i] == 0) {
                granted.add(perm);
            } else {
                denied.add(perm);
            }
        }
        if (!granted.isEmpty()) {
            callbacks.onPermissionsGranted(requestCode, granted);
        }
        if (!denied.isEmpty()) {
            callbacks.onPermissionsDenied(requestCode, denied);
        }
        if (!granted.isEmpty() && denied.isEmpty()) {
            runAnnotatedMethods(object, requestCode);
        }
    }

    private static boolean shouldShowRequestPermissionRationale(Object object, String perm) {
        if (object instanceof Activity) {
            return ActivityCompat.shouldShowRequestPermissionRationale((Activity) object, perm);
        }
        if (object instanceof Fragment) {
            return ((Fragment) object).shouldShowRequestPermissionRationale(perm);
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void executePermissionsRequest(Object object, String[] perms, int requestCode) {
        checkCallingObjectSuitability(object);
        if (object instanceof Activity) {
            ActivityCompat.requestPermissions((Activity) object, perms, requestCode);
        } else if (object instanceof Fragment) {
            ((Fragment) object).requestPermissions(perms, requestCode);
        }
    }

    private static Activity getActivity(Object object) {
        if (object instanceof Activity) {
            return (Activity) object;
        }
        if (object instanceof Fragment) {
            return ((Fragment) object).getActivity();
        }
        return null;
    }

    private static void runAnnotatedMethods(Object object, int requestCode) {
        String str;
        Class clazz = object.getClass();
        for (Method method : clazz.getDeclaredMethods()) {
            if (method.isAnnotationPresent(AfterPermissionGranted.class)) {
                AfterPermissionGranted ann = (AfterPermissionGranted) method.getAnnotation(AfterPermissionGranted.class);
                if (ann.value() != requestCode) {
                    continue;
                } else {
                    if (method.getParameterTypes().length > 0) {
                        String valueOf = String.valueOf(method.getName());
                        if (valueOf.length() != 0) {
                            str = "Cannot execute non-void method ".concat(valueOf);
                        } else {
                            str = r3;
                            String str2 = new String("Cannot execute non-void method ");
                        }
                        throw new RuntimeException(str);
                    }
                    try {
                        if (!method.isAccessible()) {
                            method.setAccessible(true);
                        }
                        method.invoke(object, new Object[0]);
                    } catch (IllegalAccessException e) {
                        Log.e(TAG, "runDefaultMethod:IllegalAccessException", e);
                    } catch (InvocationTargetException e2) {
                        Log.e(TAG, "runDefaultMethod:InvocationTargetException", e2);
                    }
                }
            }
        }
    }

    private static void checkCallingObjectSuitability(Object object) {
        if (!(object instanceof Fragment) && !(object instanceof Activity)) {
            throw new IllegalArgumentException("Caller must be an Activity or a Fragment.");
        }
        if (!(object instanceof PermissionCallbacks)) {
            throw new IllegalArgumentException("Caller must implement PermissionCallbacks.");
        }
    }
}
