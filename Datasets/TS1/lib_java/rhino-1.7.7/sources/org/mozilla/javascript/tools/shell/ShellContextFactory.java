package org.mozilla.javascript.tools.shell;

import org.mozilla.javascript.Context;
import org.mozilla.javascript.ContextFactory;
import org.mozilla.javascript.ErrorReporter;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/shell/ShellContextFactory.class */
public class ShellContextFactory extends ContextFactory {
    private boolean strictMode;
    private boolean warningAsError;
    private int optimizationLevel;
    private boolean generatingDebug;
    private ErrorReporter errorReporter;
    private String characterEncoding;
    private int languageVersion = 180;
    private boolean allowReservedKeywords = true;

    @Override // org.mozilla.javascript.ContextFactory
    protected boolean hasFeature(Context cx, int featureIndex) {
        switch (featureIndex) {
            case 3:
                return this.allowReservedKeywords;
            case 4:
            case 5:
            case 6:
            case 7:
            default:
                return super.hasFeature(cx, featureIndex);
            case 8:
            case 9:
            case 11:
                return this.strictMode;
            case 10:
                return this.generatingDebug;
            case 12:
                return this.warningAsError;
        }
    }

    @Override // org.mozilla.javascript.ContextFactory
    protected void onContextCreated(Context cx) {
        cx.setLanguageVersion(this.languageVersion);
        cx.setOptimizationLevel(this.optimizationLevel);
        if (this.errorReporter != null) {
            cx.setErrorReporter(this.errorReporter);
        }
        cx.setGeneratingDebug(this.generatingDebug);
        super.onContextCreated(cx);
    }

    public void setStrictMode(boolean flag) {
        checkNotSealed();
        this.strictMode = flag;
    }

    public void setWarningAsError(boolean flag) {
        checkNotSealed();
        this.warningAsError = flag;
    }

    public void setLanguageVersion(int version) {
        Context.checkLanguageVersion(version);
        checkNotSealed();
        this.languageVersion = version;
    }

    public void setOptimizationLevel(int optimizationLevel) {
        Context.checkOptimizationLevel(optimizationLevel);
        checkNotSealed();
        this.optimizationLevel = optimizationLevel;
    }

    public void setErrorReporter(ErrorReporter errorReporter) {
        if (errorReporter == null) {
            throw new IllegalArgumentException();
        }
        this.errorReporter = errorReporter;
    }

    public void setGeneratingDebug(boolean generatingDebug) {
        this.generatingDebug = generatingDebug;
    }

    public String getCharacterEncoding() {
        return this.characterEncoding;
    }

    public void setCharacterEncoding(String characterEncoding) {
        this.characterEncoding = characterEncoding;
    }

    public void setAllowReservedKeywords(boolean allowReservedKeywords) {
        this.allowReservedKeywords = allowReservedKeywords;
    }
}
