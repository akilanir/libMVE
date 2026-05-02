.class Lcom/koushikdutta/ion/ContextReference$SupportFragmentContextReference;
.super Lcom/koushikdutta/ion/ContextReference;
.source "ContextReference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/ion/ContextReference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SupportFragmentContextReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/ion/ContextReference",
        "<",
        "Landroid/support/v4/app/Fragment;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/support/v4/app/Fragment;)V
    .registers 2
    .param p1, "fragment"    # Landroid/support/v4/app/Fragment;

    .prologue
    .line 117
    invoke-direct {p0, p1}, Lcom/koushikdutta/ion/ContextReference;-><init>(Ljava/lang/Object;)V

    .line 118
    return-void
.end method


# virtual methods
.method public getContext()Landroid/content/Context;
    .registers 3

    .prologue
    .line 122
    invoke-virtual {p0}, Lcom/koushikdutta/ion/ContextReference$SupportFragmentContextReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/Fragment;

    .line 123
    .local v0, "fragment":Landroid/support/v4/app/Fragment;
    if-nez v0, :cond_a

    .line 124
    const/4 v1, 0x0

    .line 125
    :goto_9
    return-object v1

    :cond_a
    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    goto :goto_9
.end method

.method public isAlive()Ljava/lang/String;
    .registers 4

    .prologue
    .line 130
    invoke-virtual {p0}, Lcom/koushikdutta/ion/ContextReference$SupportFragmentContextReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/Fragment;

    .line 131
    .local v0, "fragment":Landroid/support/v4/app/Fragment;
    if-nez v0, :cond_b

    .line 132
    const-string v1, "Fragment reference null"

    .line 138
    :cond_a
    :goto_a
    return-object v1

    .line 133
    :cond_b
    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lcom/koushikdutta/ion/ContextReference$ActivityContextReference;->isAlive(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v1

    .line 134
    .local v1, "ret":Ljava/lang/String;
    if-nez v1, :cond_a

    .line 136
    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->isDetached()Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 137
    const-string v1, "Fragment detached"

    goto :goto_a

    .line 138
    :cond_1e
    const/4 v1, 0x0

    goto :goto_a
.end method
