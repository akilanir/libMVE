.class public Lcom/jpardogo/android/googleprogressbar/library/GoogleProgressBar;
.super Landroid/widget/ProgressBar;
.source "GoogleProgressBar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jpardogo/android/googleprogressbar/library/GoogleProgressBar$1;,
        Lcom/jpardogo/android/googleprogressbar/library/GoogleProgressBar$ProgressType;
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 19
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/jpardogo/android/googleprogressbar/library/GoogleProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 23
    const v0, 0x1010077

    invoke-direct {p0, p1, p2, v0}, Lcom/jpardogo/android/googleprogressbar/library/GoogleProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 27
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 31
    invoke-virtual {p0}, Lcom/jpardogo/android/googleprogressbar/library/GoogleProgressBar;->isInEditMode()Z

    move-result v4

    if-eqz v4, :cond_a

    .line 42
    :cond_9
    :goto_9
    return-void

    .line 34
    :cond_a
    sget-object v4, Lcom/jpardogo/android/googleprogressbar/library/R$styleable;->GoogleProgressBar:[I

    const/4 v5, 0x0

    invoke-virtual {p1, p2, v4, p3, v5}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 35
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v4, Lcom/jpardogo/android/googleprogressbar/library/R$styleable;->GoogleProgressBar_type:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/jpardogo/android/googleprogressbar/library/R$integer;->default_type:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v5

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    .line 36
    .local v3, "typeIndex":I
    sget v4, Lcom/jpardogo/android/googleprogressbar/library/R$styleable;->GoogleProgressBar_colors:I

    sget v5, Lcom/jpardogo/android/googleprogressbar/library/R$array;->google_colors:I

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 37
    .local v1, "colorsId":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 39
    invoke-direct {p0, p1, v3, v1}, Lcom/jpardogo/android/googleprogressbar/library/GoogleProgressBar;->buildDrawable(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 40
    .local v2, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v2, :cond_9

    .line 41
    invoke-virtual {p0, v2}, Lcom/jpardogo/android/googleprogressbar/library/GoogleProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_9
.end method

.method private buildDrawable(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "typeIndex"    # I
    .param p3, "colorsId"    # I

    .prologue
    .line 45
    const/4 v0, 0x0

    .line 46
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    invoke-static {}, Lcom/jpardogo/android/googleprogressbar/library/GoogleProgressBar$ProgressType;->values()[Lcom/jpardogo/android/googleprogressbar/library/GoogleProgressBar$ProgressType;

    move-result-object v2

    aget-object v1, v2, p2

    .line 47
    .local v1, "type":Lcom/jpardogo/android/googleprogressbar/library/GoogleProgressBar$ProgressType;
    sget-object v2, Lcom/jpardogo/android/googleprogressbar/library/GoogleProgressBar$1;->$SwitchMap$com$jpardogo$android$googleprogressbar$library$GoogleProgressBar$ProgressType:[I

    invoke-virtual {v1}, Lcom/jpardogo/android/googleprogressbar/library/GoogleProgressBar$ProgressType;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_60

    .line 69
    :goto_12
    return-object v0

    .line 49
    :pswitch_13
    new-instance v2, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$Builder;

    invoke-direct {v2, p1}, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/jpardogo/android/googleprogressbar/library/GoogleProgressBar;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, p3}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$Builder;->colors([I)Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$Builder;->build()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 52
    goto :goto_12

    .line 54
    :pswitch_29
    new-instance v2, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$Builder;

    invoke-direct {v2}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$Builder;-><init>()V

    invoke-virtual {v2}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$Builder;->build()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 56
    goto :goto_12

    .line 58
    :pswitch_33
    new-instance v2, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable$Builder;

    invoke-direct {v2, p1}, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/jpardogo/android/googleprogressbar/library/GoogleProgressBar;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, p3}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable$Builder;->colors([I)Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable$Builder;->build()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 61
    goto :goto_12

    .line 63
    :pswitch_49
    new-instance v2, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$Builder;

    invoke-direct {v2, p1}, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/jpardogo/android/googleprogressbar/library/GoogleProgressBar;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, p3}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$Builder;->colors([I)Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$Builder;->build()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_12

    .line 47
    nop

    :pswitch_data_60
    .packed-switch 0x1
        :pswitch_13
        :pswitch_29
        :pswitch_33
        :pswitch_49
    .end packed-switch
.end method
