package com.facebook.stetho;

import com.facebook.stetho.inspector.protocol.ChromeDevtoolsDomain;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/InspectorModulesProvider.class */
public interface InspectorModulesProvider {
    Iterable<ChromeDevtoolsDomain> get();
}
