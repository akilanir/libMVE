.class final Lcom/koushikdutta/ion/ContextReference$1;
.super Lcom/koushikdutta/ion/ContextReference$NormalContextReference;
.source "ContextReference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/ContextReference;->fromContext(Landroid/content/Context;)Lcom/koushikdutta/ion/ContextReference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/ion/ContextReference$NormalContextReference",
        "<",
        "Landroid/content/Context;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "x0"    # Landroid/content/Context;

    .prologue
    .line 170
    invoke-direct {p0, p1}, Lcom/koushikdutta/ion/ContextReference$NormalContextReference;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public isAlive()Ljava/lang/String;
    .registers 3

    .prologue
    .line 173
    invoke-virtual {p0}, Lcom/koushikdutta/ion/ContextReference$1;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 174
    .local v0, "context":Landroid/content/Context;
    if-nez v0, :cond_b

    .line 175
    const-string v1, "Context reference null"

    .line 176
    :goto_a
    return-object v1

    :cond_b
    const/4 v1, 0x0

    goto :goto_a
.end method
