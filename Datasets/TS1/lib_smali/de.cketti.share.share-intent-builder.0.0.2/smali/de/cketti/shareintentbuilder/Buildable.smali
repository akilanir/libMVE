.class interface abstract Lde/cketti/shareintentbuilder/Buildable;
.super Ljava/lang/Object;
.source "Buildable.java"


# virtual methods
.method public abstract build()Landroid/content/Intent;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract share()V
.end method

.method public abstract share(Ljava/lang/CharSequence;)V
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
