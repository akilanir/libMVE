package org.mozilla.javascript;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ExternalArrayData.class */
public interface ExternalArrayData {
    Object getArrayElement(int i);

    void setArrayElement(int i, Object obj);

    int getArrayLength();
}
