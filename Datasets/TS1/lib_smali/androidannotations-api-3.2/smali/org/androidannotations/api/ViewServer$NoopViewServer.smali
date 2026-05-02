.class Lorg/androidannotations/api/ViewServer$NoopViewServer;
.super Lorg/androidannotations/api/ViewServer;
.source "ViewServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/androidannotations/api/ViewServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NoopViewServer"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    .line 517
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/androidannotations/api/ViewServer;-><init>(Lorg/androidannotations/api/ViewServer$1;)V

    .line 518
    return-void
.end method

.method synthetic constructor <init>(Lorg/androidannotations/api/ViewServer$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/androidannotations/api/ViewServer$1;

    .prologue
    .line 516
    invoke-direct {p0}, Lorg/androidannotations/api/ViewServer$NoopViewServer;-><init>()V

    return-void
.end method


# virtual methods
.method public addWindow(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 537
    return-void
.end method

.method public addWindow(Landroid/view/View;Ljava/lang/String;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 545
    return-void
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 532
    const/4 v0, 0x0

    return v0
.end method

.method public removeWindow(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 541
    return-void
.end method

.method public removeWindow(Landroid/view/View;)V
    .registers 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 549
    return-void
.end method

.method public run()V
    .registers 1

    .prologue
    .line 561
    return-void
.end method

.method public setFocusedWindow(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 553
    return-void
.end method

.method public setFocusedWindow(Landroid/view/View;)V
    .registers 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 557
    return-void
.end method

.method public start()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 522
    const/4 v0, 0x0

    return v0
.end method

.method public stop()Z
    .registers 2

    .prologue
    .line 527
    const/4 v0, 0x0

    return v0
.end method
