.class public Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
.super Ljava/lang/Object;
.source "ColorChooserDialog.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/afollestad/materialdialogs/color/ColorChooserDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected mAccentMode:Z

.field protected mAllowUserCustom:Z

.field protected mAllowUserCustomAlpha:Z

.field protected mBackBtn:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field protected mCancelBtn:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field protected mColorsSub:[[I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field protected mColorsTop:[I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field protected final transient mContext:Landroid/support/v7/app/AppCompatActivity;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field protected mCustomBtn:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field protected mDoneBtn:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field protected mDynamicButtonColor:Z

.field protected mPreselect:I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field protected mPresetsBtn:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field protected mSetPreselectionColor:Z

.field protected final mTitle:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field protected mTitleSub:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/support/v7/app/AppCompatActivity;I)V
    .registers 6
    .param p1    # Landroid/support/v7/app/AppCompatActivity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "title"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<ActivityType:",
            "Landroid/support/v7/app/AppCompatActivity;",
            ":",
            "Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorCallback;",
            ">(TActivityType;I)V"
        }
    .end annotation

    .prologue
    .local p1, "context":Landroid/support/v7/app/AppCompatActivity;, "TActivityType;"
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 581
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 560
    sget v0, Lcom/afollestad/materialdialogs/commons/R$string;->md_done_label:I

    iput v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mDoneBtn:I

    .line 562
    sget v0, Lcom/afollestad/materialdialogs/commons/R$string;->md_back_label:I

    iput v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mBackBtn:I

    .line 564
    sget v0, Lcom/afollestad/materialdialogs/commons/R$string;->md_cancel_label:I

    iput v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mCancelBtn:I

    .line 566
    sget v0, Lcom/afollestad/materialdialogs/commons/R$string;->md_custom_label:I

    iput v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mCustomBtn:I

    .line 568
    sget v0, Lcom/afollestad/materialdialogs/commons/R$string;->md_presets_label:I

    iput v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mPresetsBtn:I

    .line 575
    iput-boolean v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mAccentMode:Z

    .line 576
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mDynamicButtonColor:Z

    .line 577
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mAllowUserCustom:Z

    .line 578
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mAllowUserCustomAlpha:Z

    .line 579
    iput-boolean v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mSetPreselectionColor:Z

    .line 582
    iput-object p1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mContext:Landroid/support/v7/app/AppCompatActivity;

    .line 583
    iput p2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mTitle:I

    .line 584
    return-void
.end method


# virtual methods
.method public accentMode(Z)Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    .registers 2
    .param p1, "accentMode"    # Z
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 601
    iput-boolean p1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mAccentMode:Z

    .line 602
    return-object p0
.end method

.method public allowUserColorInput(Z)Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    .registers 2
    .param p1, "allow"    # Z
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 657
    iput-boolean p1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mAllowUserCustom:Z

    .line 658
    return-object p0
.end method

.method public allowUserColorInputAlpha(Z)Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    .registers 2
    .param p1, "allow"    # Z
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 663
    iput-boolean p1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mAllowUserCustomAlpha:Z

    .line 664
    return-object p0
.end method

.method public backButton(I)Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    .registers 2
    .param p1, "text"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 613
    iput p1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mBackBtn:I

    .line 614
    return-object p0
.end method

.method public build()Lcom/afollestad/materialdialogs/color/ColorChooserDialog;
    .registers 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 669
    new-instance v1, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    invoke-direct {v1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;-><init>()V

    .line 670
    .local v1, "dialog":Lcom/afollestad/materialdialogs/color/ColorChooserDialog;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 671
    .local v0, "args":Landroid/os/Bundle;
    const-string v2, "builder"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 672
    invoke-virtual {v1, v0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->setArguments(Landroid/os/Bundle;)V

    .line 673
    return-object v1
.end method

.method public cancelButton(I)Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    .registers 2
    .param p1, "text"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 619
    iput p1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mCancelBtn:I

    .line 620
    return-object p0
.end method

.method public customButton(I)Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    .registers 2
    .param p1, "text"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 625
    iput p1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mCustomBtn:I

    .line 626
    return-object p0
.end method

.method public customColors(I[[I)Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    .registers 4
    .param p1, "topLevel"    # I
        .annotation build Landroid/support/annotation/ArrayRes;
        .end annotation
    .end param
    .param p2, "subLevel"    # [[I
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 650
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mContext:Landroid/support/v7/app/AppCompatActivity;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getColorArray(Landroid/content/Context;I)[I

    move-result-object v0

    iput-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mColorsTop:[I

    .line 651
    iput-object p2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mColorsSub:[[I

    .line 652
    return-object p0
.end method

.method public customColors([I[[I)Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    .registers 3
    .param p1, "topLevel"    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "subLevel"    # [[I
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 643
    iput-object p1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mColorsTop:[I

    .line 644
    iput-object p2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mColorsSub:[[I

    .line 645
    return-object p0
.end method

.method public doneButton(I)Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    .registers 2
    .param p1, "text"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 607
    iput p1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mDoneBtn:I

    .line 608
    return-object p0
.end method

.method public dynamicButtonColor(Z)Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    .registers 2
    .param p1, "enabled"    # Z
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 637
    iput-boolean p1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mDynamicButtonColor:Z

    .line 638
    return-object p0
.end method

.method public preselect(I)Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    .registers 3
    .param p1, "preselect"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 594
    iput p1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mPreselect:I

    .line 595
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mSetPreselectionColor:Z

    .line 596
    return-object p0
.end method

.method public presetsButton(I)Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    .registers 2
    .param p1, "text"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 631
    iput p1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mPresetsBtn:I

    .line 632
    return-object p0
.end method

.method public show()Lcom/afollestad/materialdialogs/color/ColorChooserDialog;
    .registers 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 678
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->build()Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    move-result-object v0

    .line 679
    .local v0, "dialog":Lcom/afollestad/materialdialogs/color/ColorChooserDialog;
    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mContext:Landroid/support/v7/app/AppCompatActivity;

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->show(Landroid/support/v7/app/AppCompatActivity;)Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .line 680
    return-object v0
.end method

.method public titleSub(I)Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    .registers 2
    .param p1, "titleSub"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 588
    iput p1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mTitleSub:I

    .line 589
    return-object p0
.end method
