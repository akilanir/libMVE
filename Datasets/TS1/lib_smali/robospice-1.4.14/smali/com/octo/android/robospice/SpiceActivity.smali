.class public Lcom/octo/android/robospice/SpiceActivity;
.super Landroid/app/Activity;
.source "SpiceActivity.java"


# instance fields
.field private final spiceManager:Lcom/octo/android/robospice/SpiceManager;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 15
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 17
    new-instance v0, Lcom/octo/android/robospice/SpiceManager;

    const-class v1, Lcom/octo/android/robospice/SpiceService;

    invoke-direct {v0, v1}, Lcom/octo/android/robospice/SpiceManager;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/octo/android/robospice/SpiceActivity;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    return-void
.end method


# virtual methods
.method public getSpiceManager()Lcom/octo/android/robospice/SpiceManager;
    .registers 2

    .prologue
    .line 32
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceActivity;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    return-object v0
.end method

.method protected onStart()V
    .registers 2

    .prologue
    .line 21
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceActivity;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    invoke-virtual {v0, p0}, Lcom/octo/android/robospice/SpiceManager;->start(Landroid/content/Context;)V

    .line 22
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 23
    return-void
.end method

.method protected onStop()V
    .registers 2

    .prologue
    .line 27
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceActivity;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    invoke-virtual {v0}, Lcom/octo/android/robospice/SpiceManager;->shouldStop()V

    .line 28
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 29
    return-void
.end method
