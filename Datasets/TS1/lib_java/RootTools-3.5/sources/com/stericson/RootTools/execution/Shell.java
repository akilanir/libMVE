package com.stericson.RootTools.execution;

import android.content.Context;
import com.stericson.RootTools.RootTools;
import com.stericson.RootTools.exceptions.RootDeniedException;
import java.io.BufferedReader;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.Writer;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeoutException;

/* loaded from: RootTools-3.5.jar:com/stericson/RootTools/execution/Shell.class */
public class Shell {
    private static final String token = "F*D^W@#FGF";
    private static Shell rootShell = null;
    private static Shell shell = null;
    private static Shell customShell = null;
    public static ShellContext defaultContext = ShellContext.NORMAL;
    private int shellTimeout;
    private ShellType shellType;
    private ShellContext shellContext;
    private final Process proc;
    private final BufferedReader in;
    private final OutputStreamWriter out;
    private String error = "";
    private final List<Command> commands = new ArrayList();
    private boolean close = false;
    public boolean isExecuting = false;
    public boolean isReading = false;
    private int maxCommands = 5000;
    private int read = 0;
    private int write = 0;
    private int totalExecuted = 0;
    private int totalRead = 0;
    private boolean isCleaning = false;
    private Runnable input = new Runnable() { // from class: com.stericson.RootTools.execution.Shell.1
        @Override // java.lang.Runnable
        public void run() {
            while (true) {
                try {
                    try {
                        synchronized (Shell.this.commands) {
                            while (!Shell.this.close && Shell.this.write >= Shell.this.commands.size()) {
                                Shell.this.isExecuting = false;
                                Shell.this.commands.wait();
                            }
                        }
                        if (Shell.this.write >= Shell.this.maxCommands) {
                            while (Shell.this.read != Shell.this.write) {
                                RootTools.log("Waiting for read and write to catch up before cleanup.");
                            }
                            Shell.this.cleanCommands();
                        }
                        if (Shell.this.write < Shell.this.commands.size()) {
                            Shell.this.isExecuting = true;
                            Command cmd = (Command) Shell.this.commands.get(Shell.this.write);
                            cmd.startExecution();
                            RootTools.log("Executing: " + cmd.getCommand());
                            Shell.this.out.write(cmd.getCommand());
                            String line = "\necho F*D^W@#FGF " + Shell.this.totalExecuted + " $?\n";
                            Shell.this.out.write(line);
                            Shell.this.out.flush();
                            Shell.access$308(Shell.this);
                            Shell.access$808(Shell.this);
                        } else if (Shell.this.close) {
                            Shell.this.isExecuting = false;
                            Shell.this.out.write("\nexit 0\n");
                            Shell.this.out.flush();
                            RootTools.log("Closing shell");
                            Shell.this.write = 0;
                            Shell.this.closeQuietly(Shell.this.out);
                            return;
                        }
                    } catch (IOException e) {
                        RootTools.log(e.getMessage(), 2, e);
                        Shell.this.write = 0;
                        Shell.this.closeQuietly(Shell.this.out);
                        return;
                    } catch (InterruptedException e2) {
                        RootTools.log(e2.getMessage(), 2, e2);
                        Shell.this.write = 0;
                        Shell.this.closeQuietly(Shell.this.out);
                        return;
                    }
                } catch (Throwable th) {
                    Shell.this.write = 0;
                    Shell.this.closeQuietly(Shell.this.out);
                    throw th;
                }
            }
        }
    };
    private Runnable output = new Runnable() { // from class: com.stericson.RootTools.execution.Shell.3
        @Override // java.lang.Runnable
        public void run() {
            Command command = null;
            while (!Shell.this.close) {
                try {
                    Shell.this.isReading = false;
                    String line = Shell.this.in.readLine();
                    Shell.this.isReading = true;
                    if (line == null) {
                        break;
                    }
                    if (command == null) {
                        if (Shell.this.read >= Shell.this.commands.size()) {
                            if (Shell.this.close) {
                                break;
                            }
                        } else {
                            command = (Command) Shell.this.commands.get(Shell.this.read);
                        }
                    }
                    int pos = line.indexOf(Shell.token);
                    if (pos == -1) {
                        command.output(command.id, line);
                    }
                    if (pos > 0) {
                        command.output(command.id, line.substring(0, pos));
                    }
                    if (pos >= 0) {
                        String[] fields = line.substring(pos).split(" ");
                        if (fields.length >= 2 && fields[1] != null) {
                            int id = 0;
                            try {
                                id = Integer.parseInt(fields[1]);
                            } catch (NumberFormatException e) {
                            }
                            int exitCode = -1;
                            try {
                                exitCode = Integer.parseInt(fields[2]);
                            } catch (NumberFormatException e2) {
                            }
                            if (id == Shell.this.totalRead) {
                                command.setExitCode(exitCode);
                                command.commandFinished();
                                command = null;
                                Shell.access$508(Shell.this);
                                Shell.access$1108(Shell.this);
                            }
                        }
                    }
                } catch (IOException e3) {
                    RootTools.log(e3.getMessage(), 2, e3);
                    return;
                }
            }
            RootTools.log("Read all output");
            try {
                Shell.this.proc.waitFor();
                Shell.this.proc.destroy();
            } catch (Exception e4) {
            }
            Shell.this.closeQuietly(Shell.this.out);
            Shell.this.closeQuietly(Shell.this.in);
            RootTools.log("Shell destroyed");
            while (Shell.this.read < Shell.this.commands.size()) {
                if (command == null) {
                    command = (Command) Shell.this.commands.get(Shell.this.read);
                }
                command.terminated("Unexpected Termination.");
                command = null;
                Shell.access$508(Shell.this);
            }
            Shell.this.read = 0;
        }
    };

