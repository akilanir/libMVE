package org.ini4j.spi;

/* loaded from: ini4j-0.5.4.jar:org/ini4j/spi/OptionsHandler.class */
public interface OptionsHandler extends HandlerBase {
    void endOptions();

    @Override // org.ini4j.spi.HandlerBase
    void handleComment(String str);

    @Override // org.ini4j.spi.HandlerBase
    void handleOption(String str, String str2);

    void startOptions();
}
