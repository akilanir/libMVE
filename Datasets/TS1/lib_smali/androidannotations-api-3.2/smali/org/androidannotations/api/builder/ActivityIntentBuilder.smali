.class public abstract Lorg/androidannotations/api/builder/ActivityIntentBuilder;
.super Lorg/androidannotations/api/builder/IntentBuilder;
.source "ActivityIntentBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<I:",
        "Lorg/androidannotations/api/builder/ActivityIntentBuilder",
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
    .local p0, "this":Lorg/androidannotations/api/builder/ActivityIntentBuilder;, "Lorg/androidannotations/api/builder/ActivityIntentBuilder<TI;>;"
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
    .local p0, "this":Lorg/androidannotations/api/builder/ActivityIntentBuilder;, "Lorg/androidannotations/api/builder/ActivityIntentBuilder<TI;>;"
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, p1, p2}, Lorg/androidannotations/api/builder/IntentBuilder;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 26
    return-void
.end method


# virtual methods
.method public start()V
    .registers 3

    .prologue
    .line 33
    .local p0, "this":Lorg/androidannotations/api/builder/ActivityIntentBuilder;, "Lorg/androidannotations/api/builder/ActivityIntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/ActivityIntentBuilder;->context:Landroid/content/Context;

    iget-object v1, p0, Lorg/androidannotations/api/builder/ActivityIntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 34
    return-void
.end method

.method public startForResult(I)V
    .registers 4
    .param p1, "requestCode"    # I

    .prologue
    .line 37
    .local p0, "this":Lorg/androidannotations/api/builder/ActivityIntentBuilder;, "Lorg/androidannotations/api/builder/ActivityIntentBuilder<TI;>;"
    iget-object v0, p0, Lorg/androidannotations/api/builder/ActivityIntentBuilder;->context:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Activity;

    if-eqz v0, :cond_10

    .line 38
    iget-object v0, p0, Lorg/androidannotations/api/builder/ActivityIntentBuilder;->context:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    iget-object v1, p0, Lorg/androidannotations/api/builder/ActivityIntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, v1, p1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 42
    :goto_f
    return-void

    .line 40
    :cond_10
    iget-object v0, p0, Lorg/androidannotations/api/builder/ActivityIntentBuilder;->context:Landroid/content/Context;

    iget-object v1, p0, Lorg/androidannotations/api/builder/ActivityIntentBuilder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_f
.end method
