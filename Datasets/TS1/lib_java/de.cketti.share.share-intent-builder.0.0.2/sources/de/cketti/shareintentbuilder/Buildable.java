package de.cketti.shareintentbuilder;

import android.content.Intent;
import android.support.annotation.NonNull;

/* loaded from: de.cketti.share.share-intent-builder.0.0.2.jar:de/cketti/shareintentbuilder/Buildable.class */
interface Buildable {
    @NonNull
    Intent build();

    void share();

    void share(@NonNull CharSequence charSequence);
}
