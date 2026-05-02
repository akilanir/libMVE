package cyanogenmod.app;

import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.os.UserHandle;
import android.util.Log;
import android.util.Slog;
import cyanogenmod.app.ICMStatusBarManager;

/* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/app/CMStatusBarManager.class */
public class CMStatusBarManager {
    private static final String TAG = "CMStatusBarManager";
    private static boolean localLOGV = false;
    private Context mContext;
    private static ICMStatusBarManager sService;
    private static CMStatusBarManager sCMStatusBarManagerInstance;

    private CMStatusBarManager(Context context) {
        Context appContext = context.getApplicationContext();
        if (appContext != null) {
            this.mContext = appContext;
        } else {
            this.mContext = context;
        }
        sService = getService();
    }

    public static CMStatusBarManager getInstance(Context context) {
        if (sCMStatusBarManagerInstance == null) {
            sCMStatusBarManagerInstance = new CMStatusBarManager(context);
        }
        return sCMStatusBarManagerInstance;
    }

    public void publishTile(int id, CustomTile customTile) {
        publishTile(null, id, customTile);
    }

    public void publishTile(String tag, int id, CustomTile customTile) {
        if (sService == null) {
            Log.w(TAG, "not connected to CMStatusBarManagerService");
            return;
        }
        int[] idOut = new int[1];
        String pkg = this.mContext.getPackageName();
        if (localLOGV) {
            Log.v(TAG, pkg + ": create(" + id + ", " + customTile + ")");
        }
        try {
            sService.createCustomTileWithTag(pkg, this.mContext.getOpPackageName(), tag, id, customTile, idOut, UserHandle.myUserId());
            if (id != idOut[0]) {
                Log.w(TAG, "notify: id corrupted: sent " + id + ", got back " + idOut[0]);
            }
        } catch (RemoteException e) {
            Slog.w(TAG, "warning: no cm status bar service");
        }
    }

    public void publishTileAsUser(String tag, int id, CustomTile customTile, UserHandle user) {
        if (sService == null) {
            Log.w(TAG, "not connected to CMStatusBarManagerService");
            return;
        }
        int[] idOut = new int[1];
        String pkg = this.mContext.getPackageName();
        if (localLOGV) {
            Log.v(TAG, pkg + ": create(" + id + ", " + customTile + ")");
        }
        try {
            sService.createCustomTileWithTag(pkg, this.mContext.getOpPackageName(), tag, id, customTile, idOut, user.getIdentifier());
            if (id != idOut[0]) {
                Log.w(TAG, "notify: id corrupted: sent " + id + ", got back " + idOut[0]);
            }
        } catch (RemoteException e) {
            Slog.w(TAG, "warning: no cm status bar service");
        }
    }

    public void removeTile(int id) {
        removeTile(null, id);
    }

    public void removeTile(String tag, int id) {
        if (sService == null) {
            Log.w(TAG, "not connected to CMStatusBarManagerService");
            return;
        }
        String pkg = this.mContext.getPackageName();
        if (localLOGV) {
            Log.v(TAG, pkg + ": remove(" + id + ")");
        }
        try {
            sService.removeCustomTileWithTag(pkg, tag, id, UserHandle.myUserId());
        } catch (RemoteException e) {
            Slog.w(TAG, "warning: no cm status bar service");
        }
    }

    public void removeTileAsUser(String tag, int id, UserHandle user) {
        if (sService == null) {
            Log.w(TAG, "not connected to CMStatusBarManagerService");
            return;
        }
        String pkg = this.mContext.getPackageName();
        if (localLOGV) {
            Log.v(TAG, pkg + ": remove(" + id + ")");
        }
        try {
            sService.removeCustomTileWithTag(pkg, tag, id, user.getIdentifier());
        } catch (RemoteException e) {
        }
    }

    public ICMStatusBarManager getService() {
        if (sService != null) {
            return sService;
        }
        IBinder b = ServiceManager.getService(CMContextConstants.CM_STATUS_BAR_SERVICE);
        if (b != null) {
            sService = ICMStatusBarManager.Stub.asInterface(b);
            return sService;
        }
        return null;
    }
}
