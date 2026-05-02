.class interface abstract Lde/cketti/shareintentbuilder/AcceptsExtraStream;
.super Ljava/lang/Object;
.source "AcceptsExtraStream.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lde/cketti/shareintentbuilder/AcceptsExtraStream",
        "<TT;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract stream(Landroid/net/Uri;)Lde/cketti/shareintentbuilder/AcceptsExtraStream;
    .param p1    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract stream(Landroid/net/Uri;Ljava/lang/String;)Lde/cketti/shareintentbuilder/AcceptsExtraStream;
    .param p1    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation
.end method
