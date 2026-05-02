package de.cketti.shareintentbuilder;

import android.support.annotation.NonNull;
import de.cketti.shareintentbuilder.OptionalExtraBuilder;
import java.util.Collection;

/* loaded from: de.cketti.share.share-intent-builder.0.0.2.jar:de/cketti/shareintentbuilder/OptionalExtraBuilder.class */
public abstract class OptionalExtraBuilder<T extends OptionalExtraBuilder<T>> {
    protected final ShareIntentBuilder builder;

    protected abstract T getSelf();

    public OptionalExtraBuilder(ShareIntentBuilder builder) {
        this.builder = builder;
    }

    @NonNull
    public T subject(@NonNull String str) {
        this.builder.subject(str);
        return (T) getSelf();
    }

    @NonNull
    public T email(@NonNull String str) {
        this.builder.to(str);
        return (T) getSelf();
    }

    @NonNull
    public T email(@NonNull Collection<String> collection) {
        this.builder.to(collection);
        return (T) getSelf();
    }

    @NonNull
    public T to(@NonNull String str) {
        this.builder.to(str);
        return (T) getSelf();
    }

    @NonNull
    public T to(@NonNull Collection<String> collection) {
        this.builder.to(collection);
        return (T) getSelf();
    }

    @NonNull
    public T cc(@NonNull String str) {
        this.builder.cc(str);
        return (T) getSelf();
    }

    @NonNull
    public T cc(@NonNull Collection<String> collection) {
        this.builder.cc(collection);
        return (T) getSelf();
    }

    @NonNull
    public T bcc(@NonNull String str) {
        this.builder.bcc(str);
        return (T) getSelf();
    }

    @NonNull
    public T bcc(@NonNull Collection<String> collection) {
        this.builder.bcc(collection);
        return (T) getSelf();
    }
}
