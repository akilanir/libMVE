package eu.chainfire.libsuperuser;

import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import eu.chainfire.libsuperuser.StreamGobbler;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: eu.chainfire.libsuperuser.1.0.0.201702212052.jar:eu/chainfire/libsuperuser/Shell.class */
public class Shell {
    protected static String[] availableTestCommands = {"echo -BOC-", "id"};

    /* loaded from: eu.chainfire.libsuperuser.1.0.0.201702212052.jar:eu/chainfire/libsuperuser/Shell$OnCommandLineListener.class */
    public interface OnCommandLineListener extends OnResult, StreamGobbler.OnLineListener {
        void onCommandResult(int i, int i2);
    }

    /* loaded from: eu.chainfire.libsuperuser.1.0.0.201702212052.jar:eu/chainfire/libsuperuser/Shell$OnCommandResultListener.class */
    public interface OnCommandResultListener extends OnResult {
        void onCommandResult(int i, int i2, List<String> list);
    }

    /* loaded from: eu.chainfire.libsuperuser.1.0.0.201702212052.jar:eu/chainfire/libsuperuser/Shell$OnResult.class */
    private interface OnResult {
        public static final int WATCHDOG_EXIT = -1;
        public static final int SHELL_DIED = -2;
        public static final int SHELL_EXEC_FAILED = -3;
        public static final int SHELL_WRONG_UID = -4;
        public static final int SHELL_RUNNING = 0;
    }

