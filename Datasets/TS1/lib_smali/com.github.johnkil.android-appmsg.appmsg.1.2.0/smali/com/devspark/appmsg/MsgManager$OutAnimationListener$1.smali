.class Lcom/devspark/appmsg/MsgManager$OutAnimationListener$1;
.super Ljava/lang/Object;
.source "MsgManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/devspark/appmsg/MsgManager$OutAnimationListener;->onAnimationEnd(Landroid/view/animation/Animation;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/devspark/appmsg/MsgManager$OutAnimationListener;

.field final synthetic val$parent:Landroid/view/ViewGroup;

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/devspark/appmsg/MsgManager$OutAnimationListener;Landroid/view/ViewGroup;Landroid/view/View;)V
    .registers 4

    .prologue
    .line 295
    iput-object p1, p0, Lcom/devspark/appmsg/MsgManager$OutAnimationListener$1;->this$0:Lcom/devspark/appmsg/MsgManager$OutAnimationListener;

    iput-object p2, p0, Lcom/devspark/appmsg/MsgManager$OutAnimationListener$1;->val$parent:Landroid/view/ViewGroup;

    iput-object p3, p0, Lcom/devspark/appmsg/MsgManager$OutAnimationListener$1;->val$view:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 298
    iget-object v0, p0, Lcom/devspark/appmsg/MsgManager$OutAnimationListener$1;->val$parent:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/devspark/appmsg/MsgManager$OutAnimationListener$1;->val$view:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 299
    return-void
.end method
