package org.mozilla.javascript.tools.debugger;

import org.mozilla.javascript.tools.debugger.Dim;

/* compiled from: SwingGui.java */
/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/RunProxy.class */
class RunProxy implements Runnable {
    static final int OPEN_FILE = 1;
    static final int LOAD_FILE = 2;
    static final int UPDATE_SOURCE_TEXT = 3;
    static final int ENTER_INTERRUPT = 4;
    private SwingGui debugGui;
    private int type;
    String fileName;
    String text;
    Dim.SourceInfo sourceInfo;
    Dim.StackFrame lastFrame;
    String threadTitle;
    String alertMessage;

    public RunProxy(SwingGui debugGui, int type) {
        this.debugGui = debugGui;
        this.type = type;
    }

    @Override // java.lang.Runnable
    public void run() {
        switch (this.type) {
            case 1:
                try {
                    this.debugGui.dim.compileScript(this.fileName, this.text);
                    return;
                } catch (RuntimeException ex) {
                    MessageDialogWrapper.showMessageDialog(this.debugGui, ex.getMessage(), "Error Compiling " + this.fileName, 0);
                    return;
                }
            case 2:
                try {
                    this.debugGui.dim.evalScript(this.fileName, this.text);
                    return;
                } catch (RuntimeException ex2) {
                    MessageDialogWrapper.showMessageDialog(this.debugGui, ex2.getMessage(), "Run error for " + this.fileName, 0);
                    return;
                }
            case 3:
                String fileName = this.sourceInfo.url();
                if (!this.debugGui.updateFileWindow(this.sourceInfo) && !fileName.equals("<stdin>")) {
                    this.debugGui.createFileWindow(this.sourceInfo, -1);
                    return;
                }
                return;
            case 4:
                this.debugGui.enterInterruptImpl(this.lastFrame, this.threadTitle, this.alertMessage);
                return;
            default:
                throw new IllegalArgumentException(String.valueOf(this.type));
        }
    }
}
