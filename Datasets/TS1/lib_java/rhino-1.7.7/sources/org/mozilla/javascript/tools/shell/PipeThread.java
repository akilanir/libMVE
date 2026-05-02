package org.mozilla.javascript.tools.shell;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.mozilla.javascript.Context;

/* compiled from: Global.java */
/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/shell/PipeThread.class */
class PipeThread extends Thread {
    private boolean fromProcess;
    private InputStream from;
    private OutputStream to;

    PipeThread(boolean fromProcess, InputStream from, OutputStream to) {
        setDaemon(true);
        this.fromProcess = fromProcess;
        this.from = from;
        this.to = to;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        try {
            Global.pipe(this.fromProcess, this.from, this.to);
        } catch (IOException ex) {
            throw Context.throwAsScriptRuntimeEx(ex);
        }
    }
}
