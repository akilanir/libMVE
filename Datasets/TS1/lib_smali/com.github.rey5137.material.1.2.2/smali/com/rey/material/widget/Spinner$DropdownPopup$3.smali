.class Lcom/rey/material/widget/Spinner$DropdownPopup$3;
.super Ljava/lang/Object;
.source "Spinner.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/widget/Spinner$DropdownPopup;->setAdapter(Landroid/widget/ListAdapter;)V
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
    .line 1222
    iput-object p1, p0, Lcom/rey/material/widget/Spinner$DropdownPopup$3;->this$1:Lcom/rey/material/widget/Spinner$DropdownPopup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 9
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 1225
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropdownPopup$3;->this$1:Lcom/rey/material/widget/Spinner$DropdownPopup;

    iget-object v0, v0, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    iget-object v1, p0, Lcom/rey/material/widget/Spinner$DropdownPopup$3;->this$1:Lcom/rey/material/widget/Spinner$DropdownPopup;

    # getter for: Lcom/rey/material/widget/Spinner$DropdownPopup;->mAdapter:Lcom/rey/material/widget/Spinner$DropDownAdapter;
    invoke-static {v1}, Lcom/rey/material/widget/Spinner$DropdownPopup;->access$900(Lcom/rey/material/widget/Spinner$DropdownPopup;)Lcom/rey/material/widget/Spinner$DropDownAdapter;

    move-result-object v1

    invoke-virtual {v1, p3}, Lcom/rey/material/widget/Spinner$DropDownAdapter;->getItemId(I)J

    move-result-wide v1

    invoke-virtual {v0, p2, p3, v1, v2}, Lcom/rey/material/widget/Spinner;->performItemClick(Landroid/view/View;IJ)Z

    .line 1226
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropdownPopup$3;->this$1:Lcom/rey/material/widget/Spinner$DropdownPopup;

    invoke-virtual {v0}, Lcom/rey/material/widget/Spinner$DropdownPopup;->dismiss()V

    .line 1227
    return-void
.end method
