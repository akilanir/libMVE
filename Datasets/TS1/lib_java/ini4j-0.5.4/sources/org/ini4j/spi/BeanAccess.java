package org.ini4j.spi;

/* loaded from: ini4j-0.5.4.jar:org/ini4j/spi/BeanAccess.class */
public interface BeanAccess {
    void propAdd(String str, String str2);

    String propDel(String str);

    String propGet(String str);

    String propGet(String str, int i);

    int propLength(String str);

    String propSet(String str, String str2);

    String propSet(String str, String str2, int i);
}
