.class Lcom/yalantis/ucrop/UCropActivity$8;
.super Ljava/lang/Object;
.source "UCropActivity.java"

# interfaces
.implements Lcom/yalantis/ucrop/callback/BitmapCropCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yalantis/ucrop/UCropActivity;->cropAndSaveImage()V
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
    .line 581
    iput-object p1, p0, Lcom/yalantis/ucrop/UCropActivity$8;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBitmapCropped()V
    .registers 4

    .prologue
    .line 584
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity$8;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    iget-object v1, p0, Lcom/yalantis/ucrop/UCropActivity$8;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    # getter for: Lcom/yalantis/ucrop/UCropActivity;->mOutputUri:Landroid/net/Uri;
    invoke-static {v1}, Lcom/yalantis/ucrop/UCropActivity;->access$1000(Lcom/yalantis/ucrop/UCropActivity;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/yalantis/ucrop/UCropActivity$8;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    # getter for: Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;
    invoke-static {v2}, Lcom/yalantis/ucrop/UCropActivity;->access$500(Lcom/yalantis/ucrop/UCropActivity;)Lcom/yalantis/ucrop/view/GestureCropImageView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/yalantis/ucrop/view/GestureCropImageView;->getTargetAspectRatio()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/yalantis/ucrop/UCropActivity;->setResultUri(Landroid/net/Uri;F)V

    .line 585
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity$8;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    invoke-virtual {v0}, Lcom/yalantis/ucrop/UCropActivity;->finish()V

    .line 586
    return-void
.end method

.method public onCropFailure(Ljava/lang/Exception;)V
    .registers 3
    .param p1, "bitmapCropException"    # Ljava/lang/Exception;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 590
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity$8;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    invoke-virtual {v0, p1}, Lcom/yalantis/ucrop/UCropActivity;->setResultException(Ljava/lang/Throwable;)V

    .line 591
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity$8;->this$0:Lcom/yalantis/ucrop/UCropActivity;

    invoke-virtual {v0}, Lcom/yalantis/ucrop/UCropActivity;->finish()V

    .line 592
    return-void
.end method
