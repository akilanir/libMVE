package de.cketti.shareintentbuilder;

import android.net.Uri;
import android.support.annotation.NonNull;

/* loaded from: de.cketti.share.share-intent-builder.0.0.2.jar:de/cketti/shareintentbuilder/TextAndStreamNoBuilder.class */
public class TextAndStreamNoBuilder extends OptionalExtraBuilder<TextAndStreamNoBuilder> implements AcceptsSingleExtraText<StreamBuilder>, AcceptsExtraStream<TextAndStreamBuilder> {
    TextAndStreamNoBuilder(ShareIntentBuilder builder) {
        super(builder);
        builder.ignoreSpecification();
    }

    @Override // de.cketti.shareintentbuilder.AcceptsExtraStream
    @NonNull
    public TextAndStreamBuilder stream(@NonNull Uri stream) {
        return new TextAndStreamBuilder(this.builder).stream(stream);
    }

    @Override // de.cketti.shareintentbuilder.AcceptsExtraStream
    @NonNull
    public TextAndStreamBuilder stream(@NonNull Uri stream, @NonNull String type) {
        return new TextAndStreamBuilder(this.builder).stream(stream, type);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // de.cketti.shareintentbuilder.AcceptsSingleExtraText
    @NonNull
    public StreamBuilder text(@NonNull String text) {
        this.builder.text(text);
        return new StreamBuilder(this.builder);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // de.cketti.shareintentbuilder.OptionalExtraBuilder
    public TextAndStreamNoBuilder getSelf() {
        return this;
    }
}
