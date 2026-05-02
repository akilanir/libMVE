.class public abstract Lorg/androidannotations/api/builder/ServiceIntentBuilder;
.super Lorg/androidannotations/api/builder/IntentBuilder;
.source "ServiceIntentBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<I:",
        "Lorg/androidannotations/api/builder/ServiceIntentBuilder",
        "<TI;>;>",
        "Lorg/androidannotations/api/builder/IntentBuilder",
        "<TI;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 29
    .local p0, "this":Lorg/androidannotations/api/builder/ServiceIntentBuilder;, "Lorg/androidannotations/api/builder/ServiceIntentBuilder<TI;>;"
    invoke-direct {p0, p1, p2}, Lorg/androidannotations/api/builder/IntentBuilder;-><init>(Landroid/content/Context;Landroid/content/Intent;)V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/Class;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p0, "this":Lorg/androidannotations/api/builder/ServiceIntentBuilder;, "Lorg/androidannotations/api/builder/ServiceIntentBuilder<TI;>;"
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, p1, p2}, Lorg/androidannotations/api/builder/IntentBuilder;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 26
    return-void
.end method


# virtual methods
.method public start()Landroid/content/ComponentName;
    .registers 3

    .prologue
    .line 33
    .local p0, "this":Lorg/androidannotations/api/builder/ServiceIntentBuilder;, "Lorg/androidannotations/api/builder/ServiceIntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/ServiceIntentBuilder;->context:Landroid/content/Context;

    iget-object v1, p0, Lorg/androidannotations/api/builder/ServiceIntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    move-result-object v0

    return-object v0
.end method

.method public stop()Z
    .registers 3

    .prologue
    .line 37
    .local p0, "this":Lorg/androidannotations/api/builder/ServiceIntentBuilder;, "Lorg/androidannotations/api/builder/ServiceIntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/ServiceIntentBuilder;->context:Landroid/content/Context;

    iget-object v1, p0, Lorg/androidannotations/api/builder/ServiceIntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method
