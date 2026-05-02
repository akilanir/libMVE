.class public Lcom/afollestad/materialdialogs/color/ColorChooserDialog;
.super Landroid/support/v4/app/DialogFragment;
.source "ColorChooserDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;,
        Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;,
        Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorCallback;,
        Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorChooserTag;
    }
.end annotation


# static fields
.field public static final TAG_ACCENT:Ljava/lang/String; = "[MD_COLOR_CHOOSER]"

.field public static final TAG_CUSTOM:Ljava/lang/String; = "[MD_COLOR_CHOOSER]"

.field public static final TAG_PRIMARY:Ljava/lang/String; = "[MD_COLOR_CHOOSER]"


# instance fields
.field private mCallback:Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorCallback;

.field private mCircleSize:I

.field private mColorChooserCustomFrame:Landroid/view/View;

.field private mColorsSub:[[I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private mColorsTop:[I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private mCustomColorHex:Landroid/widget/EditText;

.field private mCustomColorIndicator:Landroid/view/View;

.field private mCustomColorRgbListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

.field private mCustomColorTextWatcher:Landroid/text/TextWatcher;

.field private mCustomSeekA:Landroid/widget/SeekBar;

.field private mCustomSeekAValue:Landroid/widget/TextView;

.field private mCustomSeekB:Landroid/widget/SeekBar;

.field private mCustomSeekBValue:Landroid/widget/TextView;

.field private mCustomSeekG:Landroid/widget/SeekBar;

.field private mCustomSeekGValue:Landroid/widget/TextView;

.field private mCustomSeekR:Landroid/widget/SeekBar;

.field private mCustomSeekRValue:Landroid/widget/TextView;

.field private mGrid:Landroid/widget/GridView;

.field private mSelectedCustomColor:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 81
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 82
    return-void
.end method

.method static synthetic access$000(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)V
    .registers 1
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->invalidateDynamicButtonColors()V

    return-void
.end method

.method static synthetic access$100(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;
    .param p1, "x1"    # Lcom/afollestad/materialdialogs/MaterialDialog;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->toggleCustom(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekA:Landroid/widget/SeekBar;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/TextView;
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekAValue:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekR:Landroid/widget/SeekBar;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekG:Landroid/widget/SeekBar;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/SeekBar;
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekB:Landroid/widget/SeekBar;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;I)V
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;
    .param p1, "x1"    # I

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->topIndex(I)V

    return-void
.end method

.method static synthetic access$1600(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;I)V
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;
    .param p1, "x1"    # I

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->subIndex(I)V

    return-void
.end method

.method static synthetic access$1700(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/EditText;
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorHex:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/TextView;
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekRValue:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/TextView;
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekGValue:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Z
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->isInSub()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2000(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/widget/TextView;
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekBValue:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)[[I
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsSub:[[I

    return-object v0
.end method

.method static synthetic access$2200(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)I
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->topIndex()I

    move-result v0

    return v0
.end method

.method static synthetic access$2300(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)[I
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsTop:[I

    return-object v0
.end method

.method static synthetic access$2400(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)I
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    iget v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCircleSize:I

    return v0
.end method

.method static synthetic access$2500(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)I
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->subIndex()I

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;Z)V
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;
    .param p1, "x1"    # Z

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->isInSub(Z)V

    return-void
.end method

.method static synthetic access$500(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)V
    .registers 1
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->invalidate()V

    return-void
.end method

.method static synthetic access$600(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)I
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getSelectedColor()I

    move-result v0

    return v0
.end method

.method static synthetic access$700(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorCallback;
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCallback:Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorCallback;

    return-object v0
.end method

.method static synthetic access$800(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)I
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    iget v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mSelectedCustomColor:I

    return v0
.end method

.method static synthetic access$802(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;I)I
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;
    .param p1, "x1"    # I

    .prologue
    .line 44
    iput p1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mSelectedCustomColor:I

    return p1
.end method

.method static synthetic access$900(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorIndicator:Landroid/view/View;

    return-object v0
.end method

.method private dismissIfNecessary(Landroid/support/v7/app/AppCompatActivity;Ljava/lang/String;)V
    .registers 5
    .param p1, "context"    # Landroid/support/v7/app/AppCompatActivity;
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 690
    invoke-virtual {p1}, Landroid/support/v7/app/AppCompatActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 691
    .local v0, "frag":Landroid/support/v4/app/Fragment;
    if-eqz v0, :cond_1f

    move-object v1, v0

    .line 692
    check-cast v1, Landroid/support/v4/app/DialogFragment;

    invoke-virtual {v1}, Landroid/support/v4/app/DialogFragment;->dismiss()V

    .line 693
    invoke-virtual {p1}, Landroid/support/v7/app/AppCompatActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 696
    :cond_1f
    return-void
.end method

.method private findSubIndexForColor(II)V
    .registers 6
    .param p1, "topIndex"    # I
    .param p2, "color"    # I

    .prologue
    .line 253
    iget-object v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsSub:[[I

    if-eqz v2, :cond_b

    iget-object v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsSub:[[I

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    if-ge v2, p1, :cond_c

    .line 262
    :cond_b
    :goto_b
    return-void

    .line 255
    :cond_c
    iget-object v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsSub:[[I

    aget-object v0, v2, p1

    .line 256
    .local v0, "subColors":[I
    const/4 v1, 0x0

    .local v1, "subIndex":I
    :goto_11
    array-length v2, v0

    if-ge v1, v2, :cond_b

    .line 257
    aget v2, v0, v1

    if-ne v2, p2, :cond_1c

    .line 258
    invoke-direct {p0, v1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->subIndex(I)V

    goto :goto_b

    .line 256
    :cond_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_11
.end method

.method public static findVisible(Landroid/support/v7/app/AppCompatActivity;Ljava/lang/String;)Lcom/afollestad/materialdialogs/color/ColorChooserDialog;
    .registers 4
    .param p0, "context"    # Landroid/support/v7/app/AppCompatActivity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "tag"    # Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 700
    invoke-virtual {p0}, Landroid/support/v7/app/AppCompatActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 701
    .local v0, "frag":Landroid/support/v4/app/Fragment;
    if-eqz v0, :cond_11

    instance-of v1, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    if-eqz v1, :cond_11

    .line 702
    check-cast v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    .line 703
    .end local v0    # "frag":Landroid/support/v4/app/Fragment;
    :goto_10
    return-object v0

    .restart local v0    # "frag":Landroid/support/v4/app/Fragment;
    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method private generateColors()V
    .registers 3

    .prologue
    .line 65
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    move-result-object v0

    .line 66
    .local v0, "builder":Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    iget-object v1, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mColorsTop:[I

    if-eqz v1, :cond_11

    .line 67
    iget-object v1, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mColorsTop:[I

    iput-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsTop:[I

    .line 68
    iget-object v1, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mColorsSub:[[I

    iput-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsSub:[[I

    .line 79
    :goto_10
    return-void

    .line 72
    :cond_11
    iget-boolean v1, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mAccentMode:Z

    if-eqz v1, :cond_1e

    .line 73
    sget-object v1, Lcom/afollestad/materialdialogs/color/ColorPalette;->ACCENT_COLORS:[I

    iput-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsTop:[I

    .line 74
    sget-object v1, Lcom/afollestad/materialdialogs/color/ColorPalette;->ACCENT_COLORS_SUB:[[I

    iput-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsSub:[[I

    goto :goto_10

    .line 76
    :cond_1e
    sget-object v1, Lcom/afollestad/materialdialogs/color/ColorPalette;->PRIMARY_COLORS:[I

    iput-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsTop:[I

    .line 77
    sget-object v1, Lcom/afollestad/materialdialogs/color/ColorPalette;->PRIMARY_COLORS_SUB:[[I

    iput-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsSub:[[I

    goto :goto_10
.end method

.method private getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    .registers 3

    .prologue
    .line 685
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_12

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "builder"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_14

    :cond_12
    const/4 v0, 0x0

    .line 686
    :goto_13
    return-object v0

    :cond_14
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "builder"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    goto :goto_13
.end method

.method private getSelectedColor()I
    .registers 5
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation

    .prologue
    const/4 v3, -0x1

    .line 231
    iget-object v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorChooserCustomFrame:Landroid/view/View;

    if-eqz v2, :cond_10

    iget-object v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorChooserCustomFrame:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_10

    .line 232
    iget v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mSelectedCustomColor:I

    .line 245
    :cond_f
    :goto_f
    return v0

    .line 234
    :cond_10
    const/4 v0, 0x0

    .line 235
    .local v0, "color":I
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->subIndex()I

    move-result v2

    if-le v2, v3, :cond_44

    .line 236
    iget-object v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsSub:[[I

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->topIndex()I

    move-result v3

    aget-object v2, v2, v3

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->subIndex()I

    move-result v3

    aget v0, v2, v3

    .line 239
    :cond_25
    :goto_25
    if-nez v0, :cond_f

    .line 240
    const/4 v1, 0x0

    .line 241
    .local v1, "fallback":I
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_39

    .line 242
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const v3, 0x1010435

    invoke-static {v2, v3}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v1

    .line 243
    :cond_39
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    sget v3, Lcom/afollestad/materialdialogs/commons/R$attr;->colorAccent:I

    invoke-static {v2, v3, v1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;II)I

    move-result v0

    goto :goto_f

    .line 237
    .end local v1    # "fallback":I
    :cond_44
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->topIndex()I

    move-result v2

    if-le v2, v3, :cond_25

    .line 238
    iget-object v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsTop:[I

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->topIndex()I

    move-result v3

    aget v0, v2, v3

    goto :goto_25
.end method

.method private invalidate()V
    .registers 5

    .prologue
    .line 501
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mGrid:Landroid/widget/GridView;

    invoke-virtual {v0}, Landroid/widget/GridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    if-nez v0, :cond_34

    .line 502
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mGrid:Landroid/widget/GridView;

    new-instance v1, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;

    invoke-direct {v1, p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter;-><init>(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 503
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mGrid:Landroid/widget/GridView;

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/afollestad/materialdialogs/commons/R$drawable;->md_transparent:I

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/support/v4/content/res/ResourcesCompat;->getDrawable(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 505
    :goto_22
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_33

    .line 506
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getTitle()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setTitle(I)V

    .line 507
    :cond_33
    return-void

    .line 504
    :cond_34
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mGrid:Landroid/widget/GridView;

    invoke-virtual {v0}, Landroid/widget/GridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    goto :goto_22
.end method

.method private invalidateDynamicButtonColors()V
    .registers 7

    .prologue
    const/16 v5, 0xf7

    .line 200
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v1

    check-cast v1, Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 201
    .local v1, "dialog":Lcom/afollestad/materialdialogs/MaterialDialog;
    if-nez v1, :cond_b

    .line 227
    :cond_a
    :goto_a
    return-void

    .line 202
    :cond_b
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    move-result-object v0

    .line 203
    .local v0, "builder":Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    iget-boolean v3, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mDynamicButtonColor:Z

    if-eqz v3, :cond_a

    .line 204
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getSelectedColor()I

    move-result v2

    .line 205
    .local v2, "selectedColor":I
    invoke-static {v2}, Landroid/graphics/Color;->alpha(I)I

    move-result v3

    const/16 v4, 0x40

    if-lt v3, v4, :cond_31

    invoke-static {v2}, Landroid/graphics/Color;->red(I)I

    move-result v3

    if-le v3, v5, :cond_37

    invoke-static {v2}, Landroid/graphics/Color;->green(I)I

    move-result v3

    if-le v3, v5, :cond_37

    invoke-static {v2}, Landroid/graphics/Color;->blue(I)I

    move-result v3

    if-le v3, v5, :cond_37

    .line 210
    :cond_31
    const-string v3, "#DEDEDE"

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    .line 213
    :cond_37
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    move-result-object v3

    iget-boolean v3, v3, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mDynamicButtonColor:Z

    if-eqz v3, :cond_5a

    .line 214
    sget-object v3, Lcom/afollestad/materialdialogs/DialogAction;->POSITIVE:Lcom/afollestad/materialdialogs/DialogAction;

    invoke-virtual {v1, v3}, Lcom/afollestad/materialdialogs/MaterialDialog;->getActionButton(Lcom/afollestad/materialdialogs/DialogAction;)Lcom/afollestad/materialdialogs/internal/MDButton;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/afollestad/materialdialogs/internal/MDButton;->setTextColor(I)V

    .line 215
    sget-object v3, Lcom/afollestad/materialdialogs/DialogAction;->NEGATIVE:Lcom/afollestad/materialdialogs/DialogAction;

    invoke-virtual {v1, v3}, Lcom/afollestad/materialdialogs/MaterialDialog;->getActionButton(Lcom/afollestad/materialdialogs/DialogAction;)Lcom/afollestad/materialdialogs/internal/MDButton;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/afollestad/materialdialogs/internal/MDButton;->setTextColor(I)V

    .line 216
    sget-object v3, Lcom/afollestad/materialdialogs/DialogAction;->NEUTRAL:Lcom/afollestad/materialdialogs/DialogAction;

    invoke-virtual {v1, v3}, Lcom/afollestad/materialdialogs/MaterialDialog;->getActionButton(Lcom/afollestad/materialdialogs/DialogAction;)Lcom/afollestad/materialdialogs/internal/MDButton;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/afollestad/materialdialogs/internal/MDButton;->setTextColor(I)V

    .line 219
    :cond_5a
    iget-object v3, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekR:Landroid/widget/SeekBar;

    if-eqz v3, :cond_a

    .line 220
    iget-object v3, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekA:Landroid/widget/SeekBar;

    invoke-virtual {v3}, Landroid/widget/SeekBar;->getVisibility()I

    move-result v3

    if-nez v3, :cond_6b

    .line 221
    iget-object v3, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekA:Landroid/widget/SeekBar;

    invoke-static {v3, v2}, Lcom/afollestad/materialdialogs/internal/MDTintHelper;->setTint(Landroid/widget/SeekBar;I)V

    .line 222
    :cond_6b
    iget-object v3, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekR:Landroid/widget/SeekBar;

    invoke-static {v3, v2}, Lcom/afollestad/materialdialogs/internal/MDTintHelper;->setTint(Landroid/widget/SeekBar;I)V

    .line 223
    iget-object v3, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekG:Landroid/widget/SeekBar;

    invoke-static {v3, v2}, Lcom/afollestad/materialdialogs/internal/MDTintHelper;->setTint(Landroid/widget/SeekBar;I)V

    .line 224
    iget-object v3, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekB:Landroid/widget/SeekBar;

    invoke-static {v3, v2}, Lcom/afollestad/materialdialogs/internal/MDTintHelper;->setTint(Landroid/widget/SeekBar;I)V

    goto :goto_a
.end method

.method private isInSub(Z)V
    .registers 4
    .param p1, "value"    # Z

    .prologue
    .line 126
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "in_sub"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 127
    return-void
.end method

.method private isInSub()Z
    .registers 4

    .prologue
    .line 122
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "in_sub"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private subIndex()I
    .registers 4

    .prologue
    const/4 v0, -0x1

    .line 140
    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsSub:[[I

    if-nez v1, :cond_6

    .line 141
    :goto_5
    return v0

    :cond_6
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "sub_index"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    goto :goto_5
.end method

.method private subIndex(I)V
    .registers 4
    .param p1, "value"    # I

    .prologue
    .line 145
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsSub:[[I

    if-nez v0, :cond_5

    .line 147
    :goto_4
    return-void

    .line 146
    :cond_5
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "sub_index"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_4
.end method

.method private toggleCustom(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 8
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;

    .prologue
    const/4 v3, 0x1

    const/4 v5, 0x0

    const/4 v2, 0x0

    .line 396
    if-nez p1, :cond_b

    .line 397
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    .end local p1    # "dialog":Lcom/afollestad/materialdialogs/MaterialDialog;
    check-cast p1, Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 398
    .restart local p1    # "dialog":Lcom/afollestad/materialdialogs/MaterialDialog;
    :cond_b
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mGrid:Landroid/widget/GridView;

    invoke-virtual {v0}, Landroid/widget/GridView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_a6

    .line 399
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    move-result-object v0

    iget v0, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mCustomBtn:I

    invoke-virtual {p1, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTitle(I)V

    .line 400
    sget-object v0, Lcom/afollestad/materialdialogs/DialogAction;->NEUTRAL:Lcom/afollestad/materialdialogs/DialogAction;

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    move-result-object v1

    iget v1, v1, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mPresetsBtn:I

    invoke-virtual {p1, v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setActionButton(Lcom/afollestad/materialdialogs/DialogAction;I)V

    .line 401
    sget-object v0, Lcom/afollestad/materialdialogs/DialogAction;->NEGATIVE:Lcom/afollestad/materialdialogs/DialogAction;

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    move-result-object v1

    iget v1, v1, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mCancelBtn:I

    invoke-virtual {p1, v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setActionButton(Lcom/afollestad/materialdialogs/DialogAction;I)V

    .line 402
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mGrid:Landroid/widget/GridView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setVisibility(I)V

    .line 403
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorChooserCustomFrame:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 404
    new-instance v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;

    invoke-direct {v0, p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$5;-><init>(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)V

    iput-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorTextWatcher:Landroid/text/TextWatcher;

    .line 442
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorHex:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorTextWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 443
    new-instance v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;

    invoke-direct {v0, p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$6;-><init>(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)V

    iput-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorRgbListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    .line 474
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekR:Landroid/widget/SeekBar;

    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorRgbListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 475
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekG:Landroid/widget/SeekBar;

    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorRgbListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 476
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekB:Landroid/widget/SeekBar;

    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorRgbListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 477
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekA:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getVisibility()I

    move-result v0

    if-nez v0, :cond_8c

    .line 478
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekA:Landroid/widget/SeekBar;

    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorRgbListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 479
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorHex:Landroid/widget/EditText;

    const-string v1, "%08X"

    new-array v2, v3, [Ljava/lang/Object;

    iget v3, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mSelectedCustomColor:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 498
    :goto_8b
    return-void

    .line 481
    :cond_8c
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorHex:Landroid/widget/EditText;

    const-string v1, "%06X"

    new-array v2, v3, [Ljava/lang/Object;

    const v3, 0xffffff

    iget v4, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mSelectedCustomColor:I

    and-int/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_8b

    .line 484
    :cond_a6
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    move-result-object v0

    iget v0, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mTitle:I

    invoke-virtual {p1, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTitle(I)V

    .line 485
    sget-object v0, Lcom/afollestad/materialdialogs/DialogAction;->NEUTRAL:Lcom/afollestad/materialdialogs/DialogAction;

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    move-result-object v1

    iget v1, v1, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mCustomBtn:I

    invoke-virtual {p1, v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setActionButton(Lcom/afollestad/materialdialogs/DialogAction;I)V

    .line 486
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->isInSub()Z

    move-result v0

    if-eqz v0, :cond_f2

    .line 487
    sget-object v0, Lcom/afollestad/materialdialogs/DialogAction;->NEGATIVE:Lcom/afollestad/materialdialogs/DialogAction;

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    move-result-object v1

    iget v1, v1, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mBackBtn:I

    invoke-virtual {p1, v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setActionButton(Lcom/afollestad/materialdialogs/DialogAction;I)V

    .line 489
    :goto_cb
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mGrid:Landroid/widget/GridView;

    invoke-virtual {v0, v5}, Landroid/widget/GridView;->setVisibility(I)V

    .line 490
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorChooserCustomFrame:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 491
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorHex:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorTextWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 492
    iput-object v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorTextWatcher:Landroid/text/TextWatcher;

    .line 493
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekR:Landroid/widget/SeekBar;

    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 494
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekG:Landroid/widget/SeekBar;

    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 495
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekB:Landroid/widget/SeekBar;

    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 496
    iput-object v2, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorRgbListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    goto :goto_8b

    .line 488
    :cond_f2
    sget-object v0, Lcom/afollestad/materialdialogs/DialogAction;->NEGATIVE:Lcom/afollestad/materialdialogs/DialogAction;

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    move-result-object v1

    iget v1, v1, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mCancelBtn:I

    invoke-virtual {p1, v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setActionButton(Lcom/afollestad/materialdialogs/DialogAction;I)V

    goto :goto_cb
.end method

.method private topIndex()I
    .registers 4

    .prologue
    .line 130
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "top_index"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private topIndex(I)V
    .registers 4
    .param p1, "value"    # I

    .prologue
    .line 134
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->topIndex()I

    move-result v0

    if-eq v0, p1, :cond_10

    const/4 v0, -0x1

    if-le p1, v0, :cond_10

    .line 135
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsTop:[I

    aget v0, v0, p1

    invoke-direct {p0, p1, v0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->findSubIndexForColor(II)V

    .line 136
    :cond_10
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "top_index"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 137
    return-void
.end method


# virtual methods
.method public getTitle()I
    .registers 4
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 151
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    move-result-object v0

    .line 153
    .local v0, "builder":Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->isInSub()Z

    move-result v2

    if-eqz v2, :cond_11

    iget v1, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mTitleSub:I

    .line 155
    .local v1, "title":I
    :goto_c
    if-nez v1, :cond_10

    iget v1, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mTitle:I

    .line 156
    :cond_10
    return v1

    .line 154
    .end local v1    # "title":I
    :cond_11
    iget v1, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mTitle:I

    .restart local v1    # "title":I
    goto :goto_c
.end method

.method public isAccentMode()Z
    .registers 2

    .prologue
    .line 160
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    move-result-object v0

    iget-boolean v0, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mAccentMode:Z

    return v0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .registers 4
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 115
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 116
    instance-of v0, p1, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorCallback;

    if-nez v0, :cond_f

    .line 117
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "ColorChooserDialog needs to be shown from an Activity implementing ColorCallback."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 118
    :cond_f
    check-cast p1, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorCallback;

    .end local p1    # "activity":Landroid/app/Activity;
    iput-object p1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCallback:Lcom/afollestad/materialdialogs/color/ColorChooserDialog$ColorCallback;

    .line 119
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 8
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 165
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_3c

    .line 166
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 167
    .local v3, "tag":[Ljava/lang/String;
    const/4 v4, 0x0

    aget-object v4, v3, v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 168
    .local v2, "index":I
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v1

    check-cast v1, Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 169
    .local v1, "dialog":Lcom/afollestad/materialdialogs/MaterialDialog;
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    move-result-object v0

    .line 171
    .local v0, "builder":Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->isInSub()Z

    move-result v4

    if-eqz v4, :cond_3d

    .line 172
    invoke-direct {p0, v2}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->subIndex(I)V

    .line 181
    :cond_2c
    :goto_2c
    iget-boolean v4, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mAllowUserCustom:Z

    if-eqz v4, :cond_36

    .line 182
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getSelectedColor()I

    move-result v4

    iput v4, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mSelectedCustomColor:I

    .line 183
    :cond_36
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->invalidateDynamicButtonColors()V

    .line 184
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->invalidate()V

    .line 186
    .end local v0    # "builder":Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    .end local v1    # "dialog":Lcom/afollestad/materialdialogs/MaterialDialog;
    .end local v2    # "index":I
    .end local v3    # "tag":[Ljava/lang/String;
    :cond_3c
    return-void

    .line 174
    .restart local v0    # "builder":Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    .restart local v1    # "dialog":Lcom/afollestad/materialdialogs/MaterialDialog;
    .restart local v2    # "index":I
    .restart local v3    # "tag":[Ljava/lang/String;
    :cond_3d
    invoke-direct {p0, v2}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->topIndex(I)V

    .line 175
    iget-object v4, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsSub:[[I

    if-eqz v4, :cond_2c

    iget-object v4, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsSub:[[I

    array-length v4, v4

    if-ge v2, v4, :cond_2c

    .line 176
    sget-object v4, Lcom/afollestad/materialdialogs/DialogAction;->NEGATIVE:Lcom/afollestad/materialdialogs/DialogAction;

    iget v5, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mBackBtn:I

    invoke-virtual {v1, v4, v5}, Lcom/afollestad/materialdialogs/MaterialDialog;->setActionButton(Lcom/afollestad/materialdialogs/DialogAction;I)V

    .line 177
    const/4 v4, 0x1

    invoke-direct {p0, v4}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->isInSub(Z)V

    goto :goto_2c
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 14
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/16 v11, 0x8

    const/4 v9, 0x0

    .line 267
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    if-eqz v7, :cond_16

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    const-string v10, "builder"

    invoke-virtual {v7, v10}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1e

    .line 268
    :cond_16
    new-instance v7, Ljava/lang/IllegalStateException;

    const-string v8, "ColorChooserDialog should be created using its Builder interface."

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 269
    :cond_1e
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->generateColors()V

    .line 272
    const/4 v2, 0x0

    .line 274
    .local v2, "foundPreselectColor":Z
    if-eqz p1, :cond_151

    .line 275
    const-string v7, "in_custom"

    invoke-virtual {p1, v7, v9}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    if-nez v7, :cond_14e

    move v2, v8

    .line 276
    :goto_2d
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getSelectedColor()I

    move-result v3

    .line 314
    .local v3, "preselectColor":I
    :cond_31
    :goto_31
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    sget v10, Lcom/afollestad/materialdialogs/commons/R$dimen;->md_colorchooser_circlesize:I

    invoke-virtual {v7, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    iput v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCircleSize:I

    .line 315
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    move-result-object v0

    .line 317
    .local v0, "builder":Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    new-instance v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v10

    invoke-direct {v7, v10}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getTitle()I

    move-result v10

    invoke-virtual {v7, v10}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->title(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v7

    invoke-virtual {v7, v9}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->autoDismiss(Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v7

    sget v10, Lcom/afollestad/materialdialogs/commons/R$layout;->md_dialog_colorchooser:I

    invoke-virtual {v7, v10, v9}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView(IZ)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v7

    iget v10, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mCancelBtn:I

    invoke-virtual {v7, v10}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v7

    iget v10, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mDoneBtn:I

    invoke-virtual {v7, v10}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v10

    iget-boolean v7, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mAllowUserCustom:Z

    if-eqz v7, :cond_1b6

    iget v7, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mCustomBtn:I

    :goto_6e
    invoke-virtual {v10, v7}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralText(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v7

    new-instance v10, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$4;

    invoke-direct {v10, p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$4;-><init>(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)V

    invoke-virtual {v7, v10}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onPositive(Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v7

    new-instance v10, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$3;

    invoke-direct {v10, p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$3;-><init>(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)V

    invoke-virtual {v7, v10}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onNegative(Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v7

    new-instance v10, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$2;

    invoke-direct {v10, p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$2;-><init>(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)V

    invoke-virtual {v7, v10}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onNeutral(Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v7

    new-instance v10, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$1;

    invoke-direct {v10, p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$1;-><init>(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)V

    invoke-virtual {v7, v10}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->showListener(Landroid/content/DialogInterface$OnShowListener;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v7

    invoke-virtual {v7}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->build()Lcom/afollestad/materialdialogs/MaterialDialog;

    move-result-object v1

    .line 357
    .local v1, "dialog":Lcom/afollestad/materialdialogs/MaterialDialog;
    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->getCustomView()Landroid/view/View;

    move-result-object v6

    .line 358
    .local v6, "v":Landroid/view/View;
    sget v7, Lcom/afollestad/materialdialogs/commons/R$id;->grid:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/GridView;

    iput-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mGrid:Landroid/widget/GridView;

    .line 360
    iget-boolean v7, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mAllowUserCustom:Z

    if-eqz v7, :cond_14a

    .line 361
    iput v3, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mSelectedCustomColor:I

    .line 362
    sget v7, Lcom/afollestad/materialdialogs/commons/R$id;->colorChooserCustomFrame:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    iput-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorChooserCustomFrame:Landroid/view/View;

    .line 363
    sget v7, Lcom/afollestad/materialdialogs/commons/R$id;->hexInput:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/EditText;

    iput-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorHex:Landroid/widget/EditText;

    .line 364
    sget v7, Lcom/afollestad/materialdialogs/commons/R$id;->colorIndicator:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    iput-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorIndicator:Landroid/view/View;

    .line 365
    sget v7, Lcom/afollestad/materialdialogs/commons/R$id;->colorA:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/SeekBar;

    iput-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekA:Landroid/widget/SeekBar;

    .line 366
    sget v7, Lcom/afollestad/materialdialogs/commons/R$id;->colorAValue:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekAValue:Landroid/widget/TextView;

    .line 367
    sget v7, Lcom/afollestad/materialdialogs/commons/R$id;->colorR:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/SeekBar;

    iput-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekR:Landroid/widget/SeekBar;

    .line 368
    sget v7, Lcom/afollestad/materialdialogs/commons/R$id;->colorRValue:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekRValue:Landroid/widget/TextView;

    .line 369
    sget v7, Lcom/afollestad/materialdialogs/commons/R$id;->colorG:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/SeekBar;

    iput-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekG:Landroid/widget/SeekBar;

    .line 370
    sget v7, Lcom/afollestad/materialdialogs/commons/R$id;->colorGValue:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekGValue:Landroid/widget/TextView;

    .line 371
    sget v7, Lcom/afollestad/materialdialogs/commons/R$id;->colorB:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/SeekBar;

    iput-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekB:Landroid/widget/SeekBar;

    .line 372
    sget v7, Lcom/afollestad/materialdialogs/commons/R$id;->colorBValue:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekBValue:Landroid/widget/TextView;

    .line 374
    iget-boolean v7, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mAllowUserCustomAlpha:Z

    if-nez v7, :cond_1b9

    .line 375
    sget v7, Lcom/afollestad/materialdialogs/commons/R$id;->colorALabel:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7, v11}, Landroid/view/View;->setVisibility(I)V

    .line 376
    iget-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekA:Landroid/widget/SeekBar;

    invoke-virtual {v7, v11}, Landroid/widget/SeekBar;->setVisibility(I)V

    .line 377
    iget-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomSeekAValue:Landroid/widget/TextView;

    invoke-virtual {v7, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 378
    iget-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorHex:Landroid/widget/EditText;

    const-string v10, "2196F3"

    invoke-virtual {v7, v10}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 379
    iget-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorHex:Landroid/widget/EditText;

    new-array v8, v8, [Landroid/text/InputFilter;

    new-instance v10, Landroid/text/InputFilter$LengthFilter;

    const/4 v11, 0x6

    invoke-direct {v10, v11}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v10, v8, v9

    invoke-virtual {v7, v8}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 385
    :goto_145
    if-nez v2, :cond_14a

    .line 387
    invoke-direct {p0, v1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->toggleCustom(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    .line 391
    :cond_14a
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->invalidate()V

    .line 392
    return-object v1

    .end local v0    # "builder":Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    .end local v1    # "dialog":Lcom/afollestad/materialdialogs/MaterialDialog;
    .end local v3    # "preselectColor":I
    .end local v6    # "v":Landroid/view/View;
    :cond_14e
    move v2, v9

    .line 275
    goto/16 :goto_2d

    .line 278
    :cond_151
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    move-result-object v7

    iget-boolean v7, v7, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mSetPreselectionColor:Z

    if-eqz v7, :cond_1b1

    .line 279
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    move-result-object v7

    iget v3, v7, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mPreselect:I

    .line 280
    .restart local v3    # "preselectColor":I
    if-eqz v3, :cond_31

    .line 281
    const/4 v5, 0x0

    .local v5, "topIndex":I
    :goto_162
    iget-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsTop:[I

    array-length v7, v7

    if-ge v5, v7, :cond_31

    .line 282
    iget-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsTop:[I

    aget v7, v7, v5

    if-ne v7, v3, :cond_18e

    .line 283
    const/4 v2, 0x1

    .line 284
    invoke-direct {p0, v5}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->topIndex(I)V

    .line 285
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    move-result-object v7

    iget-boolean v7, v7, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mAccentMode:Z

    if-eqz v7, :cond_17f

    .line 286
    const/4 v7, 0x2

    invoke-direct {p0, v7}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->subIndex(I)V

    goto/16 :goto_31

    .line 287
    :cond_17f
    iget-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsSub:[[I

    if-eqz v7, :cond_188

    .line 288
    invoke-direct {p0, v5, v3}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->findSubIndexForColor(II)V

    goto/16 :goto_31

    .line 290
    :cond_188
    const/4 v7, 0x5

    invoke-direct {p0, v7}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->subIndex(I)V

    goto/16 :goto_31

    .line 295
    :cond_18e
    iget-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsSub:[[I

    if-eqz v7, :cond_1ab

    .line 296
    const/4 v4, 0x0

    .local v4, "subIndex":I
    :goto_193
    iget-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsSub:[[I

    aget-object v7, v7, v5

    array-length v7, v7

    if-ge v4, v7, :cond_1a9

    .line 297
    iget-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorsSub:[[I

    aget-object v7, v7, v5

    aget v7, v7, v4

    if-ne v7, v3, :cond_1ae

    .line 298
    const/4 v2, 0x1

    .line 299
    invoke-direct {p0, v5}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->topIndex(I)V

    .line 300
    invoke-direct {p0, v4}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->subIndex(I)V

    .line 304
    :cond_1a9
    if-nez v2, :cond_31

    .line 281
    .end local v4    # "subIndex":I
    :cond_1ab
    add-int/lit8 v5, v5, 0x1

    goto :goto_162

    .line 296
    .restart local v4    # "subIndex":I
    :cond_1ae
    add-int/lit8 v4, v4, 0x1

    goto :goto_193

    .line 309
    .end local v3    # "preselectColor":I
    .end local v4    # "subIndex":I
    .end local v5    # "topIndex":I
    :cond_1b1
    const/high16 v3, -0x1000000

    .line 310
    .restart local v3    # "preselectColor":I
    const/4 v2, 0x1

    goto/16 :goto_31

    .restart local v0    # "builder":Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    :cond_1b6
    move v7, v9

    .line 317
    goto/16 :goto_6e

    .line 381
    .restart local v1    # "dialog":Lcom/afollestad/materialdialogs/MaterialDialog;
    .restart local v6    # "v":Landroid/view/View;
    :cond_1b9
    iget-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorHex:Landroid/widget/EditText;

    const-string v10, "FF2196F3"

    invoke-virtual {v7, v10}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 382
    iget-object v7, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mCustomColorHex:Landroid/widget/EditText;

    new-array v8, v8, [Landroid/text/InputFilter;

    new-instance v10, Landroid/text/InputFilter$LengthFilter;

    invoke-direct {v10, v11}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v10, v8, v9

    invoke-virtual {v7, v8}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    goto/16 :goto_145
.end method

.method public onLongClick(Landroid/view/View;)Z
    .registers 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x1

    .line 190
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_20

    .line 191
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v4, ":"

    invoke-virtual {v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 192
    .local v1, "tag":[Ljava/lang/String;
    aget-object v2, v1, v3

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 193
    .local v0, "color":I
    check-cast p1, Lcom/afollestad/materialdialogs/color/CircleView;

    .end local p1    # "v":Landroid/view/View;
    invoke-virtual {p1, v0}, Lcom/afollestad/materialdialogs/color/CircleView;->showHint(I)V

    move v2, v3

    .line 196
    .end local v0    # "color":I
    .end local v1    # "tag":[Ljava/lang/String;
    :goto_1f
    return v2

    .restart local p1    # "v":Landroid/view/View;
    :cond_20
    const/4 v2, 0x0

    goto :goto_1f
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 105
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 106
    const-string v0, "top_index"

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->topIndex()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 107
    const-string v0, "in_sub"

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->isInSub()Z

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 108
    const-string v0, "sub_index"

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->subIndex()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 109
    const-string v1, "in_custom"

    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorChooserCustomFrame:Landroid/view/View;

    if-eqz v0, :cond_31

    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->mColorChooserCustomFrame:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_31

    const/4 v0, 0x1

    :goto_2d
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 111
    return-void

    .line 109
    :cond_31
    const/4 v0, 0x0

    goto :goto_2d
.end method

.method public show(Landroid/support/v7/app/AppCompatActivity;)Lcom/afollestad/materialdialogs/color/ColorChooserDialog;
    .registers 5
    .param p1, "context"    # Landroid/support/v7/app/AppCompatActivity;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 709
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    move-result-object v0

    .line 710
    .local v0, "builder":Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    iget-object v2, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mColorsTop:[I

    if-eqz v2, :cond_15

    .line 711
    const-string v1, "[MD_COLOR_CHOOSER]"

    .line 715
    .local v1, "tag":Ljava/lang/String;
    :goto_a
    invoke-direct {p0, p1, v1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->dismissIfNecessary(Landroid/support/v7/app/AppCompatActivity;Ljava/lang/String;)V

    .line 716
    invoke-virtual {p1}, Landroid/support/v7/app/AppCompatActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {p0, v2, v1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 717
    return-object p0

    .line 712
    .end local v1    # "tag":Ljava/lang/String;
    :cond_15
    iget-boolean v2, v0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mAccentMode:Z

    if-eqz v2, :cond_1c

    .line 713
    const-string v1, "[MD_COLOR_CHOOSER]"

    .restart local v1    # "tag":Ljava/lang/String;
    goto :goto_a

    .line 714
    .end local v1    # "tag":Ljava/lang/String;
    :cond_1c
    const-string v1, "[MD_COLOR_CHOOSER]"

    .restart local v1    # "tag":Ljava/lang/String;
    goto :goto_a
.end method
