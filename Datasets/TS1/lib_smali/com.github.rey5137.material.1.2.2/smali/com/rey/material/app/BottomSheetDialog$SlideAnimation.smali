.class Lcom/rey/material/app/BottomSheetDialog$SlideAnimation;
.super Landroid/view/animation/Animation;
.source "BottomSheetDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/BottomSheetDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SlideAnimation"
.end annotation


# instance fields
.field mEnd:I

.field mStart:I

.field final synthetic this$0:Lcom/rey/material/app/BottomSheetDialog;


# direct methods
.method public constructor <init>(Lcom/rey/material/app/BottomSheetDialog;II)V
    .registers 4
    .param p2, "start"    # I
    .param p3, "end"    # I

    .prologue
    .line 520
    iput-object p1, p0, Lcom/rey/material/app/BottomSheetDialog$SlideAnimation;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    .line 521
    iput p2, p0, Lcom/rey/material/app/BottomSheetDialog$SlideAnimation;->mStart:I

    .line 522
    iput p3, p0, Lcom/rey/material/app/BottomSheetDialog$SlideAnimation;->mEnd:I

    .line 523
    return-void
.end method


# virtual methods
.method protected applyTransformation(FLandroid/view/animation/Transformation;)V
    .registers 6
    .param p1, "interpolatedTime"    # F
    .param p2, "t"    # Landroid/view/animation/Transformation;

    .prologue
    .line 527
    iget v1, p0, Lcom/rey/material/app/BottomSheetDialog$SlideAnimation;->mEnd:I

    iget v2, p0, Lcom/rey/material/app/BottomSheetDialog$SlideAnimation;->mStart:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    mul-float/2addr v1, p1

    iget v2, p0, Lcom/rey/material/app/BottomSheetDialog$SlideAnimation;->mStart:I

    int-to-float v2, v2

    add-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 528
    .local v0, "top":I
    iget-object v1, p0, Lcom/rey/material/app/BottomSheetDialog$SlideAnimation;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mContainer:Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;
    invoke-static {v1}, Lcom/rey/material/app/BottomSheetDialog;->access$1300(Lcom/rey/material/app/BottomSheetDialog;)Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;

    move-result-object v1

    if-eqz v1, :cond_21

    .line 529
    iget-object v1, p0, Lcom/rey/material/app/BottomSheetDialog$SlideAnimation;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mContainer:Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;
    invoke-static {v1}, Lcom/rey/material/app/BottomSheetDialog;->access$1300(Lcom/rey/material/app/BottomSheetDialog;)Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->setChildTop(I)V

    .line 532
    :goto_20
    return-void

    .line 531
    :cond_21
    invoke-virtual {p0}, Lcom/rey/material/app/BottomSheetDialog$SlideAnimation;->cancel()V

    goto :goto_20
.end method
