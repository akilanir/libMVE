.class Lorg/dmfs/android/colorpicker/PaletteFragment$1;
.super Ljava/lang/Object;
.source "PaletteFragment.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/dmfs/android/colorpicker/PaletteFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/dmfs/android/colorpicker/PaletteFragment;

.field final synthetic val$gridview:Landroid/widget/GridView;

.field final synthetic val$inflater:Landroid/view/LayoutInflater;

.field final synthetic val$rootView:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Lorg/dmfs/android/colorpicker/PaletteFragment;Landroid/view/ViewGroup;Landroid/widget/GridView;Landroid/view/LayoutInflater;)V
    .registers 5

    .prologue
    .line 91
    iput-object p1, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->this$0:Lorg/dmfs/android/colorpicker/PaletteFragment;

    iput-object p2, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->val$rootView:Landroid/view/ViewGroup;

    iput-object p3, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->val$gridview:Landroid/widget/GridView;

    iput-object p4, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->val$inflater:Landroid/view/LayoutInflater;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .registers 16
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/4 v14, 0x1

    const/high16 v13, 0x41000000    # 8.0f

    const/4 v12, 0x0

    .line 95
    iget-object v10, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->val$rootView:Landroid/view/ViewGroup;

    invoke-virtual {v10}, Landroid/view/ViewGroup;->getHeight()I

    move-result v10

    iget-object v11, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->val$rootView:Landroid/view/ViewGroup;

    invoke-virtual {v11}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v11

    sub-int/2addr v10, v11

    iget-object v11, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->val$rootView:Landroid/view/ViewGroup;

    invoke-virtual {v11}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v11

    sub-int v8, v10, v11

    .line 96
    .local v8, "parentHeight":I
    iget-object v10, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->val$rootView:Landroid/view/ViewGroup;

    invoke-virtual {v10}, Landroid/view/ViewGroup;->getWidth()I

    move-result v10

    iget-object v11, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->val$rootView:Landroid/view/ViewGroup;

    invoke-virtual {v11}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v11

    sub-int/2addr v10, v11

    iget-object v11, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->val$rootView:Landroid/view/ViewGroup;

    invoke-virtual {v11}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v11

    sub-int v9, v10, v11

    .line 98
    .local v9, "parentWidth":I
    invoke-static {v9, v8}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 101
    .local v3, "gridWidth":I
    sget v10, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0x10

    if-lt v10, v11, :cond_92

    .line 103
    iget-object v10, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->val$gridview:Landroid/widget/GridView;

    invoke-virtual {v10}, Landroid/widget/GridView;->getHorizontalSpacing()I

    move-result v10

    iget-object v11, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->this$0:Lorg/dmfs/android/colorpicker/PaletteFragment;

    # getter for: Lorg/dmfs/android/colorpicker/PaletteFragment;->mAdapter:Lorg/dmfs/android/colorpicker/PaletteGridAdapter;
    invoke-static {v11}, Lorg/dmfs/android/colorpicker/PaletteFragment;->access$000(Lorg/dmfs/android/colorpicker/PaletteFragment;)Lorg/dmfs/android/colorpicker/PaletteGridAdapter;

    move-result-object v11

    invoke-virtual {v11}, Lorg/dmfs/android/colorpicker/PaletteGridAdapter;->getNumColumns()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    mul-int v1, v10, v11

    .line 127
    .local v1, "columnSpacing":I
    :goto_4c
    sub-int v10, v3, v1

    iget-object v11, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->this$0:Lorg/dmfs/android/colorpicker/PaletteFragment;

    # getter for: Lorg/dmfs/android/colorpicker/PaletteFragment;->mAdapter:Lorg/dmfs/android/colorpicker/PaletteGridAdapter;
    invoke-static {v11}, Lorg/dmfs/android/colorpicker/PaletteFragment;->access$000(Lorg/dmfs/android/colorpicker/PaletteFragment;)Lorg/dmfs/android/colorpicker/PaletteGridAdapter;

    move-result-object v11

    invoke-virtual {v11}, Lorg/dmfs/android/colorpicker/PaletteGridAdapter;->getNumColumns()I

    move-result v11

    div-int v2, v10, v11

    .line 130
    .local v2, "columnWidth":I
    iget-object v10, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->this$0:Lorg/dmfs/android/colorpicker/PaletteFragment;

    # getter for: Lorg/dmfs/android/colorpicker/PaletteFragment;->mAdapter:Lorg/dmfs/android/colorpicker/PaletteGridAdapter;
    invoke-static {v10}, Lorg/dmfs/android/colorpicker/PaletteFragment;->access$000(Lorg/dmfs/android/colorpicker/PaletteFragment;)Lorg/dmfs/android/colorpicker/PaletteGridAdapter;

    move-result-object v10

    invoke-virtual {v10}, Lorg/dmfs/android/colorpicker/PaletteGridAdapter;->getNumColumns()I

    move-result v10

    mul-int/2addr v10, v2

    add-int v0, v10, v1

    .line 133
    .local v0, "actualGridWidth":I
    add-int/lit8 v10, v3, -0x1

    if-ge v0, v10, :cond_cc

    .line 135
    sub-int v10, v3, v0

    div-int/lit8 v6, v10, 0x2

    .line 136
    .local v6, "padding":I
    if-lez v6, :cond_76

    .line 138
    iget-object v10, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->val$gridview:Landroid/widget/GridView;

    invoke-virtual {v10, v6, v6, v6, v6}, Landroid/widget/GridView;->setPadding(IIII)V

    .line 149
    .end local v6    # "padding":I
    :cond_76
    :goto_76
    iget-object v10, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->val$gridview:Landroid/widget/GridView;

    invoke-virtual {v10, v2}, Landroid/widget/GridView;->setColumnWidth(I)V

    .line 151
    iget-object v10, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->val$gridview:Landroid/widget/GridView;

    invoke-virtual {v10}, Landroid/widget/GridView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    .line 152
    .local v7, "params":Landroid/view/ViewGroup$LayoutParams;
    if-eqz v7, :cond_87

    iget v10, v7, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v10, v3, :cond_91

    .line 154
    :cond_87
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 155
    .local v4, "lparams":Landroid/widget/LinearLayout$LayoutParams;
    iget-object v10, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->val$gridview:Landroid/widget/GridView;

    invoke-virtual {v10, v4}, Landroid/widget/GridView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 157
    .end local v4    # "lparams":Landroid/widget/LinearLayout$LayoutParams;
    :cond_91
    return-void

    .line 114
    .end local v0    # "actualGridWidth":I
    .end local v1    # "columnSpacing":I
    .end local v2    # "columnWidth":I
    .end local v7    # "params":Landroid/view/ViewGroup$LayoutParams;
    :cond_92
    iget-object v10, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->val$inflater:Landroid/view/LayoutInflater;

    invoke-virtual {v10}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    .line 115
    .local v5, "metrics":Landroid/util/DisplayMetrics;
    sget v10, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0xa

    if-le v10, v11, :cond_ba

    .line 117
    invoke-static {v14, v13, v5}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v10

    float-to-int v10, v10

    iget-object v11, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->this$0:Lorg/dmfs/android/colorpicker/PaletteFragment;

    # getter for: Lorg/dmfs/android/colorpicker/PaletteFragment;->mAdapter:Lorg/dmfs/android/colorpicker/PaletteGridAdapter;
    invoke-static {v11}, Lorg/dmfs/android/colorpicker/PaletteFragment;->access$000(Lorg/dmfs/android/colorpicker/PaletteFragment;)Lorg/dmfs/android/colorpicker/PaletteGridAdapter;

    move-result-object v11

    invoke-virtual {v11}, Lorg/dmfs/android/colorpicker/PaletteGridAdapter;->getNumColumns()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    mul-int v1, v10, v11

    .restart local v1    # "columnSpacing":I
    goto :goto_4c

    .line 122
    .end local v1    # "columnSpacing":I
    :cond_ba
    invoke-static {v14, v13, v5}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v10

    float-to-int v10, v10

    iget-object v11, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->this$0:Lorg/dmfs/android/colorpicker/PaletteFragment;

    # getter for: Lorg/dmfs/android/colorpicker/PaletteFragment;->mAdapter:Lorg/dmfs/android/colorpicker/PaletteGridAdapter;
    invoke-static {v11}, Lorg/dmfs/android/colorpicker/PaletteFragment;->access$000(Lorg/dmfs/android/colorpicker/PaletteFragment;)Lorg/dmfs/android/colorpicker/PaletteGridAdapter;

    move-result-object v11

    invoke-virtual {v11}, Lorg/dmfs/android/colorpicker/PaletteGridAdapter;->getNumColumns()I

    move-result v11

    mul-int v1, v10, v11

    .restart local v1    # "columnSpacing":I
    goto :goto_4c

    .line 145
    .end local v5    # "metrics":Landroid/util/DisplayMetrics;
    .restart local v0    # "actualGridWidth":I
    .restart local v2    # "columnWidth":I
    :cond_cc
    iget-object v10, p0, Lorg/dmfs/android/colorpicker/PaletteFragment$1;->val$gridview:Landroid/widget/GridView;

    invoke-virtual {v10, v12, v12, v12, v12}, Landroid/widget/GridView;->setPadding(IIII)V

    goto :goto_76
.end method
