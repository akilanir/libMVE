.class Lcom/koushikdutta/ion/ContextReference$ServiceContextReference;
.super Lcom/koushikdutta/ion/ContextReference$NormalContextReference;
.source "ContextReference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/ion/ContextReference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ServiceContextReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/ion/ContextReference$NormalContextReference",
        "<",
        "Landroid/app/Service;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/app/Service;)V
    .registers 2
    .param p1, "service"    # Landroid/app/Service;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/koushikdutta/ion/ContextReference$NormalContextReference;-><init>(Landroid/content/Context;)V

    .line 45
    return-void
.end method

.method static isAlive(Landroid/app/Service;)Ljava/lang/String;
    .registers 7
    .param p0, "candidate"    # Landroid/app/Service;

    .prologue
    .line 48
    if-nez p0, :cond_5

    .line 49
    const-string v4, "Service reference null"

    .line 59
    :goto_4
    return-object v4

    .line 50
    :cond_5
    const-string v4, "activity"

    invoke-virtual {p0, v4}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager;

    .line 51
    .local v1, "manager":Landroid/app/ActivityManager;
    const v4, 0x7fffffff

    invoke-virtual {v1, v4}, Landroid/app/ActivityManager;->getRunningServices(I)Ljava/util/List;

    move-result-object v3

    .line 52
    .local v3, "services":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningServiceInfo;>;"
    if-nez v3, :cond_19

    .line 53
    const-string v4, "Could not retrieve services from service manager"

    goto :goto_4

    .line 54
    :cond_19
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_1d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/ActivityManager$RunningServiceInfo;

    .line 55
    .local v2, "service":Landroid/app/ActivityManager$RunningServiceInfo;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v2, Landroid/app/ActivityManager$RunningServiceInfo;->service:Landroid/content/ComponentName;

    invoke-virtual {v5}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1d

    .line 56
    const/4 v4, 0x0

    goto :goto_4

    .line 59
    .end local v2    # "service":Landroid/app/ActivityManager$RunningServiceInfo;
    :cond_3f
    const-string v4, "Service stopped"

    goto :goto_4
.end method


# virtual methods
.method public isAlive()Ljava/lang/String;
    .registers 2

    .prologue
    .line 64
    invoke-virtual {p0}, Lcom/koushikdutta/ion/ContextReference$ServiceContextReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Service;

    invoke-static {v0}, Lcom/koushikdutta/ion/ContextReference$ServiceContextReference;->isAlive(Landroid/app/Service;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
