.class Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;
.super Ljava/lang/Object;
.source "ColorChooserDialog.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


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
    .line 443
    iput-object p1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 11
    .param p1, "seekBar"    # Landroid/widget/SeekBar;
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 446
    if-eqz p3, :cond_51

    .line 447
    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # invokes: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    invoke-static {v1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$300(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    move-result-object v1

    iget-boolean v1, v1, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mAllowUserCustomAlpha:Z

    if-eqz v1, :cond_d6

    .line 448
    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekA:Landroid/widget/SeekBar;
    invoke-static {v1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1000(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v1

    iget-object v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekR:Landroid/widget/SeekBar;
    invoke-static {v2}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1200(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/SeekBar;->getProgress()I

    move-result v2

    iget-object v3, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekG:Landroid/widget/SeekBar;
    invoke-static {v3}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1300(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/SeekBar;->getProgress()I

    move-result v3

    iget-object v4, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekB:Landroid/widget/SeekBar;
    invoke-static {v4}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1400(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/SeekBar;->getProgress()I

    move-result v4

    invoke-static {v1, v2, v3, v4}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    .line 452
    .local v0, "color":I
    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorHex:Landroid/widget/EditText;
    invoke-static {v1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1700(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/EditText;

    move-result-object v1

    const-string v2, "%08X"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 460
    .end local v0    # "color":I
    :cond_51
    :goto_51
    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekAValue:Landroid/widget/TextView;
    invoke-static {v1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1100(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/TextView;

    move-result-object v1

    const-string v2, "%d"

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekA:Landroid/widget/SeekBar;
    invoke-static {v4}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1000(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/SeekBar;->getProgress()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 461
    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekRValue:Landroid/widget/TextView;
    invoke-static {v1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1800(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/TextView;

    move-result-object v1

    const-string v2, "%d"

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekR:Landroid/widget/SeekBar;
    invoke-static {v4}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1200(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/SeekBar;->getProgress()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 462
    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekGValue:Landroid/widget/TextView;
    invoke-static {v1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1900(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/TextView;

    move-result-object v1

    const-string v2, "%d"

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekG:Landroid/widget/SeekBar;
    invoke-static {v4}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1300(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/SeekBar;->getProgress()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 463
    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekBValue:Landroid/widget/TextView;
    invoke-static {v1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$2000(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/TextView;

    move-result-object v1

    const-string v2, "%d"

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekB:Landroid/widget/SeekBar;
    invoke-static {v4}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1400(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/SeekBar;->getProgress()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 464
    return-void

    .line 454
    :cond_d6
    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekR:Landroid/widget/SeekBar;
    invoke-static {v1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1200(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v1

    iget-object v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekG:Landroid/widget/SeekBar;
    invoke-static {v2}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1300(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/SeekBar;->getProgress()I

    move-result v2

    iget-object v3, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekB:Landroid/widget/SeekBar;
    invoke-static {v3}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1400(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/SeekBar;->getProgress()I

    move-result v3

    invoke-static {v1, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    .line 457
    .restart local v0    # "color":I
    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # getter for: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorHex:Landroid/widget/EditText;
    invoke-static {v1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$1700(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/EditText;

    move-result-object v1

    const-string v2, "%06X"

    new-array v3, v6, [Ljava/lang/Object;

    const v4, 0xffffff

    and-int/2addr v4, v0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_51
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 468
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 472
    return-void
.end method
