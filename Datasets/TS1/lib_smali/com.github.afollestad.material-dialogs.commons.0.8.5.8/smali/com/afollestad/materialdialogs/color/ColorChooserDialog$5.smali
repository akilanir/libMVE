.class Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;
.super Ljava/lang/Object;
.source "ColorChooserDialog.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->toggleCustom(Lcom/afollestad/materialdialogs/MaterialDialog;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;


# direct methods
.method constructor <init>(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)V
    .registers 2

    .prologue
    .line 404
    iput-object p1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 2
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 440
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 407
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 16
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    const/4 v10, 0x0

    const/4 v9, -0x1

    .line 412
    :try_start_2
    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "#"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v6

    # setter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mSelectedCustomColor:I
    invoke-static {v5, v6}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$802(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;I)I
    :try_end_22
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_22} :catch_d5

    .line 416
    :goto_22
    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorIndicator:Landroid/view/View;
    invoke-static {v5}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$900(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/view/View;

    move-result-object v5

    iget-object v6, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mSelectedCustomColor:I
    invoke-static {v6}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$800(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 417
    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekA:Landroid/widget/SeekBar;
    invoke-static {v5}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1000(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/SeekBar;->getVisibility()I

    move-result v5

    if-nez v5, :cond_68

    .line 418
    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mSelectedCustomColor:I
    invoke-static {v5}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$800(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)I

    move-result v5

    invoke-static {v5}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    .line 419
    .local v0, "alpha":I
    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekA:Landroid/widget/SeekBar;
    invoke-static {v5}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1000(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;

    move-result-object v5

    invoke-virtual {v5, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 420
    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekAValue:Landroid/widget/TextView;
    invoke-static {v5}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1100(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/TextView;

    move-result-object v5

    const-string v6, "%d"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 422
    .end local v0    # "alpha":I
    :cond_68
    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekA:Landroid/widget/SeekBar;
    invoke-static {v5}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1000(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/SeekBar;->getVisibility()I

    move-result v5

    if-nez v5, :cond_87

    .line 423
    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mSelectedCustomColor:I
    invoke-static {v5}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$800(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)I

    move-result v5

    invoke-static {v5}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    .line 424
    .restart local v0    # "alpha":I
    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekA:Landroid/widget/SeekBar;
    invoke-static {v5}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1000(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;

    move-result-object v5

    invoke-virtual {v5, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 426
    .end local v0    # "alpha":I
    :cond_87
    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mSelectedCustomColor:I
    invoke-static {v5}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$800(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)I

    move-result v5

    invoke-static {v5}, Landroid/graphics/Color;->red(I)I

    move-result v4

    .line 427
    .local v4, "red":I
    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekR:Landroid/widget/SeekBar;
    invoke-static {v5}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1200(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 428
    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mSelectedCustomColor:I
    invoke-static {v5}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$800(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)I

    move-result v5

    invoke-static {v5}, Landroid/graphics/Color;->green(I)I

    move-result v3

    .line 429
    .local v3, "green":I
    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekG:Landroid/widget/SeekBar;
    invoke-static {v5}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1300(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 430
    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mSelectedCustomColor:I
    invoke-static {v5}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$800(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)I

    move-result v5

    invoke-static {v5}, Landroid/graphics/Color;->blue(I)I

    move-result v1

    .line 431
    .local v1, "blue":I
    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekB:Landroid/widget/SeekBar;
    invoke-static {v5}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1400(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;

    move-result-object v5

    invoke-virtual {v5, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 432
    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # invokes: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->isInSub(Z)V
    invoke-static {v5, v10}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$400(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;Z)V

    .line 433
    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # invokes: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->topIndex(I)V
    invoke-static {v5, v9}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1500(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;I)V

    .line 434
    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # invokes: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->subIndex(I)V
    invoke-static {v5, v9}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1600(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;I)V

    .line 435
    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # invokes: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->invalidateDynamicButtonColors()V
    invoke-static {v5}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$000(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)V

    .line 436
    return-void

    .line 413
    .end local v1    # "blue":I
    .end local v3    # "green":I
    .end local v4    # "red":I
    :catch_d5
    move-exception v2

    .line 414
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    iget-object v5, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    const/high16 v6, -0x1000000

    # setter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mSelectedCustomColor:I
    invoke-static {v5, v6}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$802(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;I)I

    goto/16 :goto_22
.end method
