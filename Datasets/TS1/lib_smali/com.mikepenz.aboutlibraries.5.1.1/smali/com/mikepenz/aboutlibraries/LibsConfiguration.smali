.class public Lcom/mikepenz/aboutlibraries/LibsConfiguration;
.super Ljava/lang/Object;
.source "LibsConfiguration.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListenerImpl;,
        Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;,
        Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;
    }
.end annotation


# static fields
.field private static SINGLETON:Lcom/mikepenz/aboutlibraries/LibsConfiguration;


# instance fields
.field private layoutAnimationController:Landroid/view/animation/LayoutAnimationController;

.field private listener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

.field private uiListener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 13
    const/4 v0, 0x0

    sput-object v0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->SINGLETON:Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->listener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    .line 44
    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->uiListener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;

    .line 59
    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->layoutAnimationController:Landroid/view/animation/LayoutAnimationController;

    .line 16
    return-void
.end method

.method public static getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;
    .registers 1

    .prologue
    .line 19
    sget-object v0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->SINGLETON:Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    if-nez v0, :cond_b

    .line 20
    new-instance v0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    invoke-direct {v0}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;-><init>()V

    sput-object v0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->SINGLETON:Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    .line 22
    :cond_b
    sget-object v0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->SINGLETON:Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    return-object v0
.end method


# virtual methods
.method public getLayoutAnimationController()Landroid/view/animation/LayoutAnimationController;
    .registers 2

    .prologue
    .line 62
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->layoutAnimationController:Landroid/view/animation/LayoutAnimationController;

    return-object v0
.end method

.method public getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;
    .registers 2

    .prologue
    .line 36
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->listener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    return-object v0
.end method

.method public getUiListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;
    .registers 2

    .prologue
    .line 47
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->uiListener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;

    return-object v0
.end method

.method public removeListener()V
    .registers 2

    .prologue
    .line 40
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->listener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    .line 41
    return-void
.end method

.method public removeUiListener()V
    .registers 2

    .prologue
    .line 55
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->uiListener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;

    .line 56
    return-void
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 74
    const/4 v0, 0x0

    sput-object v0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->SINGLETON:Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    .line 75
    return-void
.end method

.method public setLayoutAnimationController(Landroid/view/animation/LayoutAnimationController;)V
    .registers 2
    .param p1, "layoutAnimationController"    # Landroid/view/animation/LayoutAnimationController;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->layoutAnimationController:Landroid/view/animation/LayoutAnimationController;

    .line 67
    return-void
.end method

.method public setListener(Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;)V
    .registers 2
    .param p1, "libsListener"    # Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->listener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    .line 33
    return-void
.end method

.method public setUiListener(Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;)V
    .registers 2
    .param p1, "uiListener"    # Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->uiListener:Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;

    .line 52
    return-void
.end method
