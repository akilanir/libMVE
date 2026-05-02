package info.guardianproject.netcipher.proxy;

import android.content.Context;
import android.util.Log;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URLEncoder;
import java.util.StringTokenizer;

/* loaded from: netcipher-1.2.jar:info/guardianproject/netcipher/proxy/TorServiceUtils.class */
public class TorServiceUtils {
    private static final String TAG = "TorUtils";
    public static final String SHELL_CMD_CHMOD = "chmod";
    public static final String SHELL_CMD_KILL = "kill -9";
    public static final String SHELL_CMD_RM = "rm";
    public static final String SHELL_CMD_PS = "ps";
    public static final String SHELL_CMD_PIDOF = "pidof";
    public static final String CHMOD_EXE_VALUE = "700";

    public static boolean isRootPossible() {
        File fileSU;
        StringBuilder log = new StringBuilder();
        try {
            fileSU = new File("/system/app/Superuser.apk");
        } catch (IOException e) {
            Log.e(TAG, "Error checking for root access", e);
        } catch (Exception e2) {
            Log.e(TAG, "Error checking for root access", e2);
        }
        if (fileSU.exists()) {
            return true;
        }
        File fileSU2 = new File("/system/app/superuser.apk");
        if (fileSU2.exists()) {
            return true;
        }
        File fileSU3 = new File("/system/bin/su");
        if (fileSU3.exists()) {
            String[] cmd = {"su"};
            int exitCode = doShellCommand(cmd, log, false, true);
            if (exitCode != 0) {
                return false;
            }
            return true;
        }
        String[] cmd2 = {"which su"};
        int exitCode2 = doShellCommand(cmd2, log, false, true);
        if (exitCode2 == 0) {
            Log.d(TAG, "root exists, but not sure about permissions");
            return true;
        }
        Log.e(TAG, "Could not acquire root permissions");
        return false;
    }

    public static int findProcessId(Context context) {
        String dataPath = context.getFilesDir().getParentFile().getParentFile().getAbsolutePath();
        String command = dataPath + "/" + OrbotHelper.ORBOT_PACKAGE_NAME + "/app_bin/tor";
        int procId = -1;
        try {
            procId = findProcessIdWithPidOf(command);
            if (procId == -1) {
                procId = findProcessIdWithPS(command);
            }
        } catch (Exception e) {
            try {
                procId = findProcessIdWithPS(command);
            } catch (Exception e2) {
                Log.e(TAG, "Unable to get proc id for command: " + URLEncoder.encode(command), e2);
            }
        }
        return procId;
    }

    public static int findProcessIdWithPidOf(String command) throws Exception {
        int procId = -1;
        Runtime r = Runtime.getRuntime();
        String baseName = new File(command).getName();
        Process procPs = r.exec(new String[]{SHELL_CMD_PIDOF, baseName});
        BufferedReader reader = new BufferedReader(new InputStreamReader(procPs.getInputStream()));
        while (true) {
            String line = reader.readLine();
            if (line == null) {
                break;
            }
            try {
                procId = Integer.parseInt(line.trim());
                break;
            } catch (NumberFormatException e) {
                Log.e("TorServiceUtils", "unable to parse process pid: " + line, e);
            }
        }
        return procId;
    }

    public static int findProcessIdWithPS(String command) throws Exception {
        int procId = -1;
        Runtime r = Runtime.getRuntime();
        Process procPs = r.exec(SHELL_CMD_PS);
        BufferedReader reader = new BufferedReader(new InputStreamReader(procPs.getInputStream()));
        while (true) {
            String line = reader.readLine();
            if (line == null) {
                break;
            }
            if (line.indexOf(' ' + command) != -1) {
                StringTokenizer st = new StringTokenizer(line, " ");
                st.nextToken();
                procId = Integer.parseInt(st.nextToken().trim());
                break;
            }
        }
        return procId;
    }

    public static int doShellCommand(String[] cmds, StringBuilder log, boolean runAsRoot, boolean waitFor) throws Exception {
        Process proc;
        int exitCode = -1;
        if (runAsRoot) {
            proc = Runtime.getRuntime().exec("su");
        } else {
            proc = Runtime.getRuntime().exec("sh");
        }
        OutputStreamWriter out = new OutputStreamWriter(proc.getOutputStream());
        for (String str : cmds) {
            out.write(str);
            out.write("\n");
        }
        out.flush();
        out.write("exit\n");
        out.flush();
        if (waitFor) {
            char[] buf = new char[10];
            InputStreamReader reader = new InputStreamReader(proc.getInputStream());
            while (true) {
                int read = reader.read(buf);
                if (read == -1) {
                    break;
                }
                if (log != null) {
                    log.append(buf, 0, read);
                }
            }
            InputStreamReader reader2 = new InputStreamReader(proc.getErrorStream());
            while (true) {
                int read2 = reader2.read(buf);
                if (read2 == -1) {
                    break;
                }
                if (log != null) {
                    log.append(buf, 0, read2);
                }
            }
            exitCode = proc.waitFor();
        }
        return exitCode;
    }
}
