package org.apache.commons.beanutils;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/DynaClass.class */
public interface DynaClass {
    String getName();

    DynaProperty getDynaProperty(String str);

    DynaProperty[] getDynaProperties();

    DynaBean newInstance() throws IllegalAccessException, InstantiationException;
}