    /* loaded from: RootTools-3.5.jar:com/stericson/RootTools/execution/Shell$ShellType.class */
    public enum ShellType {
        NORMAL,
        ROOT,
        CUSTOM
    }

    static /* synthetic */ int access$308(Shell x0) {
        int i = x0.write;
        x0.write = i + 1;
        return i;
    }

    static /* synthetic */ int access$808(Shell x0) {
        int i = x0.totalExecuted;
        x0.totalExecuted = i + 1;
        return i;
    }

    static /* synthetic */ int access$508(Shell x0) {
        int i = x0.read;
        x0.read = i + 1;
        return i;
    }

    static /* synthetic */ int access$1108(Shell x0) {
        int i = x0.totalRead;
        x0.totalRead = i + 1;
        return i;
    }

    /* loaded from: RootTools-3.5.jar:com/stericson/RootTools/execution/Shell$ShellContext.class */
    public enum ShellContext {
        NORMAL("normal"),
        SHELL("u:r:shell:s0"),
        SYSTEM_SERVER("u:r:system_server:s0"),
        SYSTEM_APP("u:r:system_app:s0"),
        PLATFORM_APP("u:r:platform_app:s0"),
        UNTRUSTED_APP("u:r:untrusted_app:s0"),
        RECOVERY("u:r:recovery:s0");

        private String value;

        ShellContext(String value) {
            this.value = value;
        }

        public String getValue() {
            return this.value;
        }
    }

    private Shell(String cmd, ShellType shellType, ShellContext shellContext, int shellTimeout) throws IOException, TimeoutException, RootDeniedException {
        this.shellTimeout = 25000;
        this.shellType = null;
        this.shellContext = ShellContext.NORMAL;
        RootTools.log("Starting shell: " + cmd);
        RootTools.log("Context: " + shellContext.getValue());
        RootTools.log("Timeout: " + shellTimeout);
        this.shellType = shellType;
        this.shellTimeout = shellTimeout > 0 ? shellTimeout : this.shellTimeout;
        this.shellContext = shellContext;
        if (this.shellContext == ShellContext.NORMAL) {
            this.proc = new ProcessBuilder(cmd).redirectErrorStream(true).start();
        } else {
            this.proc = new ProcessBuilder(cmd, "--context " + this.shellContext.getValue()).redirectErrorStream(true).start();
        }
        this.in = new BufferedReader(new InputStreamReader(this.proc.getInputStream(), "UTF-8"));
        this.out = new OutputStreamWriter(this.proc.getOutputStream(), "UTF-8");
        Worker worker = new Worker();
        worker.start();
        try {
            worker.join(this.shellTimeout);
            if (worker.exit == -911) {
                try {
                    this.proc.destroy();
                } catch (Exception e) {
                }
                closeQuietly(this.in);
                closeQuietly(this.out);
                throw new TimeoutException(this.error);
            }
            if (worker.exit == -42) {
                try {
                    this.proc.destroy();
                } catch (Exception e2) {
                }
                closeQuietly(this.in);
                closeQuietly(this.out);
                throw new RootDeniedException("Root Access Denied");
            }
            Thread si = new Thread(this.input, "Shell Input");
            si.setPriority(5);
            si.start();
            Thread so = new Thread(this.output, "Shell Output");
            so.setPriority(5);
            so.start();
        } catch (InterruptedException e3) {
            worker.interrupt();
            Thread.currentThread().interrupt();
            throw new TimeoutException();
        }
    }

