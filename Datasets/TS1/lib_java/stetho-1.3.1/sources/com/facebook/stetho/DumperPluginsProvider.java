package com.facebook.stetho;

import com.facebook.stetho.dumpapp.DumperPlugin;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/DumperPluginsProvider.class */
public interface DumperPluginsProvider {
    Iterable<DumperPlugin> get();
}
