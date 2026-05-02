.class public Lde/cketti/shareintentbuilder/StreamBuilder;
.super Lde/cketti/shareintentbuilder/OptionalExtraBuilder;
.source "StreamBuilder.java"

# interfaces
.implements Lde/cketti/shareintentbuilder/AcceptsExtraStream;
.implements Lde/cketti/shareintentbuilder/Buildable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lde/cketti/shareintentbuilder/OptionalExtraBuilder",
        "<",
        "Lde/cketti/shareintentbuilder/StreamBuilder;",
        ">;",
        "Lde/cketti/shareintentbuilder/AcceptsExtraStream",
        "<",
        "Lde/cketti/shareintentbuilder/StreamBuilder;",
        ">;",
        "Lde/cketti/shareintentbuilder/Buildable;"
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
    return-void
.end method


# virtual methods
.method public build()Landroid/content/Intent;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 61
    iget-object v0, p0, Lde/cketti/shareintentbuilder/StreamBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->build()Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic getSelf()Lde/cketti/shareintentbuilder/OptionalExtraBuilder;
    .registers 2

    .prologue
    .line 28
    invoke-virtual {p0}, Lde/cketti/shareintentbuilder/StreamBuilder;->getSelf()Lde/cketti/shareintentbuilder/StreamBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected getSelf()Lde/cketti/shareintentbuilder/StreamBuilder;
    .registers 1

    .prologue
    .line 82
    return-object p0
.end method

.method public share()V
    .registers 2

    .prologue
    .line 69
    iget-object v0, p0, Lde/cketti/shareintentbuilder/StreamBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->share()V

    .line 70
    return-void
.end method

.method public share(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "title"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 77
    iget-object v0, p0, Lde/cketti/shareintentbuilder/StreamBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->share(Ljava/lang/CharSequence;)V

    .line 78
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
    .line 28
    invoke-virtual {p0, p1}, Lde/cketti/shareintentbuilder/StreamBuilder;->stream(Landroid/net/Uri;)Lde/cketti/shareintentbuilder/StreamBuilder;

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
    invoke-virtual {p0, p1, p2}, Lde/cketti/shareintentbuilder/StreamBuilder;->stream(Landroid/net/Uri;Ljava/lang/String;)Lde/cketti/shareintentbuilder/StreamBuilder;

    move-result-object v0

    return-object v0
.end method

.method public stream(Landroid/net/Uri;)Lde/cketti/shareintentbuilder/StreamBuilder;
    .registers 3
    .param p1, "stream"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 41
    iget-object v0, p0, Lde/cketti/shareintentbuilder/StreamBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->stream(Landroid/net/Uri;)V

    .line 42
    return-object p0
.end method

.method public stream(Landroid/net/Uri;Ljava/lang/String;)Lde/cketti/shareintentbuilder/StreamBuilder;
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
    .line 51
    iget-object v0, p0, Lde/cketti/shareintentbuilder/StreamBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0, p1, p2}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->stream(Landroid/net/Uri;Ljava/lang/String;)V

    .line 52
    return-object p0
.end method
