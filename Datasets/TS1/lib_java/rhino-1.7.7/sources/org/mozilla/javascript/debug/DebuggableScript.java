package org.mozilla.javascript.debug;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/debug/DebuggableScript.class */
public interface DebuggableScript {
    boolean isTopLevel();

    boolean isFunction();

    String getFunctionName();

    int getParamCount();

    int getParamAndVarCount();

    String getParamOrVarName(int i);

    String getSourceName();

    boolean isGeneratedScript();

    int[] getLineNumbers();

    int getFunctionCount();

    DebuggableScript getFunction(int i);

    DebuggableScript getParent();
}
