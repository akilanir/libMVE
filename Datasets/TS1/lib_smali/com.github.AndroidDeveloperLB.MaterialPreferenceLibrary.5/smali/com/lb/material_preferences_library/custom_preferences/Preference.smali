.class public Lcom/lb/material_preferences_library/custom_preferences/Preference;
.super Landroid/preference/Preference;
.source "Preference.java"


# instance fields
.field private _icon:Landroid/graphics/drawable/Drawable;

.field private _iconResId:I

.field private _isInitialized:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 107
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 19
    iput-boolean v1, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_isInitialized:Z

    .line 108
    iget-boolean v0, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_isInitialized:Z

    if-nez v0, :cond_11

    .line 110
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_isInitialized:Z

    .line 111
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v1, v1}, Lcom/lb/material_preferences_library/custom_preferences/Preference;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 113
    :cond_11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x0

    .line 97
    invoke-direct {p0, p1, p2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 19
    iput-boolean v1, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_isInitialized:Z

    .line 98
    iget-boolean v0, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_isInitialized:Z

    if-nez v0, :cond_10

    .line 100
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_isInitialized:Z

    .line 101
    invoke-virtual {p0, p1, p2, v1, v1}, Lcom/lb/material_preferences_library/custom_preferences/Preference;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 103
    :cond_10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v1, 0x0

    .line 87
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    iput-boolean v1, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_isInitialized:Z

    .line 88
    iget-boolean v0, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_isInitialized:Z

    if-nez v0, :cond_10

    .line 90
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_isInitialized:Z

    .line 91
    invoke-virtual {p0, p1, p2, p3, v1}, Lcom/lb/material_preferences_library/custom_preferences/Preference;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 93
    :cond_10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 34
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 19
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_isInitialized:Z

    .line 35
    iget-boolean v0, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_isInitialized:Z

    if-nez v0, :cond_10

    .line 37
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_isInitialized:Z

    .line 38
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/lb/material_preferences_library/custom_preferences/Preference;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 40
    :cond_10
    return-void
.end method


# virtual methods
.method public getIconCompat()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 82
    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_icon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 25
    sget v1, Lcom/lb/material_preferences_library/R$layout;->mpl__preference:I

    invoke-virtual {p0, v1}, Lcom/lb/material_preferences_library/custom_preferences/Preference;->setLayoutResource(I)V

    .line 26
    sget-object v1, Lcom/lb/material_preferences_library/R$styleable;->Preference:[I

    invoke-virtual {p1, p2, v1, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 27
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Lcom/lb/material_preferences_library/R$styleable;->Preference_icon:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_iconResId:I

    .line 28
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 29
    return-void
.end method

.method protected onBindView(Landroid/view/View;)V
    .registers 8
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/16 v4, 0x8

    const/4 v3, 0x0

    .line 118
    invoke-super {p0, p1}, Landroid/preference/Preference;->onBindView(Landroid/view/View;)V

    .line 119
    sget v2, Lcom/lb/material_preferences_library/R$id;->icon:I

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 120
    .local v1, "imageView":Landroid/widget/ImageView;
    if-eqz v1, :cond_39

    .line 122
    iget v2, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_iconResId:I

    if-nez v2, :cond_18

    iget-object v2, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_icon:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_31

    .line 124
    :cond_18
    iget-object v2, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_icon:Landroid/graphics/drawable/Drawable;

    if-nez v2, :cond_28

    .line 125
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/Preference;->getContext()Landroid/content/Context;

    move-result-object v2

    iget v5, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_iconResId:I

    invoke-static {v2, v5}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_icon:Landroid/graphics/drawable/Drawable;

    .line 126
    :cond_28
    iget-object v2, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_icon:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_31

    .line 127
    iget-object v2, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_icon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 129
    :cond_31
    iget-object v2, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_icon:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_49

    move v2, v3

    :goto_36
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 132
    :cond_39
    sget v2, Lcom/lb/material_preferences_library/R$id;->icon_frame:I

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 133
    .local v0, "imageFrame":Landroid/view/View;
    if-eqz v0, :cond_48

    .line 135
    iget-object v2, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_icon:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_4b

    :goto_45
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 137
    :cond_48
    return-void

    .end local v0    # "imageFrame":Landroid/view/View;
    :cond_49
    move v2, v4

    .line 129
    goto :goto_36

    .restart local v0    # "imageFrame":Landroid/view/View;
    :cond_4b
    move v3, v4

    .line 135
    goto :goto_45
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 52
    if-nez p1, :cond_6

    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_icon:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_c

    :cond_6
    if-eqz p1, :cond_11

    iget-object v0, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_icon:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_11

    .line 54
    :cond_c
    iput-object p1, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_icon:Landroid/graphics/drawable/Drawable;

    .line 55
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/Preference;->notifyChanged()V

    .line 57
    :cond_11
    return-void
.end method

.method public setIconCompat(I)V
    .registers 3
    .param p1, "iconResId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 67
    iget v0, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_iconResId:I

    if-eq v0, p1, :cond_11

    .line 69
    iput p1, p0, Lcom/lb/material_preferences_library/custom_preferences/Preference;->_iconResId:I

    .line 70
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/custom_preferences/Preference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lb/material_preferences_library/custom_preferences/Preference;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 72
    :cond_11
    return-void
.end method
