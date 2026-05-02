.class public abstract Lorg/androidannotations/api/builder/ActivityIntentBuilder;
.super Lorg/androidannotations/api/builder/IntentBuilder;
.source "ActivityIntentBuilder.java"

# interfaces
.implements Lorg/androidannotations/api/builder/ActivityStarter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<I:",
        "Lorg/androidannotations/api/builder/ActivityIntentBuilder",
        "<TI;>;>",
        "Lorg/androidannotations/api/builder/IntentBuilder",
        "<TI;>;",
        "Lorg/androidannotations/api/builder/ActivityStarter;"
    }
.end annotation


# instance fields
.field protected lastOptions:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 61
    .local p0, "this":Lorg/androidannotations/api/builder/ActivityIntentBuilder;, "Lorg/androidannotations/api/builder/ActivityIntentBuilder<TI;>;"
    invoke-direct {p0, p1, p2}, Lorg/androidannotations/api/builder/IntentBuilder;-><init>(Landroid/content/Context;Landroid/content/Intent;)V

    .line 62
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
    .line 46
    .local p0, "this":Lorg/androidannotations/api/builder/ActivityIntentBuilder;, "Lorg/androidannotations/api/builder/ActivityIntentBuilder<TI;>;"
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, p1, p2}, Lorg/androidannotations/api/builder/IntentBuilder;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 47
    return-void
.end method


# virtual methods
.method public final start()V
    .registers 2

    .prologue
    .line 66
    .local p0, "this":Lorg/androidannotations/api/builder/ActivityIntentBuilder;, "Lorg/androidannotations/api/builder/ActivityIntentBuilder<TI;>;"
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lorg/androidannotations/api/builder/ActivityIntentBuilder;->startForResult(I)V

    .line 67
    return-void
.end method

.method public abstract startForResult(I)V
.end method

.method public withOptions(Landroid/os/Bundle;)Lorg/androidannotations/api/builder/ActivityStarter;
    .registers 2
    .param p1, "options"    # Landroid/os/Bundle;

    .prologue
    .line 80
    .local p0, "this":Lorg/androidannotations/api/builder/ActivityIntentBuilder;, "Lorg/androidannotations/api/builder/ActivityIntentBuilder<TI;>;"
    iput-object p1, p0, Lorg/androidannotations/api/builder/ActivityIntentBuilder;->lastOptions:Landroid/os/Bundle;

    .line 81
    return-object p0
.end method
