.class Lcom/afollestad/materialdialogs/DialogInit;
.super Ljava/lang/Object;
.source "DialogInit.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInflateLayout(Lcom/afollestad/materialdialogs/MaterialDialog$Builder;)I
    .registers 3
    .param p0, "builder"    # Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .annotation build Landroid/support/annotation/LayoutRes;
    .end annotation

    .prologue
    .line 53
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView:Landroid/view/View;

    if-eqz v0, :cond_7

    .line 54
    sget v0, Lcom/afollestad/materialdialogs/R$layout;->md_dialog_custom:I

    .line 66
    :goto_6
    return v0

    .line 55
    :cond_7
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    array-length v0, v0

    if-gtz v0, :cond_14

    :cond_10
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_17

    .line 56
    :cond_14
    sget v0, Lcom/afollestad/materialdialogs/R$layout;->md_dialog_list:I

    goto :goto_6

    .line 57
    :cond_17
    iget v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progress:I

    const/4 v1, -0x2

    if-le v0, v1, :cond_1f

    .line 58
    sget v0, Lcom/afollestad/materialdialogs/R$layout;->md_dialog_progress:I

    goto :goto_6

    .line 59
    :cond_1f
    iget-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateProgress:Z

    if-eqz v0, :cond_2d

    .line 60
    iget-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateIsHorizontalProgress:Z

    if-eqz v0, :cond_2a

    .line 61
    sget v0, Lcom/afollestad/materialdialogs/R$layout;->md_dialog_progress_indeterminate_horizontal:I

    goto :goto_6

    .line 62
    :cond_2a
    sget v0, Lcom/afollestad/materialdialogs/R$layout;->md_dialog_progress_indeterminate:I

    goto :goto_6

    .line 63
    :cond_2d
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputCallback:Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;

    if-eqz v0, :cond_34

    .line 64
    sget v0, Lcom/afollestad/materialdialogs/R$layout;->md_dialog_input:I

    goto :goto_6

    .line 66
    :cond_34
    sget v0, Lcom/afollestad/materialdialogs/R$layout;->md_dialog_basic:I

    goto :goto_6
.end method

