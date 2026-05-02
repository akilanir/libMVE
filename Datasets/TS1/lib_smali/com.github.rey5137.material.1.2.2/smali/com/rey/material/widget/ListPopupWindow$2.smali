.class Lcom/rey/material/widget/ListPopupWindow$2;
.super Lcom/rey/material/widget/ListPopupWindow$ForwardingListener;
.source "ListPopupWindow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/widget/ListPopupWindow;->createDragToOpenListener(Landroid/view/View;)Landroid/view/View$OnTouchListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/ListPopupWindow;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/ListPopupWindow;Landroid/view/View;)V
    .registers 3
    .param p2, "x0"    # Landroid/view/View;

    .prologue
    .line 1057
    iput-object p1, p0, Lcom/rey/material/widget/ListPopupWindow$2;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    invoke-direct {p0, p2}, Lcom/rey/material/widget/ListPopupWindow$ForwardingListener;-><init>(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public getPopup()Lcom/rey/material/widget/ListPopupWindow;
    .registers 2

    .prologue
    .line 1060
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow$2;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    return-object v0
.end method
