.class public Lpl/droidsonroids/gif/GifTextView;
.super Landroid/widget/TextView;
.source "GifTextView.java"


# instance fields
.field private mFreezesAnimation:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v0, 0x0

    .line 43
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 44
    invoke-direct {p0, p2, v0, v0}, Lpl/droidsonroids/gif/GifTextView;->init(Landroid/util/AttributeSet;II)V

    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 57
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 58
    const/4 v0, 0x0

    invoke-direct {p0, p2, p3, v0}, Lpl/droidsonroids/gif/GifTextView;->init(Landroid/util/AttributeSet;II)V

    .line 59
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 73
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 74
    invoke-direct {p0, p2, p3, p4}, Lpl/droidsonroids/gif/GifTextView;->init(Landroid/util/AttributeSet;II)V

    .line 75
    return-void
.end method

.method private getGifOrDefaultDrawable(I)Landroid/graphics/drawable/Drawable;
    .registers 5
    .param p1, "resId"    # I

    .prologue
    .line 130
    if-nez p1, :cond_4

    .line 131
    const/4 v1, 0x0

    .line 144
    :goto_3
    return-object v1

    .line 133
    :cond_4
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 134
    .local v0, "resources":Landroid/content/res/Resources;
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextView;->isInEditMode()Z

    move-result v1

    if-nez v1, :cond_21

    const-string v1, "drawable"

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_21

    .line 136
    :try_start_1a
    new-instance v1, Lpl/droidsonroids/gif/GifDrawable;

    invoke-direct {v1, v0, p1}, Lpl/droidsonroids/gif/GifDrawable;-><init>(Landroid/content/res/Resources;I)V
    :try_end_1f
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_1f} :catch_20
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_1a .. :try_end_1f} :catch_20

    goto :goto_3

    .line 137
    :catch_20
    move-exception v1

    .line 141
    :cond_21
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_34

    .line 142
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    goto :goto_3

    .line 144
    :cond_34
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    goto :goto_3
.end method

