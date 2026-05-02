.class interface abstract Lde/cketti/shareintentbuilder/AcceptsExtraText;
.super Ljava/lang/Object;
.source "AcceptsExtraText.java"

# interfaces
.implements Lde/cketti/shareintentbuilder/AcceptsSingleExtraText;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lde/cketti/shareintentbuilder/AcceptsExtraText",
        "<TT;>;>",
        "Ljava/lang/Object;",
        "Lde/cketti/shareintentbuilder/AcceptsSingleExtraText",
        "<TT;>;"
    }
.end annotation


# virtual methods
.method public abstract text(Ljava/util/Collection;)Lde/cketti/shareintentbuilder/AcceptsExtraText;
    .param p1    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)TT;"
        }
    .end annotation
.end method
