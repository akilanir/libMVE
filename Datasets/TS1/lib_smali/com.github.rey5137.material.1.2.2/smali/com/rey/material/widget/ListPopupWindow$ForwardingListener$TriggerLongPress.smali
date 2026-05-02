.class Lcom/rey/material/widget/ListPopupWindow$ForwardingListener$TriggerLongPress;
.super Ljava/lang/Object;
.source "ListPopupWindow.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/ListPopupWindow$ForwardingListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TriggerLongPress"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/ListPopupWindow$ForwardingListener;


# direct methods
.method private constructor <init>(Lcom/rey/material/widget/ListPopupWindow$ForwardingListener;)V
    .registers 2

    .prologue
    .line 1525
    iput-object p1, p0, Lcom/rey/material/widget/ListPopupWindow$ForwardingListener$TriggerLongPress;->this$0:Lcom/rey/material/widget/ListPopupWindow$ForwardingListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/rey/material/widget/ListPopupWindow$ForwardingListener;Lcom/rey/material/widget/ListPopupWindow$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/rey/material/widget/ListPopupWindow$ForwardingListener;
    .param p2, "x1"    # Lcom/rey/material/widget/ListPopupWindow$1;

    .prologue
    .line 1525
    invoke-direct {p0, p1}, Lcom/rey/material/widget/ListPopupWindow$ForwardingListener$TriggerLongPress;-><init>(Lcom/rey/material/widget/ListPopupWindow$ForwardingListener;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 1528
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow$ForwardingListener$TriggerLongPress;->this$0:Lcom/rey/material/widget/ListPopupWindow$ForwardingListener;

    # invokes: Lcom/rey/material/widget/ListPopupWindow$ForwardingListener;->onLongPress()V
    invoke-static {v0}, Lcom/rey/material/widget/ListPopupWindow$ForwardingListener;->access$1400(Lcom/rey/material/widget/ListPopupWindow$ForwardingListener;)V

    .line 1529
    return-void
.end method