.method private hideCompoundDrawables([Landroid/graphics/drawable/Drawable;)V
    .registers 6
    .param p1, "drawables"    # [Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v2, 0x0

    .line 169
    array-length v3, p1

    move v1, v2

    :goto_3
    if-ge v1, v3, :cond_f

    aget-object v0, p1, v1

    .line 170
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_c

    .line 171
    invoke-virtual {v0, v2, v2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 169
    :cond_c
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 174
    .end local v0    # "d":Landroid/graphics/drawable/Drawable;
    :cond_f
    return-void
.end method

.method private init(Landroid/util/AttributeSet;II)V
    .registers 13
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyle"    # I
    .param p3, "defStyleRes"    # I

    .prologue
    const/4 v8, 0x0

    .line 80
    if-eqz p1, :cond_72

    .line 81
    const-string v6, "http://schemas.android.com/apk/res/android"

    const-string v7, "drawableLeft"

    invoke-interface {p1, v6, v7, v8}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v6

    invoke-direct {p0, v6}, Lpl/droidsonroids/gif/GifTextView;->getGifOrDefaultDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 82
    .local v2, "left":Landroid/graphics/drawable/Drawable;
    const-string v6, "http://schemas.android.com/apk/res/android"

    const-string v7, "drawableTop"

    invoke-interface {p1, v6, v7, v8}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v6

    invoke-direct {p0, v6}, Lpl/droidsonroids/gif/GifTextView;->getGifOrDefaultDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 83
    .local v5, "top":Landroid/graphics/drawable/Drawable;
    const-string v6, "http://schemas.android.com/apk/res/android"

    const-string v7, "drawableRight"

    invoke-interface {p1, v6, v7, v8}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v6

    invoke-direct {p0, v6}, Lpl/droidsonroids/gif/GifTextView;->getGifOrDefaultDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 84
    .local v3, "right":Landroid/graphics/drawable/Drawable;
    const-string v6, "http://schemas.android.com/apk/res/android"

    const-string v7, "drawableBottom"

    invoke-interface {p1, v6, v7, v8}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v6

    invoke-direct {p0, v6}, Lpl/droidsonroids/gif/GifTextView;->getGifOrDefaultDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 85
    .local v0, "bottom":Landroid/graphics/drawable/Drawable;
    const-string v6, "http://schemas.android.com/apk/res/android"

    const-string v7, "drawableStart"

    invoke-interface {p1, v6, v7, v8}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v6

    invoke-direct {p0, v6}, Lpl/droidsonroids/gif/GifTextView;->getGifOrDefaultDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 86
    .local v4, "start":Landroid/graphics/drawable/Drawable;
    const-string v6, "http://schemas.android.com/apk/res/android"

    const-string v7, "drawableEnd"

    invoke-interface {p1, v6, v7, v8}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v6

    invoke-direct {p0, v6}, Lpl/droidsonroids/gif/GifTextView;->getGifOrDefaultDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 88
    .local v1, "end":Landroid/graphics/drawable/Drawable;
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x11

    if-lt v6, v7, :cond_80

    .line 89
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextView;->getLayoutDirection()I

    move-result v6

    if-nez v6, :cond_79

    .line 90
    if-nez v4, :cond_5a

    .line 91
    move-object v4, v2

    .line 93
    :cond_5a
    if-nez v1, :cond_5d

    .line 94
    move-object v1, v3

    .line 104
    :cond_5d
    :goto_5d
    invoke-virtual {p0, v4, v5, v1, v0}, Lpl/droidsonroids/gif/GifTextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 105
    invoke-virtual {p0, v2, v5, v3, v0}, Lpl/droidsonroids/gif/GifTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 109
    :goto_63
    const-string v6, "http://schemas.android.com/apk/res/android"

    const-string v7, "background"

    invoke-interface {p1, v6, v7, v8}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v6

    invoke-direct {p0, v6}, Lpl/droidsonroids/gif/GifTextView;->getGifOrDefaultDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-direct {p0, v6}, Lpl/droidsonroids/gif/GifTextView;->setBackgroundInternal(Landroid/graphics/drawable/Drawable;)V

    .line 111
    .end local v0    # "bottom":Landroid/graphics/drawable/Drawable;
    .end local v1    # "end":Landroid/graphics/drawable/Drawable;
    .end local v2    # "left":Landroid/graphics/drawable/Drawable;
    .end local v3    # "right":Landroid/graphics/drawable/Drawable;
    .end local v4    # "start":Landroid/graphics/drawable/Drawable;
    .end local v5    # "top":Landroid/graphics/drawable/Drawable;
    :cond_72
    invoke-static {p0, p1, p2, p3}, Lpl/droidsonroids/gif/GifViewUtils;->isFreezingAnimation(Landroid/view/View;Landroid/util/AttributeSet;II)Z

    move-result v6

    iput-boolean v6, p0, Lpl/droidsonroids/gif/GifTextView;->mFreezesAnimation:Z

    .line 112
    return-void

    .line 97
    .restart local v0    # "bottom":Landroid/graphics/drawable/Drawable;
    .restart local v1    # "end":Landroid/graphics/drawable/Drawable;
    .restart local v2    # "left":Landroid/graphics/drawable/Drawable;
    .restart local v3    # "right":Landroid/graphics/drawable/Drawable;
    .restart local v4    # "start":Landroid/graphics/drawable/Drawable;
    .restart local v5    # "top":Landroid/graphics/drawable/Drawable;
    :cond_79
    if-nez v4, :cond_7c

    .line 98
    move-object v4, v3

    .line 100
    :cond_7c
    if-nez v1, :cond_5d

    .line 101
    move-object v1, v2

    goto :goto_5d

    .line 107
    :cond_80
    invoke-virtual {p0, v2, v5, v3, v0}, Lpl/droidsonroids/gif/GifTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_63
.end method

.method private setBackgroundInternal(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "bg"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 116
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_a

    .line 117
    invoke-virtual {p0, p1}, Lpl/droidsonroids/gif/GifTextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 121
    :goto_9
    return-void

    .line 119
    :cond_a
    invoke-virtual {p0, p1}, Lpl/droidsonroids/gif/GifTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_9
.end method


# virtual methods
.method protected onDetachedFromWindow()V
    .registers 3

    .prologue
    .line 161
    invoke-super {p0}, Landroid/widget/TextView;->onDetachedFromWindow()V

    .line 162
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-direct {p0, v0}, Lpl/droidsonroids/gif/GifTextView;->hideCompoundDrawables([Landroid/graphics/drawable/Drawable;)V

    .line 163
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_17

    .line 164
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-direct {p0, v0}, Lpl/droidsonroids/gif/GifTextView;->hideCompoundDrawables([Landroid/graphics/drawable/Drawable;)V

    .line 166
    :cond_17
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 10
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    const/4 v7, 0x3

    const/4 v4, 0x1

    const/4 v6, 0x2

    const/4 v5, 0x0

    .line 195
    move-object v2, p1

    check-cast v2, Lpl/droidsonroids/gif/GifViewSavedState;

    .line 196
    .local v2, "ss":Lpl/droidsonroids/gif/GifViewSavedState;
    invoke-virtual {v2}, Lpl/droidsonroids/gif/GifViewSavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v3

    invoke-super {p0, v3}, Landroid/widget/TextView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 198
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 199
    .local v0, "compoundDrawables":[Landroid/graphics/drawable/Drawable;
    aget-object v3, v0, v5

    invoke-virtual {v2, v3, v5}, Lpl/droidsonroids/gif/GifViewSavedState;->restoreState(Landroid/graphics/drawable/Drawable;I)V

    .line 200
    aget-object v3, v0, v4

    invoke-virtual {v2, v3, v4}, Lpl/droidsonroids/gif/GifViewSavedState;->restoreState(Landroid/graphics/drawable/Drawable;I)V

    .line 201
    aget-object v3, v0, v6

    invoke-virtual {v2, v3, v6}, Lpl/droidsonroids/gif/GifViewSavedState;->restoreState(Landroid/graphics/drawable/Drawable;I)V

    .line 202
    aget-object v3, v0, v7

    invoke-virtual {v2, v3, v7}, Lpl/droidsonroids/gif/GifViewSavedState;->restoreState(Landroid/graphics/drawable/Drawable;I)V

    .line 203
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x11

    if-lt v3, v4, :cond_3c

    .line 204
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 205
    .local v1, "compoundDrawablesRelative":[Landroid/graphics/drawable/Drawable;
    aget-object v3, v1, v5

    const/4 v4, 0x4

    invoke-virtual {v2, v3, v4}, Lpl/droidsonroids/gif/GifViewSavedState;->restoreState(Landroid/graphics/drawable/Drawable;I)V

    .line 206
    aget-object v3, v1, v6

    const/4 v4, 0x5

    invoke-virtual {v2, v3, v4}, Lpl/droidsonroids/gif/GifViewSavedState;->restoreState(Landroid/graphics/drawable/Drawable;I)V

    .line 208
    .end local v1    # "compoundDrawablesRelative":[Landroid/graphics/drawable/Drawable;
    :cond_3c
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    const/4 v4, 0x6

    invoke-virtual {v2, v3, v4}, Lpl/droidsonroids/gif/GifViewSavedState;->restoreState(Landroid/graphics/drawable/Drawable;I)V

    .line 209
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 178
    const/4 v3, 0x7

    new-array v2, v3, [Landroid/graphics/drawable/Drawable;

    .line 179
    .local v2, "savedDrawables":[Landroid/graphics/drawable/Drawable;
    iget-boolean v3, p0, Lpl/droidsonroids/gif/GifTextView;->mFreezesAnimation:Z

    if-eqz v3, :cond_2c

    .line 180
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 181
    .local v0, "compoundDrawables":[Landroid/graphics/drawable/Drawable;
    array-length v3, v0

    invoke-static {v0, v5, v2, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 183
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x11

    if-lt v3, v4, :cond_25

    .line 184
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 185
    .local v1, "compoundDrawablesRelative":[Landroid/graphics/drawable/Drawable;
    const/4 v3, 0x4

    aget-object v4, v1, v5

    aput-object v4, v2, v3

    .line 186
    const/4 v3, 0x5

    const/4 v4, 0x2

    aget-object v4, v1, v4

    aput-object v4, v2, v3

    .line 188
    .end local v1    # "compoundDrawablesRelative":[Landroid/graphics/drawable/Drawable;
    :cond_25
    const/4 v3, 0x6

    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    aput-object v4, v2, v3

    .line 190
    .end local v0    # "compoundDrawables":[Landroid/graphics/drawable/Drawable;
    :cond_2c
    new-instance v3, Lpl/droidsonroids/gif/GifViewSavedState;

    invoke-super {p0}, Landroid/widget/TextView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Lpl/droidsonroids/gif/GifViewSavedState;-><init>(Landroid/os/Parcelable;[Landroid/graphics/drawable/Drawable;)V

    return-object v3
.end method

.method public setBackgroundResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 125
    invoke-direct {p0, p1}, Lpl/droidsonroids/gif/GifTextView;->getGifOrDefaultDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-direct {p0, v0}, Lpl/droidsonroids/gif/GifTextView;->setBackgroundInternal(Landroid/graphics/drawable/Drawable;)V

    .line 126
    return-void
.end method

.method public setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V
    .registers 9
    .param p1, "start"    # I
    .param p2, "top"    # I
    .param p3, "end"    # I
    .param p4, "bottom"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 151
    invoke-direct {p0, p1}, Lpl/droidsonroids/gif/GifTextView;->getGifOrDefaultDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-direct {p0, p2}, Lpl/droidsonroids/gif/GifTextView;->getGifOrDefaultDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-direct {p0, p3}, Lpl/droidsonroids/gif/GifTextView;->getGifOrDefaultDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-direct {p0, p4}, Lpl/droidsonroids/gif/GifTextView;->getGifOrDefaultDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {p0, v0, v1, v2, v3}, Lpl/droidsonroids/gif/GifTextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 152
    return-void
.end method

.method public setCompoundDrawablesWithIntrinsicBounds(IIII)V
    .registers 9
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 156
    invoke-direct {p0, p1}, Lpl/droidsonroids/gif/GifTextView;->getGifOrDefaultDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-direct {p0, p2}, Lpl/droidsonroids/gif/GifTextView;->getGifOrDefaultDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-direct {p0, p3}, Lpl/droidsonroids/gif/GifTextView;->getGifOrDefaultDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-direct {p0, p4}, Lpl/droidsonroids/gif/GifTextView;->getGifOrDefaultDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {p0, v0, v1, v2, v3}, Lpl/droidsonroids/gif/GifTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 157
    return-void
.end method

.method public setFreezesAnimation(Z)V
    .registers 2
    .param p1, "freezesAnimation"    # Z

    .prologue
    .line 218
    iput-boolean p1, p0, Lpl/droidsonroids/gif/GifTextView;->mFreezesAnimation:Z

    .line 219
    return-void
.end method
