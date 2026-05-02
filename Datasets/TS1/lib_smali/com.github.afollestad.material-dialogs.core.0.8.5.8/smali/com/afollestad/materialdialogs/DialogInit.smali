.class Lcom/afollestad/materialdialogs/DialogInit;
.super Ljava/lang/Object;
.source "DialogInit.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInflateLayout(Lcom/afollestad/materialdialogs/MaterialDialog$Builder;)I
    .registers 3
    .param p0, "builder"    # Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .annotation build Landroid/support/annotation/LayoutRes;
    .end annotation

    .prologue
    .line 54
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView:Landroid/view/View;

    if-eqz v0, :cond_7

    .line 55
    sget v0, Lcom/afollestad/materialdialogs/R$layout;->md_dialog_custom:I

    .line 67
    :goto_6
    return v0

    .line 56
    :cond_7
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    array-length v0, v0

    if-gtz v0, :cond_14

    :cond_10
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_17

    .line 57
    :cond_14
    sget v0, Lcom/afollestad/materialdialogs/R$layout;->md_dialog_list:I

    goto :goto_6

    .line 58
    :cond_17
    iget v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progress:I

    const/4 v1, -0x2

    if-le v0, v1, :cond_1f

    .line 59
    sget v0, Lcom/afollestad/materialdialogs/R$layout;->md_dialog_progress:I

    goto :goto_6

    .line 60
    :cond_1f
    iget-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateProgress:Z

    if-eqz v0, :cond_2d

    .line 61
    iget-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateIsHorizontalProgress:Z

    if-eqz v0, :cond_2a

    .line 62
    sget v0, Lcom/afollestad/materialdialogs/R$layout;->md_dialog_progress_indeterminate_horizontal:I

    goto :goto_6

    .line 63
    :cond_2a
    sget v0, Lcom/afollestad/materialdialogs/R$layout;->md_dialog_progress_indeterminate:I

    goto :goto_6

    .line 64
    :cond_2d
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputCallback:Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;

    if-eqz v0, :cond_34

    .line 65
    sget v0, Lcom/afollestad/materialdialogs/R$layout;->md_dialog_input:I

    goto :goto_6

    .line 67
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
    .line 47
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    sget v3, Lcom/afollestad/materialdialogs/R$attr;->md_dark_theme:I

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->theme:Lcom/afollestad/materialdialogs/Theme;

    sget-object v4, Lcom/afollestad/materialdialogs/Theme;->DARK:Lcom/afollestad/materialdialogs/Theme;

    if-ne v1, v4, :cond_1a

    const/4 v1, 0x1

    :goto_b
    invoke-static {v2, v3, v1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveBoolean(Landroid/content/Context;IZ)Z

    move-result v0

    .line 48
    .local v0, "darkTheme":Z
    if-eqz v0, :cond_1c

    sget-object v1, Lcom/afollestad/materialdialogs/Theme;->DARK:Lcom/afollestad/materialdialogs/Theme;

    :goto_13
    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->theme:Lcom/afollestad/materialdialogs/Theme;

    .line 49
    if-eqz v0, :cond_1f

    sget v1, Lcom/afollestad/materialdialogs/R$style;->MD_Dark:I

    :goto_19
    return v1

    .line 47
    .end local v0    # "darkTheme":Z
    :cond_1a
    const/4 v1, 0x0

    goto :goto_b

    .line 48
    .restart local v0    # "darkTheme":Z
    :cond_1c
    sget-object v1, Lcom/afollestad/materialdialogs/Theme;->LIGHT:Lcom/afollestad/materialdialogs/Theme;

    goto :goto_13

    .line 49
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
    .line 73
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 76
    .local v3, "builder":Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->cancelable:Z

    move/from16 v21, v0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setCancelable(Z)V

    .line 77
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->canceledOnTouchOutside:Z

    move/from16 v21, v0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setCanceledOnTouchOutside(Z)V

    .line 78
    iget v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->backgroundColor:I

    move/from16 v21, v0

    if-nez v21, :cond_2e

    .line 79
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_background_color:I

    invoke-static/range {v21 .. v22}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v21

    move/from16 v0, v21

    iput v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->backgroundColor:I

    .line 80
    :cond_2e
    iget v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->backgroundColor:I

    move/from16 v21, v0

    if-eqz v21, :cond_60

    .line 81
    new-instance v7, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v7}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 82
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

    .line 83
    iget v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->backgroundColor:I

    move/from16 v21, v0

    move/from16 v0, v21

    invoke-virtual {v7, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 84
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-static {v0, v7}, Lcom/afollestad/materialdialogs/util/DialogUtils;->setBackgroundCompat(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 88
    .end local v7    # "drawable":Landroid/graphics/drawable/GradientDrawable;
    :cond_60
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColorSet:Z

    move/from16 v21, v0

    if-nez v21, :cond_78

    .line 89
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_positive_color:I

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColor:Landroid/content/res/ColorStateList;

    move-object/from16 v23, v0

    invoke-static/range {v21 .. v23}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveActionTextColorStateList(Landroid/content/Context;ILandroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object v21

    move-object/from16 v0, v21

    iput-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColor:Landroid/content/res/ColorStateList;

    .line 90
    :cond_78
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralColorSet:Z

    move/from16 v21, v0

    if-nez v21, :cond_90

    .line 91
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_neutral_color:I

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralColor:Landroid/content/res/ColorStateList;

    move-object/from16 v23, v0

    invoke-static/range {v21 .. v23}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveActionTextColorStateList(Landroid/content/Context;ILandroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object v21

    move-object/from16 v0, v21

    iput-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralColor:Landroid/content/res/ColorStateList;

    .line 92
    :cond_90
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeColorSet:Z

    move/from16 v21, v0

    if-nez v21, :cond_a8

    .line 93
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_negative_color:I

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeColor:Landroid/content/res/ColorStateList;

    move-object/from16 v23, v0

    invoke-static/range {v21 .. v23}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveActionTextColorStateList(Landroid/content/Context;ILandroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object v21

    move-object/from16 v0, v21

    iput-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeColor:Landroid/content/res/ColorStateList;

    .line 94
    :cond_a8
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColorSet:Z

    move/from16 v21, v0

    if-nez v21, :cond_c0

    .line 95
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_widget_color:I

    iget v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    move/from16 v23, v0

    invoke-static/range {v21 .. v23}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;II)I

    move-result v21

    move/from16 v0, v21

    iput v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    .line 98
    :cond_c0
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleColorSet:Z

    move/from16 v21, v0

    if-nez v21, :cond_e5

    .line 99
    invoke-virtual/range {p0 .. p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v21

    const v22, 0x1010036

    invoke-static/range {v21 .. v22}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v20

    .line 100
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

    .line 110
    .end local v20    # "titleColorFallback":I
    :cond_e5
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColorSet:Z

    move/from16 v21, v0

    if-nez v21, :cond_108

    .line 111
    invoke-virtual/range {p0 .. p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v21

    const v22, 0x1010038

    invoke-static/range {v21 .. v22}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v4

    .line 112
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

    .line 122
    .end local v4    # "contentColorFallback":I
    :cond_108
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemColorSet:Z

    move/from16 v21, v0

    if-nez v21, :cond_120

    .line 123
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_item_color:I

    iget v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor:I

    move/from16 v23, v0

    invoke-static/range {v21 .. v23}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;II)I

    move-result v21

    move/from16 v0, v21

    iput v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemColor:I

    .line 126
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

    .line 127
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

    .line 128
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$id;->titleFrame:I

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/afollestad/materialdialogs/MaterialDialog;->titleFrame:Landroid/view/View;

    .line 129
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

    .line 130
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

    .line 133
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

    .line 134
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

    .line 135
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

    .line 138
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputCallback:Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;

    move-object/from16 v21, v0

    if-eqz v21, :cond_1d9

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText:Ljava/lang/CharSequence;

    move-object/from16 v21, v0

    if-nez v21, :cond_1d9

    .line 139
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    const v22, 0x104000a

    invoke-virtual/range {v21 .. v22}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v21

    move-object/from16 v0, v21

    iput-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText:Ljava/lang/CharSequence;

    .line 142
    :cond_1d9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->positiveButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v22, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText:Ljava/lang/CharSequence;

    move-object/from16 v21, v0

    if-eqz v21, :cond_704

    const/16 v21, 0x0

    :goto_1e7
    move-object/from16 v0, v22

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->setVisibility(I)V

    .line 143
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->neutralButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v22, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralText:Ljava/lang/CharSequence;

    move-object/from16 v21, v0

    if-eqz v21, :cond_708

    const/16 v21, 0x0

    :goto_1fc
    move-object/from16 v0, v22

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->setVisibility(I)V

    .line 144
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->negativeButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    move-object/from16 v22, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText:Ljava/lang/CharSequence;

    move-object/from16 v21, v0

    if-eqz v21, :cond_70c

    const/16 v21, 0x0

    :goto_211
    move-object/from16 v0, v22

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->setVisibility(I)V

    .line 147
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->icon:Landroid/graphics/drawable/Drawable;

    move-object/from16 v21, v0

    if-eqz v21, :cond_710

    .line 148
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 149
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    move-object/from16 v21, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->icon:Landroid/graphics/drawable/Drawable;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 161
    :goto_236
    iget v11, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->maxIconSize:I

    .line 162
    .local v11, "maxIconSize":I
    const/16 v21, -0x1

    move/from16 v0, v21

    if-ne v11, v0, :cond_248

    .line 163
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_icon_max_size:I

    invoke-static/range {v21 .. v22}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDimension(Landroid/content/Context;I)I

    move-result v11

    .line 164
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

    .line 165
    :cond_25a
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v21

    sget v22, Lcom/afollestad/materialdialogs/R$dimen;->md_icon_max_size:I

    invoke-virtual/range {v21 .. v22}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    .line 166
    :cond_268
    const/16 v21, -0x1

    move/from16 v0, v21

    if-le v11, v0, :cond_298

    .line 167
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    move-object/from16 v21, v0

    const/16 v22, 0x1

    invoke-virtual/range {v21 .. v22}, Landroid/widget/ImageView;->setAdjustViewBounds(Z)V

    .line 168
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Landroid/widget/ImageView;->setMaxHeight(I)V

    .line 169
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Landroid/widget/ImageView;->setMaxWidth(I)V

    .line 170
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/widget/ImageView;->requestLayout()V

    .line 174
    :cond_298
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dividerColorSet:Z

    move/from16 v21, v0

    if-nez v21, :cond_2ba

    .line 175
    invoke-virtual/range {p0 .. p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v21

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_divider:I

    invoke-static/range {v21 .. v22}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v6

    .line 176
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

    .line 178
    .end local v6    # "dividerFallback":I
    :cond_2ba
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    iget v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dividerColor:I

    move/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->setDividerColor(I)V

    .line 181
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->title:Landroid/widget/TextView;

    move-object/from16 v21, v0

    if-eqz v21, :cond_32c

    .line 182
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->title:Landroid/widget/TextView;

    move-object/from16 v21, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->mediumFont:Landroid/graphics/Typeface;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTypeface(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 183
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->title:Landroid/widget/TextView;

    move-object/from16 v21, v0

    iget v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleColor:I

    move/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Landroid/widget/TextView;->setTextColor(I)V

    .line 184
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->title:Landroid/widget/TextView;

    move-object/from16 v21, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/afollestad/materialdialogs/GravityEnum;->getGravityInt()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Landroid/widget/TextView;->setGravity(I)V

    .line 185
    sget v21, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v22, 0x11

    move/from16 v0, v21

    move/from16 v1, v22

    if-lt v0, v1, :cond_31b

    .line 187
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->title:Landroid/widget/TextView;

    move-object/from16 v21, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/afollestad/materialdialogs/GravityEnum;->getTextAlignment()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Landroid/widget/TextView;->setTextAlignment(I)V

    .line 190
    :cond_31b
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->title:Ljava/lang/CharSequence;

    move-object/from16 v21, v0

    if-nez v21, :cond_741

    .line 191
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->titleFrame:Landroid/view/View;

    move-object/from16 v21, v0

    const/16 v22, 0x8

    invoke-virtual/range {v21 .. v22}, Landroid/view/View;->setVisibility(I)V

    .line 199
    :cond_32c
    :goto_32c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    move-object/from16 v21, v0

    if-eqz v21, :cond_3d5

    .line 200
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    move-object/from16 v21, v0

    new-instance v22, Landroid/text/method/LinkMovementMethod;

    invoke-direct/range {v22 .. v22}, Landroid/text/method/LinkMovementMethod;-><init>()V

    invoke-virtual/range {v21 .. v22}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 201
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    move-object/from16 v21, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->regularFont:Landroid/graphics/Typeface;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTypeface(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 202
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    iget v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentLineSpacingMultiplier:F

    move/from16 v23, v0

    invoke-virtual/range {v21 .. v23}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 203
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->linkColor:Landroid/content/res/ColorStateList;

    move-object/from16 v21, v0

    if-nez v21, :cond_75b

    .line 204
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

    if-eqz v21, :cond_76a

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

    if-lt v0, v1, :cond_777

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

    if-nez v21, :cond_7be

    .line 277
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackSingleChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;

    move-object/from16 v21, v0

    if-eqz v21, :cond_785

    .line 278
    sget-object v21, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->SINGLE:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    .line 288
    :cond_5e1
    :goto_5e1
    new-instance v21, Lcom/afollestad/materialdialogs/DefaultAdapter;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->getLayoutForType(Lcom/afollestad/materialdialogs/MaterialDialog$ListType;)I

    move-result v22

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/afollestad/materialdialogs/DefaultAdapter;-><init>(Lcom/afollestad/materialdialogs/MaterialDialog;I)V

    move-object/from16 v0, v21

    iput-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    .line 297
    :cond_5fa
    :goto_5fa
    invoke-static/range {p0 .. p0}, Lcom/afollestad/materialdialogs/DialogInit;->setupProgressDialog(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    .line 300
    invoke-static/range {p0 .. p0}, Lcom/afollestad/materialdialogs/DialogInit;->setupInputDialog(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    .line 303
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView:Landroid/view/View;

    move-object/from16 v21, v0

    if-eqz v21, :cond_6a9

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$id;->root:I

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v21

    check-cast v21, Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    invoke-virtual/range {v21 .. v21}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->noTitleNoPadding()V

    .line 305
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$id;->customViewFrame:I

    invoke-virtual/range {v21 .. v22}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/FrameLayout;

    .line 306
    .local v8, "frame":Landroid/widget/FrameLayout;
    move-object/from16 v0, p0

    iput-object v8, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->customViewFrame:Landroid/widget/FrameLayout;

    .line 307
    iget-object v10, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView:Landroid/view/View;

    .line 308
    .local v10, "innerView":Landroid/view/View;
    invoke-virtual {v10}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v21

    if-eqz v21, :cond_63c

    .line 309
    invoke-virtual {v10}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v21

    check-cast v21, Landroid/view/ViewGroup;

    move-object/from16 v0, v21

    invoke-virtual {v0, v10}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 310
    :cond_63c
    iget-boolean v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->wrapCustomViewInScroll:Z

    move/from16 v21, v0

    if-eqz v21, :cond_69b

    .line 313
    invoke-virtual/range {p0 .. p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    .line 314
    .local v17, "r":Landroid/content/res/Resources;
    sget v21, Lcom/afollestad/materialdialogs/R$dimen;->md_dialog_frame_margin:I

    move-object/from16 v0, v17

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    .line 315
    .local v9, "framePadding":I
    new-instance v18, Landroid/widget/ScrollView;

    invoke-virtual/range {p0 .. p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v21

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 316
    .local v18, "sv":Landroid/widget/ScrollView;
    sget v21, Lcom/afollestad/materialdialogs/R$dimen;->md_content_padding_top:I

    move-object/from16 v0, v17

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v15

    .line 317
    .local v15, "paddingTop":I
    sget v21, Lcom/afollestad/materialdialogs/R$dimen;->md_content_padding_bottom:I

    move-object/from16 v0, v17

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v14

    .line 318
    .local v14, "paddingBottom":I
    const/16 v21, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setClipToPadding(Z)V

    .line 319
    instance-of v0, v10, Landroid/widget/EditText;

    move/from16 v21, v0

    if-eqz v21, :cond_7d9

    .line 321
    move-object/from16 v0, v18

    invoke-virtual {v0, v9, v15, v9, v14}, Landroid/widget/ScrollView;->setPadding(IIII)V

    .line 327
    :goto_689
    new-instance v21, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v22, -0x1

    const/16 v23, -0x2

    invoke-direct/range {v21 .. v23}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v10, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 330
    move-object/from16 v10, v18

    .line 332
    .end local v9    # "framePadding":I
    .end local v14    # "paddingBottom":I
    .end local v15    # "paddingTop":I
    .end local v17    # "r":Landroid/content/res/Resources;
    .end local v18    # "sv":Landroid/widget/ScrollView;
    :cond_69b
    new-instance v21, Landroid/view/ViewGroup$LayoutParams;

    const/16 v22, -0x1

    const/16 v23, -0x2

    invoke-direct/range {v21 .. v23}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    move-object/from16 v0, v21

    invoke-virtual {v8, v10, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 337
    .end local v8    # "frame":Landroid/widget/FrameLayout;
    .end local v10    # "innerView":Landroid/view/View;
    :cond_6a9
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->showListener:Landroid/content/DialogInterface$OnShowListener;

    move-object/from16 v21, v0

    if-eqz v21, :cond_6ba

    .line 338
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->showListener:Landroid/content/DialogInterface$OnShowListener;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 339
    :cond_6ba
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->cancelListener:Landroid/content/DialogInterface$OnCancelListener;

    move-object/from16 v21, v0

    if-eqz v21, :cond_6cb

    .line 340
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->cancelListener:Landroid/content/DialogInterface$OnCancelListener;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 341
    :cond_6cb
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dismissListener:Landroid/content/DialogInterface$OnDismissListener;

    move-object/from16 v21, v0

    if-eqz v21, :cond_6dc

    .line 342
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dismissListener:Landroid/content/DialogInterface$OnDismissListener;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 343
    :cond_6dc
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->keyListener:Landroid/content/DialogInterface$OnKeyListener;

    move-object/from16 v21, v0

    if-eqz v21, :cond_6ed

    .line 344
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->keyListener:Landroid/content/DialogInterface$OnKeyListener;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 347
    :cond_6ed
    invoke-virtual/range {p0 .. p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setOnShowListenerInternal()V

    .line 350
    invoke-virtual/range {p0 .. p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->invalidateList()V

    .line 351
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setViewInternal(Landroid/view/View;)V

    .line 352
    invoke-virtual/range {p0 .. p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->checkIfListInitScroll()V

    .line 353
    return-void

    .line 142
    .end local v11    # "maxIconSize":I
    .end local v12    # "negativeTextView":Lcom/afollestad/materialdialogs/internal/MDButton;
    .end local v13    # "neutralTextView":Lcom/afollestad/materialdialogs/internal/MDButton;
    .end local v16    # "positiveTextView":Lcom/afollestad/materialdialogs/internal/MDButton;
    .end local v19    # "textAllCaps":Z
    :cond_704
    const/16 v21, 0x8

    goto/16 :goto_1e7

    .line 143
    :cond_708
    const/16 v21, 0x8

    goto/16 :goto_1fc

    .line 144
    :cond_70c
    const/16 v21, 0x8

    goto/16 :goto_211

    .line 151
    :cond_710
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    sget v22, Lcom/afollestad/materialdialogs/R$attr;->md_icon:I

    invoke-static/range {v21 .. v22}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 152
    .local v5, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v5, :cond_734

    .line 153
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 154
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_236

    .line 156
    :cond_734
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    move-object/from16 v21, v0

    const/16 v22, 0x8

    invoke-virtual/range {v21 .. v22}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_236

    .line 193
    .end local v5    # "d":Landroid/graphics/drawable/Drawable;
    .restart local v11    # "maxIconSize":I
    :cond_741
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->title:Landroid/widget/TextView;

    move-object/from16 v21, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->title:Ljava/lang/CharSequence;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 194
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->titleFrame:Landroid/view/View;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_32c

    .line 205
    :cond_75b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    move-object/from16 v21, v0

    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->linkColor:Landroid/content/res/ColorStateList;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Landroid/widget/TextView;->setLinkTextColor(Landroid/content/res/ColorStateList;)V

    goto/16 :goto_37e

    .line 217
    :cond_76a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    move-object/from16 v21, v0

    const/16 v22, 0x8

    invoke-virtual/range {v21 .. v22}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_3d5

    .line 231
    :cond_777
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
    :cond_785
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackMultiChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;

    move-object/from16 v21, v0

    if-eqz v21, :cond_7b4

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

    .line 283
    const/16 v21, 0x0

    move-object/from16 v0, v21

    iput-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndices:[Ljava/lang/Integer;

    goto/16 :goto_5e1

    .line 286
    :cond_7b4
    sget-object v21, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->REGULAR:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    goto/16 :goto_5e1

    .line 290
    :cond_7be
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    instance-of v0, v0, Lcom/afollestad/materialdialogs/internal/MDAdapter;

    move/from16 v21, v0

    if-eqz v21, :cond_5fa

    .line 292
    iget-object v0, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    move-object/from16 v21, v0

    check-cast v21, Lcom/afollestad/materialdialogs/internal/MDAdapter;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-interface {v0, v1}, Lcom/afollestad/materialdialogs/internal/MDAdapter;->setDialog(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    goto/16 :goto_5fa

    .line 324
    .restart local v8    # "frame":Landroid/widget/FrameLayout;
    .restart local v9    # "framePadding":I
    .restart local v10    # "innerView":Landroid/view/View;
    .restart local v14    # "paddingBottom":I
    .restart local v15    # "paddingTop":I
    .restart local v17    # "r":Landroid/content/res/Resources;
    .restart local v18    # "sv":Landroid/widget/ScrollView;
    :cond_7d9
    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v21

    move/from16 v2, v22

    invoke-virtual {v0, v1, v15, v2, v14}, Landroid/widget/ScrollView;->setPadding(IIII)V

    .line 325
    const/16 v21, 0x0

    const/16 v22, 0x0

    move/from16 v0, v21

    move/from16 v1, v22

    invoke-virtual {v10, v9, v0, v9, v1}, Landroid/view/View;->setPadding(IIII)V

    goto/16 :goto_689
.end method

.method private static setupInputDialog(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 6
    .param p0, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;

    .prologue
    const/4 v4, -0x1

    .line 417
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 418
    .local v0, "builder":Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    const v2, 0x1020009

    invoke-virtual {v1, v2}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    .line 419
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    if-nez v1, :cond_15

    .line 447
    :goto_14
    return-void

    .line 420
    :cond_15
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    iget-object v2, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->regularFont:Landroid/graphics/Typeface;

    invoke-virtual {p0, v1, v2}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTypeface(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 421
    iget-object v1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputPrefill:Ljava/lang/CharSequence;

    if-eqz v1, :cond_27

    .line 422
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    iget-object v2, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputPrefill:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 423
    :cond_27
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setInternalInputCallback()V

    .line 424
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    iget-object v2, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputHint:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 425
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->setSingleLine()V

    .line 426
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    iget v2, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor:I

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setTextColor(I)V

    .line 427
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    iget v2, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor:I

    const v3, 0x3e99999a    # 0.3f

    invoke-static {v2, v3}, Lcom/afollestad/materialdialogs/util/DialogUtils;->adjustAlpha(IF)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 428
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    invoke-static {v1, v2}, Lcom/afollestad/materialdialogs/internal/MDTintHelper;->setTint(Landroid/widget/EditText;I)V

    .line 430
    iget v1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputType:I

    if-eq v1, v4, :cond_76

    .line 431
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    iget v2, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputType:I

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 432
    iget v1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputType:I

    const/16 v2, 0x90

    if-eq v1, v2, :cond_76

    iget v1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputType:I

    and-int/lit16 v1, v1, 0x80

    const/16 v2, 0x80

    if-ne v1, v2, :cond_76

    .line 435
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 439
    :cond_76
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    sget v2, Lcom/afollestad/materialdialogs/R$id;->minMax:I

    invoke-virtual {v1, v2}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->inputMinMax:Landroid/widget/TextView;

    .line 440
    iget v1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMinLength:I

    if-gtz v1, :cond_8a

    iget v1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMaxLength:I

    if-le v1, v4, :cond_a4

    .line 441
    :cond_8a
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    iget-boolean v1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputAllowEmpty:Z

    if-nez v1, :cond_a2

    const/4 v1, 0x1

    :goto_9d
    invoke-virtual {p0, v2, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->invalidateInputMinMaxIndicator(IZ)V

    goto/16 :goto_14

    :cond_a2
    const/4 v1, 0x0

    goto :goto_9d

    .line 444
    :cond_a4
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->inputMinMax:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 445
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->inputMinMax:Landroid/widget/TextView;

    goto/16 :goto_14
.end method

.method private static setupProgressDialog(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 10
    .param p0, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;

    .prologue
    const/4 v8, 0x0

    .line 356
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 357
    .local v0, "builder":Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    iget-boolean v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateProgress:Z

    if-nez v3, :cond_c

    iget v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progress:I

    const/4 v4, -0x2

    if-le v3, v4, :cond_1d

    .line 358
    :cond_c
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    const v4, 0x102000d

    invoke-virtual {v3, v4}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ProgressBar;

    iput-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    .line 359
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    if-nez v3, :cond_1e

    .line 414
    :cond_1d
    :goto_1d
    return-void

    .line 361
    :cond_1e
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xe

    if-lt v3, v4, :cond_110

    .line 362
    iget-boolean v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateProgress:Z

    if-eqz v3, :cond_f6

    .line 363
    iget-boolean v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateIsHorizontalProgress:Z

    if-eqz v3, :cond_dc

    .line 364
    new-instance v1, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3}, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;-><init>(Landroid/content/Context;)V

    .line 365
    .local v1, "d":Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;
    iget v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    invoke-virtual {v1, v3}, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->setTint(I)V

    .line 366
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v3, v1}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 367
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v3, v1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 384
    .end local v1    # "d":Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;
    :goto_44
    iget-boolean v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateProgress:Z

    if-eqz v3, :cond_4c

    iget-boolean v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateIsHorizontalProgress:Z

    if-eqz v3, :cond_1d

    .line 385
    :cond_4c
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    iget-boolean v4, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateIsHorizontalProgress:Z

    invoke-virtual {v3, v4}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 386
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v3, v8}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 387
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    iget v4, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressMax:I

    invoke-virtual {v3, v4}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 388
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    sget v4, Lcom/afollestad/materialdialogs/R$id;->label:I

    invoke-virtual {v3, v4}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressLabel:Landroid/widget/TextView;

    .line 389
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressLabel:Landroid/widget/TextView;

    if-eqz v3, :cond_8a

    .line 390
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressLabel:Landroid/widget/TextView;

    iget v4, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 391
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressLabel:Landroid/widget/TextView;

    iget-object v4, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->mediumFont:Landroid/graphics/Typeface;

    invoke-virtual {p0, v3, v4}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTypeface(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 392
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressLabel:Landroid/widget/TextView;

    iget-object v4, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressPercentFormat:Ljava/text/NumberFormat;

    const-wide/16 v5, 0x0

    invoke-virtual {v4, v5, v6}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 394
    :cond_8a
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    sget v4, Lcom/afollestad/materialdialogs/R$id;->minMax:I

    invoke-virtual {v3, v4}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressMinMax:Landroid/widget/TextView;

    .line 395
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressMinMax:Landroid/widget/TextView;

    if-eqz v3, :cond_122

    .line 396
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressMinMax:Landroid/widget/TextView;

    iget v4, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 397
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressMinMax:Landroid/widget/TextView;

    iget-object v4, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->regularFont:Landroid/graphics/Typeface;

    invoke-virtual {p0, v3, v4}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTypeface(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 399
    iget-boolean v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->showMinMax:Z

    if-eqz v3, :cond_119

    .line 400
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressMinMax:Landroid/widget/TextView;

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 401
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressMinMax:Landroid/widget/TextView;

    iget-object v4, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressNumberFormat:Ljava/lang/String;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    const/4 v6, 0x1

    iget v7, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressMax:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 403
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v3}, Landroid/widget/ProgressBar;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 404
    .local v2, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    iput v8, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 405
    iput v8, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    goto/16 :goto_1d

    .line 369
    .end local v2    # "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_dc
    new-instance v1, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawable;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawable;-><init>(Landroid/content/Context;)V

    .line 370
    .local v1, "d":Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawable;
    iget v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    invoke-virtual {v1, v3}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawable;->setTint(I)V

    .line 371
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v3, v1}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 372
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v3, v1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_44

    .line 375
    .end local v1    # "d":Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawable;
    :cond_f6
    new-instance v1, Lme/zhanghai/android/materialprogressbar/HorizontalProgressDrawable;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3}, Lme/zhanghai/android/materialprogressbar/HorizontalProgressDrawable;-><init>(Landroid/content/Context;)V

    .line 376
    .local v1, "d":Lme/zhanghai/android/materialprogressbar/HorizontalProgressDrawable;
    iget v3, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    invoke-virtual {v1, v3}, Lme/zhanghai/android/materialprogressbar/HorizontalProgressDrawable;->setTint(I)V

    .line 377
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v3, v1}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 378
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v3, v1}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_44

    .line 381
    .end local v1    # "d":Lme/zhanghai/android/materialprogressbar/HorizontalProgressDrawable;
    :cond_110
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    iget v4, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    invoke-static {v3, v4}, Lcom/afollestad/materialdialogs/internal/MDTintHelper;->setTint(Landroid/widget/ProgressBar;I)V

    goto/16 :goto_44

    .line 407
    :cond_119
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgressMinMax:Landroid/widget/TextView;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_1d

    .line 410
    :cond_122
    iput-boolean v8, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->showMinMax:Z

    goto/16 :goto_1d
.end method
