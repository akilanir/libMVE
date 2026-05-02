.class Lcom/koushikdutta/ion/ContextReference$FragmentContextReference;
.super Lcom/koushikdutta/ion/ContextReference;
.source "ContextReference.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xd
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/ion/ContextReference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "FragmentContextReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/ion/ContextReference",
        "<",
        "Landroid/app/Fragment;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/app/Fragment;)V
    .registers 2
    .param p1, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 90
    invoke-direct {p0, p1}, Lcom/koushikdutta/ion/ContextReference;-><init>(Ljava/lang/Object;)V

    .line 91
    return-void
.end method


# virtual methods
.method public getContext()Landroid/content/Context;
    .registers 3

    .prologue
    .line 95
    invoke-virtual {p0}, Lcom/koushikdutta/ion/ContextReference$FragmentContextReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Fragment;

    .line 96
    .local v0, "fragment":Landroid/app/Fragment;
    if-nez v0, :cond_a

    .line 97
    const/4 v1, 0x0

    .line 98
    :goto_9
    return-object v1

    :cond_a
    invoke-virtual {v0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    goto :goto_9
.end method

.method public isAlive()Ljava/lang/String;
    .registers 4

    .prologue
    .line 103
    invoke-virtual {p0}, Lcom/koushikdutta/ion/ContextReference$FragmentContextReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Fragment;

    .line 104
    .local v0, "fragment":Landroid/app/Fragment;
    if-nez v0, :cond_b

    .line 105
    const-string v1, "Fragment reference null"

    .line 111
    :cond_a
    :goto_a
    return-object v1

    .line 106
    :cond_b
    invoke-virtual {v0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/koushikdutta/ion/ContextReference$ActivityContextReference;->isAlive(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v1

    .line 107
    .local v1, "ret":Ljava/lang/String;
    if-nez v1, :cond_a

    .line 109
    invoke-virtual {v0}, Landroid/app/Fragment;->isDetached()Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 110
    const-string v1, "Fragment detached"

    goto :goto_a

    .line 111
    :cond_1e
    const/4 v1, 0x0

    goto :goto_a
.end method
