package de.cketti.shareintentbuilder;

import android.net.Uri;
import android.support.annotation.NonNull;
import java.util.Collection;

/* loaded from: de.cketti.share.share-intent-builder.0.0.2.jar:de/cketti/shareintentbuilder/ShareIntentNoBuilder.class */
public class ShareIntentNoBuilder extends OptionalExtraBuilder<ShareIntentNoBuilder> implements AcceptsExtraText<TextBuilder>, AcceptsExtraStream<StreamBuilder> {
    @Override // de.cketti.shareintentbuilder.AcceptsExtraText
    @NonNull
    public /* bridge */ /* synthetic */ AcceptsExtraText text(@NonNull Collection collection) {
        return text((Collection<String>) collection);
    }

    ShareIntentNoBuilder(ShareIntentBuilder builder) {
        super(builder);
    }

    public TextAndStreamNoBuilder ignoreSpecification() {
        return new TextAndStreamNoBuilder(this.builder);
    }

    @Override // de.cketti.shareintentbuilder.AcceptsSingleExtraText
    @NonNull
    public TextBuilder text(@NonNull String text) {
        return new TextBuilder(this.builder).text(text);
    }

    @Override // de.cketti.shareintentbuilder.AcceptsExtraText
    @NonNull
    public TextBuilder text(@NonNull Collection<String> texts) {
        return new TextBuilder(this.builder).text(texts);
    }

    @Override // de.cketti.shareintentbuilder.AcceptsExtraStream
    @NonNull
    public StreamBuilder stream(@NonNull Uri stream) {
        return new StreamBuilder(this.builder).stream(stream);
    }

    @Override // de.cketti.shareintentbuilder.AcceptsExtraStream
    @NonNull
    public StreamBuilder stream(@NonNull Uri stream, @NonNull String type) {
        return new StreamBuilder(this.builder).stream(stream, type);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // de.cketti.shareintentbuilder.OptionalExtraBuilder
    public ShareIntentNoBuilder getSelf() {
        return this;
    }
}
