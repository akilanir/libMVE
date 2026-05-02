package org.mozilla.javascript.tools.debugger;

import java.awt.Component;
import javax.swing.JOptionPane;

/* compiled from: SwingGui.java */
/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/MessageDialogWrapper.class */
class MessageDialogWrapper {
    MessageDialogWrapper() {
    }

    public static void showMessageDialog(Component parent, String msg, String title, int flags) {
        if (msg.length() > 60) {
            StringBuilder buf = new StringBuilder();
            int len = msg.length();
            int j = 0;
            int i = 0;
            while (i < len) {
                char c = msg.charAt(i);
                buf.append(c);
                if (Character.isWhitespace(c)) {
                    int k = i + 1;
                    while (k < len && !Character.isWhitespace(msg.charAt(k))) {
                        k++;
                    }
                    if (k < len) {
                        int nextWordLen = k - i;
                        if (j + nextWordLen > 60) {
                            buf.append('\n');
                            j = 0;
                        }
                    }
                }
                i++;
                j++;
            }
            msg = buf.toString();
        }
        JOptionPane.showMessageDialog(parent, msg, title, flags);
    }
}
