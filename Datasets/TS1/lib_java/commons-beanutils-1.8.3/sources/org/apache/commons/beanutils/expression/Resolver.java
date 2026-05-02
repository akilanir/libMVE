package org.apache.commons.beanutils.expression;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/expression/Resolver.class */
public interface Resolver {
    int getIndex(String str);

    String getKey(String str);

    String getProperty(String str);

    boolean hasNested(String str);

    boolean isIndexed(String str);

    boolean isMapped(String str);

    String next(String str);

    String remove(String str);
}
