package org.mozilla.javascript.tools;

import java.io.PrintStream;
import java.text.MessageFormat;
import java.util.Locale;
import java.util.MissingResourceException;
import java.util.ResourceBundle;
import org.mozilla.javascript.Context;
import org.mozilla.javascript.EcmaError;
import org.mozilla.javascript.ErrorReporter;
import org.mozilla.javascript.EvaluatorException;
import org.mozilla.javascript.JavaScriptException;
import org.mozilla.javascript.RhinoException;
import org.mozilla.javascript.SecurityUtilities;
import org.mozilla.javascript.WrappedException;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/ToolErrorReporter.class */
public class ToolErrorReporter implements ErrorReporter {
    private static final String messagePrefix = "js: ";
    private boolean hasReportedErrorFlag;
    private boolean reportWarnings;
    private PrintStream err;

    public ToolErrorReporter(boolean reportWarnings) {
        this(reportWarnings, System.err);
    }

    public ToolErrorReporter(boolean reportWarnings, PrintStream err) {
        this.reportWarnings = reportWarnings;
        this.err = err;
    }

    public static String getMessage(String messageId) {
        return getMessage(messageId, (Object[]) null);
    }

    public static String getMessage(String messageId, String argument) {
        Object[] args = {argument};
        return getMessage(messageId, args);
    }

    public static String getMessage(String messageId, Object arg1, Object arg2) {
        Object[] args = {arg1, arg2};
        return getMessage(messageId, args);
    }

    public static String getMessage(String messageId, Object[] args) {
        Context cx = Context.getCurrentContext();
        Locale locale = cx == null ? Locale.getDefault() : cx.getLocale();
        ResourceBundle rb = ResourceBundle.getBundle("org.mozilla.javascript.tools.resources.Messages", locale);
        try {
            String formatString = rb.getString(messageId);
            if (args == null) {
                return formatString;
            }
            MessageFormat formatter = new MessageFormat(formatString);
            return formatter.format(args);
        } catch (MissingResourceException e) {
            throw new RuntimeException("no message resource found for message property " + messageId);
        }
    }

    private static String getExceptionMessage(RhinoException ex) {
        String msg;
        if (ex instanceof JavaScriptException) {
            msg = getMessage("msg.uncaughtJSException", ex.details());
        } else if (ex instanceof EcmaError) {
            msg = getMessage("msg.uncaughtEcmaError", ex.details());
        } else if (ex instanceof EvaluatorException) {
            msg = ex.details();
        } else {
            msg = ex.toString();
        }
        return msg;
    }

    @Override // org.mozilla.javascript.ErrorReporter
    public void warning(String message, String sourceName, int line, String lineSource, int lineOffset) {
        if (!this.reportWarnings) {
            return;
        }
        reportErrorMessage(message, sourceName, line, lineSource, lineOffset, true);
    }

    @Override // org.mozilla.javascript.ErrorReporter
    public void error(String message, String sourceName, int line, String lineSource, int lineOffset) {
        this.hasReportedErrorFlag = true;
        reportErrorMessage(message, sourceName, line, lineSource, lineOffset, false);
    }

    @Override // org.mozilla.javascript.ErrorReporter
    public EvaluatorException runtimeError(String message, String sourceName, int line, String lineSource, int lineOffset) {
        return new EvaluatorException(message, sourceName, line, lineSource, lineOffset);
    }

    public boolean hasReportedError() {
        return this.hasReportedErrorFlag;
    }

    public boolean isReportingWarnings() {
        return this.reportWarnings;
    }

    public void setIsReportingWarnings(boolean reportWarnings) {
        this.reportWarnings = reportWarnings;
    }

    public static void reportException(ErrorReporter er, RhinoException ex) {
        if (er instanceof ToolErrorReporter) {
            ((ToolErrorReporter) er).reportException(ex);
        } else {
            String msg = getExceptionMessage(ex);
            er.error(msg, ex.sourceName(), ex.lineNumber(), ex.lineSource(), ex.columnNumber());
        }
    }

    public void reportException(RhinoException ex) {
        if (ex instanceof WrappedException) {
            WrappedException we = (WrappedException) ex;
            we.printStackTrace(this.err);
        } else {
            String lineSeparator = SecurityUtilities.getSystemProperty("line.separator");
            String msg = getExceptionMessage(ex) + lineSeparator + ex.getScriptStackTrace();
            reportErrorMessage(msg, ex.sourceName(), ex.lineNumber(), ex.lineSource(), ex.columnNumber(), false);
        }
    }

    private void reportErrorMessage(String message, String sourceName, int line, String lineSource, int lineOffset, boolean justWarning) {
        String message2;
        if (line > 0) {
            String lineStr = String.valueOf(line);
            if (sourceName != null) {
                Object[] args = {sourceName, lineStr, message};
                message2 = getMessage("msg.format3", args);
            } else {
                Object[] args2 = {lineStr, message};
                message2 = getMessage("msg.format2", args2);
            }
        } else {
            Object[] args3 = {message};
            message2 = getMessage("msg.format1", args3);
        }
        if (justWarning) {
            message2 = getMessage("msg.warning", message2);
        }
        this.err.println(messagePrefix + message2);
        if (null != lineSource) {
            this.err.println(messagePrefix + lineSource);
            this.err.println(messagePrefix + buildIndicator(lineOffset));
        }
    }

    private String buildIndicator(int offset) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < offset - 1; i++) {
            sb.append(".");
        }
        sb.append("^");
        return sb.toString();
    }
}
