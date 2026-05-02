.class public Lde/cketti/shareintentbuilder/TextAndStreamBuilder;
.super Lde/cketti/shareintentbuilder/OptionalExtraBuilder;
.source "TextAndStreamBuilder.java"

# interfaces
.implements Lde/cketti/shareintentbuilder/AcceptsSingleExtraText;
.implements Lde/cketti/shareintentbuilder/AcceptsExtraStream;
.implements Lde/cketti/shareintentbuilder/Buildable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lde/cketti/shareintentbuilder/OptionalExtraBuilder",
        "<",
        "Lde/cketti/shareintentbuilder/TextAndStreamBuilder;",
        ">;",
        "Lde/cketti/shareintentbuilder/AcceptsSingleExtraText",
        "<",
        "Lde/cketti/shareintentbuilder/StreamBuilder;",
        ">;",
        "Lde/cketti/shareintentbuilder/AcceptsExtraStream",
        "<",
        "Lde/cketti/shareintentbuilder/TextAndStreamBuilder;",
        ">;",
        "Lde/cketti/shareintentbuilder/Buildable;"
    }
.end annotation


# direct methods
.method constructor <init>(Lde/cketti/shareintentbuilder/ShareIntentBuilder;)V
    .registers 2
    .param p1, "builder"    # Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;-><init>(Lde/cketti/shareintentbuilder/ShareIntentBuilder;)V

    .line 34
    return-void
.end method


# virtual methods
.method public build()Landroid/content/Intent;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 72
    iget-object v0, p0, Lde/cketti/shareintentbuilder/TextAndStreamBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->build()Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic getSelf()Lde/cketti/shareintentbuilder/OptionalExtraBuilder;
    .registers 2

    .prologue
    .line 29
    invoke-virtual {p0}, Lde/cketti/shareintentbuilder/TextAndStreamBuilder;->getSelf()Lde/cketti/shareintentbuilder/TextAndStreamBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected getSelf()Lde/cketti/shareintentbuilder/TextAndStreamBuilder;
    .registers 1

    .prologue
    .line 93
    return-object p0
.end method

.method public share()V
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lde/cketti/shareintentbuilder/TextAndStreamBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->share()V

    .line 81
    return-void
.end method

.method public share(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "title"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 88
    iget-object v0, p0, Lde/cketti/shareintentbuilder/TextAndStreamBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->share(Ljava/lang/CharSequence;)V

    .line 89
    return-void
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
    .line 29
    invoke-virtual {p0, p1}, Lde/cketti/shareintentbuilder/TextAndStreamBuilder;->stream(Landroid/net/Uri;)Lde/cketti/shareintentbuilder/TextAndStreamBuilder;

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
    .line 29
    invoke-virtual {p0, p1, p2}, Lde/cketti/shareintentbuilder/TextAndStreamBuilder;->stream(Landroid/net/Uri;Ljava/lang/String;)Lde/cketti/shareintentbuilder/TextAndStreamBuilder;

    move-result-object v0

    return-object v0
.end method

.method public stream(Landroid/net/Uri;)Lde/cketti/shareintentbuilder/TextAndStreamBuilder;
    .registers 3
    .param p1, "stream"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 42
    iget-object v0, p0, Lde/cketti/shareintentbuilder/TextAndStreamBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->stream(Landroid/net/Uri;)V

    .line 43
    return-object p0
.end method

.method public stream(Landroid/net/Uri;Ljava/lang/String;)Lde/cketti/shareintentbuilder/TextAndStreamBuilder;
    .registers 4
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
    .line 52
    iget-object v0, p0, Lde/cketti/shareintentbuilder/TextAndStreamBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0, p1, p2}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->stream(Landroid/net/Uri;Ljava/lang/String;)V

    .line 53
    return-object p0
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
    .line 62
    iget-object v0, p0, Lde/cketti/shareintentbuilder/TextAndStreamBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->text(Ljava/lang/String;)V

    .line 63
    new-instance v0, Lde/cketti/shareintentbuilder/StreamBuilder;

    iget-object v1, p0, Lde/cketti/shareintentbuilder/TextAndStreamBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

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
    .line 29
    invoke-virtual {p0, p1}, Lde/cketti/shareintentbuilder/TextAndStreamBuilder;->text(Ljava/lang/String;)Lde/cketti/shareintentbuilder/StreamBuilder;

    move-result-object v0

    return-object v0
.end method
