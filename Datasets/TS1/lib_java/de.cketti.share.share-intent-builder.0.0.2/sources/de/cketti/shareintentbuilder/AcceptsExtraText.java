package de.cketti.shareintentbuilder;

import android.support.annotation.NonNull;
import de.cketti.shareintentbuilder.AcceptsExtraText;
import java.util.Collection;

/* loaded from: de.cketti.share.share-intent-builder.0.0.2.jar:de/cketti/shareintentbuilder/AcceptsExtraText.class */
interface AcceptsExtraText<T extends AcceptsExtraText<T>> extends AcceptsSingleExtraText<T> {
    @NonNull
    T text(@NonNull Collection<String> collection);
}
