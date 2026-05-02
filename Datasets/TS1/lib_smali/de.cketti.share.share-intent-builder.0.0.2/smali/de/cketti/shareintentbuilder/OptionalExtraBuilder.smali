.class public abstract Lde/cketti/shareintentbuilder/OptionalExtraBuilder;
.super Ljava/lang/Object;
.source "OptionalExtraBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lde/cketti/shareintentbuilder/OptionalExtraBuilder",
        "<TT;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected final builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;


# direct methods
.method public constructor <init>(Lde/cketti/shareintentbuilder/ShareIntentBuilder;)V
    .registers 2
    .param p1, "builder"    # Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    .prologue
    .line 33
    .local p0, "this":Lde/cketti/shareintentbuilder/OptionalExtraBuilder;, "Lde/cketti/shareintentbuilder/OptionalExtraBuilder<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    .line 35
    return-void
.end method


# virtual methods
.method public bcc(Ljava/lang/String;)Lde/cketti/shareintentbuilder/OptionalExtraBuilder;
    .registers 3
    .param p1, "emailAddress"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 177
    .local p0, "this":Lde/cketti/shareintentbuilder/OptionalExtraBuilder;, "Lde/cketti/shareintentbuilder/OptionalExtraBuilder<TT;>;"
    iget-object v0, p0, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->bcc(Ljava/lang/String;)V

    .line 178
    invoke-virtual {p0}, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;->getSelf()Lde/cketti/shareintentbuilder/OptionalExtraBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bcc(Ljava/util/Collection;)Lde/cketti/shareintentbuilder/OptionalExtraBuilder;
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
            ">;)TT;"
        }
    .end annotation

    .prologue
    .line 195
    .local p0, "this":Lde/cketti/shareintentbuilder/OptionalExtraBuilder;, "Lde/cketti/shareintentbuilder/OptionalExtraBuilder<TT;>;"
    .local p1, "emailAddresses":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    iget-object v0, p0, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->bcc(Ljava/util/Collection;)V

    .line 196
    invoke-virtual {p0}, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;->getSelf()Lde/cketti/shareintentbuilder/OptionalExtraBuilder;

    move-result-object v0

    return-object v0
.end method

.method public cc(Ljava/lang/String;)Lde/cketti/shareintentbuilder/OptionalExtraBuilder;
    .registers 3
    .param p1, "emailAddress"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 141
    .local p0, "this":Lde/cketti/shareintentbuilder/OptionalExtraBuilder;, "Lde/cketti/shareintentbuilder/OptionalExtraBuilder<TT;>;"
    iget-object v0, p0, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->cc(Ljava/lang/String;)V

    .line 142
    invoke-virtual {p0}, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;->getSelf()Lde/cketti/shareintentbuilder/OptionalExtraBuilder;

    move-result-object v0

    return-object v0
.end method

.method public cc(Ljava/util/Collection;)Lde/cketti/shareintentbuilder/OptionalExtraBuilder;
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
            ">;)TT;"
        }
    .end annotation

    .prologue
    .line 159
    .local p0, "this":Lde/cketti/shareintentbuilder/OptionalExtraBuilder;, "Lde/cketti/shareintentbuilder/OptionalExtraBuilder<TT;>;"
    .local p1, "emailAddresses":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    iget-object v0, p0, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->cc(Ljava/util/Collection;)V

    .line 160
    invoke-virtual {p0}, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;->getSelf()Lde/cketti/shareintentbuilder/OptionalExtraBuilder;

    move-result-object v0

    return-object v0
.end method

.method public email(Ljava/lang/String;)Lde/cketti/shareintentbuilder/OptionalExtraBuilder;
    .registers 3
    .param p1, "emailAddress"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 69
    .local p0, "this":Lde/cketti/shareintentbuilder/OptionalExtraBuilder;, "Lde/cketti/shareintentbuilder/OptionalExtraBuilder<TT;>;"
    iget-object v0, p0, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->to(Ljava/lang/String;)V

    .line 70
    invoke-virtual {p0}, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;->getSelf()Lde/cketti/shareintentbuilder/OptionalExtraBuilder;

    move-result-object v0

    return-object v0
.end method

.method public email(Ljava/util/Collection;)Lde/cketti/shareintentbuilder/OptionalExtraBuilder;
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
            ">;)TT;"
        }
    .end annotation

    .prologue
    .line 87
    .local p0, "this":Lde/cketti/shareintentbuilder/OptionalExtraBuilder;, "Lde/cketti/shareintentbuilder/OptionalExtraBuilder<TT;>;"
    .local p1, "emailAddresses":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    iget-object v0, p0, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->to(Ljava/util/Collection;)V

    .line 88
    invoke-virtual {p0}, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;->getSelf()Lde/cketti/shareintentbuilder/OptionalExtraBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected abstract getSelf()Lde/cketti/shareintentbuilder/OptionalExtraBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public subject(Ljava/lang/String;)Lde/cketti/shareintentbuilder/OptionalExtraBuilder;
    .registers 3
    .param p1, "subject"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lde/cketti/shareintentbuilder/OptionalExtraBuilder;, "Lde/cketti/shareintentbuilder/OptionalExtraBuilder<TT;>;"
    iget-object v0, p0, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->subject(Ljava/lang/String;)V

    .line 52
    invoke-virtual {p0}, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;->getSelf()Lde/cketti/shareintentbuilder/OptionalExtraBuilder;

    move-result-object v0

    return-object v0
.end method

.method public to(Ljava/lang/String;)Lde/cketti/shareintentbuilder/OptionalExtraBuilder;
    .registers 3
    .param p1, "emailAddress"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 105
    .local p0, "this":Lde/cketti/shareintentbuilder/OptionalExtraBuilder;, "Lde/cketti/shareintentbuilder/OptionalExtraBuilder<TT;>;"
    iget-object v0, p0, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->to(Ljava/lang/String;)V

    .line 106
    invoke-virtual {p0}, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;->getSelf()Lde/cketti/shareintentbuilder/OptionalExtraBuilder;

    move-result-object v0

    return-object v0
.end method

.method public to(Ljava/util/Collection;)Lde/cketti/shareintentbuilder/OptionalExtraBuilder;
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
            ">;)TT;"
        }
    .end annotation

    .prologue
    .line 123
    .local p0, "this":Lde/cketti/shareintentbuilder/OptionalExtraBuilder;, "Lde/cketti/shareintentbuilder/OptionalExtraBuilder<TT;>;"
    .local p1, "emailAddresses":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    iget-object v0, p0, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;->builder:Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-virtual {v0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->to(Ljava/util/Collection;)V

    .line 124
    invoke-virtual {p0}, Lde/cketti/shareintentbuilder/OptionalExtraBuilder;->getSelf()Lde/cketti/shareintentbuilder/OptionalExtraBuilder;

    move-result-object v0

    return-object v0
.end method
