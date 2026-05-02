package org.ini4j.spi;

/* loaded from: ini4j-0.5.4.jar:org/ini4j/spi/HandlerBase.class */
interface HandlerBase {
    void handleComment(String str);

    void handleOption(String str, String str2);
}
