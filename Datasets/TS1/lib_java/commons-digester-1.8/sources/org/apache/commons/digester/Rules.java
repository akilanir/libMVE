package org.apache.commons.digester;

import java.util.List;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/Rules.class */
public interface Rules {
    Digester getDigester();

    void setDigester(Digester digester);

    String getNamespaceURI();

    void setNamespaceURI(String str);

    void add(String str, Rule rule);

    void clear();

    List match(String str);

    List match(String str, String str2);

    List rules();
}
