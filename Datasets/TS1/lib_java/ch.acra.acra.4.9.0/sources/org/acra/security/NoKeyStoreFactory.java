package org.acra.security;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.security.KeyStore;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/security/NoKeyStoreFactory.class */
public class NoKeyStoreFactory implements KeyStoreFactory {
    @Override // org.acra.security.KeyStoreFactory
    @Nullable
    public KeyStore create(@NonNull Context context) {
        return null;
    }
}
