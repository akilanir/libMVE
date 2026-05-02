package eu.chainfire.libsuperuser;

import android.os.Build;
import eu.chainfire.libsuperuser.Shell;
import java.util.List;
import java.util.Locale;

/* loaded from: eu.chainfire.libsuperuser.1.0.0.201608240809.jar:eu/chainfire/libsuperuser/Toolbox.class */
public class Toolbox {
    private static final int TOYBOX_SDK = 23;
    private static final Object synchronizer = new Object();
    private static volatile String toybox = null;

    public static void init() {
        if (toybox != null) {
            return;
        }
        if (Build.VERSION.SDK_INT < TOYBOX_SDK) {
            toybox = BuildConfig.FLAVOR;
            return;
        }
        if (Debug.getSanityChecksEnabledEffective() && Debug.onMainThread()) {
            Debug.log(ShellOnMainThreadException.EXCEPTION_TOOLBOX);
            throw new ShellOnMainThreadException(ShellOnMainThreadException.EXCEPTION_TOOLBOX);
        }
        synchronized (synchronizer) {
            toybox = BuildConfig.FLAVOR;
            List<String> output = Shell.SH.run("toybox");
            if (output != null) {
                toybox = " ";
                for (String line : output) {
                    toybox += line.trim() + " ";
                }
            }
        }
    }

    public static String command(String format, Object... args) {
        String applet;
        if (Build.VERSION.SDK_INT < TOYBOX_SDK) {
            return String.format(Locale.ENGLISH, "toolbox " + format, args);
        }
        if (toybox == null) {
            init();
        }
        String format2 = format.trim();
        int p = format2.indexOf(32);
        if (p >= 0) {
            applet = format2.substring(0, p);
        } else {
            applet = format2;
        }
        if (toybox.contains(" " + applet + " ")) {
            return String.format(Locale.ENGLISH, "toybox " + format2, args);
        }
        return String.format(Locale.ENGLISH, "toolbox " + format2, args);
    }
}
