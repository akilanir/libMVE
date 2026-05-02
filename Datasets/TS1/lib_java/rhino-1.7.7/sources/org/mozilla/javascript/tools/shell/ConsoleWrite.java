package org.mozilla.javascript.tools.shell;

/* compiled from: ConsoleTextArea.java */
/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/shell/ConsoleWrite.class */
class ConsoleWrite implements Runnable {
    private ConsoleTextArea textArea;
    private String str;

    public ConsoleWrite(ConsoleTextArea textArea, String str) {
        this.textArea = textArea;
        this.str = str;
    }

    @Override // java.lang.Runnable
    public void run() {
        this.textArea.write(this.str);
    }
}
