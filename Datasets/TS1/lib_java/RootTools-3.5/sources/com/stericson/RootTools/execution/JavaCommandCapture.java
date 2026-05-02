package com.stericson.RootTools.execution;

import android.content.Context;
import com.stericson.RootTools.RootTools;

/* loaded from: RootTools-3.5.jar:com/stericson/RootTools/execution/JavaCommandCapture.class */
public class JavaCommandCapture extends Command {
    private StringBuilder sb;

    public JavaCommandCapture(int id, Context context, String... command) {
        super(id, true, context, command);
        this.sb = new StringBuilder();
    }

    public JavaCommandCapture(int id, boolean handlerEnabled, Context context, String... command) {
        super(id, handlerEnabled, true, context, command);
        this.sb = new StringBuilder();
    }

    public JavaCommandCapture(int id, int timeout, Context context, String... command) {
        super(id, timeout, true, context, command);
        this.sb = new StringBuilder();
    }

    @Override // com.stericson.RootTools.execution.Command
    public void commandOutput(int id, String line) {
        this.sb.append(line).append('\n');
        RootTools.log("Command", "ID: " + id + ", " + line);
    }

    @Override // com.stericson.RootTools.execution.Command
    public void commandTerminated(int id, String reason) {
    }

    @Override // com.stericson.RootTools.execution.Command
    public void commandCompleted(int id, int exitCode) {
    }

    public String toString() {
        return this.sb.toString();
    }
}
