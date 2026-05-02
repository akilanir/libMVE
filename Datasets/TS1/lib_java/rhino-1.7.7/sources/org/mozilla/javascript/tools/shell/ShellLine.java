package org.mozilla.javascript.tools.shell;

import java.io.InputStream;
import java.nio.charset.Charset;
import org.mozilla.javascript.Scriptable;

@Deprecated
/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/shell/ShellLine.class */
public class ShellLine {
    @Deprecated
    public static InputStream getStream(Scriptable scope) {
        ShellConsole console = ShellConsole.getConsole(scope, Charset.defaultCharset());
        if (console != null) {
            return console.getIn();
        }
        return null;
    }
}
