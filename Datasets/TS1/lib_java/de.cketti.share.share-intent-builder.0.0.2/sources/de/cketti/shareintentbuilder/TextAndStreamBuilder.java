package de.cketti.shareintentbuilder;

import android.content.Intent;
import android.net.Uri;
import android.support.annotation.NonNull;

/* loaded from: de.cketti.share.share-intent-builder.0.0.2.jar:de/cketti/shareintentbuilder/TextAndStreamBuilder.class */
public class TextAndStreamBuilder extends OptionalExtraBuilder<TextAndStreamBuilder> implements AcceptsSingleExtraText<StreamBuilder>, AcceptsExtraStream<TextAndStreamBuilder>, Buildable {
    TextAndStreamBuilder(ShareIntentBuilder builder) {
        super(builder);
    }

    @Override // de.cketti.shareintentbuilder.AcceptsExtraStream
    @NonNull
    public TextAndStreamBuilder stream(@NonNull Uri stream) {
        this.builder.stream(stream);
        return this;
    }

    @Override // de.cketti.shareintentbuilder.AcceptsExtraStream
    @NonNull
    public TextAndStreamBuilder stream(@NonNull Uri stream, @NonNull String type) {
        this.builder.stream(stream, type);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // de.cketti.shareintentbuilder.AcceptsSingleExtraText
    @NonNull
    public StreamBuilder text(@NonNull String text) {
        this.builder.text(text);
        return new StreamBuilder(this.builder);
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
    public TextAndStreamBuilder getSelf() {
        return this;
    }
}
