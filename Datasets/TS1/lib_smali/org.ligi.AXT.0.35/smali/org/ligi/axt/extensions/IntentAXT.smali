.class public Lorg/ligi/axt/extensions/IntentAXT;
.super Ljava/lang/Object;
.source "IntentAXT.java"


# instance fields
.field private final intent:Landroid/content/Intent;


# direct methods
.method public constructor <init>(Landroid/content/Intent;)V
    .registers 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lorg/ligi/axt/extensions/IntentAXT;->intent:Landroid/content/Intent;

    .line 16
    return-void
.end method


# virtual methods
.method public isIntentAvailable(Landroid/content/pm/PackageManager;)Z
    .registers 3
    .param p1, "pm"    # Landroid/content/pm/PackageManager;

    .prologue
    .line 28
    const/high16 v0, 0x10000

    invoke-virtual {p0, p1, v0}, Lorg/ligi/axt/extensions/IntentAXT;->isIntentAvailable(Landroid/content/pm/PackageManager;I)Z

    move-result v0

    return v0
.end method

.method public isIntentAvailable(Landroid/content/pm/PackageManager;I)Z
    .registers 4
    .param p1, "pm"    # Landroid/content/pm/PackageManager;
    .param p2, "flags"    # I

    .prologue
    .line 32
    iget-object v0, p0, Lorg/ligi/axt/extensions/IntentAXT;->intent:Landroid/content/Intent;

    invoke-virtual {p1, v0, p2}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isServiceAvailable(Landroid/content/pm/PackageManager;)Z
    .registers 4
    .param p1, "pm"    # Landroid/content/pm/PackageManager;

    .prologue
    .line 45
    iget-object v0, p0, Lorg/ligi/axt/extensions/IntentAXT;->intent:Landroid/content/Intent;

    const/high16 v1, 0x10000

    invoke-virtual {p1, v0, v1}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public isServiceAvailable(Landroid/content/pm/PackageManager;I)Z
    .registers 4
    .param p1, "pm"    # Landroid/content/pm/PackageManager;
    .param p2, "flags"    # I

    .prologue
    .line 49
    iget-object v0, p0, Lorg/ligi/axt/extensions/IntentAXT;->intent:Landroid/content/Intent;

    invoke-virtual {p1, v0, p2}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public makeExplicit(Landroid/content/Context;)Landroid/content/Intent;
    .registers 10
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v7, 0x0

    .line 53
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 54
    .local v3, "pm":Landroid/content/pm/PackageManager;
    iget-object v6, p0, Lorg/ligi/axt/extensions/IntentAXT;->intent:Landroid/content/Intent;

    invoke-virtual {v3, v6, v7}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v4

    .line 56
    .local v4, "resolveInfo":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    if-nez v4, :cond_f

    .line 57
    const/4 v6, 0x0

    .line 65
    :goto_e
    return-object v6

    .line 60
    :cond_f
    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/pm/ResolveInfo;

    .line 61
    .local v5, "serviceInfo":Landroid/content/pm/ResolveInfo;
    iget-object v6, v5, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v2, v6, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    .line 62
    .local v2, "packageName":Ljava/lang/String;
    iget-object v6, v5, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v0, v6, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    .line 63
    .local v0, "className":Ljava/lang/String;
    new-instance v1, Landroid/content/ComponentName;

    invoke-direct {v1, v2, v0}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .local v1, "component":Landroid/content/ComponentName;
    new-instance v6, Landroid/content/Intent;

    iget-object v7, p0, Lorg/ligi/axt/extensions/IntentAXT;->intent:Landroid/content/Intent;

    invoke-direct {v6, v7}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    invoke-virtual {v6, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v6

    goto :goto_e
.end method
