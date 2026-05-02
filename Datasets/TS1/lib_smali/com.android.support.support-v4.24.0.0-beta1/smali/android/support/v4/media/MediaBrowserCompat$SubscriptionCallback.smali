.class public abstract Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;
.super Ljava/lang/Object;
.source "MediaBrowserCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/MediaBrowserCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "SubscriptionCallback"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback$StubApi24;,
        Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback$StubApi21;
    }
.end annotation


# instance fields
.field private final mSubscriptionCallbackObj:Ljava/lang/Object;

.field private final mToken:Landroid/os/IBinder;


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 502
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 503
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_18

    .line 504
    new-instance v0, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback$StubApi24;

    invoke-direct {v0, p0, v2}, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback$StubApi24;-><init>(Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;Landroid/support/v4/media/MediaBrowserCompat$1;)V

    .line 505
    invoke-static {v0}, Landroid/support/v4/media/MediaBrowserCompatApi24;->createSubscriptionCallback(Landroid/support/v4/media/MediaBrowserCompatApi24$SubscriptionCallback;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;->mSubscriptionCallbackObj:Ljava/lang/Object;

    .line 506
    iput-object v2, p0, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;->mToken:Landroid/os/IBinder;

    .line 515
    :goto_17
    return-void

    .line 507
    :cond_18
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_31

    .line 508
    new-instance v0, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback$StubApi21;

    invoke-direct {v0, p0, v2}, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback$StubApi21;-><init>(Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;Landroid/support/v4/media/MediaBrowserCompat$1;)V

    .line 509
    invoke-static {v0}, Landroid/support/v4/media/MediaBrowserCompatApi21;->createSubscriptionCallback(Landroid/support/v4/media/MediaBrowserCompatApi21$SubscriptionCallback;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;->mSubscriptionCallbackObj:Ljava/lang/Object;

    .line 510
    new-instance v0, Landroid/os/Binder;

    invoke-direct {v0}, Landroid/os/Binder;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;->mToken:Landroid/os/IBinder;

    goto :goto_17

    .line 512
    :cond_31
    iput-object v2, p0, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;->mSubscriptionCallbackObj:Ljava/lang/Object;

    .line 513
    new-instance v0, Landroid/os/Binder;

    invoke-direct {v0}, Landroid/os/Binder;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;->mToken:Landroid/os/IBinder;

    goto :goto_17
.end method

.method static synthetic access$1100(Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;)Landroid/os/IBinder;
    .registers 2
    .param p0, "x0"    # Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;

    .prologue
    .line 498
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;->mToken:Landroid/os/IBinder;

    return-object v0
.end method

.method static synthetic access$2000(Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;

    .prologue
    .line 498
    iget-object v0, p0, Landroid/support/v4/media/MediaBrowserCompat$SubscriptionCallback;->mSubscriptionCallbackObj:Ljava/lang/Object;

    return-object v0
.end method


# virtual methods
.method public onChildrenLoaded(Ljava/lang/String;Ljava/util/List;)V
    .registers 3
    .param p1, "parentId"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/support/v4/media/MediaBrowserCompat$MediaItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 524
    .local p2, "children":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/media/MediaBrowserCompat$MediaItem;>;"
    return-void
.end method

.method public onChildrenLoaded(Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;)V
    .registers 4
    .param p1, "parentId"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "options"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/support/v4/media/MediaBrowserCompat$MediaItem;",
            ">;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .prologue
    .line 537
    .local p2, "children":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/media/MediaBrowserCompat$MediaItem;>;"
    return-void
.end method

.method public onError(Ljava/lang/String;)V
    .registers 2
    .param p1, "parentId"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 549
    return-void
.end method

.method public onError(Ljava/lang/String;Landroid/os/Bundle;)V
    .registers 3
    .param p1, "parentId"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "options"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 564
    return-void
.end method
