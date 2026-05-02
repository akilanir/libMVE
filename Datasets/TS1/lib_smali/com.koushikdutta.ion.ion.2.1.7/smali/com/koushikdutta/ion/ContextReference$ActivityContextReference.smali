.class Lcom/koushikdutta/ion/ContextReference$ActivityContextReference;
.super Lcom/koushikdutta/ion/ContextReference$NormalContextReference;
.source "ContextReference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/ion/ContextReference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ActivityContextReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/ion/ContextReference$NormalContextReference",
        "<",
        "Landroid/app/Activity;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 70
    invoke-direct {p0, p1}, Lcom/koushikdutta/ion/ContextReference$NormalContextReference;-><init>(Landroid/content/Context;)V

    .line 71
    return-void
.end method

.method static isAlive(Landroid/app/Activity;)Ljava/lang/String;
    .registers 2
    .param p0, "a"    # Landroid/app/Activity;

    .prologue
    .line 74
    if-nez p0, :cond_5

    .line 75
    const-string v0, "Activity reference null"

    .line 78
    :goto_4
    return-object v0

    .line 76
    :cond_5
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 77
    const-string v0, "Activity finished"

    goto :goto_4

    .line 78
    :cond_e
    const/4 v0, 0x0

    goto :goto_4
.end method


# virtual methods
.method public isAlive()Ljava/lang/String;
    .registers 2

    .prologue
    .line 83
    invoke-virtual {p0}, Lcom/koushikdutta/ion/ContextReference$ActivityContextReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    invoke-static {v0}, Lcom/koushikdutta/ion/ContextReference$ActivityContextReference;->isAlive(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
