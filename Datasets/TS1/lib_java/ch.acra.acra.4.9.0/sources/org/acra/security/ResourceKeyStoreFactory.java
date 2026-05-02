package org.acra.security;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.RawRes;
import java.io.InputStream;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/security/ResourceKeyStoreFactory.class */
final class ResourceKeyStoreFactory extends BaseKeyStoreFactory {

    @RawRes
    private final int rawRes;

    ResourceKeyStoreFactory(String certificateType, @RawRes int rawRes) {
        super(certificateType);
        this.rawRes = rawRes;
    }

    @Override // org.acra.security.BaseKeyStoreFactory
    public InputStream getInputStream(@NonNull Context context) {
        return context.getResources().openRawResource(this.rawRes);
    }
}
