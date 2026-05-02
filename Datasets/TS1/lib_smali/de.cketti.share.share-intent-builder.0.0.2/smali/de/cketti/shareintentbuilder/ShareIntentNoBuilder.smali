.class public Lde/cketti/shareintentbuilder/ShareIntentNoBuilder;
.super Lde/cketti/shareintentbuilder/OptionalExtraBuilder;
.source "ShareIntentNoBuilder.java"

# interfaces
.implements Lde/cketti/shareintentbuilder/AcceptsExtraText;
.implements Lde/cketti/shareintentbuilder/AcceptsExtraStream;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lde/cketti/shareintentbuilder/OptionalExtraBuilder",
        "<",
        "Lde/cketti/shareintentbuilder/ShareIntentNoBuilder;",
        ">;",
        "Lde/cketti/shareintentbuilder/AcceptsExtraText",
        "<",
        "Lde/cketti/shareintentbuilder/TextBuilder;",
        ">;",
        "Lde/cketti/shareintentbuilder/AcceptsExtraStream",
        "<",
        "Lde/cketti/shareintentbuilder/StreamBuilder;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Lde/cketti/shareintentbuilder/ShareIntentBuilder;)V
    .registers 2
    .param p1, "builder"    # Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;-><init>(Lde/cketti/shareintentbuilder/ShareIntentBuilder;)V

    .line 35
    return-void
.end method


# virtual methods
.method protected bridge synthetic getSelf()Lde/cketti/shareintentbuilder/OptionalExtraBuilder;
    .registers 2

    .prologue
    .line 30
    invoke-virtual {p0}, Lde/cketti/shareintentbuilder/ShareIntentNoBuilder;->getSelf()Lde/cketti/shareintentbuilder/ShareIntentNoBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected getSelf()Lde/cketti/shareintentbuilder/ShareIntentNoBuilder;
    .registers 1

    .prologue
    .line 80
    return-object p0
.end method

.method public ignoreSpecification()Lde/cketti/shareintentbuilder/TextAndStreamNoBuilder;
    .registers 3

    .prologue
    .line 43
    new-instance v0, Lde/cketti/shareintentbuilder/TextAndStreamNoBuilder;

    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentNoBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-direct {v0, v1}, Lde/cketti/shareintentbuilder/TextAndStreamNoBuilder;-><init>(Lde/cketti/shareintentbuilder/ShareIntentBuilder;)V

    return-object v0
.end method

.method public bridge synthetic stream(Landroid/net/Uri;)Lde/cketti/shareintentbuilder/AcceptsExtraStream;
    .registers 3
    .param p1    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 30
    invoke-virtual {p0, p1}, Lde/cketti/shareintentbuilder/ShareIntentNoBuilder;->stream(Landroid/net/Uri;)Lde/cketti/shareintentbuilder/StreamBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic stream(Landroid/net/Uri;Ljava/lang/String;)Lde/cketti/shareintentbuilder/AcceptsExtraStream;
    .registers 4
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

    .prologue
    .line 30
    invoke-virtual {p0, p1, p2}, Lde/cketti/shareintentbuilder/ShareIntentNoBuilder;->stream(Landroid/net/Uri;Ljava/lang/String;)Lde/cketti/shareintentbuilder/StreamBuilder;

    move-result-object v0

    return-object v0
.end method

.method public stream(Landroid/net/Uri;)Lde/cketti/shareintentbuilder/StreamBuilder;
    .registers 4
    .param p1, "stream"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 67
    new-instance v0, Lde/cketti/shareintentbuilder/StreamBuilder;

    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentNoBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-direct {v0, v1}, Lde/cketti/shareintentbuilder/StreamBuilder;-><init>(Lde/cketti/shareintentbuilder/ShareIntentBuilder;)V

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/StreamBuilder;->stream(Landroid/net/Uri;)Lde/cketti/shareintentbuilder/StreamBuilder;

    move-result-object v0

    return-object v0
.end method

.method public stream(Landroid/net/Uri;Ljava/lang/String;)Lde/cketti/shareintentbuilder/StreamBuilder;
    .registers 5
    .param p1, "stream"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "type"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 75
    new-instance v0, Lde/cketti/shareintentbuilder/StreamBuilder;

    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentNoBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-direct {v0, v1}, Lde/cketti/shareintentbuilder/StreamBuilder;-><init>(Lde/cketti/shareintentbuilder/ShareIntentBuilder;)V

    invoke-virtual {v0, p1, p2}, Lde/cketti/shareintentbuilder/StreamBuilder;->stream(Landroid/net/Uri;Ljava/lang/String;)Lde/cketti/shareintentbuilder/StreamBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic text(Ljava/util/Collection;)Lde/cketti/shareintentbuilder/AcceptsExtraText;
    .registers 3
    .param p1    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 30
    invoke-virtual {p0, p1}, Lde/cketti/shareintentbuilder/ShareIntentNoBuilder;->text(Ljava/util/Collection;)Lde/cketti/shareintentbuilder/TextBuilder;

    move-result-object v0

    return-object v0
.end method

.method public text(Ljava/lang/String;)Lde/cketti/shareintentbuilder/TextBuilder;
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 51
    new-instance v0, Lde/cketti/shareintentbuilder/TextBuilder;

    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentNoBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-direct {v0, v1}, Lde/cketti/shareintentbuilder/TextBuilder;-><init>(Lde/cketti/shareintentbuilder/ShareIntentBuilder;)V

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/TextBuilder;->text(Ljava/lang/String;)Lde/cketti/shareintentbuilder/TextBuilder;

    move-result-object v0

    return-object v0
.end method

.method public text(Ljava/util/Collection;)Lde/cketti/shareintentbuilder/TextBuilder;
    .registers 4
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
            ">;)",
            "Lde/cketti/shareintentbuilder/TextBuilder;"
        }
    .end annotation

    .prologue
    .line 59
    .local p1, "texts":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    new-instance v0, Lde/cketti/shareintentbuilder/TextBuilder;

    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentNoBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-direct {v0, v1}, Lde/cketti/shareintentbuilder/TextBuilder;-><init>(Lde/cketti/shareintentbuilder/ShareIntentBuilder;)V

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/TextBuilder;->text(Ljava/util/Collection;)Lde/cketti/shareintentbuilder/TextBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic text(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 30
    invoke-virtual {p0, p1}, Lde/cketti/shareintentbuilder/ShareIntentNoBuilder;->text(Ljava/lang/String;)Lde/cketti/shareintentbuilder/TextBuilder;

    move-result-object v0

    return-object v0
.end method
