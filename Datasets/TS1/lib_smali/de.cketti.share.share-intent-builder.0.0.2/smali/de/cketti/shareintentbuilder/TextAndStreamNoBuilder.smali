.class public Lde/cketti/shareintentbuilder/TextAndStreamNoBuilder;
.super Lde/cketti/shareintentbuilder/OptionalExtraBuilder;
.source "TextAndStreamNoBuilder.java"

# interfaces
.implements Lde/cketti/shareintentbuilder/AcceptsSingleExtraText;
.implements Lde/cketti/shareintentbuilder/AcceptsExtraStream;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lde/cketti/shareintentbuilder/OptionalExtraBuilder",
        "<",
        "Lde/cketti/shareintentbuilder/TextAndStreamNoBuilder;",
        ">;",
        "Lde/cketti/shareintentbuilder/AcceptsSingleExtraText",
        "<",
        "Lde/cketti/shareintentbuilder/StreamBuilder;",
        ">;",
        "Lde/cketti/shareintentbuilder/AcceptsExtraStream",
        "<",
        "Lde/cketti/shareintentbuilder/TextAndStreamBuilder;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Lde/cketti/shareintentbuilder/ShareIntentBuilder;)V
    .registers 2
    .param p1, "builder"    # Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;-><init>(Lde/cketti/shareintentbuilder/ShareIntentBuilder;)V

    .line 33
    invoke-virtual {p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->ignoreSpecification()V

    .line 34
    return-void
.end method


# virtual methods
.method protected bridge synthetic getSelf()Lde/cketti/shareintentbuilder/OptionalExtraBuilder;
    .registers 2

    .prologue
    .line 28
    invoke-virtual {p0}, Lde/cketti/shareintentbuilder/TextAndStreamNoBuilder;->getSelf()Lde/cketti/shareintentbuilder/TextAndStreamNoBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected getSelf()Lde/cketti/shareintentbuilder/TextAndStreamNoBuilder;
    .registers 1

    .prologue
    .line 66
    return-object p0
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
    .line 28
    invoke-virtual {p0, p1}, Lde/cketti/shareintentbuilder/TextAndStreamNoBuilder;->stream(Landroid/net/Uri;)Lde/cketti/shareintentbuilder/TextAndStreamBuilder;

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
    .line 28
    invoke-virtual {p0, p1, p2}, Lde/cketti/shareintentbuilder/TextAndStreamNoBuilder;->stream(Landroid/net/Uri;Ljava/lang/String;)Lde/cketti/shareintentbuilder/TextAndStreamBuilder;

    move-result-object v0

    return-object v0
.end method

.method public stream(Landroid/net/Uri;)Lde/cketti/shareintentbuilder/TextAndStreamBuilder;
    .registers 4
    .param p1, "stream"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 42
    new-instance v0, Lde/cketti/shareintentbuilder/TextAndStreamBuilder;

    iget-object v1, p0, Lde/cketti/shareintentbuilder/TextAndStreamNoBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-direct {v0, v1}, Lde/cketti/shareintentbuilder/TextAndStreamBuilder;-><init>(Lde/cketti/shareintentbuilder/ShareIntentBuilder;)V

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/TextAndStreamBuilder;->stream(Landroid/net/Uri;)Lde/cketti/shareintentbuilder/TextAndStreamBuilder;

    move-result-object v0

    return-object v0
.end method

.method public stream(Landroid/net/Uri;Ljava/lang/String;)Lde/cketti/shareintentbuilder/TextAndStreamBuilder;
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
    .line 51
    new-instance v0, Lde/cketti/shareintentbuilder/TextAndStreamBuilder;

    iget-object v1, p0, Lde/cketti/shareintentbuilder/TextAndStreamNoBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-direct {v0, v1}, Lde/cketti/shareintentbuilder/TextAndStreamBuilder;-><init>(Lde/cketti/shareintentbuilder/ShareIntentBuilder;)V

    invoke-virtual {v0, p1, p2}, Lde/cketti/shareintentbuilder/TextAndStreamBuilder;->stream(Landroid/net/Uri;Ljava/lang/String;)Lde/cketti/shareintentbuilder/TextAndStreamBuilder;

    move-result-object v0

    return-object v0
.end method

.method public text(Ljava/lang/String;)Lde/cketti/shareintentbuilder/StreamBuilder;
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 60
    iget-object v0, p0, Lde/cketti/shareintentbuilder/TextAndStreamNoBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->text(Ljava/lang/String;)V

    .line 61
    new-instance v0, Lde/cketti/shareintentbuilder/StreamBuilder;

    iget-object v1, p0, Lde/cketti/shareintentbuilder/TextAndStreamNoBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-direct {v0, v1}, Lde/cketti/shareintentbuilder/StreamBuilder;-><init>(Lde/cketti/shareintentbuilder/ShareIntentBuilder;)V

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
    .line 28
    invoke-virtual {p0, p1}, Lde/cketti/shareintentbuilder/TextAndStreamNoBuilder;->text(Ljava/lang/String;)Lde/cketti/shareintentbuilder/StreamBuilder;

    move-result-object v0

    return-object v0
.end method
