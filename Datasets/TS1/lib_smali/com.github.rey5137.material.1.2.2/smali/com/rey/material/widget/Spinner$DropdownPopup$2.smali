.class Lcom/rey/material/widget/Spinner$DropdownPopup$2;
.super Ljava/lang/Object;
.source "Spinner.java"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/widget/Spinner$DropdownPopup;-><init>(Lcom/rey/material/widget/Spinner;Landroid/content/Context;Landroid/util/AttributeSet;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/rey/material/widget/Spinner$DropdownPopup;

.field final synthetic val$this$0:Lcom/rey/material/widget/Spinner;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/Spinner$DropdownPopup;Lcom/rey/material/widget/Spinner;)V
    .registers 3

    .prologue
    .line 1199
    iput-object p1, p0, Lcom/rey/material/widget/Spinner$DropdownPopup$2;->this$1:Lcom/rey/material/widget/Spinner$DropdownPopup;

    iput-object p2, p0, Lcom/rey/material/widget/Spinner$DropdownPopup$2;->val$this$0:Lcom/rey/material/widget/Spinner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss()V
    .registers 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 1205
    iget-object v1, p0, Lcom/rey/material/widget/Spinner$DropdownPopup$2;->this$1:Lcom/rey/material/widget/Spinner$DropdownPopup;

    iget-object v1, v1, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    invoke-virtual {v1}, Lcom/rey/material/widget/Spinner;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 1206
    .local v0, "vto":Landroid/view/ViewTreeObserver;
    if-eqz v0, :cond_19

    .line 1207
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-lt v1, v2, :cond_21

    .line 1208
    iget-object v1, p0, Lcom/rey/material/widget/Spinner$DropdownPopup$2;->this$1:Lcom/rey/material/widget/Spinner$DropdownPopup;

    # getter for: Lcom/rey/material/widget/Spinner$DropdownPopup;->layoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
    invoke-static {v1}, Lcom/rey/material/widget/Spinner$DropdownPopup;->access$700(Lcom/rey/material/widget/Spinner$DropdownPopup;)Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 1212
    :cond_19
    :goto_19
    iget-object v1, p0, Lcom/rey/material/widget/Spinner$DropdownPopup$2;->this$1:Lcom/rey/material/widget/Spinner$DropdownPopup;

    iget-object v1, v1, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    # invokes: Lcom/rey/material/widget/Spinner;->onPopupDismissed()V
    invoke-static {v1}, Lcom/rey/material/widget/Spinner;->access$800(Lcom/rey/material/widget/Spinner;)V

    .line 1213
    return-void

    .line 1210
    :cond_21
    iget-object v1, p0, Lcom/rey/material/widget/Spinner$DropdownPopup$2;->this$1:Lcom/rey/material/widget/Spinner$DropdownPopup;

    # getter for: Lcom/rey/material/widget/Spinner$DropdownPopup;->layoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
    invoke-static {v1}, Lcom/rey/material/widget/Spinner$DropdownPopup;->access$700(Lcom/rey/material/widget/Spinner$DropdownPopup;)Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_19
.end method
