.class abstract Lcom/koushikdutta/ion/ContextReference$NormalContextReference;
.super Lcom/koushikdutta/ion/ContextReference;
.source "ContextReference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/ion/ContextReference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "NormalContextReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/content/Context;",
        ">",
        "Lcom/koushikdutta/ion/ContextReference",
        "<TT;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p0, "this":Lcom/koushikdutta/ion/ContextReference$NormalContextReference;, "Lcom/koushikdutta/ion/ContextReference$NormalContextReference<TT;>;"
    .local p1, "context":Landroid/content/Context;, "TT;"
    invoke-direct {p0, p1}, Lcom/koushikdutta/ion/ContextReference;-><init>(Ljava/lang/Object;)V

    .line 26
    return-void
.end method

.method static isAlive(Landroid/content/Context;)Ljava/lang/String;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    instance-of v0, p0, Landroid/app/Service;

    if-eqz v0, :cond_b

    .line 30
    check-cast p0, Landroid/app/Service;

    .end local p0    # "context":Landroid/content/Context;
    invoke-static {p0}, Lcom/koushikdutta/ion/ContextReference$ServiceContextReference;->isAlive(Landroid/app/Service;)Ljava/lang/String;

    move-result-object v0

    .line 33
    :goto_a
    return-object v0

    .line 31
    .restart local p0    # "context":Landroid/content/Context;
    :cond_b
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_16

    .line 32
    check-cast p0, Landroid/app/Activity;

    .end local p0    # "context":Landroid/content/Context;
    invoke-static {p0}, Lcom/koushikdutta/ion/ContextReference$ActivityContextReference;->isAlive(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 33
    .restart local p0    # "context":Landroid/content/Context;
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method


# virtual methods
.method public getContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 38
    .local p0, "this":Lcom/koushikdutta/ion/ContextReference$NormalContextReference;, "Lcom/koushikdutta/ion/ContextReference$NormalContextReference<TT;>;"
    invoke-virtual {p0}, Lcom/koushikdutta/ion/ContextReference$NormalContextReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    return-object v0
.end method
