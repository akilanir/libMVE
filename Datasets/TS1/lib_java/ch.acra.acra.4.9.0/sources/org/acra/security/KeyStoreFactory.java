package org.acra.security;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.security.KeyStore;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/security/KeyStoreFactory.class */
public interface KeyStoreFactory {
    @Nullable
    KeyStore create(@NonNull Context context);
}