    public Command add(Command command) throws IOException {
        if (this.close) {
            throw new IllegalStateException("Unable to add commands to a closed shell");
        }
        while (this.isCleaning) {
        }
        this.commands.add(command);
        notifyThreads();
        return command;
    }

    public void useCWD(Context context) throws IOException, TimeoutException, RootDeniedException {
        add(new CommandCapture(-1, false, "cd " + context.getApplicationInfo().dataDir));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cleanCommands() {
        this.isCleaning = true;
        int toClean = Math.abs(this.maxCommands - (this.maxCommands / 4));
        RootTools.log("Cleaning up: " + toClean);
        for (int i = 0; i < toClean; i++) {
            this.commands.remove(0);
        }
        this.read = this.commands.size() - 1;
        this.write = this.commands.size() - 1;
        this.isCleaning = false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void closeQuietly(Reader input) {
        if (input != null) {
            try {
                input.close();
            } catch (Exception e) {
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void closeQuietly(Writer output) {
        if (output != null) {
            try {
                output.close();
            } catch (Exception e) {
            }
        }
    }

    public void close() throws IOException {
        if (this == rootShell) {
            rootShell = null;
        } else if (this == shell) {
            shell = null;
        } else if (this == customShell) {
            customShell = null;
        }
        synchronized (this.commands) {
            this.close = true;
            notifyThreads();
        }
    }

    public static void closeCustomShell() throws IOException {
        if (customShell == null) {
            return;
        }
        customShell.close();
    }

    public static void closeRootShell() throws IOException {
        if (rootShell == null) {
            return;
        }
        rootShell.close();
    }

    public static void closeShell() throws IOException {
        if (shell == null) {
            return;
        }
        shell.close();
    }

    public static void closeAll() throws IOException {
        closeShell();
        closeRootShell();
        closeCustomShell();
    }

    public int getCommandQueuePosition(Command cmd) {
        return this.commands.indexOf(cmd);
    }

    public String getCommandQueuePositionString(Command cmd) {
        return "Command is in position " + getCommandQueuePosition(cmd) + " currently executing command at position " + this.write + " and the number of commands is " + this.commands.size();
    }

    public static Shell getOpenShell() {
        if (customShell != null) {
            return customShell;
        }
        if (rootShell != null) {
            return rootShell;
        }
        return shell;
    }

    public static boolean isShellOpen() {
        return shell == null;
    }

    public static boolean isCustomShellOpen() {
        return customShell == null;
    }

    public static boolean isRootShellOpen() {
        return rootShell == null;
    }

    public static boolean isAnyShellOpen() {
        return (shell == null && rootShell == null && customShell == null) ? false : true;
    }

    protected void notifyThreads() {
        Thread t = new Thread() { // from class: com.stericson.RootTools.execution.Shell.2
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                synchronized (Shell.this.commands) {
                    Shell.this.commands.notifyAll();
                }
            }
        };
        t.start();
    }

    public static void runRootCommand(Command command) throws IOException, TimeoutException, RootDeniedException {
        startRootShell().add(command);
    }

    public static void runCommand(Command command) throws IOException, TimeoutException {
        startShell().add(command);
    }

    public static Shell startRootShell() throws IOException, TimeoutException, RootDeniedException {
        return startRootShell(0, 3);
    }

    public static Shell startRootShell(int timeout) throws IOException, TimeoutException, RootDeniedException {
        return startRootShell(timeout, 3);
    }

    public static Shell startRootShell(int timeout, int retry) throws IOException, TimeoutException, RootDeniedException {
        return startRootShell(timeout, defaultContext, retry);
    }

    public static Shell startRootShell(int timeout, ShellContext shellContext, int retry) throws IOException, TimeoutException, RootDeniedException {
        if (rootShell == null) {
            RootTools.log("Starting Root Shell!");
            int retries = 0;
            while (rootShell == null) {
                try {
                    rootShell = new Shell("su", ShellType.ROOT, shellContext, timeout);
                } catch (IOException e) {
                    int i = retries;
                    retries++;
                    if (i >= retry) {
                        RootTools.log("IOException, could not start shell");
                        throw e;
                    }
                }
            }
        } else if (rootShell.shellContext != shellContext) {
            try {
                RootTools.log("Context is different than open shell, switching context...");
                rootShell.switchRootShellContext(shellContext);
            } catch (IOException e2) {
                RootTools.log("Context could not be switched for existing root shell...");
                throw e2;
            }
        } else {
            RootTools.log("Using Existing Root Shell!");
        }
        return rootShell;
    }

    public static Shell startCustomShell(String shellPath) throws IOException, TimeoutException, RootDeniedException {
        return startCustomShell(shellPath, 0);
    }

    public static Shell startCustomShell(String shellPath, int timeout) throws IOException, TimeoutException, RootDeniedException {
        if (customShell == null) {
            RootTools.log("Starting Custom Shell!");
            customShell = new Shell(shellPath, ShellType.CUSTOM, ShellContext.NORMAL, timeout);
        } else {
            RootTools.log("Using Existing Custom Shell!");
        }
        return customShell;
    }

    public static Shell startShell() throws IOException, TimeoutException {
        return startShell(0);
    }

    public static Shell startShell(int timeout) throws IOException, TimeoutException {
        try {
            if (shell == null) {
                RootTools.log("Starting Shell!");
                shell = new Shell("/system/bin/sh", ShellType.NORMAL, ShellContext.NORMAL, timeout);
            } else {
                RootTools.log("Using Existing Shell!");
            }
            return shell;
        } catch (RootDeniedException e) {
            throw new IOException();
        }
    }

    public Shell switchRootShellContext(ShellContext shellContext) throws IOException, TimeoutException, RootDeniedException {
        if (this.shellType == ShellType.ROOT) {
            try {
                closeRootShell();
            } catch (Exception e) {
                RootTools.log("Problem closing shell while trying to switch context...");
            }
            return startRootShell(this.shellTimeout, shellContext, 3);
        }
        RootTools.log("Can only switch context on a root shell!");
        return this;
    }

    /* loaded from: RootTools-3.5.jar:com/stericson/RootTools/execution/Shell$Worker.class */
    protected static class Worker extends Thread {
        public int exit;
        public Shell shell;

        private Worker(Shell shell) {
            this.exit = -911;
            this.shell = shell;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            try {
                this.shell.out.write("echo Started\n");
                this.shell.out.flush();
                while (true) {
                    String line = this.shell.in.readLine();
                    if (line == null) {
                        throw new EOFException();
                    }
                    if (!"".equals(line)) {
                        if (!"Started".equals(line)) {
                            this.shell.error = "unkown error occured.";
                        } else {
                            this.exit = 1;
                            setShellOom();
                            return;
                        }
                    }
                }
            } catch (IOException e) {
                this.exit = -42;
                if (e.getMessage() == null) {
                    this.shell.error = "RootAccess denied?.";
                } else {
                    this.shell.error = e.getMessage();
                }
            }
        }

        private void setShellOom() {
            Field field;
            try {
                Class<?> processClass = this.shell.proc.getClass();
                try {
                    field = processClass.getDeclaredField("pid");
                } catch (NoSuchFieldException e) {
                    field = processClass.getDeclaredField("id");
                }
                field.setAccessible(true);
                int pid = ((Integer) field.get(this.shell.proc)).intValue();
                this.shell.out.write("(echo -17 > /proc/" + pid + "/oom_adj) &> /dev/null\n");
                this.shell.out.write("(echo -17 > /proc/$$/oom_adj) &> /dev/null\n");
                this.shell.out.flush();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }
}
