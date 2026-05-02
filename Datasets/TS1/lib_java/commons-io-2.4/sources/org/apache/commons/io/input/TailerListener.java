package org.apache.commons.io.input;

/* loaded from: commons-io-2.4.jar:org/apache/commons/io/input/TailerListener.class */
public interface TailerListener {
    void init(Tailer tailer);

    void fileNotFound();

    void fileRotated();

    void handle(String str);

    void handle(Exception exc);
}
