package com.stericson.RootTools.execution;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.stericson.RootTools.RootTools;
import java.io.IOException;

/* loaded from: RootTools-3.5.jar:com/stericson/RootTools/execution/Command.class */
public abstract class Command {
    ExecutionMonitor executionMonitor;
    Handler mHandler;
    boolean executing;
    String[] command;
    boolean javaCommand;
    Context context;
    boolean finished;
    boolean terminated;
    boolean handlerEnabled;
    int exitCode;
    int id;
    int timeout;

    public abstract void commandOutput(int i, String str);

    public abstract void commandTerminated(int i, String str);

    public abstract void commandCompleted(int i, int i2);

    public Command(int id, String... command) {
        this.executionMonitor = null;
        this.mHandler = null;
        this.executing = false;
        this.command = new String[0];
        this.javaCommand = false;
        this.context = null;
        this.finished = false;
        this.terminated = false;
        this.handlerEnabled = true;
        this.exitCode = -1;
        this.id = 0;
        this.timeout = RootTools.default_Command_Timeout;
        this.command = command;
        this.id = id;
        createHandler(RootTools.handlerEnabled);
    }

    public Command(int id, boolean handlerEnabled, String... command) {
        this.executionMonitor = null;
        this.mHandler = null;
        this.executing = false;
        this.command = new String[0];
        this.javaCommand = false;
        this.context = null;
        this.finished = false;
        this.terminated = false;
        this.handlerEnabled = true;
        this.exitCode = -1;
        this.id = 0;
        this.timeout = RootTools.default_Command_Timeout;
        this.command = command;
        this.id = id;
        createHandler(handlerEnabled);
    }

    public Command(int id, int timeout, String... command) {
        this.executionMonitor = null;
        this.mHandler = null;
        this.executing = false;
        this.command = new String[0];
        this.javaCommand = false;
        this.context = null;
        this.finished = false;
        this.terminated = false;
        this.handlerEnabled = true;
        this.exitCode = -1;
        this.id = 0;
        this.timeout = RootTools.default_Command_Timeout;
        this.command = command;
        this.id = id;
        this.timeout = timeout;
        createHandler(RootTools.handlerEnabled);
    }

    public Command(int id, boolean javaCommand, Context context, String... command) {
        this(id, command);
        this.javaCommand = javaCommand;
        this.context = context;
    }

    public Command(int id, boolean handlerEnabled, boolean javaCommand, Context context, String... command) {
        this(id, handlerEnabled, command);
        this.javaCommand = javaCommand;
        this.context = context;
    }

    public Command(int id, int timeout, boolean javaCommand, Context context, String... command) {
        this(id, timeout, command);
        this.javaCommand = javaCommand;
        this.context = context;
    }

    protected void finishCommand() {
        this.executing = false;
        this.finished = true;
        notifyAll();
    }

    protected void commandFinished() {
        if (!this.terminated) {
            synchronized (this) {
                if (this.mHandler != null && this.handlerEnabled) {
                    Message msg = this.mHandler.obtainMessage();
                    Bundle bundle = new Bundle();
                    bundle.putInt("action", 2);
                    msg.setData(bundle);
                    this.mHandler.sendMessage(msg);
                } else {
                    commandCompleted(this.id, this.exitCode);
                }
                RootTools.log("Command " + this.id + " finished.");
                finishCommand();
            }
        }
    }

    private void createHandler(boolean handlerEnabled) {
        this.handlerEnabled = handlerEnabled;
        if (Looper.myLooper() != null && handlerEnabled) {
            RootTools.log("CommandHandler created");
            this.mHandler = new CommandHandler();
        } else {
            RootTools.log("CommandHandler not created");
        }
    }

    public String getCommand() {
        StringBuilder sb = new StringBuilder();
        if (this.javaCommand) {
            String filePath = this.context.getFilesDir().getPath();
            for (int i = 0; i < this.command.length; i++) {
                sb.append("dalvikvm -cp " + filePath + "/anbuild.dex com.android.internal.util.WithFramework com.stericson.RootTools.containers.RootClass " + this.command[i]);
                sb.append('\n');
            }
        } else {
            for (int i2 = 0; i2 < this.command.length; i2++) {
                sb.append(this.command[i2]);
                sb.append('\n');
            }
        }
        return sb.toString();
    }

    public boolean isExecuting() {
        return this.executing;
    }

    public boolean isHandlerEnabled() {
        return this.handlerEnabled;
    }

    public boolean isFinished() {
        return this.finished;
    }

    public int getExitCode() {
        return this.exitCode;
    }

    protected void setExitCode(int code) {
        synchronized (this) {
            this.exitCode = code;
        }
    }

    protected void startExecution() {
        this.executionMonitor = new ExecutionMonitor();
        this.executionMonitor.setPriority(1);
        this.executionMonitor.start();
        this.executing = true;
    }

    public void terminate(String reason) {
        try {
            Shell.closeAll();
            RootTools.log("Terminating all shells.");
            terminated(reason);
        } catch (IOException e) {
        }
    }

    protected void terminated(String reason) {
        synchronized (this) {
            if (this.mHandler != null && this.handlerEnabled) {
                Message msg = this.mHandler.obtainMessage();
                Bundle bundle = new Bundle();
                bundle.putInt("action", 3);
                bundle.putString("text", reason);
                msg.setData(bundle);
                this.mHandler.sendMessage(msg);
            } else {
                commandTerminated(this.id, reason);
            }
            RootTools.log("Command " + this.id + " did not finish because it was terminated. Termination reason: " + reason);
            setExitCode(-1);
            this.terminated = true;
            finishCommand();
        }
    }

    protected void output(int id, String line) {
        if (this.mHandler != null && this.handlerEnabled) {
            Message msg = this.mHandler.obtainMessage();
            Bundle bundle = new Bundle();
            bundle.putInt("action", 1);
            bundle.putString("text", line);
            msg.setData(bundle);
            this.mHandler.sendMessage(msg);
            return;
        }
        commandOutput(id, line);
    }

    /* loaded from: RootTools-3.5.jar:com/stericson/RootTools/execution/Command$ExecutionMonitor.class */
    private class ExecutionMonitor extends Thread {
        private ExecutionMonitor() {
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            while (!Command.this.finished) {
                synchronized (Command.this) {
                    try {
                        Command.this.wait(Command.this.timeout);
                    } catch (InterruptedException e) {
                    }
                }
                if (!Command.this.finished) {
                    RootTools.log("Timeout Exception has occurred.");
                    Command.this.terminate("Timeout Exception");
                }
            }
        }
    }

    /* loaded from: RootTools-3.5.jar:com/stericson/RootTools/execution/Command$CommandHandler.class */
    private class CommandHandler extends Handler {
        public static final String ACTION = "action";
        public static final String TEXT = "text";
        public static final int COMMAND_OUTPUT = 1;
        public static final int COMMAND_COMPLETED = 2;
        public static final int COMMAND_TERMINATED = 3;

        private CommandHandler() {
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            int action = msg.getData().getInt("action");
            String text = msg.getData().getString("text");
            switch (action) {
                case 1:
                    Command.this.commandOutput(Command.this.id, text);
                    break;
                case 2:
                    Command.this.commandCompleted(Command.this.id, Command.this.exitCode);
                    break;
                case 3:
                    Command.this.commandTerminated(Command.this.id, text);
                    break;
            }
        }
    }
}
