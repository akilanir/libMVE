.class Lcom/rey/material/widget/EditText$LabelView;
.super Lcom/rey/material/widget/TextView;
.source "EditText.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/EditText;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LabelView"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/EditText;


# direct methods
.method public constructor <init>(Lcom/rey/material/widget/EditText;Landroid/content/Context;)V
    .registers 3
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 3671
    iput-object p1, p0, Lcom/rey/material/widget/EditText$LabelView;->this$0:Lcom/rey/material/widget/EditText;

    .line 3672
    invoke-direct {p0, p2}, Lcom/rey/material/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 3673
    return-void
.end method


# virtual methods
.method protected onCreateDrawableState(I)[I
    .registers 3
    .param p1, "extraSpace"    # I

    .prologue
    .line 3687
    iget-object v0, p0, Lcom/rey/material/widget/EditText$LabelView;->this$0:Lcom/rey/material/widget/EditText;

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getDrawableState()[I

    move-result-object v0

    return-object v0
.end method

.method public setTextAppearance(I)V
    .registers 2
    .param p1, "resId"    # I

    .prologue
    .line 3677
    invoke-static {p0, p1}, Lcom/rey/material/util/ViewUtil;->applyTextAppearance(Landroid/widget/TextView;I)V

    .line 3678
    return-void
.end method

.method public setTextAppearance(Landroid/content/Context;I)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resId"    # I

    .prologue
    .line 3682
    invoke-static {p0, p2}, Lcom/rey/material/util/ViewUtil;->applyTextAppearance(Landroid/widget/TextView;I)V

    .line 3683
    return-void
.end method
