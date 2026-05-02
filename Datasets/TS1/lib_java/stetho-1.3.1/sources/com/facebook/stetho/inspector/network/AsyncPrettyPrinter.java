package com.facebook.stetho.inspector.network;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/network/AsyncPrettyPrinter.class */
public interface AsyncPrettyPrinter {
    void printTo(PrintWriter printWriter, InputStream inputStream) throws IOException;

    PrettyPrinterDisplayType getPrettifiedType();
}