.method public static getTheme(Lcom/afollestad/materialdialogs/MaterialDialog$Builder;)I
    .registers 6
    .param p0, "builder"    # Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/StyleRes;
    .end annotation

    .prologue
    .line 46
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    sget v3, Lcom/afollestad/materialdialogs/R$attr;->md_dark_theme:I

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->theme:Lcom/afollestad/materialdialogs/Theme;

    sget-object v4, Lcom/afollestad/materialdialogs/Theme;->DARK:Lcom/afollestad/materialdialogs/Theme;

    if-ne v1, v4, :cond_1a

    const/4 v1, 0x1

    :goto_b
    invoke-static {v2, v3, v1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveBoolean(Landroid/content/Context;IZ)Z

    move-result v0

    .line 47
    .local v0, "darkTheme":Z
    if-eqz v0, :cond_1c

    sget-object v1, Lcom/afollestad/materialdialogs/Theme;->DARK:Lcom/afollestad/materialdialogs/Theme;

    :goto_13
    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->theme:Lcom/afollestad/materialdialogs/Theme;

    .line 48
    if-eqz v0, :cond_1f

    sget v1, Lcom/afollestad/materialdialogs/R$style;->MD_Dark:I

    :goto_19
    return v1

    .line 46
    .end local v0    # "darkTheme":Z
    :cond_1a
    const/4 v1, 0x0

    goto :goto_b

    .line 47
    .restart local v0    # "darkTheme":Z
    :cond_1c
    sget-object v1, Lcom/afollestad/materialdialogs/Theme;->LIGHT:Lcom/afollestad/materialdialogs/Theme;

    goto :goto_13

    .line 48
    :cond_1f
    sget v1, Lcom/afollestad/materialdialogs/R$style;->MD_Light:I

    goto :goto_19
.end method

.method public static init(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 25
    .param p0, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 72
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 75
    .local v3, "builder":Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->cancelable:Z

    move/from16 v21, v0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setCancelable(Z)V

    .line 76
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->cancelable:Z

    move/from16 v21, v0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setCanceledOnTouchOutside(Z)V

    .line 77
    iget v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->backgroundColor:I

    move/from16 v21, v0

    if-nez v21, :cond_2e

    .line 78
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_background_color:I

    invoke-static/range {v21 .. v22}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v21

    move/from16 v0, v21

    iput v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->backgroundColor:I

    .line 79
    :cond_2e
    iget v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->backgroundColor:I

    move/from16 v21, v0

    if-eqz v21, :cond_60

    .line 80
    new-instance v7, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v7}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 81
    .local v7, "drawable":Landroid/graphics/drawable/GradientDrawable;
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v21

    sget v22, Lcom/afollestad/materialdialogs/R$dimen;->md_bg_corner_radius:I

    invoke-virtual/range {v21 .. v22}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v21

    move/from16 v0, v21

    invoke-virtual {v7, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 82
    iget v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->backgroundColor:I

    move/from16 v21, v0

    move/from16 v0, v21

    invoke-virtual {v7, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 83
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-static {v0, v7}, Lcom/afollestad/materialdialogs/util/DialogUtils;->setBackgroundCompat(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 87
    .end local v7    # "drawable":Landroid/graphics/drawable/GradientDrawable;
    :cond_60
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColorSet:Z

    move/from16 v21, v0

    if-nez v21, :cond_78

    .line 88
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_positive_color:I

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColor:Landroid/content/res/ColorStateList;

    move-object/from16 v23, v0

    invoke-static/range {v21 .. v23}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveActionTextColorStateList(Landroid/content/Context;ILandroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object v21

    move-object/from16 v0, v21

    iput-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColor:Landroid/content/res/ColorStateList;

    .line 89
    :cond_78
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralColorSet:Z

    move/from16 v21, v0

    if-nez v21, :cond_90

    .line 90
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_neutral_color:I

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralColor:Landroid/content/res/ColorStateList;

    move-object/from16 v23, v0

    invoke-static/range {v21 .. v23}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveActionTextColorStateList(Landroid/content/Context;ILandroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object v21

    move-object/from16 v0, v21

    iput-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralColor:Landroid/content/res/ColorStateList;

    .line 91
    :cond_90
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeColorSet:Z

    move/from16 v21, v0

    if-nez v21, :cond_a8

    .line 92
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_negative_color:I

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeColor:Landroid/content/res/ColorStateList;

    move-object/from16 v23, v0

    invoke-static/range {v21 .. v23}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveActionTextColorStateList(Landroid/content/Context;ILandroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object v21

    move-object/from16 v0, v21

    iput-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeColor:Landroid/content/res/ColorStateList;

    .line 93
    :cond_a8
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColorSet:Z

    move/from16 v21, v0

    if-nez v21, :cond_c0

    .line 94
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_widget_color:I

    iget v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    move/from16 v23, v0

    invoke-static/range {v21 .. v23}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;II)I

    move-result v21

    move/from16 v0, v21

    iput v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    .line 97
    :cond_c0
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleColorSet:Z

    move/from16 v21, v0

    if-nez v21, :cond_e5

    .line 98
    invoke-virtual/range {p0 .. p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v21

    const v22, 0x1010036

    invoke-static/range {v21 .. v22}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v20

    .line 99
    .local v20, "titleColorFallback":I
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_title_color:I

    move-object/from16 v0, v21

    move/from16 v1, v22

    move/from16 v2, v20

    invoke-static {v0, v1, v2}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;II)I

    move-result v21

    move/from16 v0, v21

    iput v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleColor:I

    .line 109
    .end local v20    # "titleColorFallback":I
    :cond_e5
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColorSet:Z

    move/from16 v21, v0

    if-nez v21, :cond_108

    .line 110
    invoke-virtual/range {p0 .. p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v21

    const v22, 0x1010038

    invoke-static/range {v21 .. v22}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v4

    .line 111
    .local v4, "contentColorFallback":I
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_content_color:I

    move-object/from16 v0, v21

    move/from16 v1, v22

    invoke-static {v0, v1, v4}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;II)I

    move-result v21

    move/from16 v0, v21

    iput v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor:I

    .line 121
    .end local v4    # "contentColorFallback":I
    :cond_108
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemColorSet:Z

    move/from16 v21, v0

    if-nez v21, :cond_120

    .line 122
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_item_color:I

    iget v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor:I

    move/from16 v23, v0

    invoke-static/range {v21 .. v23}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;II)I

    move-result v21

    move/from16 v0, v21

    iput v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemColor:I

    .line 125
    :cond_120
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$id;->title:I

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v21

    check-cast v21, Landroid/widget/TextView;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/afollestad/materialdialogs/MaterialDialog;->title:Landroid/widget/TextView;

    .line 126
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$id;->icon:I

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v21

    check-cast v21, Landroid/widget/ImageView;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    .line 127
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$id;->titleFrame:I

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/afollestad/materialdialogs/MaterialDialog;->titleFrame:Landroid/view/View;

    .line 128
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$id;->content:I

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v21

    check-cast v21, Landroid/widget/TextView;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    .line 129
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$id;->contentListView:I

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v21

    check-cast v21, Landroid/widget/ListView;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    .line 132
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$id;->buttonDefaultPositive:I

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v21

    check-cast v21, Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/afollestad/materialdialogs/MaterialDialog;->positiveButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    .line 133
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$id;->buttonDefaultNeutral:I

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v21

    check-cast v21, Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/afollestad/materialdialogs/MaterialDialog;->neutralButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    .line 134
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$id;->buttonDefaultNegative:I

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v21

    check-cast v21, Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/afollestad/materialdialogs/MaterialDialog;->negativeButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    .line 137
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputCallback:Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;

    move-object/from16 v21, v0

    if-eqz v21, :cond_1d9

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText:Ljava/lang/CharSequence;

    move-object/from16 v21, v0

    if-nez v21, :cond_1d9

    .line 138
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    const v22, 0x104000a

    invoke-virtual/range {v21 .. v22}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v21

    move-object/from16 v0, v21

    iput-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText:Ljava/lang/CharSequence;

    .line 141
    :cond_1d9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->positiveButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v22, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText:Ljava/lang/CharSequence;

    move-object/from16 v21, v0

    if-eqz v21, :cond_6f3

    const/16 v21, 0x0

    :goto_1e7
    move-object/from16 v0, v22

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->setVisibility(I)V

    .line 142
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->neutralButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v22, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralText:Ljava/lang/CharSequence;

    move-object/from16 v21, v0

    if-eqz v21, :cond_6f7

    const/16 v21, 0x0

    :goto_1fc
    move-object/from16 v0, v22

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->setVisibility(I)V

    .line 143
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->negativeButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v22, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText:Ljava/lang/CharSequence;

    move-object/from16 v21, v0

    if-eqz v21, :cond_6fb

    const/16 v21, 0x0

    :goto_211
    move-object/from16 v0, v22

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->setVisibility(I)V

    .line 146
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->icon:Landroid/graphics/drawable/Drawable;

    move-object/from16 v21, v0

    if-eqz v21, :cond_6ff

    .line 147
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 148
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    move-object/from16 v21, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->icon:Landroid/graphics/drawable/Drawable;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 160
    :goto_236
    iget v11, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->maxIconSize:I

    .line 161
    .local v11, "maxIconSize":I
    const/16 v21, -0x1

    move/from16 v0, v21

    if-ne v11, v0, :cond_248

    .line 162
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_icon_max_size:I

    invoke-static/range {v21 .. v22}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDimension(Landroid/content/Context;I)I

    move-result v11

    .line 163
    :cond_248
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->limitIconToDefaultSize:Z

    move/from16 v21, v0

    if-nez v21, :cond_25a

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_icon_limit_icon_to_default_size:I

    invoke-static/range {v21 .. v22}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveBoolean(Landroid/content/Context;I)Z

    move-result v21

    if-eqz v21, :cond_268

    .line 164
    :cond_25a
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v21

    sget v22, Lcom/afollestad/materialdialogs/R$dimen;->md_icon_max_size:I

    invoke-virtual/range {v21 .. v22}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    .line 165
    :cond_268
    const/16 v21, -0x1

    move/from16 v0, v21

    if-le v11, v0, :cond_298

    .line 166
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    move-object/from16 v21, v0

    const/16 v22, 0x1

    invoke-virtual/range {v21 .. v22}, Landroid/widget/ImageView;->setAdjustViewBounds(Z)V

    .line 167
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Landroid/widget/ImageView;->setMaxHeight(I)V

    .line 168
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Landroid/widget/ImageView;->setMaxWidth(I)V

    .line 169
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/widget/ImageView;->requestLayout()V

    .line 173
    :cond_298
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dividerColorSet:Z

    move/from16 v21, v0

    if-nez v21, :cond_2ba

    .line 174
    invoke-virtual/range {p0 .. p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v21

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_divider:I

    invoke-static/range {v21 .. v22}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v6

    .line 175
    .local v6, "dividerFallback":I
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_divider_color:I

    move-object/from16 v0, v21

    move/from16 v1, v22

    invoke-static {v0, v1, v6}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;II)I

    move-result v21

    move/from16 v0, v21

    iput v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dividerColor:I

    .line 177
    .end local v6    # "dividerFallback":I
    :cond_2ba
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    iget v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dividerColor:I

    move/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->setDividerColor(I)V

    .line 180
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->title:Landroid/widget/TextView;

    move-object/from16 v21, v0

    if-eqz v21, :cond_32c

    .line 181
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->title:Landroid/widget/TextView;

    move-object/from16 v21, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->mediumFont:Landroid/graphics/Typeface;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTypeface(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 182
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->title:Landroid/widget/TextView;

    move-object/from16 v21, v0

    iget v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleColor:I

    move/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Landroid/widget/TextView;->setTextColor(I)V

    .line 183
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->title:Landroid/widget/TextView;

    move-object/from16 v21, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/afollestad/materialdialogs/GravityEnum;->getGravityInt()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Landroid/widget/TextView;->setGravity(I)V

    .line 184
    sget v21, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v22, 0x11

    move/from16 v0, v21

    move/from16 v1, v22

    if-lt v0, v1, :cond_31b

    .line 186
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->title:Landroid/widget/TextView;

    move-object/from16 v21, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/afollestad/materialdialogs/GravityEnum;->getTextAlignment()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Landroid/widget/TextView;->setTextAlignment(I)V

    .line 189
    :cond_31b
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->title:Ljava/lang/CharSequence;

    move-object/from16 v21, v0

    if-nez v21, :cond_730

    .line 190
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->titleFrame:Landroid/view/View;

    move-object/from16 v21, v0

    const/16 v22, 0x8

    invoke-virtual/range {v21 .. v22}, Landroid/view/View;->setVisibility(I)V

    .line 198
    :cond_32c
    :goto_32c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    move-object/from16 v21, v0

    if-eqz v21, :cond_3d5

    .line 199
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    move-object/from16 v21, v0

    new-instance v22, Landroid/text/method/LinkMovementMethod;

    invoke-direct/range {v22 .. v22}, Landroid/text/method/LinkMovementMethod;-><init>()V

    invoke-virtual/range {v21 .. v22}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 200
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    move-object/from16 v21, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->regularFont:Landroid/graphics/Typeface;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTypeface(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 201
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    iget v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentLineSpacingMultiplier:F

    move/from16 v23, v0

    invoke-virtual/range {v21 .. v23}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 202
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColor:Landroid/content/res/ColorStateList;

    move-object/from16 v21, v0

    if-nez v21, :cond_74a

    .line 203
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    move-object/from16 v21, v0

    invoke-virtual/range {p0 .. p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v22

    const v23, 0x1010036

    invoke-static/range {v22 .. v23}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Landroid/widget/TextView;->setLinkTextColor(I)V

    .line 206
    :goto_37e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    move-object/from16 v21, v0

    iget v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor:I

    move/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Landroid/widget/TextView;->setTextColor(I)V

    .line 207
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    move-object/from16 v21, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/afollestad/materialdialogs/GravityEnum;->getGravityInt()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Landroid/widget/TextView;->setGravity(I)V

    .line 208
    sget v21, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v22, 0x11

    move/from16 v0, v21

    move/from16 v1, v22

    if-lt v0, v1, :cond_3b7

    .line 210
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    move-object/from16 v21, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/afollestad/materialdialogs/GravityEnum;->getTextAlignment()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Landroid/widget/TextView;->setTextAlignment(I)V

    .line 213
    :cond_3b7
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->content:Ljava/lang/CharSequence;

    move-object/from16 v21, v0

    if-eqz v21, :cond_759

    .line 214
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    move-object/from16 v21, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->content:Ljava/lang/CharSequence;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 215
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Landroid/widget/TextView;->setVisibility(I)V

    .line 222
    :cond_3d5
    :goto_3d5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->buttonsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->setButtonGravity(Lcom/afollestad/materialdialogs/GravityEnum;)V

    .line 223
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->setButtonStackedGravity(Lcom/afollestad/materialdialogs/GravityEnum;)V

    .line 224
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->forceStacking:Z

    move/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->setForceStack(Z)V

    .line 226
    sget v21, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v22, 0xe

    move/from16 v0, v21

    move/from16 v1, v22

    if-lt v0, v1, :cond_766

    .line 227
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    const v22, 0x101038c

    const/16 v23, 0x1

    invoke-static/range {v21 .. v23}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveBoolean(Landroid/content/Context;IZ)Z

    move-result v19

    .line 228
    .local v19, "textAllCaps":Z
    if-eqz v19, :cond_421

    .line 229
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->textAllCaps:I

    const/16 v23, 0x1

    invoke-static/range {v21 .. v23}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveBoolean(Landroid/content/Context;IZ)Z

    move-result v19

    .line 234
    :cond_421
    :goto_421
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->positiveButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v16, v0

    .line 235
    .local v16, "positiveTextView":Lcom/afollestad/materialdialogs/internal/MDButton;
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->mediumFont:Landroid/graphics/Typeface;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTypeface(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 236
    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->setAllCapsCompat(Z)V

    .line 237
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText:Ljava/lang/CharSequence;

    move-object/from16 v21, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->setText(Ljava/lang/CharSequence;)V

    .line 238
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColor:Landroid/content/res/ColorStateList;

    move-object/from16 v21, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 239
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->positiveButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v21, v0

    sget-object v22, Lcom/afollestad/materialdialogs/DialogAction;->POSITIVE:Lcom/afollestad/materialdialogs/DialogAction;

    const/16 v23, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lcom/afollestad/materialdialogs/MaterialDialog;->getButtonSelector(Lcom/afollestad/materialdialogs/DialogAction;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDButton;->setStackedSelector(Landroid/graphics/drawable/Drawable;)V

    .line 240
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->positiveButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v21, v0

    sget-object v22, Lcom/afollestad/materialdialogs/DialogAction;->POSITIVE:Lcom/afollestad/materialdialogs/DialogAction;

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lcom/afollestad/materialdialogs/MaterialDialog;->getButtonSelector(Lcom/afollestad/materialdialogs/DialogAction;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDButton;->setDefaultSelector(Landroid/graphics/drawable/Drawable;)V

    .line 241
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->positiveButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v21, v0

    sget-object v22, Lcom/afollestad/materialdialogs/DialogAction;->POSITIVE:Lcom/afollestad/materialdialogs/DialogAction;

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDButton;->setTag(Ljava/lang/Object;)V

    .line 242
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->positiveButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 243
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->positiveButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDButton;->setVisibility(I)V

    .line 245
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->negativeButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    .line 246
    .local v12, "negativeTextView":Lcom/afollestad/materialdialogs/internal/MDButton;
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->mediumFont:Landroid/graphics/Typeface;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v12, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTypeface(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 247
    move/from16 v0, v19

    invoke-virtual {v12, v0}, Lcom/afollestad/materialdialogs/internal/MDButton;->setAllCapsCompat(Z)V

    .line 248
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText:Ljava/lang/CharSequence;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Lcom/afollestad/materialdialogs/internal/MDButton;->setText(Ljava/lang/CharSequence;)V

    .line 249
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeColor:Landroid/content/res/ColorStateList;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Lcom/afollestad/materialdialogs/internal/MDButton;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 250
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->negativeButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v21, v0

    sget-object v22, Lcom/afollestad/materialdialogs/DialogAction;->NEGATIVE:Lcom/afollestad/materialdialogs/DialogAction;

    const/16 v23, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lcom/afollestad/materialdialogs/MaterialDialog;->getButtonSelector(Lcom/afollestad/materialdialogs/DialogAction;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDButton;->setStackedSelector(Landroid/graphics/drawable/Drawable;)V

    .line 251
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->negativeButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v21, v0

    sget-object v22, Lcom/afollestad/materialdialogs/DialogAction;->NEGATIVE:Lcom/afollestad/materialdialogs/DialogAction;

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lcom/afollestad/materialdialogs/MaterialDialog;->getButtonSelector(Lcom/afollestad/materialdialogs/DialogAction;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDButton;->setDefaultSelector(Landroid/graphics/drawable/Drawable;)V

    .line 252
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->negativeButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v21, v0

    sget-object v22, Lcom/afollestad/materialdialogs/DialogAction;->NEGATIVE:Lcom/afollestad/materialdialogs/DialogAction;

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDButton;->setTag(Ljava/lang/Object;)V

    .line 253
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->negativeButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 254
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->negativeButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDButton;->setVisibility(I)V

    .line 256
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->neutralButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    .line 257
    .local v13, "neutralTextView":Lcom/afollestad/materialdialogs/internal/MDButton;
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->mediumFont:Landroid/graphics/Typeface;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v13, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTypeface(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 258
    move/from16 v0, v19

    invoke-virtual {v13, v0}, Lcom/afollestad/materialdialogs/internal/MDButton;->setAllCapsCompat(Z)V

    .line 259
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralText:Ljava/lang/CharSequence;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/afollestad/materialdialogs/internal/MDButton;->setText(Ljava/lang/CharSequence;)V

    .line 260
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralColor:Landroid/content/res/ColorStateList;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/afollestad/materialdialogs/internal/MDButton;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 261
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->neutralButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v21, v0

    sget-object v22, Lcom/afollestad/materialdialogs/DialogAction;->NEUTRAL:Lcom/afollestad/materialdialogs/DialogAction;

    const/16 v23, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lcom/afollestad/materialdialogs/MaterialDialog;->getButtonSelector(Lcom/afollestad/materialdialogs/DialogAction;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDButton;->setStackedSelector(Landroid/graphics/drawable/Drawable;)V

    .line 262
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->neutralButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v21, v0

    sget-object v22, Lcom/afollestad/materialdialogs/DialogAction;->NEUTRAL:Lcom/afollestad/materialdialogs/DialogAction;

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lcom/afollestad/materialdialogs/MaterialDialog;->getButtonSelector(Lcom/afollestad/materialdialogs/DialogAction;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDButton;->setDefaultSelector(Landroid/graphics/drawable/Drawable;)V

    .line 263
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->neutralButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v21, v0

    sget-object v22, Lcom/afollestad/materialdialogs/DialogAction;->NEUTRAL:Lcom/afollestad/materialdialogs/DialogAction;

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDButton;->setTag(Ljava/lang/Object;)V

    .line 264
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->neutralButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 265
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->neutralButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDButton;->setVisibility(I)V

    .line 268
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackMultiChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;

    move-object/from16 v21, v0

    if-eqz v21, :cond_5a1

    .line 269
    new-instance v21, Ljava/util/ArrayList;

    invoke-direct/range {v21 .. v21}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    .line 270
    :cond_5a1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    move-object/from16 v21, v0

    if-eqz v21, :cond_5fa

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    move-object/from16 v21, v0

    if-eqz v21, :cond_5ba

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v21, v0

    if-gtz v21, :cond_5c0

    :cond_5ba
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    move-object/from16 v21, v0

    if-eqz v21, :cond_5fa

    .line 271
    :cond_5c0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    move-object/from16 v21, v0

    invoke-virtual/range {p0 .. p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getListSelector()Landroid/graphics/drawable/Drawable;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Landroid/widget/ListView;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 275
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    move-object/from16 v21, v0

    if-nez v21, :cond_7a7

    .line 277
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackSingleChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;

    move-object/from16 v21, v0

    if-eqz v21, :cond_774

    .line 278
    sget-object v21, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->SINGLE:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    .line 286
    :cond_5e1
    :goto_5e1
    new-instance v21, Lcom/afollestad/materialdialogs/MaterialDialogAdapter;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->getLayoutForType(Lcom/afollestad/materialdialogs/MaterialDialog$ListType;)I

    move-result v22

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/afollestad/materialdialogs/MaterialDialogAdapter;-><init>(Lcom/afollestad/materialdialogs/MaterialDialog;I)V

    move-object/from16 v0, v21

    iput-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    .line 295
    :cond_5fa
    :goto_5fa
    invoke-static/range {p0 .. p0}, Lcom/afollestad/materialdialogs/DialogInit;->setupProgressDialog(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    .line 298
    invoke-static/range {p0 .. p0}, Lcom/afollestad/materialdialogs/DialogInit;->setupInputDialog(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    .line 301
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView:Landroid/view/View;

    move-object/from16 v21, v0

    if-eqz v21, :cond_698

    .line 302
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$id;->root:I

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v21

    check-cast v21, Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    invoke-virtual/range {v21 .. v21}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->noTitleNoPadding()V

    .line 303
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$id;->customViewFrame:I

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/FrameLayout;

    .line 304
    .local v8, "frame":Landroid/widget/FrameLayout;
    move-object/from16 v0, p0

    iput-object v8, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->customViewFrame:Landroid/widget/FrameLayout;

    .line 305
    iget-object v10, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView:Landroid/view/View;

    .line 306
    .local v10, "innerView":Landroid/view/View;
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->wrapCustomViewInScroll:Z

    move/from16 v21, v0

    if-eqz v21, :cond_68a

    .line 309
    invoke-virtual/range {p0 .. p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    .line 310
    .local v17, "r":Landroid/content/res/Resources;
    sget v21, Lcom/afollestad/materialdialogs/R$dimen;->md_dialog_frame_margin:I

    move-object/from16 v0, v17

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    .line 311
    .local v9, "framePadding":I
    new-instance v18, Landroid/widget/ScrollView;

    invoke-virtual/range {p0 .. p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v21

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 312
    .local v18, "sv":Landroid/widget/ScrollView;
    sget v21, Lcom/afollestad/materialdialogs/R$dimen;->md_content_padding_top:I

    move-object/from16 v0, v17

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v15

    .line 313
    .local v15, "paddingTop":I
    sget v21, Lcom/afollestad/materialdialogs/R$dimen;->md_content_padding_bottom:I

    move-object/from16 v0, v17

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v14

    .line 314
    .local v14, "paddingBottom":I
    const/16 v21, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setClipToPadding(Z)V

    .line 315
    instance-of v0, v10, Landroid/widget/EditText;

    move/from16 v21, v0

    if-eqz v21, :cond_7c6

    .line 317
    move-object/from16 v0, v18

    invoke-virtual {v0, v9, v15, v9, v14}, Landroid/widget/ScrollView;->setPadding(IIII)V

    .line 323
    :goto_678
    new-instance v21, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v22, -0x1

    const/16 v23, -0x2

    invoke-direct/range {v21 .. v23}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v10, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 326
    move-object/from16 v10, v18

    .line 328
    .end local v9    # "framePadding":I
    .end local v14    # "paddingBottom":I
    .end local v15    # "paddingTop":I
    .end local v17    # "r":Landroid/content/res/Resources;
    .end local v18    # "sv":Landroid/widget/ScrollView;
    :cond_68a
    new-instance v21, Landroid/view/ViewGroup$LayoutParams;

    const/16 v22, -0x1

    const/16 v23, -0x2

    invoke-direct/range {v21 .. v23}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    move-object/from16 v0, v21

    invoke-virtual {v8, v10, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 333
    .end local v8    # "frame":Landroid/widget/FrameLayout;
    .end local v10    # "innerView":Landroid/view/View;
    :cond_698
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->showListener:Landroid/content/DialogInterface$OnShowListener;

    move-object/from16 v21, v0

    if-eqz v21, :cond_6a9

    .line 334
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->showListener:Landroid/content/DialogInterface$OnShowListener;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 335
    :cond_6a9
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->cancelListener:Landroid/content/DialogInterface$OnCancelListener;

    move-object/from16 v21, v0

    if-eqz v21, :cond_6ba

    .line 336
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->cancelListener:Landroid/content/DialogInterface$OnCancelListener;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 337
    :cond_6ba
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dismissListener:Landroid/content/DialogInterface$OnDismissListener;

    move-object/from16 v21, v0

    if-eqz v21, :cond_6cb

    .line 338
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dismissListener:Landroid/content/DialogInterface$OnDismissListener;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 339
    :cond_6cb
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->keyListener:Landroid/content/DialogInterface$OnKeyListener;

    move-object/from16 v21, v0

    if-eqz v21, :cond_6dc

    .line 340
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->keyListener:Landroid/content/DialogInterface$OnKeyListener;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 343
    :cond_6dc
    invoke-virtual/range {p0 .. p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setOnShowListenerInternal()V

    .line 346
    invoke-virtual/range {p0 .. p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->invalidateList()V

    .line 347
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setViewInternal(Landroid/view/View;)V

    .line 348
    invoke-virtual/range {p0 .. p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->checkIfListInitScroll()V

    .line 349
    return-void

    .line 141
    .end local v11    # "maxIconSize":I
    .end local v12    # "negativeTextView":Lcom/afollestad/materialdialogs/internal/MDButton;
    .end local v13    # "neutralTextView":Lcom/afollestad/materialdialogs/internal/MDButton;
    .end local v16    # "positiveTextView":Lcom/afollestad/materialdialogs/internal/MDButton;
    .end local v19    # "textAllCaps":Z
    :cond_6f3
    const/16 v21, 0x8

    goto/16 :goto_1e7

    .line 142
    :cond_6f7
    const/16 v21, 0x8

    goto/16 :goto_1fc

    .line 143
    :cond_6fb
    const/16 v21, 0x8

    goto/16 :goto_211

    .line 150
    :cond_6ff
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_icon:I

    invoke-static/range {v21 .. v22}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 151
    .local v5, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v5, :cond_723

    .line 152
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 153
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_236

    .line 155
    :cond_723
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    move-object/from16 v21, v0

    const/16 v22, 0x8

    invoke-virtual/range {v21 .. v22}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_236

    .line 192
    .end local v5    # "d":Landroid/graphics/drawable/Drawable;
    .restart local v11    # "maxIconSize":I
    :cond_730
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->title:Landroid/widget/TextView;

    move-object/from16 v21, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->title:Ljava/lang/CharSequence;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 193
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->titleFrame:Landroid/view/View;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_32c

    .line 205
    :cond_74a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    move-object/from16 v21, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColor:Landroid/content/res/ColorStateList;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Landroid/widget/TextView;->setLinkTextColor(Landroid/content/res/ColorStateList;)V

    goto/16 :goto_37e

    .line 217
    :cond_759
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    move-object/from16 v21, v0

    const/16 v22, 0x8

    invoke-virtual/range {v21 .. v22}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_3d5

    .line 231
    :cond_766
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->textAllCaps:I

    const/16 v23, 0x1

    invoke-static/range {v21 .. v23}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveBoolean(Landroid/content/Context;IZ)Z

    move-result v19

    .restart local v19    # "textAllCaps":Z
    goto/16 :goto_421

    .line 279
    .restart local v12    # "negativeTextView":Lcom/afollestad/materialdialogs/internal/MDButton;
    .restart local v13    # "neutralTextView":Lcom/afollestad/materialdialogs/internal/MDButton;
    .restart local v16    # "positiveTextView":Lcom/afollestad/materialdialogs/internal/MDButton;
    :cond_774
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackMultiChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;

    move-object/from16 v21, v0

    if-eqz v21, :cond_79d

    .line 280
    sget-object v21, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->MULTI:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    .line 281
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndices:[Ljava/lang/Integer;

    move-object/from16 v21, v0

    if-eqz v21, :cond_5e1

    .line 282
    new-instance v21, Ljava/util/ArrayList;

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndices:[Ljava/lang/Integer;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    goto/16 :goto_5e1

    .line 284
    :cond_79d
    sget-object v21, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->REGULAR:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    goto/16 :goto_5e1

    .line 288
    :cond_7a7
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    instance-of v0, v0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;

    move/from16 v21, v0

    if-eqz v21, :cond_5fa

    .line 290
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    move-object/from16 v21, v0

    check-cast v21, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;

    const/16 v22, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    move/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;->setDialog(Lcom/afollestad/materialdialogs/MaterialDialog;Z)V

    goto/16 :goto_5fa

    .line 320
    .restart local v8    # "frame":Landroid/widget/FrameLayout;
    .restart local v9    # "framePadding":I
    .restart local v10    # "innerView":Landroid/view/View;
    .restart local v14    # "paddingBottom":I
    .restart local v15    # "paddingTop":I
    .restart local v17    # "r":Landroid/content/res/Resources;
    .restart local v18    # "sv":Landroid/widget/ScrollView;
    :cond_7c6
    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v21

    move/from16 v2, v22

    invoke-virtual {v0, v1, v15, v2, v14}, Landroid/widget/ScrollView;->setPadding(IIII)V

    .line 321
    const/16 v21, 0x0

    const/16 v22, 0x0

    move/from16 v0, v21

    move/from16 v1, v22

    invoke-virtual {v10, v9, v0, v9, v1}, Landroid/view/View;->setPadding(IIII)V

    goto/16 :goto_678
.end method

.method private static setupInputDialog(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 6
    .param p0, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;

    .prologue
    const/4 v4, -0x1

    .line 400
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 401
    .local v0, "builder":Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    const v2, 0x1020009

    invoke-virtual {v1, v2}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    .line 402
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    if-nez v1, :cond_15

    .line 429
    :goto_14
    return-void

    .line 403
    :cond_15
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    iget-object v2, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->regularFont:Landroid/graphics/Typeface;

    invoke-virtual {p0, v1, v2}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTypeface(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 404
    iget-object v1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputPrefill:Ljava/lang/CharSequence;

    if-eqz v1, :cond_27

    .line 405
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    iget-object v2, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputPrefill:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 406
    :cond_27
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setInternalInputCallback()V

    .line 407
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    iget-object v2, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputHint:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 408
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->setSingleLine()V

    .line 409
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    iget v2, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor:I

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setTextColor(I)V

    .line 410
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    iget v2, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor:I

    const v3, 0x3e99999a    # 0.3f

    invoke-static {v2, v3}, Lcom/afollestad/materialdialogs/util/DialogUtils;->adjustAlpha(IF)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 411
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    invoke-static {v1, v2}, Lcom/afollestad/materialdialogs/internal/MDTintHelper;->setTint(Landroid/widget/EditText;I)V

    .line 413
    iget v1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputType:I

    if-eq v1, v4, :cond_70

    .line 414
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    iget v2, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputType:I

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 415
    iget v1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputType:I

    and-int/lit16 v1, v1, 0x80

    const/16 v2, 0x80

    if-ne v1, v2, :cond_70

    .line 417
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 421
    :cond_70
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    sget v2, Lcom/afollestad/materialdialogs/R$id;->minMax:I

    invoke-virtual {v1, v2}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->inputMinMax:Landroid/widget/TextView;

    .line 422
    iget v1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMaxLength:I

    if-le v1, v4, :cond_9a

    .line 423
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    iget-boolean v1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputAllowEmpty:Z

    if-nez v1, :cond_98

    const/4 v1, 0x1

    :goto_93
    invoke-virtual {p0, v2, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->invalidateInputMinMaxIndicator(IZ)V

    goto/16 :goto_14

    :cond_98
    const/4 v1, 0x0

    goto :goto_93

    .line 426
    :cond_9a
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->inputMinMax:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 427
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->inputMinMax:Landroid/widget/TextView;

    goto/16 :goto_14
.end method

.method private static setupProgressDialog(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 10
    .param p0, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 352
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 353
    .local v0, "builder":Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    iget-boolean v2, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateProgress:Z

    if-nez v2, :cond_d

    iget v2, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progress:I

    const/4 v3, -0x2

    if-le v2, v3, :cond_1e

    .line 354
    :cond_d
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    const v3, 0x102000d

    invoke-virtual {v2, v3}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ProgressBar;

    iput-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    .line 355
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    if-nez v2, :cond_1f

    .line 397
    :cond_1e
    :goto_1e
    return-void

    .line 357
    :cond_1f
    iget-boolean v2, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateProgress:Z

    if-eqz v2, :cond_e9

    iget-boolean v2, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateIsHorizontalProgress:Z

    if-nez v2, :cond_e9

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xe

    if-lt v2, v3, :cond_e9

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-ge v2, v3, :cond_e9

    .line 360
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    new-instance v3, Lcom/afollestad/materialdialogs/progress/CircularProgressDrawable;

    iget v4, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    iget-object v5, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/afollestad/materialdialogs/R$dimen;->circular_progress_border:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v5

    invoke-direct {v3, v4, v5}, Lcom/afollestad/materialdialogs/progress/CircularProgressDrawable;-><init>(IF)V

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 362
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    iget v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    invoke-static {v2, v3, v8}, Lcom/afollestad/materialdialogs/internal/MDTintHelper;->setTint(Landroid/widget/ProgressBar;IZ)V

    .line 367
    :goto_52
    iget-boolean v2, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateProgress:Z

    if-eqz v2, :cond_5a

    iget-boolean v2, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateIsHorizontalProgress:Z

    if-eqz v2, :cond_1e

    .line 368
    :cond_5a
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    iget-boolean v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateIsHorizontalProgress:Z

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 369
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v7}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 370
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    iget v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressMax:I

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 371
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    sget v3, Lcom/afollestad/materialdialogs/R$id;->label:I

    invoke-virtual {v2, v3}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressLabel:Landroid/widget/TextView;

    .line 372
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressLabel:Landroid/widget/TextView;

    if-eqz v2, :cond_98

    .line 373
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressLabel:Landroid/widget/TextView;

    iget v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 374
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressLabel:Landroid/widget/TextView;

    iget-object v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->mediumFont:Landroid/graphics/Typeface;

    invoke-virtual {p0, v2, v3}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTypeface(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 375
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressLabel:Landroid/widget/TextView;

    iget-object v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressPercentFormat:Ljava/text/NumberFormat;

    const-wide/16 v4, 0x0

    invoke-virtual {v3, v4, v5}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 377
    :cond_98
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    sget v3, Lcom/afollestad/materialdialogs/R$id;->minMax:I

    invoke-virtual {v2, v3}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressMinMax:Landroid/widget/TextView;

    .line 378
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressMinMax:Landroid/widget/TextView;

    if-eqz v2, :cond_fb

    .line 379
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressMinMax:Landroid/widget/TextView;

    iget v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 380
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressMinMax:Landroid/widget/TextView;

    iget-object v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->regularFont:Landroid/graphics/Typeface;

    invoke-virtual {p0, v2, v3}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTypeface(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 382
    iget-boolean v2, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->showMinMax:Z

    if-eqz v2, :cond_f2

    .line 383
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressMinMax:Landroid/widget/TextView;

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 384
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressMinMax:Landroid/widget/TextView;

    iget-object v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressNumberFormat:Ljava/lang/String;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    iget v5, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressMax:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 386
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2}, Landroid/widget/ProgressBar;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 387
    .local v1, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    iput v7, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 388
    iput v7, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    goto/16 :goto_1e

    .line 364
    .end local v1    # "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_e9
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    iget v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    invoke-static {v2, v3}, Lcom/afollestad/materialdialogs/internal/MDTintHelper;->setTint(Landroid/widget/ProgressBar;I)V

    goto/16 :goto_52

    .line 390
    :cond_f2
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressMinMax:Landroid/widget/TextView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_1e

    .line 393
    :cond_fb
    iput-boolean v7, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->showMinMax:Z

    goto/16 :goto_1e
.end method
