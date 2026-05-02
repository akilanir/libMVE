.class Lcom/mikepenz/iconics/context/IconicsFactory;
.super Ljava/lang/Object;
.source "IconicsFactory.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method getDrawable(Landroid/content/Context;Landroid/content/res/TypedArray;Ljava/lang/String;)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "a"    # Landroid/content/res/TypedArray;
    .param p3, "icon"    # Ljava/lang/String;

    .prologue
    .line 99
    sget v10, Lcom/mikepenz/iconics/core/R$styleable;->Iconics_ico_color:I

    const/4 v11, 0x0

    invoke-virtual {p2, v10, v11}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    .line 100
    .local v1, "color":I
    sget v10, Lcom/mikepenz/iconics/core/R$styleable;->Iconics_ico_size:I

    const/4 v11, -0x1

    invoke-virtual {p2, v10, v11}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v9

    .line 101
    .local v9, "size":I
    sget v10, Lcom/mikepenz/iconics/core/R$styleable;->Iconics_ico_offset_x:I

    const/4 v11, -0x1

    invoke-virtual {p2, v10, v11}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    .line 102
    .local v6, "offsetX":I
    sget v10, Lcom/mikepenz/iconics/core/R$styleable;->Iconics_ico_offset_y:I

    const/4 v11, -0x1

    invoke-virtual {p2, v10, v11}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v7

    .line 103
    .local v7, "offsetY":I
    sget v10, Lcom/mikepenz/iconics/core/R$styleable;->Iconics_ico_padding:I

    const/4 v11, -0x1

    invoke-virtual {p2, v10, v11}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v8

    .line 104
    .local v8, "padding":I
    sget v10, Lcom/mikepenz/iconics/core/R$styleable;->Iconics_ico_contour_color:I

    const/4 v11, 0x0

    invoke-virtual {p2, v10, v11}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    .line 105
    .local v2, "contourColor":I
    sget v10, Lcom/mikepenz/iconics/core/R$styleable;->Iconics_ico_contour_width:I

    const/4 v11, -0x1

    invoke-virtual {p2, v10, v11}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    .line 106
    .local v3, "contourWidth":I
    sget v10, Lcom/mikepenz/iconics/core/R$styleable;->Iconics_ico_background_color:I

    const/4 v11, 0x0

    invoke-virtual {p2, v10, v11}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    .line 107
    .local v0, "backgroundColor":I
    sget v10, Lcom/mikepenz/iconics/core/R$styleable;->Iconics_ico_corner_radius:I

    const/4 v11, -0x1

    invoke-virtual {p2, v10, v11}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    .line 109
    .local v4, "cornerRadius":I
    new-instance v5, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-direct {v5, p1, p3}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 111
    .local v5, "drawable":Lcom/mikepenz/iconics/IconicsDrawable;
    if-eqz v1, :cond_49

    .line 112
    invoke-virtual {v5, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 114
    :cond_49
    const/4 v10, -0x1

    if-eq v9, v10, :cond_4f

    .line 115
    invoke-virtual {v5, v9}, Lcom/mikepenz/iconics/IconicsDrawable;->sizePx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 117
    :cond_4f
    const/4 v10, -0x1

    if-eq v6, v10, :cond_55

    .line 118
    invoke-virtual {v5, v6}, Lcom/mikepenz/iconics/IconicsDrawable;->iconOffsetXPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 120
    :cond_55
    const/4 v10, -0x1

    if-eq v7, v10, :cond_5b

    .line 121
    invoke-virtual {v5, v7}, Lcom/mikepenz/iconics/IconicsDrawable;->iconOffsetYPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 123
    :cond_5b
    const/4 v10, -0x1

    if-eq v8, v10, :cond_61

    .line 124
    invoke-virtual {v5, v8}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 126
    :cond_61
    if-eqz v2, :cond_66

    .line 127
    invoke-virtual {v5, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->contourColor(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 129
    :cond_66
    const/4 v10, -0x1

    if-eq v3, v10, :cond_6c

    .line 130
    invoke-virtual {v5, v3}, Lcom/mikepenz/iconics/IconicsDrawable;->contourWidthPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 132
    :cond_6c
    if-eqz v0, :cond_71

    .line 133
    invoke-virtual {v5, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->backgroundColor(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 135
    :cond_71
    const/4 v10, -0x1

    if-eq v4, v10, :cond_77

    .line 136
    invoke-virtual {v5, v4}, Lcom/mikepenz/iconics/IconicsDrawable;->roundedCornersPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 139
    :cond_77
    return-object v5
.end method

.method public onViewCreated(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 27
    if-eqz p1, :cond_16

    sget v0, Lcom/mikepenz/iconics/core/R$id;->iconics_tag_id:I

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    if-eq v0, v1, :cond_16

    .line 28
    invoke-virtual {p0, p1, p2, p3}, Lcom/mikepenz/iconics/context/IconicsFactory;->onViewCreatedInternal(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 29
    sget v0, Lcom/mikepenz/iconics/core/R$id;->iconics_tag_id:I

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 31
    :cond_16
    return-object p1
.end method

.method onViewCreatedInternal(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 8
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 40
    if-nez p3, :cond_3

    .line 88
    .end local p1    # "view":Landroid/view/View;
    :cond_2
    :goto_2
    return-void

    .line 44
    .restart local p1    # "view":Landroid/view/View;
    :cond_3
    instance-of v2, p1, Landroid/support/v7/view/menu/ActionMenuItemView;

    if-eqz v2, :cond_26

    .line 45
    sget-object v2, Lcom/mikepenz/iconics/core/R$styleable;->Iconics:[I

    invoke-virtual {p2, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 46
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v2, Lcom/mikepenz/iconics/core/R$styleable;->IconicsImageView_iiv_icon:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 48
    .local v1, "icon":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_22

    .line 49
    check-cast p1, Landroid/support/v7/view/menu/ActionMenuItemView;

    .end local p1    # "view":Landroid/view/View;
    invoke-virtual {p0, p2, v0, v1}, Lcom/mikepenz/iconics/context/IconicsFactory;->getDrawable(Landroid/content/Context;Landroid/content/res/TypedArray;Ljava/lang/String;)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/support/v7/view/menu/ActionMenuItemView;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 52
    :cond_22
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_2

    .line 53
    .end local v0    # "a":Landroid/content/res/TypedArray;
    .end local v1    # "icon":Ljava/lang/String;
    .restart local p1    # "view":Landroid/view/View;
    :cond_26
    instance-of v2, p1, Landroid/widget/EditText;

    if-eqz v2, :cond_3d

    .line 55
    new-instance v2, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;

    invoke-direct {v2}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;-><init>()V

    invoke-virtual {v2, p2}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->ctx(Landroid/content/Context;)Lcom/mikepenz/iconics/Iconics$IconicsBuilder;

    move-result-object v2

    check-cast p1, Landroid/widget/TextView;

    .end local p1    # "view":Landroid/view/View;
    invoke-virtual {v2, p1}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->on(Landroid/widget/TextView;)Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->build()V

    goto :goto_2

    .line 58
    .restart local p1    # "view":Landroid/view/View;
    :cond_3d
    instance-of v2, p1, Landroid/widget/TextView;

    if-eqz v2, :cond_5f

    .line 60
    new-instance v2, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;

    invoke-direct {v2}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;-><init>()V

    invoke-virtual {v2, p2}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->ctx(Landroid/content/Context;)Lcom/mikepenz/iconics/Iconics$IconicsBuilder;

    move-result-object v3

    move-object v2, p1

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->on(Landroid/widget/TextView;)Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->build()V

    .line 62
    check-cast p1, Landroid/widget/TextView;

    .end local p1    # "view":Landroid/view/View;
    new-instance v2, Lcom/mikepenz/iconics/context/IconicsFactory$1;

    invoke-direct {v2, p0, p2}, Lcom/mikepenz/iconics/context/IconicsFactory$1;-><init>(Lcom/mikepenz/iconics/context/IconicsFactory;Landroid/content/Context;)V

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    goto :goto_2

    .line 78
    .restart local p1    # "view":Landroid/view/View;
    :cond_5f
    instance-of v2, p1, Landroid/widget/ImageView;

    if-eqz v2, :cond_2

    .line 79
    sget-object v2, Lcom/mikepenz/iconics/core/R$styleable;->Iconics:[I

    invoke-virtual {p2, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 80
    .restart local v0    # "a":Landroid/content/res/TypedArray;
    sget v2, Lcom/mikepenz/iconics/core/R$styleable;->IconicsImageView_iiv_icon:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 82
    .restart local v1    # "icon":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_7e

    .line 83
    check-cast p1, Landroid/widget/ImageView;

    .end local p1    # "view":Landroid/view/View;
    invoke-virtual {p0, p2, v0, v1}, Lcom/mikepenz/iconics/context/IconicsFactory;->getDrawable(Landroid/content/Context;Landroid/content/res/TypedArray;Ljava/lang/String;)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 86
    :cond_7e
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_2
.end method
