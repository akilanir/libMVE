.class public Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;
.super Lorg/dmfs/android/retentionmagic/SupportDialogFragment;
.source "ColorPickerDialogFragment.java"

# interfaces
.implements Lorg/dmfs/android/colorpicker/PaletteFragment$OnColorSelectedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment$ColorDialogResultListener;
    }
.end annotation


# instance fields
.field private mPager:Lorg/dmfs/android/view/ViewPager;

.field private mPagerAdapter:Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;

.field private mPalettes:[Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;
    .annotation runtime Lorg/dmfs/android/retentionmagic/annotations/Retain;
    .end annotation
.end field

.field private mSelected:I

.field private mTitle:Ljava/lang/CharSequence;
    .annotation runtime Lorg/dmfs/android/retentionmagic/annotations/Retain;
    .end annotation
.end field

.field private mTitleId:I
    .annotation runtime Lorg/dmfs/android/retentionmagic/annotations/Retain;
    .end annotation
.end field

.field private mTitleView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 44
    invoke-direct {p0}, Lorg/dmfs/android/retentionmagic/SupportDialogFragment;-><init>()V

    .line 75
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mTitle:Ljava/lang/CharSequence;

    .line 77
    iput v1, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mTitleId:I

    .line 83
    iput v1, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mSelected:I

    return-void
.end method

.method private getListener()Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment$ColorDialogResultListener;
    .registers 5

    .prologue
    .line 230
    const/4 v0, 0x0

    .line 231
    .local v0, "listener":Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment$ColorDialogResultListener;
    invoke-virtual {p0}, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->getParentFragment()Landroid/support/v4/app/Fragment;

    move-result-object v2

    .line 232
    .local v2, "parentFragment":Landroid/support/v4/app/Fragment;
    invoke-virtual {p0}, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    .line 234
    .local v1, "parentActivity":Landroid/app/Activity;
    instance-of v3, v2, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment$ColorDialogResultListener;

    if-eqz v3, :cond_11

    move-object v0, v2

    .line 236
    check-cast v0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment$ColorDialogResultListener;

    .line 242
    :cond_10
    :goto_10
    return-object v0

    .line 238
    :cond_11
    instance-of v3, v1, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment$ColorDialogResultListener;

    if-eqz v3, :cond_10

    move-object v0, v1

    .line 240
    check-cast v0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment$ColorDialogResultListener;

    goto :goto_10
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 213
    invoke-direct {p0}, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->getListener()Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment$ColorDialogResultListener;

    move-result-object v0

    .line 215
    .local v0, "listener":Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment$ColorDialogResultListener;
    if-eqz v0, :cond_9

    .line 217
    invoke-interface {v0}, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment$ColorDialogResultListener;->onColorDialogCancelled()V

    .line 219
    :cond_9
    return-void
.end method

.method public onColorSelected(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "color"    # I
    .param p2, "paletteId"    # Ljava/lang/String;
    .param p3, "colorName"    # Ljava/lang/String;
    .param p4, "paletteName"    # Ljava/lang/String;

    .prologue
    .line 199
    invoke-direct {p0}, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->getListener()Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment$ColorDialogResultListener;

    move-result-object v0

    .line 201
    .local v0, "listener":Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment$ColorDialogResultListener;
    if-eqz v0, :cond_9

    .line 203
    invoke-interface {v0, p1, p2, p3, p4}, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment$ColorDialogResultListener;->onColorChanged(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    :cond_9
    invoke-virtual {p0}, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->dismiss()V

    .line 207
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 189
    invoke-super {p0, p1}, Lorg/dmfs/android/retentionmagic/SupportDialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;

    move-result-object v0

    .line 190
    .local v0, "result":Landroid/app/Dialog;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 191
    invoke-virtual {v0, p0}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 192
    return-object v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 9
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 163
    sget v1, Lorg/dmfs/android/colorpicker/R$layout;->org_dmfs_colorpickerdialog_fragment:I

    invoke-virtual {p1, v1, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 165
    .local v0, "view":Landroid/view/View;
    sget v1, Lorg/dmfs/android/colorpicker/R$id;->pager:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lorg/dmfs/android/view/ViewPager;

    iput-object v1, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mPager:Lorg/dmfs/android/view/ViewPager;

    .line 166
    new-instance v1, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;

    invoke-virtual {p0}, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p0}, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    iget-object v4, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mPalettes:[Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    invoke-direct {v1, v2, v3, v4}, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;-><init>(Landroid/content/res/Resources;Landroid/support/v4/app/FragmentManager;[Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;)V

    iput-object v1, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mPagerAdapter:Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;

    .line 167
    iget-object v1, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mPagerAdapter:Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;

    invoke-virtual {v1}, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->notifyDataSetChanged()V

    .line 168
    iget-object v1, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mPager:Lorg/dmfs/android/view/ViewPager;

    iget-object v2, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mPagerAdapter:Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;

    invoke-virtual {v1, v2}, Lorg/dmfs/android/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 169
    iget-object v1, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mPager:Lorg/dmfs/android/view/ViewPager;

    iget-object v2, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mPagerAdapter:Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;

    invoke-virtual {v2}, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->getCount()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    iget v3, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mSelected:I

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Lorg/dmfs/android/view/ViewPager;->setCurrentItem(I)V

    .line 171
    const v1, 0x1020016

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mTitleView:Landroid/widget/TextView;

    .line 173
    iget v1, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mTitleId:I

    if-eqz v1, :cond_54

    .line 175
    iget-object v1, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mTitleView:Landroid/widget/TextView;

    iget v2, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mTitleId:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 182
    :cond_53
    :goto_53
    return-object v0

    .line 177
    :cond_54
    iget-object v1, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mTitle:Ljava/lang/CharSequence;

    if-eqz v1, :cond_53

    .line 179
    iget-object v1, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mTitleView:Landroid/widget/TextView;

    iget-object v2, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_53
.end method

.method public selectPaletteId(Ljava/lang/String;)V
    .registers 10
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 106
    iget-object v5, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mPalettes:[Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    if-eqz v5, :cond_6

    if-nez p1, :cond_7

    .line 125
    :cond_6
    :goto_6
    return-void

    .line 111
    :cond_7
    const/4 v2, 0x0

    .line 112
    .local v2, "index":I
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mPalettes:[Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    .local v0, "arr$":[Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_c
    if-ge v1, v3, :cond_6

    aget-object v4, v0, v1

    .line 114
    .local v4, "palette":Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;
    invoke-virtual {v4}, Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-static {p1, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_35

    .line 116
    iput v2, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mSelected:I

    .line 117
    iget-object v5, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mPager:Lorg/dmfs/android/view/ViewPager;

    if-eqz v5, :cond_6

    iget-object v5, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mPagerAdapter:Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;

    if-eqz v5, :cond_6

    .line 119
    iget-object v5, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mPager:Lorg/dmfs/android/view/ViewPager;

    iget-object v6, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mPagerAdapter:Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;

    invoke-virtual {v6}, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->getCount()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    iget v7, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mSelected:I

    add-int/2addr v6, v7

    invoke-virtual {v5, v6}, Lorg/dmfs/android/view/ViewPager;->setCurrentItem(I)V

    goto :goto_6

    .line 123
    :cond_35
    add-int/lit8 v2, v2, 0x1

    .line 112
    add-int/lit8 v1, v1, 0x1

    goto :goto_c
.end method

.method public varargs setPalettes([Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;)V
    .registers 2
    .param p1, "palettes"    # [Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    .prologue
    .line 94
    iput-object p1, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mPalettes:[Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    .line 95
    return-void
.end method

.method public setTitle(I)V
    .registers 3
    .param p1, "title"    # I

    .prologue
    .line 152
    iput p1, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mTitleId:I

    .line 153
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mTitleView:Landroid/widget/TextView;

    if-eqz v0, :cond_b

    .line 155
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mTitleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 157
    :cond_b
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 136
    iput-object p1, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mTitle:Ljava/lang/CharSequence;

    .line 137
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mTitleView:Landroid/widget/TextView;

    if-eqz v0, :cond_b

    .line 139
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/ColorPickerDialogFragment;->mTitleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    :cond_b
    return-void
.end method
