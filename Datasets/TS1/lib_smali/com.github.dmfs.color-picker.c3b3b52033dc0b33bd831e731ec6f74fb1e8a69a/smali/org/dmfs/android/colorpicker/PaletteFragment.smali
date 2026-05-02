.class public Lorg/dmfs/android/colorpicker/PaletteFragment;
.super Lorg/dmfs/android/retentionmagic/SupportFragment;
.source "PaletteFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/android/colorpicker/PaletteFragment$OnColorSelectedListener;
    }
.end annotation


# instance fields
.field private mAdapter:Lorg/dmfs/android/colorpicker/PaletteGridAdapter;

.field private mPalette:Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;
    .annotation runtime Lorg/dmfs/android/retentionmagic/annotations/Retain;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/dmfs/android/retentionmagic/SupportFragment;-><init>()V

    .line 46
    return-void
.end method

.method static synthetic access$000(Lorg/dmfs/android/colorpicker/PaletteFragment;)Lorg/dmfs/android/colorpicker/PaletteGridAdapter;
    .registers 2
    .param p0, "x0"    # Lorg/dmfs/android/colorpicker/PaletteFragment;

    .prologue
    .line 44
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/PaletteFragment;->mAdapter:Lorg/dmfs/android/colorpicker/PaletteGridAdapter;

    return-object v0
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 9
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 72
    invoke-super {p0, p1, p2, p3}, Lorg/dmfs/android/retentionmagic/SupportFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    .line 77
    sget v2, Lorg/dmfs/android/colorpicker/R$layout;->org_dmfs_colorpickerdialog_palette_grid:I

    const/4 v3, 0x0

    invoke-virtual {p1, v2, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 78
    .local v1, "rootView":Landroid/view/ViewGroup;
    const v2, 0x1020002

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/GridView;

    .line 80
    .local v0, "gridview":Landroid/widget/GridView;
    new-instance v2, Lorg/dmfs/android/colorpicker/PaletteGridAdapter;

    invoke-virtual {p0}, Lorg/dmfs/android/colorpicker/PaletteFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    iget-object v4, p0, Lorg/dmfs/android/colorpicker/PaletteFragment;->mPalette:Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    invoke-direct {v2, v3, v4}, Lorg/dmfs/android/colorpicker/PaletteGridAdapter;-><init>(Landroid/content/Context;Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;)V

    iput-object v2, p0, Lorg/dmfs/android/colorpicker/PaletteFragment;->mAdapter:Lorg/dmfs/android/colorpicker/PaletteGridAdapter;

    .line 81
    iget-object v2, p0, Lorg/dmfs/android/colorpicker/PaletteFragment;->mAdapter:Lorg/dmfs/android/colorpicker/PaletteGridAdapter;

    invoke-virtual {v0, v2}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 82
    invoke-virtual {v0, p0}, Landroid/widget/GridView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 83
    iget-object v2, p0, Lorg/dmfs/android/colorpicker/PaletteFragment;->mAdapter:Lorg/dmfs/android/colorpicker/PaletteGridAdapter;

    invoke-virtual {v2}, Lorg/dmfs/android/colorpicker/PaletteGridAdapter;->getNumColumns()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/GridView;->setNumColumns(I)V

    .line 90
    invoke-virtual {v0}, Landroid/widget/GridView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    new-instance v3, Lorg/dmfs/android/colorpicker/PaletteFragment$1;

    invoke-direct {v3, p0, v1, v0, p1}, Lorg/dmfs/android/colorpicker/PaletteFragment$1;-><init>(Lorg/dmfs/android/colorpicker/PaletteFragment;Landroid/view/ViewGroup;Landroid/widget/GridView;Landroid/view/LayoutInflater;)V

    invoke-virtual {v2, v3}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 159
    return-object v1
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 12
    .param p2, "View"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 167
    .local p1, "gridView":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p0}, Lorg/dmfs/android/colorpicker/PaletteFragment;->getParentFragment()Landroid/support/v4/app/Fragment;

    move-result-object v1

    .line 168
    .local v1, "parent":Landroid/support/v4/app/Fragment;
    instance-of v2, v1, Lorg/dmfs/android/colorpicker/PaletteFragment$OnColorSelectedListener;

    if-eqz v2, :cond_26

    move-object v0, v1

    .line 170
    check-cast v0, Lorg/dmfs/android/colorpicker/PaletteFragment$OnColorSelectedListener;

    .line 171
    .local v0, "listener":Lorg/dmfs/android/colorpicker/PaletteFragment$OnColorSelectedListener;
    iget-object v2, p0, Lorg/dmfs/android/colorpicker/PaletteFragment;->mPalette:Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    invoke-virtual {v2, p3}, Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;->getColor(I)I

    move-result v2

    iget-object v3, p0, Lorg/dmfs/android/colorpicker/PaletteFragment;->mPalette:Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    invoke-virtual {v3}, Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;->getId()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/dmfs/android/colorpicker/PaletteFragment;->mPalette:Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    invoke-virtual {v4, p3}, Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;->getColorName(I)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/dmfs/android/colorpicker/PaletteFragment;->mPalette:Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    invoke-virtual {v5}, Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v2, v3, v4, v5}, Lorg/dmfs/android/colorpicker/PaletteFragment$OnColorSelectedListener;->onColorSelected(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    .end local v0    # "listener":Lorg/dmfs/android/colorpicker/PaletteFragment$OnColorSelectedListener;
    :cond_26
    return-void
.end method

.method public setPalette(Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;)V
    .registers 2
    .param p1, "palette"    # Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    .prologue
    .line 65
    iput-object p1, p0, Lorg/dmfs/android/colorpicker/PaletteFragment;->mPalette:Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    .line 66
    return-void
.end method
