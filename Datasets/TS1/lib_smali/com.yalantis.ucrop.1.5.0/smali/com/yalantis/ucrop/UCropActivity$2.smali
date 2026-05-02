.class Lcom/yalantis/ucrop/UCropActivity$2;
.super Ljava/lang/Object;
.source "UCropActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yalantis/ucrop/UCropActivity;->setupAspectRatioWidget()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yalantis/ucrop/UCropActivity;


# direct methods
.method constructor <init>(Lcom/yalantis/ucrop/UCropActivity;)V
    .registers 2

    .prologue
    .line 409
    iput-object p1, p0, Lcom/yalantis/ucrop/UCropActivity$2;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 8
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    .line 412
    iget-object v2, p0, Lcom/yalantis/ucrop/UCropActivity$2;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    # getter for: Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;
    invoke-static {v2}, Lcom/yalantis/ucrop/UCropActivity;->access$500(Lcom/yalantis/ucrop/UCropActivity;)Lcom/yalantis/ucrop/view/GestureCropImageView;

    move-result-object v4

    move-object v2, p1

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;

    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    move-result v5

    invoke-virtual {v2, v5}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->getAspectRatio(Z)F

    move-result v2

    invoke-virtual {v4, v2}, Lcom/yalantis/ucrop/view/GestureCropImageView;->setTargetAspectRatio(F)V

    .line 414
    iget-object v2, p0, Lcom/yalantis/ucrop/UCropActivity$2;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    # getter for: Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;
    invoke-static {v2}, Lcom/yalantis/ucrop/UCropActivity;->access$500(Lcom/yalantis/ucrop/UCropActivity;)Lcom/yalantis/ucrop/view/GestureCropImageView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yalantis/ucrop/view/GestureCropImageView;->setImageToWrapCropBounds()V

    .line 415
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    move-result v2

    if-nez v2, :cond_49

    .line 416
    iget-object v2, p0, Lcom/yalantis/ucrop/UCropActivity$2;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    # getter for: Lcom/yalantis/ucrop/UCropActivity;->mCropAspectRatioViews:Ljava/util/List;
    invoke-static {v2}, Lcom/yalantis/ucrop/UCropActivity;->access$600(Lcom/yalantis/ucrop/UCropActivity;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_34
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_49

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 417
    .local v0, "cropAspectRatioView":Landroid/view/ViewGroup;
    if-ne v0, p1, :cond_47

    const/4 v2, 0x1

    :goto_43
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setSelected(Z)V

    goto :goto_34

    :cond_47
    move v2, v3

    goto :goto_43

    .line 420
    .end local v0    # "cropAspectRatioView":Landroid/view/ViewGroup;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_49
    return-void
.end method
