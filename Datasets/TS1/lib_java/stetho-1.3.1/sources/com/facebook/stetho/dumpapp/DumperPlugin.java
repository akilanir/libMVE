package com.facebook.stetho.dumpapp;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/dumpapp/DumperPlugin.class */
public interface DumperPlugin {
    String getName();

    void dump(DumperContext dumperContext) throws DumpException;
}
