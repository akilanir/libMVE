.class Lcom/rey/material/widget/Spinner$DropdownPopup$1;
.super Ljava/lang/Object;
.source "Spinner.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/Spinner$DropdownPopup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/rey/material/widget/Spinner$DropdownPopup;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/Spinner$DropdownPopup;)V
    .registers 2

    .prologue
    .line 1181
    iput-object p1, p0, Lcom/rey/material/widget/Spinner$DropdownPopup$1;->this$1:Lcom/rey/material/widget/Spinner$DropdownPopup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .registers 2

    .prologue
    .line 1184
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropdownPopup$1;->this$1:Lcom/rey/material/widget/Spinner$DropdownPopup;

    invoke-virtual {v0}, Lcom/rey/material/widget/Spinner$DropdownPopup;->computeContentWidth()V

    .line 1188
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropdownPopup$1;->this$1:Lcom/rey/material/widget/Spinner$DropdownPopup;

    # invokes: Lcom/rey/material/widget/ListPopupWindow;->show()V
    invoke-static {v0}, Lcom/rey/material/widget/Spinner$DropdownPopup;->access$601(Lcom/rey/material/widget/Spinner$DropdownPopup;)V

    .line 1189
    return-void
.end method
