package org.mozilla.javascript.ast;

import org.mozilla.javascript.ErrorReporter;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ast/IdeErrorReporter.class */
public interface IdeErrorReporter extends ErrorReporter {
    void warning(String str, String str2, int i, int i2);

    void error(String str, String str2, int i, int i2);
}
