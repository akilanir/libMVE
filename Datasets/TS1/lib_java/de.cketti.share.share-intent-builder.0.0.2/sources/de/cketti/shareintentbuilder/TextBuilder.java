package de.cketti.shareintentbuilder;

import android.content.Intent;
import android.support.annotation.NonNull;
import java.util.Collection;

/* loaded from: de.cketti.share.share-intent-builder.0.0.2.jar:de/cketti/shareintentbuilder/TextBuilder.class */
public class TextBuilder extends OptionalExtraBuilder<TextBuilder> implements AcceptsExtraText<TextBuilder>, Buildable {
    @Override // de.cketti.shareintentbuilder.AcceptsExtraText
    @NonNull
    public /* bridge */ /* synthetic */ AcceptsExtraText text(@NonNull Collection collection) {
        return text((Collection<String>) collection);
    }

    TextBuilder(ShareIntentBuilder builder) {
        super(builder);
    }

    @Override // de.cketti.shareintentbuilder.AcceptsSingleExtraText
    @NonNull
    public TextBuilder text(@NonNull String text) {
        this.builder.text(text);
        return this;
    }

    @Override // de.cketti.shareintentbuilder.AcceptsExtraText
    @NonNull
    public TextBuilder text(@NonNull Collection<String> texts) {
        this.builder.text(texts);
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
    public TextBuilder getSelf() {
        return this;
    }
}
