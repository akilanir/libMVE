package eu.chainfire.libsuperuser;

import eu.chainfire.libsuperuser.Shell;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: eu.chainfire.libsuperuser.1.0.0.201702212052.jar:eu/chainfire/libsuperuser/Policy.class */
public abstract class Policy {
    private static final int MAX_POLICY_LENGTH = 4064;
    private static final Object synchronizer = new Object();
    private static volatile Boolean canInject = null;
    private static volatile boolean injected = false;

    protected abstract String[] getPolicies();

    public static boolean haveInjected() {
        return injected;
    }

    public static void resetInjected() {
        synchronized (synchronizer) {
            injected = false;
        }
    }

    public static boolean canInject() {
        synchronized (synchronizer) {
            if (canInject != null) {
                return canInject.booleanValue();
            }
            canInject = false;
            List<String> result = Shell.run("sh", new String[]{"supolicy"}, null, false);
            if (result != null) {
                Iterator<String> it = result.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    String line = it.next();
                    if (line.contains("supolicy")) {
                        canInject = true;
                        break;
                    }
                }
            }
            return canInject.booleanValue();
        }
    }

    public static void resetCanInject() {
        synchronized (synchronizer) {
            canInject = null;
        }
    }

    protected List<String> getInjectCommands() {
        return getInjectCommands(true);
    }

    protected List<String> getInjectCommands(boolean allowBlocking) {
        synchronized (synchronizer) {
            if (!Shell.SU.isSELinuxEnforcing()) {
                return null;
            }
            if (allowBlocking && !canInject()) {
                return null;
            }
            if (injected) {
                return null;
            }
            String[] policies = getPolicies();
            if (policies != null && policies.length > 0) {
                List<String> commands = new ArrayList<>();
                String command = BuildConfig.FLAVOR;
                for (String policy : policies) {
                    if (command.length() == 0 || command.length() + policy.length() + 3 < MAX_POLICY_LENGTH) {
                        command = command + " \"" + policy + "\"";
                    } else {
                        commands.add("supolicy --live" + command);
                        command = BuildConfig.FLAVOR;
                    }
                }
                if (command.length() > 0) {
                    commands.add("supolicy --live" + command);
                }
                return commands;
            }
            return null;
        }
    }

    public void inject() {
        synchronized (synchronizer) {
            List<String> commands = getInjectCommands();
            if (commands != null && commands.size() > 0) {
                Shell.SU.run(commands);
            }
            injected = true;
        }
    }

    public void inject(Shell.Interactive shell, boolean waitForIdle) {
        synchronized (synchronizer) {
            List<String> commands = getInjectCommands(waitForIdle);
            if (commands != null && commands.size() > 0) {
                shell.addCommand(commands);
                if (waitForIdle) {
                    shell.waitForIdle();
                }
            }
            injected = true;
        }
    }
}
