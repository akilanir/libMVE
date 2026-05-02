.class Lcom/devspark/appmsg/MsgManager$OutAnimationListener;
.super Ljava/lang/Object;
.source "MsgManager.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/devspark/appmsg/MsgManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OutAnimationListener"
.end annotation


# instance fields
.field private final appMsg:Lcom/devspark/appmsg/AppMsg;


# direct methods
.method private constructor <init>(Lcom/devspark/appmsg/AppMsg;)V
    .registers 2
    .param p1, "appMsg"    # Lcom/devspark/appmsg/AppMsg;

    .prologue
    .line 280
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 281
    iput-object p1, p0, Lcom/devspark/appmsg/MsgManager$OutAnimationListener;->appMsg:Lcom/devspark/appmsg/AppMsg;

    .line 282
    return-void
.end method

.method synthetic constructor <init>(Lcom/devspark/appmsg/AppMsg;Lcom/devspark/appmsg/MsgManager$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/devspark/appmsg/AppMsg;
    .param p2, "x1"    # Lcom/devspark/appmsg/MsgManager$1;

    .prologue
    .line 276
    invoke-direct {p0, p1}, Lcom/devspark/appmsg/MsgManager$OutAnimationListener;-><init>(Lcom/devspark/appmsg/AppMsg;)V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 5
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 291
    iget-object v2, p0, Lcom/devspark/appmsg/MsgManager$OutAnimationListener;->appMsg:Lcom/devspark/appmsg/AppMsg;

    invoke-virtual {v2}, Lcom/devspark/appmsg/AppMsg;->getView()Landroid/view/View;

    move-result-object v1

    .line 292
    .local v1, "view":Landroid/view/View;
    iget-object v2, p0, Lcom/devspark/appmsg/MsgManager$OutAnimationListener;->appMsg:Lcom/devspark/appmsg/AppMsg;

    invoke-virtual {v2}, Lcom/devspark/appmsg/AppMsg;->isFloating()Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 293
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 294
    .local v0, "parent":Landroid/view/ViewGroup;
    if-eqz v0, :cond_1e

    .line 295
    new-instance v2, Lcom/devspark/appmsg/MsgManager$OutAnimationListener$1;

    invoke-direct {v2, p0, v0, v1}, Lcom/devspark/appmsg/MsgManager$OutAnimationListener$1;-><init>(Lcom/devspark/appmsg/MsgManager$OutAnimationListener;Landroid/view/ViewGroup;Landroid/view/View;)V

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 305
    .end local v0    # "parent":Landroid/view/ViewGroup;
    :cond_1e
    :goto_1e
    return-void

    .line 303
    :cond_1f
    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1e
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 310
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 287
    return-void
.end method
