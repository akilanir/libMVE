.class Lcom/devspark/appmsg/MsgManager$ReleaseCallbacksIcs;
.super Ljava/lang/Object;
.source "MsgManager.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;
.implements Lcom/devspark/appmsg/MsgManager$ReleaseCallbacks;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xe
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/devspark/appmsg/MsgManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ReleaseCallbacksIcs"
.end annotation


# instance fields
.field private mLastApp:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/app/Application;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 318
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 333
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 331
    invoke-static {p1}, Lcom/devspark/appmsg/MsgManager;->release(Landroid/app/Activity;)V

    .line 332
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 336
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 335
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 338
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 334
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 337
    return-void
.end method

.method public register(Landroid/app/Application;)V
    .registers 3
    .param p1, "app"    # Landroid/app/Application;

    .prologue
    .line 321
    iget-object v0, p0, Lcom/devspark/appmsg/MsgManager$ReleaseCallbacksIcs;->mLastApp:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/devspark/appmsg/MsgManager$ReleaseCallbacksIcs;->mLastApp:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_d

    .line 327
    :goto_c
    return-void

    .line 324
    :cond_d
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/devspark/appmsg/MsgManager$ReleaseCallbacksIcs;->mLastApp:Ljava/lang/ref/WeakReference;

    .line 326
    invoke-virtual {p1, p0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    goto :goto_c
.end method
