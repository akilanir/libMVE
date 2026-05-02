.class public Lorg/acra/security/NoKeyStoreFactory;
.super Ljava/lang/Object;
.source "NoKeyStoreFactory.java"

# interfaces
.implements Lorg/acra/security/KeyStoreFactory;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Landroid/content/Context;)Ljava/security/KeyStore;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 34
    const/4 v0, 0x0

    return-object v0
.end method
