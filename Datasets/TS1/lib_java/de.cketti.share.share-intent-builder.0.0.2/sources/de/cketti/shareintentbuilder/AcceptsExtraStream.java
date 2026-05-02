package de.cketti.shareintentbuilder;

import android.net.Uri;
import android.support.annotation.NonNull;
import de.cketti.shareintentbuilder.AcceptsExtraStream;

/* loaded from: de.cketti.share.share-intent-builder.0.0.2.jar:de/cketti/shareintentbuilder/AcceptsExtraStream.class */
interface AcceptsExtraStream<T extends AcceptsExtraStream<T>> {
    @NonNull
    T stream(@NonNull Uri uri);

    @NonNull
    T stream(@NonNull Uri uri, @NonNull String str);
}
