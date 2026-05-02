package com.stericson.RootTools.execution;

import com.stericson.RootTools.RootTools;

/* loaded from: RootTools-3.5.jar:com/stericson/RootTools/execution/CommandCapture.class */
public class CommandCapture extends Command {
    private StringBuilder sb;

    public CommandCapture(int id, String... command) {
        super(id, command);
        this.sb = new StringBuilder();
    }

    public CommandCapture(int id, boolean handlerEnabled, String... command) {
        super(id, handlerEnabled, command);
        this.sb = new StringBuilder();
    }

    public CommandCapture(int id, int timeout, String... command) {
        super(id, timeout, command);
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
    public void commandCompleted(int id, int exitcode) {
    }

    public String toString() {
        return this.sb.toString();
    }
}
