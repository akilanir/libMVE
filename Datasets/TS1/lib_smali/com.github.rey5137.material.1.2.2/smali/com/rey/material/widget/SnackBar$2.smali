.class Lcom/rey/material/widget/SnackBar$2;
.super Ljava/lang/Object;
.source "SnackBar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/widget/SnackBar;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/SnackBar;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/SnackBar;)V
    .registers 2

    .prologue
    .line 149
    iput-object p1, p0, Lcom/rey/material/widget/SnackBar$2;->this$0:Lcom/rey/material/widget/SnackBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 153
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$2;->this$0:Lcom/rey/material/widget/SnackBar;

    # getter for: Lcom/rey/material/widget/SnackBar;->mActionClickListener:Lcom/rey/material/widget/SnackBar$OnActionClickListener;
    invoke-static {v0}, Lcom/rey/material/widget/SnackBar;->access$000(Lcom/rey/material/widget/SnackBar;)Lcom/rey/material/widget/SnackBar$OnActionClickListener;

    move-result-object v0

    if-eqz v0, :cond_19

    .line 154
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$2;->this$0:Lcom/rey/material/widget/SnackBar;

    # getter for: Lcom/rey/material/widget/SnackBar;->mActionClickListener:Lcom/rey/material/widget/SnackBar$OnActionClickListener;
    invoke-static {v0}, Lcom/rey/material/widget/SnackBar;->access$000(Lcom/rey/material/widget/SnackBar;)Lcom/rey/material/widget/SnackBar$OnActionClickListener;

    move-result-object v0

    iget-object v1, p0, Lcom/rey/material/widget/SnackBar$2;->this$0:Lcom/rey/material/widget/SnackBar;

    iget-object v2, p0, Lcom/rey/material/widget/SnackBar$2;->this$0:Lcom/rey/material/widget/SnackBar;

    # getter for: Lcom/rey/material/widget/SnackBar;->mActionId:I
    invoke-static {v2}, Lcom/rey/material/widget/SnackBar;->access$100(Lcom/rey/material/widget/SnackBar;)I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/rey/material/widget/SnackBar$OnActionClickListener;->onActionClick(Lcom/rey/material/widget/SnackBar;I)V

    .line 156
    :cond_19
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$2;->this$0:Lcom/rey/material/widget/SnackBar;

    invoke-virtual {v0}, Lcom/rey/material/widget/SnackBar;->dismiss()V

    .line 157
    return-void
.end method
