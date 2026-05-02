package org.apache.commons.digester;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/StackAction.class */
public interface StackAction {
    Object onPush(Digester digester, String str, Object obj);

    Object onPop(Digester digester, String str, Object obj);
}