    @Deprecated
    public static List<String> run(String shell, String[] commands, boolean wantSTDERR) {
        return run(shell, commands, null, wantSTDERR);
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x015f  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0164  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0186 A[Catch: IOException -> 0x01e0, IOException -> 0x022c, InterruptedException -> 0x0234, LOOP:0: B:28:0x017f->B:30:0x0186, LOOP_END, TryCatch #2 {IOException -> 0x01e0, blocks: (B:27:0x0174, B:30:0x0186, B:31:0x01cc), top: B:55:0x0174 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.List<java.lang.String> run(java.lang.String r7, java.lang.String[] r8, java.lang.String[] r9, boolean r10) {
        /*
            Method dump skipped, instructions count: 594
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: eu.chainfire.libsuperuser.Shell.run(java.lang.String, java.lang.String[], java.lang.String[], boolean):java.util.List");
    }

    protected static boolean parseAvailableResult(List<String> ret, boolean checkForRoot) {
        if (ret == null) {
            return false;
        }
        boolean echo_seen = false;
        for (String line : ret) {
            if (line.contains("uid=")) {
                return !checkForRoot || line.contains("uid=0");
            }
            if (line.contains("-BOC-")) {
                echo_seen = true;
            }
        }
        return echo_seen;
    }

    /* loaded from: eu.chainfire.libsuperuser.1.0.0.201702212052.jar:eu/chainfire/libsuperuser/Shell$SH.class */
    public static class SH {
        public static List<String> run(String command) {
            return Shell.run("sh", new String[]{command}, null, false);
        }

        public static List<String> run(List<String> commands) {
            return Shell.run("sh", (String[]) commands.toArray(new String[commands.size()]), null, false);
        }

        public static List<String> run(String[] commands) {
            return Shell.run("sh", commands, null, false);
        }
    }

    /* loaded from: eu.chainfire.libsuperuser.1.0.0.201702212052.jar:eu/chainfire/libsuperuser/Shell$SU.class */
    public static class SU {
        private static Boolean isSELinuxEnforcing = null;
        private static String[] suVersion = {null, null};

        public static List<String> run(String command) {
            return Shell.run("su", new String[]{command}, null, false);
        }

        public static List<String> run(List<String> commands) {
            return Shell.run("su", (String[]) commands.toArray(new String[commands.size()]), null, false);
        }

        public static List<String> run(String[] commands) {
            return Shell.run("su", commands, null, false);
        }

        public static boolean available() {
            List<String> ret = run(Shell.availableTestCommands);
            return Shell.parseAvailableResult(ret, true);
        }

        public static synchronized String version(boolean internal) {
            int idx = internal ? 0 : 1;
            if (suVersion[idx] == null) {
                String version = null;
                List<String> ret = Shell.run(internal ? "su -V" : "su -v", new String[]{"exit"}, null, false);
                if (ret != null) {
                    Iterator<String> it = ret.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        String line = it.next();
                        if (!internal) {
                            if (!line.trim().equals(BuildConfig.FLAVOR)) {
                                version = line;
                                break;
                            }
                        } else if (Integer.parseInt(line) > 0) {
                            version = line;
                            break;
                        }
                    }
                }
                suVersion[idx] = version;
            }
            return suVersion[idx];
        }

        public static boolean isSU(String shell) {
            int pos = shell.indexOf(32);
            if (pos >= 0) {
                shell = shell.substring(0, pos);
            }
            int pos2 = shell.lastIndexOf(47);
            if (pos2 >= 0) {
                shell = shell.substring(pos2 + 1);
            }
            return shell.equals("su");
        }

        public static String shell(int uid, String context) {
            String shell = "su";
            if (context != null && isSELinuxEnforcing()) {
                String display = version(false);
                String internal = version(true);
                if (display != null && internal != null && display.endsWith("SUPERSU") && Integer.valueOf(internal).intValue() >= 190) {
                    shell = String.format(Locale.ENGLISH, "%s --context %s", shell, context);
                }
            }
            if (uid > 0) {
                shell = String.format(Locale.ENGLISH, "%s %d", shell, Integer.valueOf(uid));
            }
            return shell;
        }

        public static String shellMountMaster() {
            if (Build.VERSION.SDK_INT >= 17) {
                return "su --mount-master";
            }
            return "su";
        }

        public static synchronized boolean isSELinuxEnforcing() {
            if (isSELinuxEnforcing == null) {
                Boolean enforcing = null;
                if (Build.VERSION.SDK_INT >= 17) {
                    File f = new File("/sys/fs/selinux/enforce");
                    if (f.exists()) {
                        try {
                            InputStream is = new FileInputStream("/sys/fs/selinux/enforce");
                            try {
                                enforcing = Boolean.valueOf(is.read() == 49);
                                is.close();
                            } catch (Throwable th) {
                                is.close();
                                throw th;
                            }
                        } catch (Exception e) {
                        }
                    }
                    if (enforcing == null) {
                        enforcing = Boolean.valueOf(Build.VERSION.SDK_INT >= 19);
                    }
                }
                if (enforcing == null) {
                    enforcing = false;
                }
                isSELinuxEnforcing = enforcing;
            }
            return isSELinuxEnforcing.booleanValue();
        }

        public static synchronized void clearCachedResults() {
            isSELinuxEnforcing = null;
            suVersion[0] = null;
            suVersion[1] = null;
        }
    }

    /* loaded from: eu.chainfire.libsuperuser.1.0.0.201702212052.jar:eu/chainfire/libsuperuser/Shell$Command.class */
    private static class Command {
        private static int commandCounter = 0;
        private final String[] commands;
        private final int code;
        private final OnCommandResultListener onCommandResultListener;
        private final OnCommandLineListener onCommandLineListener;
        private final String marker;

        public Command(String[] commands, int code, OnCommandResultListener onCommandResultListener, OnCommandLineListener onCommandLineListener) {
            this.commands = commands;
            this.code = code;
            this.onCommandResultListener = onCommandResultListener;
            this.onCommandLineListener = onCommandLineListener;
            StringBuilder append = new StringBuilder().append(UUID.randomUUID().toString());
            int i = commandCounter + 1;
            commandCounter = i;
            this.marker = append.append(String.format("-%08x", Integer.valueOf(i))).toString();
        }
    }

    /* loaded from: eu.chainfire.libsuperuser.1.0.0.201702212052.jar:eu/chainfire/libsuperuser/Shell$Builder.class */
    public static class Builder {
        private Handler handler = null;
        private boolean autoHandler = true;
        private String shell = "sh";
        private boolean wantSTDERR = false;
        private List<Command> commands = new LinkedList();
        private Map<String, String> environment = new HashMap();
        private StreamGobbler.OnLineListener onSTDOUTLineListener = null;
        private StreamGobbler.OnLineListener onSTDERRLineListener = null;
        private int watchdogTimeout = 0;

        public Builder setHandler(Handler handler) {
            this.handler = handler;
            return this;
        }

        public Builder setAutoHandler(boolean autoHandler) {
            this.autoHandler = autoHandler;
            return this;
        }

        public Builder setShell(String shell) {
            this.shell = shell;
            return this;
        }

        public Builder useSH() {
            return setShell("sh");
        }

        public Builder useSU() {
            return setShell("su");
        }

        public Builder setWantSTDERR(boolean wantSTDERR) {
            this.wantSTDERR = wantSTDERR;
            return this;
        }

        public Builder addEnvironment(String key, String value) {
            this.environment.put(key, value);
            return this;
        }

        public Builder addEnvironment(Map<String, String> addEnvironment) {
            this.environment.putAll(addEnvironment);
            return this;
        }

        public Builder addCommand(String command) {
            return addCommand(command, 0, (OnCommandResultListener) null);
        }

        public Builder addCommand(String command, int code, OnCommandResultListener onCommandResultListener) {
            return addCommand(new String[]{command}, code, onCommandResultListener);
        }

        public Builder addCommand(List<String> commands) {
            return addCommand(commands, 0, (OnCommandResultListener) null);
        }

        public Builder addCommand(List<String> commands, int code, OnCommandResultListener onCommandResultListener) {
            return addCommand((String[]) commands.toArray(new String[commands.size()]), code, onCommandResultListener);
        }

        public Builder addCommand(String[] commands) {
            return addCommand(commands, 0, (OnCommandResultListener) null);
        }

        public Builder addCommand(String[] commands, int code, OnCommandResultListener onCommandResultListener) {
            this.commands.add(new Command(commands, code, onCommandResultListener, null));
            return this;
        }

        public Builder setOnSTDOUTLineListener(StreamGobbler.OnLineListener onLineListener) {
            this.onSTDOUTLineListener = onLineListener;
            return this;
        }

        public Builder setOnSTDERRLineListener(StreamGobbler.OnLineListener onLineListener) {
            this.onSTDERRLineListener = onLineListener;
            return this;
        }

        public Builder setWatchdogTimeout(int watchdogTimeout) {
            this.watchdogTimeout = watchdogTimeout;
            return this;
        }

        public Builder setMinimalLogging(boolean useMinimal) {
            Debug.setLogTypeEnabled(6, !useMinimal);
            return this;
        }

        public Interactive open() {
            return new Interactive(this, null);
        }

        public Interactive open(OnCommandResultListener onCommandResultListener) {
            return new Interactive(this, onCommandResultListener);
        }
    }

    /* loaded from: eu.chainfire.libsuperuser.1.0.0.201702212052.jar:eu/chainfire/libsuperuser/Shell$Interactive.class */
    public static class Interactive {
        private final Handler handler;
        private final boolean autoHandler;
        private final String shell;
        private final boolean wantSTDERR;
        private final List<Command> commands;
        private final Map<String, String> environment;
        private final StreamGobbler.OnLineListener onSTDOUTLineListener;
        private final StreamGobbler.OnLineListener onSTDERRLineListener;
        private int watchdogTimeout;
        private Process process;
        private DataOutputStream STDIN;
        private StreamGobbler STDOUT;
        private StreamGobbler STDERR;
        private ScheduledThreadPoolExecutor watchdog;
        private volatile boolean running;
        private volatile boolean idle;
        private volatile boolean closed;
        private volatile int callbacks;
        private volatile int watchdogCount;
        private final Object idleSync;
        private final Object callbackSync;
        private volatile int lastExitCode;
        private volatile String lastMarkerSTDOUT;
        private volatile String lastMarkerSTDERR;
        private volatile Command command;
        private volatile List<String> buffer;

        private Interactive(final Builder builder, final OnCommandResultListener onCommandResultListener) {
            this.process = null;
            this.STDIN = null;
            this.STDOUT = null;
            this.STDERR = null;
            this.watchdog = null;
            this.running = false;
            this.idle = true;
            this.closed = true;
            this.callbacks = 0;
            this.idleSync = new Object();
            this.callbackSync = new Object();
            this.lastExitCode = 0;
            this.lastMarkerSTDOUT = null;
            this.lastMarkerSTDERR = null;
            this.command = null;
            this.buffer = null;
            this.autoHandler = builder.autoHandler;
            this.shell = builder.shell;
            this.wantSTDERR = builder.wantSTDERR;
            this.commands = builder.commands;
            this.environment = builder.environment;
            this.onSTDOUTLineListener = builder.onSTDOUTLineListener;
            this.onSTDERRLineListener = builder.onSTDERRLineListener;
            this.watchdogTimeout = builder.watchdogTimeout;
            if (Looper.myLooper() != null && builder.handler == null && this.autoHandler) {
                this.handler = new Handler();
            } else {
                this.handler = builder.handler;
            }
            if (onCommandResultListener != null) {
                this.watchdogTimeout = 60;
                this.commands.add(0, new Command(Shell.availableTestCommands, 0, new OnCommandResultListener() { // from class: eu.chainfire.libsuperuser.Shell.Interactive.1
                    @Override // eu.chainfire.libsuperuser.Shell.OnCommandResultListener
                    public void onCommandResult(int commandCode, int exitCode, List<String> output) {
                        if (exitCode == 0 && !Shell.parseAvailableResult(output, SU.isSU(Interactive.this.shell))) {
                            exitCode = -4;
                        }
                        Interactive.this.watchdogTimeout = builder.watchdogTimeout;
                        onCommandResultListener.onCommandResult(0, exitCode, output);
                    }
                }, null));
            }
            if (!open() && onCommandResultListener != null) {
                onCommandResultListener.onCommandResult(0, -3, null);
            }
        }

        protected void finalize() throws Throwable {
            if (!this.closed && Debug.getSanityChecksEnabledEffective()) {
                Debug.log(ShellNotClosedException.EXCEPTION_NOT_CLOSED);
                throw new ShellNotClosedException();
            }
            super.finalize();
        }

        public void addCommand(String command) {
            addCommand(command, 0, (OnCommandResultListener) null);
        }

        public void addCommand(String command, int code, OnCommandResultListener onCommandResultListener) {
            addCommand(new String[]{command}, code, onCommandResultListener);
        }

        public void addCommand(String command, int code, OnCommandLineListener onCommandLineListener) {
            addCommand(new String[]{command}, code, onCommandLineListener);
        }

        public void addCommand(List<String> commands) {
            addCommand(commands, 0, (OnCommandResultListener) null);
        }

        public void addCommand(List<String> commands, int code, OnCommandResultListener onCommandResultListener) {
            addCommand((String[]) commands.toArray(new String[commands.size()]), code, onCommandResultListener);
        }

        public void addCommand(List<String> commands, int code, OnCommandLineListener onCommandLineListener) {
            addCommand((String[]) commands.toArray(new String[commands.size()]), code, onCommandLineListener);
        }

        public void addCommand(String[] commands) {
            addCommand(commands, 0, (OnCommandResultListener) null);
        }

        public synchronized void addCommand(String[] commands, int code, OnCommandResultListener onCommandResultListener) {
            this.commands.add(new Command(commands, code, onCommandResultListener, null));
            runNextCommand();
        }

        public synchronized void addCommand(String[] commands, int code, OnCommandLineListener onCommandLineListener) {
            this.commands.add(new Command(commands, code, null, onCommandLineListener));
            runNextCommand();
        }

        private void runNextCommand() {
            runNextCommand(true);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public synchronized void handleWatchdog() {
            int exitCode;
            if (this.watchdog == null || this.watchdogTimeout == 0) {
                return;
            }
            if (!isRunning()) {
                exitCode = -2;
                Debug.log(String.format("[%s%%] SHELL_DIED", this.shell.toUpperCase(Locale.ENGLISH)));
            } else {
                int i = this.watchdogCount;
                this.watchdogCount = i + 1;
                if (i < this.watchdogTimeout) {
                    return;
                }
                exitCode = -1;
                Debug.log(String.format("[%s%%] WATCHDOG_EXIT", this.shell.toUpperCase(Locale.ENGLISH)));
            }
            if (this.handler != null) {
                postCallback(this.command, exitCode, this.buffer);
            }
            this.command = null;
            this.buffer = null;
            this.idle = true;
            this.watchdog.shutdown();
            this.watchdog = null;
            kill();
        }

        private void startWatchdog() {
            if (this.watchdogTimeout == 0) {
                return;
            }
            this.watchdogCount = 0;
            this.watchdog = new ScheduledThreadPoolExecutor(1);
            this.watchdog.scheduleAtFixedRate(new Runnable() { // from class: eu.chainfire.libsuperuser.Shell.Interactive.2
                @Override // java.lang.Runnable
                public void run() {
                    Interactive.this.handleWatchdog();
                }
            }, 1L, 1L, TimeUnit.SECONDS);
        }

        private void stopWatchdog() {
            if (this.watchdog != null) {
                this.watchdog.shutdownNow();
                this.watchdog = null;
            }
        }

        private void runNextCommand(boolean notifyIdle) {
            boolean running = isRunning();
            if (!running) {
                this.idle = true;
            }
            if (running && this.idle && this.commands.size() > 0) {
                Command command = this.commands.get(0);
                this.commands.remove(0);
                this.buffer = null;
                this.lastExitCode = 0;
                this.lastMarkerSTDOUT = null;
                this.lastMarkerSTDERR = null;
                if (command.commands.length > 0) {
                    try {
                        if (command.onCommandResultListener != null) {
                            this.buffer = Collections.synchronizedList(new ArrayList());
                        }
                        this.idle = false;
                        this.command = command;
                        startWatchdog();
                        for (String write : command.commands) {
                            Debug.logCommand(String.format("[%s+] %s", this.shell.toUpperCase(Locale.ENGLISH), write));
                            this.STDIN.write((write + "\n").getBytes("UTF-8"));
                        }
                        this.STDIN.write(("echo " + command.marker + " $?\n").getBytes("UTF-8"));
                        this.STDIN.write(("echo " + command.marker + " >&2\n").getBytes("UTF-8"));
                        this.STDIN.flush();
                    } catch (IOException e) {
                    }
                } else {
                    runNextCommand(false);
                }
            } else if (!running) {
                while (this.commands.size() > 0) {
                    postCallback(this.commands.remove(0), -2, null);
                }
            }
            if (this.idle && notifyIdle) {
                synchronized (this.idleSync) {
                    this.idleSync.notifyAll();
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public synchronized void processMarker() {
            if (this.command.marker.equals(this.lastMarkerSTDOUT) && this.command.marker.equals(this.lastMarkerSTDERR)) {
                postCallback(this.command, this.lastExitCode, this.buffer);
                stopWatchdog();
                this.command = null;
                this.buffer = null;
                this.idle = true;
                runNextCommand();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public synchronized void processLine(final String line, final StreamGobbler.OnLineListener listener) {
            if (listener != null) {
                if (this.handler != null) {
                    startCallback();
                    this.handler.post(new Runnable() { // from class: eu.chainfire.libsuperuser.Shell.Interactive.3
                        @Override // java.lang.Runnable
                        public void run() {
                            try {
                                listener.onLine(line);
                            } finally {
                                Interactive.this.endCallback();
                            }
                        }
                    });
                } else {
                    listener.onLine(line);
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public synchronized void addBuffer(String line) {
            if (this.buffer != null) {
                this.buffer.add(line);
            }
        }

        private void startCallback() {
            synchronized (this.callbackSync) {
                this.callbacks++;
            }
        }

        private void postCallback(final Command fCommand, final int fExitCode, final List<String> fOutput) {
            if (fCommand.onCommandResultListener == null && fCommand.onCommandLineListener == null) {
                return;
            }
            if (this.handler == null) {
                if (fCommand.onCommandResultListener != null && fOutput != null) {
                    fCommand.onCommandResultListener.onCommandResult(fCommand.code, fExitCode, fOutput);
                }
                if (fCommand.onCommandLineListener != null) {
                    fCommand.onCommandLineListener.onCommandResult(fCommand.code, fExitCode);
                    return;
                }
                return;
            }
            startCallback();
            this.handler.post(new Runnable() { // from class: eu.chainfire.libsuperuser.Shell.Interactive.4
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        if (fCommand.onCommandResultListener != null && fOutput != null) {
                            fCommand.onCommandResultListener.onCommandResult(fCommand.code, fExitCode, fOutput);
                        }
                        if (fCommand.onCommandLineListener != null) {
                            fCommand.onCommandLineListener.onCommandResult(fCommand.code, fExitCode);
                        }
                    } finally {
                        Interactive.this.endCallback();
                    }
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void endCallback() {
            synchronized (this.callbackSync) {
                this.callbacks--;
                if (this.callbacks == 0) {
                    this.callbackSync.notifyAll();
                }
            }
        }

        private synchronized boolean open() {
            Debug.log(String.format("[%s%%] START", this.shell.toUpperCase(Locale.ENGLISH)));
            try {
                if (this.environment.size() == 0) {
                    this.process = Runtime.getRuntime().exec(this.shell);
                } else {
                    Map<String, String> newEnvironment = new HashMap<>();
                    newEnvironment.putAll(System.getenv());
                    newEnvironment.putAll(this.environment);
                    int i = 0;
                    String[] env = new String[newEnvironment.size()];
                    for (Map.Entry<String, String> entry : newEnvironment.entrySet()) {
                        env[i] = entry.getKey() + "=" + entry.getValue();
                        i++;
                    }
                    this.process = Runtime.getRuntime().exec(this.shell, env);
                }
                this.STDIN = new DataOutputStream(this.process.getOutputStream());
                this.STDOUT = new StreamGobbler(this.shell.toUpperCase(Locale.ENGLISH) + "-", this.process.getInputStream(), new StreamGobbler.OnLineListener() { // from class: eu.chainfire.libsuperuser.Shell.Interactive.5
                    @Override // eu.chainfire.libsuperuser.StreamGobbler.OnLineListener
                    public void onLine(String line) {
                        synchronized (Interactive.this) {
                            if (Interactive.this.command == null) {
                                return;
                            }
                            String contentPart = line;
                            String markerPart = null;
                            int markerIndex = line.indexOf(Interactive.this.command.marker);
                            if (markerIndex == 0) {
                                contentPart = null;
                                markerPart = line;
                            } else if (markerIndex > 0) {
                                contentPart = line.substring(0, markerIndex);
                                markerPart = line.substring(markerIndex);
                            }
                            if (contentPart != null) {
                                Interactive.this.addBuffer(contentPart);
                                Interactive.this.processLine(contentPart, Interactive.this.onSTDOUTLineListener);
                                Interactive.this.processLine(contentPart, Interactive.this.command.onCommandLineListener);
                            }
                            if (markerPart != null) {
                                try {
                                    Interactive.this.lastExitCode = Integer.valueOf(markerPart.substring(Interactive.this.command.marker.length() + 1), 10).intValue();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                                Interactive.this.lastMarkerSTDOUT = Interactive.this.command.marker;
                                Interactive.this.processMarker();
                            }
                        }
                    }
                });
                this.STDERR = new StreamGobbler(this.shell.toUpperCase(Locale.ENGLISH) + "*", this.process.getErrorStream(), new StreamGobbler.OnLineListener() { // from class: eu.chainfire.libsuperuser.Shell.Interactive.6
                    @Override // eu.chainfire.libsuperuser.StreamGobbler.OnLineListener
                    public void onLine(String line) {
                        synchronized (Interactive.this) {
                            if (Interactive.this.command == null) {
                                return;
                            }
                            String contentPart = line;
                            int markerIndex = line.indexOf(Interactive.this.command.marker);
                            if (markerIndex == 0) {
                                contentPart = null;
                            } else if (markerIndex > 0) {
                                contentPart = line.substring(0, markerIndex);
                            }
                            if (contentPart != null) {
                                if (Interactive.this.wantSTDERR) {
                                    Interactive.this.addBuffer(contentPart);
                                }
                                Interactive.this.processLine(contentPart, Interactive.this.onSTDERRLineListener);
                            }
                            if (markerIndex >= 0) {
                                Interactive.this.lastMarkerSTDERR = Interactive.this.command.marker;
                                Interactive.this.processMarker();
                            }
                        }
                    }
                });
                this.STDOUT.start();
                this.STDERR.start();
                this.running = true;
                this.closed = false;
                runNextCommand();
                return true;
            } catch (IOException e) {
                return false;
            }
        }

        public void close() {
            boolean _idle = isIdle();
            synchronized (this) {
                if (this.running) {
                    this.running = false;
                    this.closed = true;
                    if (!_idle && Debug.getSanityChecksEnabledEffective() && Debug.onMainThread()) {
                        Debug.log(ShellOnMainThreadException.EXCEPTION_NOT_IDLE);
                        throw new ShellOnMainThreadException(ShellOnMainThreadException.EXCEPTION_NOT_IDLE);
                    }
                    if (!_idle) {
                        waitForIdle();
                    }
                    try {
                        try {
                            this.STDIN.write("exit\n".getBytes("UTF-8"));
                            this.STDIN.flush();
                        } catch (IOException e) {
                            if (!e.getMessage().contains("EPIPE")) {
                                throw e;
                            }
                        }
                        this.process.waitFor();
                        try {
                            this.STDIN.close();
                        } catch (IOException e2) {
                        }
                        this.STDOUT.join();
                        this.STDERR.join();
                        stopWatchdog();
                        this.process.destroy();
                    } catch (IOException e3) {
                    } catch (InterruptedException e4) {
                    }
                    Debug.log(String.format("[%s%%] END", this.shell.toUpperCase(Locale.ENGLISH)));
                }
            }
        }

        public synchronized void kill() {
            this.running = false;
            this.closed = true;
            try {
                this.STDIN.close();
            } catch (IOException e) {
            }
            try {
                this.process.destroy();
            } catch (Exception e2) {
            }
        }

        public boolean isRunning() {
            if (this.process == null) {
                return false;
            }
            try {
                this.process.exitValue();
                return false;
            } catch (IllegalThreadStateException e) {
                return true;
            }
        }

        public synchronized boolean isIdle() {
            if (!isRunning()) {
                this.idle = true;
                synchronized (this.idleSync) {
                    this.idleSync.notifyAll();
                }
            }
            return this.idle;
        }

        public boolean waitForIdle() {
            if (Debug.getSanityChecksEnabledEffective() && Debug.onMainThread()) {
                Debug.log(ShellOnMainThreadException.EXCEPTION_WAIT_IDLE);
                throw new ShellOnMainThreadException(ShellOnMainThreadException.EXCEPTION_WAIT_IDLE);
            }
            if (isRunning()) {
                synchronized (this.idleSync) {
                    while (!this.idle) {
                        try {
                            this.idleSync.wait();
                        } catch (InterruptedException e) {
                            return false;
                        }
                    }
                }
                if (this.handler != null && this.handler.getLooper() != null && this.handler.getLooper() != Looper.myLooper()) {
                    synchronized (this.callbackSync) {
                        while (this.callbacks > 0) {
                            try {
                                this.callbackSync.wait();
                            } catch (InterruptedException e2) {
                                return false;
                            }
                        }
                    }
                    return true;
                }
                return true;
            }
            return true;
        }

        public boolean hasHandler() {
            return this.handler != null;
        }
    }
}
