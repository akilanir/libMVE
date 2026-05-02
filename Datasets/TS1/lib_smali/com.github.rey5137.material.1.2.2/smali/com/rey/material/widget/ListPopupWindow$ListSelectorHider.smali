.class Lcom/rey/material/widget/ListPopupWindow$ListSelectorHider;
.super Ljava/lang/Object;
.source "ListPopupWindow.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/ListPopupWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ListSelectorHider"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/ListPopupWindow;


# direct methods
.method private constructor <init>(Lcom/rey/material/widget/ListPopupWindow;)V
    .registers 2

    .prologue
    .line 1759
    iput-object p1, p0, Lcom/rey/material/widget/ListPopupWindow$ListSelectorHider;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/rey/material/widget/ListPopupWindow;Lcom/rey/material/widget/ListPopupWindow$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/rey/material/widget/ListPopupWindow;
    .param p2, "x1"    # Lcom/rey/material/widget/ListPopupWindow$1;

    .prologue
    .line 1759
    invoke-direct {p0, p1}, Lcom/rey/material/widget/ListPopupWindow$ListSelectorHider;-><init>(Lcom/rey/material/widget/ListPopupWindow;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 1761
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow$ListSelectorHider;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    invoke-virtual {v0}, Lcom/rey/material/widget/ListPopupWindow;->clearListSelection()V

    .line 1762
    return-void
.end method
