package com.stericson.RootToolsTests;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.StrictMode;
import android.widget.ScrollView;
import android.widget.TextView;
import com.stericson.RootTools.RootTools;
import com.stericson.RootTools.containers.Permissions;
import com.stericson.RootTools.exceptions.RootDeniedException;
import com.stericson.RootTools.execution.CommandCapture;
import com.stericson.RootTools.execution.JavaCommandCapture;
import com.stericson.RootTools.execution.Shell;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.TimeoutException;

/* loaded from: RootTools-3.5.jar:com/stericson/RootToolsTests/SanityCheckRootTools.class */
public class SanityCheckRootTools extends Activity {
    private ScrollView mScrollView;
    private TextView mTextView;
    private ProgressDialog mPDialog;

    @Override // android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        StrictMode.setThreadPolicy(new StrictMode.ThreadPolicy.Builder().detectDiskReads().detectDiskWrites().detectNetwork().penaltyLog().build());
        StrictMode.setVmPolicy(new StrictMode.VmPolicy.Builder().detectLeakedSqlLiteObjects().detectLeakedClosableObjects().penaltyLog().penaltyDeath().build());
        RootTools.debugMode = true;
        this.mTextView = new TextView(this);
        this.mTextView.setText("");
        this.mScrollView = new ScrollView(this);
        this.mScrollView.addView(this.mTextView);
        setContentView(this.mScrollView);
        String version = "?";
        try {
            PackageInfo packageInfo = getPackageManager().getPackageInfo(getPackageName(), 0);
            version = packageInfo.versionName;
        } catch (PackageManager.NameNotFoundException e) {
        }
        print("SanityCheckRootTools v " + version + "\n\n");
        if (RootTools.isRootAvailable()) {
            print("Root found.\n");
        } else {
            print("Root not found");
        }
        try {
            Shell.startRootShell();
        } catch (RootDeniedException e2) {
            print("[ ROOT DENIED EXCEPTION! ]\n");
            e2.printStackTrace();
        } catch (IOException e22) {
            e22.printStackTrace();
        } catch (TimeoutException e3) {
            print("[ TIMEOUT EXCEPTION! ]\n");
            e3.printStackTrace();
        }
        try {
            if (!RootTools.isAccessGiven()) {
                print("ERROR: No root access to this device.\n");
                return;
            }
            this.mPDialog = new ProgressDialog(this);
            this.mPDialog.setCancelable(false);
            this.mPDialog.setProgressStyle(0);
            new SanityCheckThread(this, new TestHandler()).start();
        } catch (Exception e4) {
            print("ERROR: could not determine root access to this device.\n");
        }
    }

    protected void print(CharSequence text) {
        this.mTextView.append(text);
        this.mScrollView.post(new Runnable() { // from class: com.stericson.RootToolsTests.SanityCheckRootTools.1
            @Override // java.lang.Runnable
            public void run() {
                SanityCheckRootTools.this.mScrollView.fullScroll(130);
            }
        });
    }

    /* loaded from: RootTools-3.5.jar:com/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread.class */
    private class SanityCheckThread extends Thread {
        private Handler mHandler;

        public SanityCheckThread(Context context, Handler handler) {
            this.mHandler = handler;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            visualUpdate(1, null);
            visualUpdate(4, "Testing getPath");
            visualUpdate(3, "[ getPath ]\n");
            try {
                List<String> paths = RootTools.getPath();
                for (String path : paths) {
                    visualUpdate(3, path + " k\n\n");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            visualUpdate(4, "Testing A ton of commands");
            visualUpdate(3, "[ Ton of Commands ]\n");
            for (int i = 0; i < 100; i++) {
                RootTools.exists("/system/xbin/busybox");
            }
            visualUpdate(4, "Testing Find Binary");
            boolean result = RootTools.isRootAvailable();
            visualUpdate(3, "[ Checking Root ]\n");
            visualUpdate(3, result + " k\n\n");
            visualUpdate(4, "Testing file exists");
            visualUpdate(3, "[ Checking Exists() ]\n");
            visualUpdate(3, RootTools.exists("/system/sbin/[") + " k\n\n");
            visualUpdate(4, "Testing Is Access Given");
            boolean result2 = RootTools.isAccessGiven();
            visualUpdate(3, "[ Checking for Access to Root ]\n");
            visualUpdate(3, result2 + " k\n\n");
            visualUpdate(4, "Testing Remount");
            boolean result3 = RootTools.remount("/system", "rw");
            visualUpdate(3, "[ Remounting System as RW ]\n");
            visualUpdate(3, result3 + " k\n\n");
            visualUpdate(4, "Testing CheckUtil");
            visualUpdate(3, "[ Checking busybox is setup ]\n");
            visualUpdate(3, RootTools.checkUtil("busybox") + " k\n\n");
            visualUpdate(4, "Testing getBusyBoxVersion");
            visualUpdate(3, "[ Checking busybox version ]\n");
            visualUpdate(3, RootTools.getBusyBoxVersion("/system/bin/") + " k\n\n");
            try {
                visualUpdate(4, "Testing fixUtils");
                visualUpdate(3, "[ Checking Utils ]\n");
                visualUpdate(3, RootTools.fixUtils(new String[]{"ls", "rm", "ln", "dd", "chmod", "mount"}) + " k\n\n");
            } catch (Exception e2) {
                e2.printStackTrace();
            }
            try {
                visualUpdate(4, "Testing getSymlink");
                visualUpdate(3, "[ Checking [[ for symlink ]\n");
                visualUpdate(3, RootTools.getSymlink("/system/bin/[[") + " k\n\n");
            } catch (Exception e22) {
                e22.printStackTrace();
            }
            visualUpdate(4, "Testing getInode");
            visualUpdate(3, "[ Checking Inodes ]\n");
            visualUpdate(3, RootTools.getInode("/system/bin/busybox") + " k\n\n");
            visualUpdate(4, "Testing GetBusyBoxapplets");
            try {
                visualUpdate(3, "[ Getting all available Busybox applets ]\n");
                for (String applet : RootTools.getBusyBoxApplets("/data/data/stericson.busybox.donate/files/bb")) {
                    visualUpdate(3, applet + " k\n\n");
                }
            } catch (Exception e1) {
                e1.printStackTrace();
            }
            visualUpdate(4, "Testing getFilePermissionsSymlinks");
            Permissions permissions = RootTools.getFilePermissionsSymlinks("/system/bin/busybox");
            visualUpdate(3, "[ Checking busybox permissions and symlink ]\n");
            if (permissions != null) {
                visualUpdate(3, "Symlink: " + permissions.getSymlink() + " k\n\n");
                visualUpdate(3, "Group Permissions: " + permissions.getGroupPermissions() + " k\n\n");
                visualUpdate(3, "Owner Permissions: " + permissions.getOtherPermissions() + " k\n\n");
                visualUpdate(3, "Permissions: " + permissions.getPermissions() + " k\n\n");
                visualUpdate(3, "Type: " + permissions.getType() + " k\n\n");
                visualUpdate(3, "User Permissions: " + permissions.getUserPermissions() + " k\n\n");
            } else {
                visualUpdate(3, "Permissions == null k\n\n");
            }
            visualUpdate(4, "JAVA");
            visualUpdate(3, "[ Running some Java code ]\n");
            try {
                Shell shell = RootTools.getShell(true);
                JavaCommandCapture cmd = new JavaCommandCapture(43, false, SanityCheckRootTools.this, "com.stericson.RootToolsTests.NativeJavaClass") { // from class: com.stericson.RootToolsTests.SanityCheckRootTools.SanityCheckThread.1
                    @Override // com.stericson.RootTools.execution.JavaCommandCapture, com.stericson.RootTools.execution.Command
                    public void commandOutput(int id, String line) {
                        super.commandOutput(id, line);
                        SanityCheckThread.this.visualUpdate(3, line + "\n");
                    }
                };
                shell.add(cmd);
            } catch (Exception e3) {
                e3.printStackTrace();
            }
            visualUpdate(4, "Testing df");
            long spaceValue = RootTools.getSpace("/data");
            visualUpdate(3, "[ Checking /data partition size]\n");
            visualUpdate(3, spaceValue + "k\n\n");
            try {
                Shell shell2 = RootTools.getShell(true);
                CommandCapture cmd2 = new CommandCapture(42, false, "find /") { // from class: com.stericson.RootToolsTests.SanityCheckRootTools.SanityCheckThread.2
                    boolean _catch = false;

                    @Override // com.stericson.RootTools.execution.CommandCapture, com.stericson.RootTools.execution.Command
                    public void commandOutput(int id, String line) {
                        super.commandOutput(id, line);
                        if (this._catch) {
                            RootTools.log("CAUGHT!!!");
                        }
                    }

                    @Override // com.stericson.RootTools.execution.CommandCapture, com.stericson.RootTools.execution.Command
                    public void commandTerminated(int id, String reason) {
                        synchronized (SanityCheckRootTools.this) {
                            this._catch = true;
                            SanityCheckThread.this.visualUpdate(4, "All tests complete.");
                            SanityCheckThread.this.visualUpdate(2, null);
                            try {
                                RootTools.closeAllShells();
                            } catch (IOException e4) {
                                e4.printStackTrace();
                            }
                        }
                    }

                    @Override // com.stericson.RootTools.execution.CommandCapture, com.stericson.RootTools.execution.Command
                    public void commandCompleted(int id, int exitCode) {
                        synchronized (SanityCheckRootTools.this) {
                            this._catch = true;
                            SanityCheckThread.this.visualUpdate(4, "All tests complete.");
                            SanityCheckThread.this.visualUpdate(2, null);
                            try {
                                RootTools.closeAllShells();
                            } catch (IOException e4) {
                                e4.printStackTrace();
                            }
                        }
                    }
                };
                shell2.add(cmd2);
            } catch (Exception e4) {
                e4.printStackTrace();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void visualUpdate(int action, String text) {
            Message msg = this.mHandler.obtainMessage();
            Bundle bundle = new Bundle();
            bundle.putInt("action", action);
            bundle.putString("text", text);
            msg.setData(bundle);
            this.mHandler.sendMessage(msg);
        }
    }

    /* loaded from: RootTools-3.5.jar:com/stericson/RootToolsTests/SanityCheckRootTools$TestHandler.class */
    private class TestHandler extends Handler {
        public static final String ACTION = "action";
        public static final int ACTION_SHOW = 1;
        public static final int ACTION_HIDE = 2;
        public static final int ACTION_DISPLAY = 3;
        public static final int ACTION_PDISPLAY = 4;
        public static final String TEXT = "text";

        private TestHandler() {
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            int action = msg.getData().getInt("action");
            String text = msg.getData().getString("text");
            switch (action) {
                case 1:
                    SanityCheckRootTools.this.mPDialog.show();
                    SanityCheckRootTools.this.mPDialog.setMessage("Running Root Library Tests...");
                    break;
                case 2:
                    if (null != text) {
                        SanityCheckRootTools.this.print(text);
                    }
                    SanityCheckRootTools.this.mPDialog.hide();
                    break;
                case 3:
                    SanityCheckRootTools.this.print(text);
                    break;
                case 4:
                    SanityCheckRootTools.this.mPDialog.setMessage(text);
                    break;
            }
        }
    }
}
