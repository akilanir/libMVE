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
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lorg/ligi/axt/extensions/IntentAXT;->intent:Landroid/content/Intent;

    .line 12
    return-void
.end method


# virtual methods
.method public isIntentAvailable(Landroid/content/pm/PackageManager;)Z
    .registers 3
    .param p1, "pm"    # Landroid/content/pm/PackageManager;

    .prologue
    .line 24
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
    .line 28
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
    .line 41
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
    .line 45
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
