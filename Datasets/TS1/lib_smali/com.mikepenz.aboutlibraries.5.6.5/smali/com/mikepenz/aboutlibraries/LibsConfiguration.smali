.class public Lcom/mikepenz/aboutlibraries/LibsConfiguration;
.super Ljava/lang/Object;
.source "LibsConfiguration.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListenerImpl;,
        Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListenerImpl;,
        Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;,
        Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListener;,
        Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;
    }
.end annotation


# static fields
.field private static SINGLETON:Lcom/mikepenz/aboutlibraries/LibsConfiguration;


# instance fields
.field private mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

.field private mLayoutAnimationController:Landroid/view/animation/LayoutAnimationController;

.field private mLibTaskCallback:Lcom/mikepenz/aboutlibraries/LibTaskCallback;

.field private mListener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

.field private mRecyclerViewListener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListener;

.field private mUiListener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 16
    const/4 v0, 0x0

    sput-object v0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->SINGLETON:Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->mListener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    .line 46
    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->mUiListener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;

    .line 61
    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->mRecyclerViewListener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListener;

    .line 76
    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->mLayoutAnimationController:Landroid/view/animation/LayoutAnimationController;

    .line 19
    return-void
.end method

.method public static getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;
    .registers 1

    .prologue
    .line 22
    sget-object v0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->SINGLETON:Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    if-nez v0, :cond_b

    .line 23
    new-instance v0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    invoke-direct {v0}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;-><init>()V

    sput-object v0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->SINGLETON:Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    .line 25
    :cond_b
    sget-object v0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->SINGLETON:Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    return-object v0
.end method


# virtual methods
.method public getItemAnimator()Landroid/support/v7/widget/RecyclerView$ItemAnimator;
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    return-object v0
.end method

.method public getLayoutAnimationController()Landroid/view/animation/LayoutAnimationController;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->mLayoutAnimationController:Landroid/view/animation/LayoutAnimationController;

    return-object v0
.end method

.method public getLibTaskCallback()Lcom/mikepenz/aboutlibraries/LibTaskCallback;
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->mLibTaskCallback:Lcom/mikepenz/aboutlibraries/LibTaskCallback;

    return-object v0
.end method

.method public getLibsRecyclerViewListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListener;
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->mRecyclerViewListener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListener;

    return-object v0
.end method

.method public getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->mListener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    return-object v0
.end method

.method public getUiListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;
    .registers 2

    .prologue
    .line 49
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->mUiListener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;

    return-object v0
.end method

.method public removeLibsRecyclerViewListener()V
    .registers 2

    .prologue
    .line 72
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->mRecyclerViewListener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListener;

    .line 73
    return-void
.end method

.method public removeListener()V
    .registers 2

    .prologue
    .line 43
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->mListener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    .line 44
    return-void
.end method

.method public removeUiListener()V
    .registers 2

    .prologue
    .line 57
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->mUiListener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;

    .line 58
    return-void
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 111
    const/4 v0, 0x0

    sput-object v0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->SINGLETON:Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    .line 112
    return-void
.end method

.method public setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V
    .registers 2
    .param p1, "itemAnimator"    # Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    .line 94
    return-void
.end method

.method public setLayoutAnimationController(Landroid/view/animation/LayoutAnimationController;)V
    .registers 2
    .param p1, "layoutAnimationController"    # Landroid/view/animation/LayoutAnimationController;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->mLayoutAnimationController:Landroid/view/animation/LayoutAnimationController;

    .line 84
    return-void
.end method

.method public setLibTaskCallback(Lcom/mikepenz/aboutlibraries/LibTaskCallback;)V
    .registers 2
    .param p1, "mLibTaskCallback"    # Lcom/mikepenz/aboutlibraries/LibTaskCallback;

    .prologue
    .line 103
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->mLibTaskCallback:Lcom/mikepenz/aboutlibraries/LibTaskCallback;

    .line 104
    return-void
.end method

.method public setLibsRecyclerViewListener(Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListener;)V
    .registers 2
    .param p1, "recyclerViewListener"    # Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListener;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->mRecyclerViewListener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListener;

    .line 69
    return-void
.end method

.method public setListener(Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;)V
    .registers 2
    .param p1, "libsListener"    # Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->mListener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    .line 36
    return-void
.end method

.method public setUiListener(Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;)V
    .registers 2
    .param p1, "uiListener"    # Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->mUiListener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;

    .line 54
    return-void
.end method
