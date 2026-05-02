package de.cketti.shareintentbuilder;

import android.content.Intent;
import android.net.Uri;
import android.support.annotation.NonNull;

/* loaded from: de.cketti.share.share-intent-builder.0.0.2.jar:de/cketti/shareintentbuilder/StreamBuilder.class */
public class StreamBuilder extends OptionalExtraBuilder<StreamBuilder> implements AcceptsExtraStream<StreamBuilder>, Buildable {
    StreamBuilder(ShareIntentBuilder builder) {
        super(builder);
    }

    @Override // de.cketti.shareintentbuilder.AcceptsExtraStream
    @NonNull
    public StreamBuilder stream(@NonNull Uri stream) {
        this.builder.stream(stream);
        return this;
    }

    @Override // de.cketti.shareintentbuilder.AcceptsExtraStream
    @NonNull
    public StreamBuilder stream(@NonNull Uri stream, @NonNull String type) {
        this.builder.stream(stream, type);
        return this;
    }

    @Override // de.cketti.shareintentbuilder.Buildable
    @NonNull
    public Intent build() {
        return this.builder.build();
    }

    @Override // de.cketti.shareintentbuilder.Buildable
    public void share() {
        this.builder.share();
    }

    @Override // de.cketti.shareintentbuilder.Buildable
    public void share(@NonNull CharSequence title) {
        this.builder.share(title);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // de.cketti.shareintentbuilder.OptionalExtraBuilder
    public StreamBuilder getSelf() {
        return this;
    }
}
