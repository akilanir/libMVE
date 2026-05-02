.class public Lde/cketti/shareintentbuilder/TextBuilder;
.super Lde/cketti/shareintentbuilder/OptionalExtraBuilder;
.source "TextBuilder.java"

# interfaces
.implements Lde/cketti/shareintentbuilder/AcceptsExtraText;
.implements Lde/cketti/shareintentbuilder/Buildable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lde/cketti/shareintentbuilder/OptionalExtraBuilder",
        "<",
        "Lde/cketti/shareintentbuilder/TextBuilder;",
        ">;",
        "Lde/cketti/shareintentbuilder/AcceptsExtraText",
        "<",
        "Lde/cketti/shareintentbuilder/TextBuilder;",
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
    iget-object v0, p0, Lde/cketti/shareintentbuilder/TextBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->build()Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic getSelf()Lde/cketti/shareintentbuilder/OptionalExtraBuilder;
    .registers 2

    .prologue
    .line 29
    invoke-virtual {p0}, Lde/cketti/shareintentbuilder/TextBuilder;->getSelf()Lde/cketti/shareintentbuilder/TextBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected getSelf()Lde/cketti/shareintentbuilder/TextBuilder;
    .registers 1

    .prologue
    .line 82
    return-object p0
.end method

.method public share()V
    .registers 2

    .prologue
    .line 69
    iget-object v0, p0, Lde/cketti/shareintentbuilder/TextBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

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
    iget-object v0, p0, Lde/cketti/shareintentbuilder/TextBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->share(Ljava/lang/CharSequence;)V

    .line 78
    return-void
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
    .line 29
    invoke-virtual {p0, p1}, Lde/cketti/shareintentbuilder/TextBuilder;->text(Ljava/util/Collection;)Lde/cketti/shareintentbuilder/TextBuilder;

    move-result-object v0

    return-object v0
.end method

.method public text(Ljava/lang/String;)Lde/cketti/shareintentbuilder/TextBuilder;
    .registers 3
    .param p1, "text"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 41
    iget-object v0, p0, Lde/cketti/shareintentbuilder/TextBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->text(Ljava/lang/String;)V

    .line 42
    return-object p0
.end method

.method public text(Ljava/util/Collection;)Lde/cketti/shareintentbuilder/TextBuilder;
    .registers 3
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
    .line 51
    .local p1, "texts":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    iget-object v0, p0, Lde/cketti/shareintentbuilder/TextBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->text(Ljava/util/Collection;)V

    .line 52
    return-object p0
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
    invoke-virtual {p0, p1}, Lde/cketti/shareintentbuilder/TextBuilder;->text(Ljava/lang/String;)Lde/cketti/shareintentbuilder/TextBuilder;

    move-result-object v0

    return-object v0
.end method
