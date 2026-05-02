.class public Lmehdi/sakout/fancybuttons/FancyButton;
.super Landroid/widget/LinearLayout;
.source "FancyButton.java"


# static fields
.field public static final POSITION_BOTTOM:I = 0x4

.field public static final POSITION_LEFT:I = 0x1

.field public static final POSITION_RIGHT:I = 0x2

.field public static final POSITION_TOP:I = 0x3


# instance fields
.field private mBorderColor:I

.field private mBorderWidth:I

.field private mContext:Landroid/content/Context;

.field private mDefaultBackgroundColor:I

.field private mDefaultIconColor:I

.field private mDefaultIconFont:Ljava/lang/String;

.field private mDefaultTextColor:I

.field private mDefaultTextFont:Ljava/lang/String;

.field private mDefaultTextGravity:I

.field private mDefaultTextSize:I

.field private mFocusBackgroundColor:I

.field private mFontIcon:Ljava/lang/String;

.field private mFontIconSize:I

.field private mFontIconView:Landroid/widget/TextView;

.field private mGhost:Z

.field private mIconPaddingBottom:I

.field private mIconPaddingLeft:I

.field private mIconPaddingRight:I

.field private mIconPaddingTop:I

.field private mIconPosition:I

.field private mIconResource:Landroid/graphics/drawable/Drawable;

.field private mIconTypeFace:Landroid/graphics/Typeface;

.field private mIconView:Landroid/widget/ImageView;

.field private mRadius:I

.field private mText:Ljava/lang/String;

.field private mTextPosition:I

.field private mTextTypeFace:Landroid/graphics/Typeface;

.field private mTextView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, -0x1

    const/high16 v2, 0x41700000    # 15.0f

    const/4 v5, 0x1

    const/4 v1, 0x0

    const/4 v4, 0x0

    .line 81
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 28
    const/high16 v0, -0x1000000

    iput v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultBackgroundColor:I

    .line 29
    iput v4, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFocusBackgroundColor:I

    .line 32
    iput v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextColor:I

    .line 33
    iput v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultIconColor:I

    .line 34
    iput v5, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextPosition:I

    .line 35
    invoke-virtual {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v2}, Lmehdi/sakout/fancybuttons/Utils;->spToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextSize:I

    .line 36
    const/16 v0, 0x11

    iput v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextGravity:I

    .line 37
    iput-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mText:Ljava/lang/String;

    .line 40
    iput-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconResource:Landroid/graphics/drawable/Drawable;

    .line 41
    invoke-virtual {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v2}, Lmehdi/sakout/fancybuttons/Utils;->spToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconSize:I

    .line 42
    iput-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIcon:Ljava/lang/String;

    .line 43
    iput v5, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPosition:I

    .line 45
    const/16 v0, 0xa

    iput v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingLeft:I

    .line 46
    const/16 v0, 0xa

    iput v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingRight:I

    .line 47
    iput v4, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingTop:I

    .line 48
    iput v4, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingBottom:I

    .line 51
    iput v4, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mBorderColor:I

    .line 52
    iput v4, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mBorderWidth:I

    .line 54
    iput v4, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mRadius:I

    .line 56
    iput-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextTypeFace:Landroid/graphics/Typeface;

    .line 57
    iput-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconTypeFace:Landroid/graphics/Typeface;

    .line 67
    const-string v0, "fontawesome.ttf"

    iput-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultIconFont:Ljava/lang/String;

    .line 68
    const-string v0, "robotoregular.ttf"

    iput-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextFont:Ljava/lang/String;

    .line 74
    iput-boolean v4, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mGhost:Z

    .line 82
    iput-object p1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mContext:Landroid/content/Context;

    .line 84
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    const-string v1, "fonts/%s"

    new-array v2, v5, [Ljava/lang/Object;

    iget-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextFont:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    iput-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextTypeFace:Landroid/graphics/Typeface;

    .line 85
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    const-string v1, "iconfonts/%s"

    new-array v2, v5, [Ljava/lang/Object;

    iget-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultIconFont:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    iput-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconTypeFace:Landroid/graphics/Typeface;

    .line 87
    invoke-direct {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->initializeFancyButton()V

    .line 88
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v6, 0x1

    const/4 v5, -0x1

    const/high16 v4, 0x41700000    # 15.0f

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 96
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 28
    const/high16 v1, -0x1000000

    iput v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultBackgroundColor:I

    .line 29
    iput v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFocusBackgroundColor:I

    .line 32
    iput v5, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextColor:I

    .line 33
    iput v5, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultIconColor:I

    .line 34
    iput v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextPosition:I

    .line 35
    invoke-virtual {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v4}, Lmehdi/sakout/fancybuttons/Utils;->spToPx(Landroid/content/Context;F)I

    move-result v1

    iput v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextSize:I

    .line 36
    const/16 v1, 0x11

    iput v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextGravity:I

    .line 37
    iput-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mText:Ljava/lang/String;

    .line 40
    iput-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconResource:Landroid/graphics/drawable/Drawable;

    .line 41
    invoke-virtual {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v4}, Lmehdi/sakout/fancybuttons/Utils;->spToPx(Landroid/content/Context;F)I

    move-result v1

    iput v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconSize:I

    .line 42
    iput-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIcon:Ljava/lang/String;

    .line 43
    iput v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPosition:I

    .line 45
    const/16 v1, 0xa

    iput v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingLeft:I

    .line 46
    const/16 v1, 0xa

    iput v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingRight:I

    .line 47
    iput v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingTop:I

    .line 48
    iput v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingBottom:I

    .line 51
    iput v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mBorderColor:I

    .line 52
    iput v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mBorderWidth:I

    .line 54
    iput v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mRadius:I

    .line 56
    iput-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextTypeFace:Landroid/graphics/Typeface;

    .line 57
    iput-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconTypeFace:Landroid/graphics/Typeface;

    .line 67
    const-string v1, "fontawesome.ttf"

    iput-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultIconFont:Ljava/lang/String;

    .line 68
    const-string v1, "robotoregular.ttf"

    iput-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextFont:Ljava/lang/String;

    .line 74
    iput-boolean v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mGhost:Z

    .line 97
    iput-object p1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mContext:Landroid/content/Context;

    .line 99
    sget-object v1, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs:[I

    invoke-virtual {p1, p2, v1, v2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 100
    .local v0, "attrsArray":Landroid/content/res/TypedArray;
    invoke-direct {p0, v0}, Lmehdi/sakout/fancybuttons/FancyButton;->initAttributsArray(Landroid/content/res/TypedArray;)V

    .line 101
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 103
    invoke-direct {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->initializeFancyButton()V

    .line 105
    return-void
.end method

.method private initAttributsArray(Landroid/content/res/TypedArray;)V
    .registers 14
    .param p1, "attrsArray"    # Landroid/content/res/TypedArray;

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 271
    sget v6, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs_fb_defaultColor:I

    iget v7, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultBackgroundColor:I

    invoke-virtual {p1, v6, v7}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v6

    iput v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultBackgroundColor:I

    .line 272
    sget v6, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs_fb_focusColor:I

    iget v7, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFocusBackgroundColor:I

    invoke-virtual {p1, v6, v7}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v6

    iput v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFocusBackgroundColor:I

    .line 274
    sget v6, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs_fb_textColor:I

    iget v7, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextColor:I

    invoke-virtual {p1, v6, v7}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v6

    iput v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextColor:I

    .line 276
    sget v6, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs_fb_iconColor:I

    iget v7, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextColor:I

    invoke-virtual {p1, v6, v7}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v6

    iput v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultIconColor:I

    .line 277
    sget v6, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs_fb_textSize:I

    iget v7, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextSize:I

    int-to-float v7, v7

    invoke-virtual {p1, v6, v7}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v6

    float-to-int v6, v6

    iput v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextSize:I

    .line 278
    sget v6, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs_fb_textGravity:I

    iget v7, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextGravity:I

    invoke-virtual {p1, v6, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    iput v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextGravity:I

    .line 280
    sget v6, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs_fb_borderColor:I

    iget v7, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mBorderColor:I

    invoke-virtual {p1, v6, v7}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v6

    iput v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mBorderColor:I

    .line 281
    sget v6, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs_fb_borderWidth:I

    iget v7, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mBorderWidth:I

    int-to-float v7, v7

    invoke-virtual {p1, v6, v7}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v6

    float-to-int v6, v6

    iput v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mBorderWidth:I

    .line 283
    sget v6, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs_fb_radius:I

    iget v7, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mRadius:I

    int-to-float v7, v7

    invoke-virtual {p1, v6, v7}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v6

    float-to-int v6, v6

    iput v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mRadius:I

    .line 284
    sget v6, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs_fb_fontIconSize:I

    iget v7, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconSize:I

    int-to-float v7, v7

    invoke-virtual {p1, v6, v7}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v6

    float-to-int v6, v6

    iput v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconSize:I

    .line 286
    sget v6, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs_fb_iconPaddingLeft:I

    iget v7, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingLeft:I

    int-to-float v7, v7

    invoke-virtual {p1, v6, v7}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v6

    float-to-int v6, v6

    iput v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingLeft:I

    .line 287
    sget v6, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs_fb_iconPaddingRight:I

    iget v7, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingRight:I

    int-to-float v7, v7

    invoke-virtual {p1, v6, v7}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v6

    float-to-int v6, v6

    iput v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingRight:I

    .line 288
    sget v6, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs_fb_iconPaddingTop:I

    iget v7, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingTop:I

    int-to-float v7, v7

    invoke-virtual {p1, v6, v7}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v6

    float-to-int v6, v6

    iput v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingTop:I

    .line 289
    sget v6, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs_fb_iconPaddingBottom:I

    iget v7, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingBottom:I

    int-to-float v7, v7

    invoke-virtual {p1, v6, v7}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v6

    float-to-int v6, v6

    iput v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingBottom:I

    .line 291
    sget v6, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs_fb_ghost:I

    iget-boolean v7, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mGhost:Z

    invoke-virtual {p1, v6, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v6

    iput-boolean v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mGhost:Z

    .line 293
    sget v6, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs_fb_text:I

    invoke-virtual {p1, v6}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 294
    .local v4, "text":Ljava/lang/String;
    sget v6, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs_fb_iconPosition:I

    iget v7, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPosition:I

    invoke-virtual {p1, v6, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    iput v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPosition:I

    .line 296
    sget v6, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs_fb_fontIconResource:I

    invoke-virtual {p1, v6}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 298
    .local v1, "fontIcon":Ljava/lang/String;
    sget v6, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs_fb_iconFont:I

    invoke-virtual {p1, v6}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 299
    .local v3, "iconFontFamily":Ljava/lang/String;
    sget v6, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs_fb_textFont:I

    invoke-virtual {p1, v6}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 301
    .local v5, "textFontFamily":Ljava/lang/String;
    const/4 v2, 0x0

    .line 303
    .local v2, "icon":Landroid/graphics/drawable/Drawable;
    :try_start_cb
    sget v6, Lmehdi/sakout/fancybuttons/R$styleable;->FancyButtonsAttrs_fb_iconResource:I

    invoke-virtual {p1, v6}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    iput-object v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconResource:Landroid/graphics/drawable/Drawable;
    :try_end_d3
    .catch Ljava/lang/Exception; {:try_start_cb .. :try_end_d3} :catch_116

    .line 309
    :goto_d3
    if-eqz v1, :cond_d7

    .line 310
    iput-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIcon:Ljava/lang/String;

    .line 312
    :cond_d7
    if-eqz v4, :cond_db

    .line 313
    iput-object v4, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mText:Ljava/lang/String;

    .line 315
    :cond_db
    invoke-virtual {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->isInEditMode()Z

    move-result v6

    if-nez v6, :cond_115

    .line 316
    if-eqz v3, :cond_13e

    .line 318
    :try_start_e3
    iget-object v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "iconfonts/%s"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v3, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v6

    iput-object v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconTypeFace:Landroid/graphics/Typeface;
    :try_end_fb
    .catch Ljava/lang/Exception; {:try_start_e3 .. :try_end_fb} :catch_11b

    .line 328
    :goto_fb
    if-eqz v5, :cond_171

    .line 330
    :try_start_fd
    iget-object v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "fonts/%s"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v5, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v6

    iput-object v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextTypeFace:Landroid/graphics/Typeface;
    :try_end_115
    .catch Ljava/lang/Exception; {:try_start_fd .. :try_end_115} :catch_157

    .line 340
    :cond_115
    :goto_115
    return-void

    .line 305
    :catch_116
    move-exception v0

    .line 306
    .local v0, "e":Ljava/lang/Exception;
    const/4 v6, 0x0

    iput-object v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconResource:Landroid/graphics/drawable/Drawable;

    goto :goto_d3

    .line 319
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_11b
    move-exception v0

    .line 320
    .restart local v0    # "e":Ljava/lang/Exception;
    const-string v6, "Fancy"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    iget-object v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "iconfonts/%s"

    new-array v8, v11, [Ljava/lang/Object;

    iget-object v9, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultIconFont:Ljava/lang/String;

    aput-object v9, v8, v10

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v6

    iput-object v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconTypeFace:Landroid/graphics/Typeface;

    goto :goto_fb

    .line 325
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_13e
    iget-object v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "iconfonts/%s"

    new-array v8, v11, [Ljava/lang/Object;

    iget-object v9, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultIconFont:Ljava/lang/String;

    aput-object v9, v8, v10

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v6

    iput-object v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconTypeFace:Landroid/graphics/Typeface;

    goto :goto_fb

    .line 332
    :catch_157
    move-exception v0

    .line 333
    .restart local v0    # "e":Ljava/lang/Exception;
    iget-object v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "fonts/%s"

    new-array v8, v11, [Ljava/lang/Object;

    iget-object v9, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextFont:Ljava/lang/String;

    aput-object v9, v8, v10

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v6

    iput-object v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextTypeFace:Landroid/graphics/Typeface;

    goto :goto_115

    .line 337
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_171
    iget-object v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "fonts/%s"

    new-array v8, v11, [Ljava/lang/Object;

    iget-object v9, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextFont:Ljava/lang/String;

    aput-object v9, v8, v10

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v6

    iput-object v6, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextTypeFace:Landroid/graphics/Typeface;

    goto :goto_115
.end method

.method private initializeButtonContainer()V
    .registers 7

    .prologue
    const/4 v5, -0x2

    const/4 v4, 0x1

    const/16 v3, 0x14

    .line 395
    iget v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPosition:I

    const/4 v2, 0x3

    if-eq v1, v2, :cond_e

    iget v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPosition:I

    const/4 v2, 0x4

    if-ne v1, v2, :cond_48

    .line 396
    :cond_e
    invoke-virtual {p0, v4}, Lmehdi/sakout/fancybuttons/FancyButton;->setOrientation(I)V

    .line 400
    :goto_11
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 401
    .local v0, "containerParams":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {p0, v0}, Lmehdi/sakout/fancybuttons/FancyButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 402
    const/16 v1, 0x11

    invoke-virtual {p0, v1}, Lmehdi/sakout/fancybuttons/FancyButton;->setGravity(I)V

    .line 403
    invoke-virtual {p0, v4}, Lmehdi/sakout/fancybuttons/FancyButton;->setClickable(Z)V

    .line 404
    invoke-virtual {p0, v4}, Lmehdi/sakout/fancybuttons/FancyButton;->setFocusable(Z)V

    .line 405
    iget-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconResource:Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_47

    iget-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIcon:Ljava/lang/String;

    if-nez v1, :cond_47

    invoke-virtual {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->getPaddingLeft()I

    move-result v1

    if-nez v1, :cond_47

    invoke-virtual {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->getPaddingRight()I

    move-result v1

    if-nez v1, :cond_47

    invoke-virtual {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->getPaddingTop()I

    move-result v1

    if-nez v1, :cond_47

    invoke-virtual {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->getPaddingBottom()I

    move-result v1

    if-nez v1, :cond_47

    .line 406
    invoke-virtual {p0, v3, v3, v3, v3}, Lmehdi/sakout/fancybuttons/FancyButton;->setPadding(IIII)V

    .line 408
    :cond_47
    return-void

    .line 398
    .end local v0    # "containerParams":Landroid/widget/LinearLayout$LayoutParams;
    :cond_48
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lmehdi/sakout/fancybuttons/FancyButton;->setOrientation(I)V

    goto :goto_11
.end method

.method private initializeFancyButton()V
    .registers 6

    .prologue
    .line 115
    invoke-direct {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->initializeButtonContainer()V

    .line 117
    invoke-direct {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->setupTextView()Landroid/widget/TextView;

    move-result-object v3

    iput-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    .line 118
    invoke-direct {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->setupIconView()Landroid/widget/ImageView;

    move-result-object v3

    iput-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconView:Landroid/widget/ImageView;

    .line 119
    invoke-direct {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->setupFontIconView()Landroid/widget/TextView;

    move-result-object v3

    iput-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    .line 124
    iget-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconView:Landroid/widget/ImageView;

    if-nez v3, :cond_31

    iget-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    if-nez v3, :cond_31

    iget-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    if-nez v3, :cond_31

    .line 125
    new-instance v0, Landroid/widget/Button;

    iget-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mContext:Landroid/content/Context;

    invoke-direct {v0, v3}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 126
    .local v0, "tempTextView":Landroid/widget/Button;
    const-string v3, "Fancy Button"

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 127
    invoke-virtual {p0, v0}, Lmehdi/sakout/fancybuttons/FancyButton;->addView(Landroid/view/View;)V

    .line 167
    .end local v0    # "tempTextView":Landroid/widget/Button;
    :cond_30
    return-void

    .line 130
    :cond_31
    invoke-virtual {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->removeAllViews()V

    .line 131
    invoke-direct {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->setupBackground()V

    .line 133
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 135
    .local v2, "views":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    iget v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPosition:I

    const/4 v4, 0x1

    if-eq v3, v4, :cond_46

    iget v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPosition:I

    const/4 v4, 0x3

    if-ne v3, v4, :cond_75

    .line 137
    :cond_46
    iget-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconView:Landroid/widget/ImageView;

    if-eqz v3, :cond_4f

    .line 138
    iget-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 141
    :cond_4f
    iget-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    if-eqz v3, :cond_58

    .line 142
    iget-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 144
    :cond_58
    iget-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    if-eqz v3, :cond_61

    .line 145
    iget-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 163
    :cond_61
    :goto_61
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_65
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_30

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 164
    .local v1, "view":Landroid/view/View;
    invoke-virtual {p0, v1}, Lmehdi/sakout/fancybuttons/FancyButton;->addView(Landroid/view/View;)V

    goto :goto_65

    .line 149
    .end local v1    # "view":Landroid/view/View;
    :cond_75
    iget-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    if-eqz v3, :cond_7e

    .line 150
    iget-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 153
    :cond_7e
    iget-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconView:Landroid/widget/ImageView;

    if-eqz v3, :cond_87

    .line 154
    iget-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 157
    :cond_87
    iget-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    if-eqz v3, :cond_61

    .line 158
    iget-object v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_61
.end method

.method private setupBackground()V
    .registers 9
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const v7, 0x106000d

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 345
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 346
    .local v0, "drawable":Landroid/graphics/drawable/GradientDrawable;
    iget v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mRadius:I

    int-to-float v3, v3

    invoke-virtual {v0, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 347
    iget-boolean v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mGhost:Z

    if-eqz v3, :cond_7f

    .line 348
    invoke-virtual {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 353
    :goto_1f
    iget v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mBorderColor:I

    if-eqz v3, :cond_2a

    .line 354
    iget v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mBorderWidth:I

    iget v4, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mBorderColor:I

    invoke-virtual {v0, v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 358
    :cond_2a
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 359
    .local v1, "drawable2":Landroid/graphics/drawable/GradientDrawable;
    iget v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mRadius:I

    int-to-float v3, v3

    invoke-virtual {v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 360
    iget-boolean v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mGhost:Z

    if-eqz v3, :cond_85

    .line 361
    invoke-virtual {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 366
    :goto_44
    iget v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mBorderColor:I

    if-eqz v3, :cond_53

    .line 367
    iget-boolean v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mGhost:Z

    if-eqz v3, :cond_8b

    .line 368
    iget v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mBorderWidth:I

    iget v4, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFocusBackgroundColor:I

    invoke-virtual {v1, v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 375
    :cond_53
    :goto_53
    new-instance v2, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 377
    .local v2, "states":Landroid/graphics/drawable/StateListDrawable;
    iget v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFocusBackgroundColor:I

    if-eqz v3, :cond_70

    .line 378
    new-array v3, v6, [I

    const v4, 0x10100a7

    aput v4, v3, v5

    invoke-virtual {v2, v3, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 379
    new-array v3, v6, [I

    const v4, 0x101009c

    aput v4, v3, v5

    invoke-virtual {v2, v3, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 381
    :cond_70
    new-array v3, v5, [I

    invoke-virtual {v2, v3, v0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 383
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x10

    if-ge v3, v4, :cond_93

    .line 384
    invoke-virtual {p0, v2}, Lmehdi/sakout/fancybuttons/FancyButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 388
    :goto_7e
    return-void

    .line 351
    .end local v1    # "drawable2":Landroid/graphics/drawable/GradientDrawable;
    .end local v2    # "states":Landroid/graphics/drawable/StateListDrawable;
    :cond_7f
    iget v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultBackgroundColor:I

    invoke-virtual {v0, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    goto :goto_1f

    .line 364
    .restart local v1    # "drawable2":Landroid/graphics/drawable/GradientDrawable;
    :cond_85
    iget v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFocusBackgroundColor:I

    invoke-virtual {v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    goto :goto_44

    .line 371
    :cond_8b
    iget v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mBorderWidth:I

    iget v4, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mBorderColor:I

    invoke-virtual {v1, v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    goto :goto_53

    .line 386
    .restart local v2    # "states":Landroid/graphics/drawable/StateListDrawable;
    :cond_93
    invoke-virtual {p0, v2}, Lmehdi/sakout/fancybuttons/FancyButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_7e
.end method

.method private setupFontIconView()Landroid/widget/TextView;
    .registers 7

    .prologue
    const/4 v3, -0x2

    const/16 v5, 0x11

    const/16 v4, 0x10

    .line 196
    iget-object v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIcon:Ljava/lang/String;

    if-eqz v2, :cond_81

    .line 197
    new-instance v0, Landroid/widget/TextView;

    iget-object v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mContext:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 198
    .local v0, "fontIconView":Landroid/widget/TextView;
    iget v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultIconColor:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 200
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 201
    .local v1, "iconTextViewParams":Landroid/widget/LinearLayout$LayoutParams;
    iget v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingRight:I

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 202
    iget v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingLeft:I

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 203
    iget v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingTop:I

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 204
    iget v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingBottom:I

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 206
    iget-object v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    if-eqz v2, :cond_66

    .line 208
    iget v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPosition:I

    const/4 v3, 0x3

    if-eq v2, v3, :cond_38

    iget v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPosition:I

    const/4 v3, 0x4

    if-ne v2, v3, :cond_60

    .line 209
    :cond_38
    iput v5, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 210
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 222
    :goto_3d
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 223
    invoke-virtual {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->isInEditMode()Z

    move-result v2

    if-nez v2, :cond_6c

    .line 224
    invoke-virtual {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->getContext()Landroid/content/Context;

    move-result-object v2

    iget v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconSize:I

    int-to-float v3, v3

    invoke-static {v2, v3}, Lmehdi/sakout/fancybuttons/Utils;->pxToSp(Landroid/content/Context;F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 225
    iget-object v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIcon:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 226
    iget-object v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconTypeFace:Landroid/graphics/Typeface;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 233
    .end local v0    # "fontIconView":Landroid/widget/TextView;
    .end local v1    # "iconTextViewParams":Landroid/widget/LinearLayout$LayoutParams;
    :goto_5f
    return-object v0

    .line 213
    .restart local v0    # "fontIconView":Landroid/widget/TextView;
    .restart local v1    # "iconTextViewParams":Landroid/widget/LinearLayout$LayoutParams;
    :cond_60
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setGravity(I)V

    .line 214
    iput v4, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    goto :goto_3d

    .line 217
    :cond_66
    iput v5, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 218
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setGravity(I)V

    goto :goto_3d

    .line 228
    :cond_6c
    invoke-virtual {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->getContext()Landroid/content/Context;

    move-result-object v2

    iget v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconSize:I

    int-to-float v3, v3

    invoke-static {v2, v3}, Lmehdi/sakout/fancybuttons/Utils;->pxToSp(Landroid/content/Context;F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 229
    const-string v2, "O"

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_5f

    .line 233
    .end local v0    # "fontIconView":Landroid/widget/TextView;
    .end local v1    # "iconTextViewParams":Landroid/widget/LinearLayout$LayoutParams;
    :cond_81
    const/4 v0, 0x0

    goto :goto_5f
.end method

.method private setupIconView()Landroid/widget/ImageView;
    .registers 9

    .prologue
    const/16 v7, 0xa

    const/4 v6, -0x2

    .line 241
    iget-object v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconResource:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_48

    .line 242
    new-instance v0, Landroid/widget/ImageView;

    iget-object v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mContext:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 243
    .local v0, "iconView":Landroid/widget/ImageView;
    iget-object v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconResource:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 244
    iget v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingLeft:I

    iget v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingTop:I

    iget v4, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingRight:I

    iget v5, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingBottom:I

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 246
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 247
    .local v1, "iconViewParams":Landroid/widget/LinearLayout$LayoutParams;
    iget-object v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    if-eqz v2, :cond_43

    .line 248
    iget v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPosition:I

    const/4 v3, 0x3

    if-eq v2, v3, :cond_31

    iget v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPosition:I

    const/4 v3, 0x4

    if-ne v2, v3, :cond_3d

    .line 249
    :cond_31
    const/16 v2, 0x11

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 253
    :goto_35
    iput v7, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 254
    iput v7, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 258
    :goto_39
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 262
    .end local v0    # "iconView":Landroid/widget/ImageView;
    .end local v1    # "iconViewParams":Landroid/widget/LinearLayout$LayoutParams;
    :goto_3c
    return-object v0

    .line 251
    .restart local v0    # "iconView":Landroid/widget/ImageView;
    .restart local v1    # "iconViewParams":Landroid/widget/LinearLayout$LayoutParams;
    :cond_3d
    const v2, 0x800003

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    goto :goto_35

    .line 256
    :cond_43
    const/16 v2, 0x10

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    goto :goto_39

    .line 262
    .end local v0    # "iconView":Landroid/widget/ImageView;
    .end local v1    # "iconViewParams":Landroid/widget/LinearLayout$LayoutParams;
    :cond_48
    const/4 v0, 0x0

    goto :goto_3c
.end method

.method private setupTextView()Landroid/widget/TextView;
    .registers 5

    .prologue
    const/4 v3, -0x2

    .line 174
    iget-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mText:Ljava/lang/String;

    if-eqz v1, :cond_42

    .line 175
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 176
    .local v0, "textView":Landroid/widget/TextView;
    iget-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 177
    iget v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextGravity:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 178
    iget v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextColor:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 179
    invoke-virtual {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextSize:I

    int-to-float v2, v2

    invoke-static {v1, v2}, Lmehdi/sakout/fancybuttons/Utils;->pxToSp(Landroid/content/Context;F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 181
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 182
    invoke-virtual {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->isInEditMode()Z

    move-result v1

    if-nez v1, :cond_41

    iget-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextTypeFace:Landroid/graphics/Typeface;

    if-eqz v1, :cond_41

    .line 183
    iget-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextTypeFace:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 187
    .end local v0    # "textView":Landroid/widget/TextView;
    :cond_41
    :goto_41
    return-object v0

    :cond_42
    const/4 v0, 0x0

    goto :goto_41
.end method


# virtual methods
.method public getIconFontObject()Landroid/widget/TextView;
    .registers 2

    .prologue
    .line 673
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    return-object v0
.end method

.method public getIconImageObject()Landroid/widget/ImageView;
    .registers 2

    .prologue
    .line 681
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconView:Landroid/widget/ImageView;

    return-object v0
.end method

.method public getText()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 654
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_b

    .line 655
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    .line 657
    :goto_a
    return-object v0

    :cond_b
    const-string v0, ""

    goto :goto_a
.end method

.method public getTextViewObject()Landroid/widget/TextView;
    .registers 2

    .prologue
    .line 665
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    return-object v0
.end method

.method public setBackgroundColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 451
    iput p1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultBackgroundColor:I

    .line 452
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconView:Landroid/widget/ImageView;

    if-nez v0, :cond_e

    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    if-nez v0, :cond_e

    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_11

    .line 453
    :cond_e
    invoke-direct {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->setupBackground()V

    .line 455
    :cond_11
    return-void
.end method

.method public setBorderColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 568
    iput p1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mBorderColor:I

    .line 569
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconView:Landroid/widget/ImageView;

    if-nez v0, :cond_e

    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    if-nez v0, :cond_e

    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_11

    .line 570
    :cond_e
    invoke-direct {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->setupBackground()V

    .line 572
    :cond_11
    return-void
.end method

.method public setBorderWidth(I)V
    .registers 3
    .param p1, "width"    # I

    .prologue
    .line 579
    iput p1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mBorderWidth:I

    .line 580
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconView:Landroid/widget/ImageView;

    if-nez v0, :cond_e

    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    if-nez v0, :cond_e

    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_11

    .line 581
    :cond_e
    invoke-direct {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->setupBackground()V

    .line 583
    :cond_11
    return-void
.end method

.method public setCustomIconFont(Ljava/lang/String;)V
    .registers 9
    .param p1, "fontName"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 623
    :try_start_2
    iget-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    const-string v2, "iconfonts/%s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v1

    iput-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconTypeFace:Landroid/graphics/Typeface;
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_1a} :catch_22

    .line 629
    :goto_1a
    iget-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    if-nez v1, :cond_45

    .line 630
    invoke-direct {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->initializeFancyButton()V

    .line 634
    :goto_21
    return-void

    .line 624
    :catch_22
    move-exception v0

    .line 625
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "FancyButtons"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 626
    iget-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    const-string v2, "iconfonts/%s"

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultIconFont:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v1

    iput-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconTypeFace:Landroid/graphics/Typeface;

    goto :goto_1a

    .line 632
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_45
    iget-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    iget-object v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconTypeFace:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto :goto_21
.end method

.method public setCustomTextFont(Ljava/lang/String;)V
    .registers 9
    .param p1, "fontName"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 603
    :try_start_2
    iget-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    const-string v2, "fonts/%s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v1

    iput-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextTypeFace:Landroid/graphics/Typeface;
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_1a} :catch_22

    .line 609
    :goto_1a
    iget-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    if-nez v1, :cond_45

    .line 610
    invoke-direct {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->initializeFancyButton()V

    .line 614
    :goto_21
    return-void

    .line 604
    :catch_22
    move-exception v0

    .line 605
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "FancyButtons"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 606
    iget-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    const-string v2, "fonts/%s"

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextFont:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v1

    iput-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextTypeFace:Landroid/graphics/Typeface;

    goto :goto_1a

    .line 612
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_45
    iget-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    iget-object v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextTypeFace:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto :goto_21
.end method

.method public setFocusBackgroundColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 462
    iput p1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFocusBackgroundColor:I

    .line 463
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconView:Landroid/widget/ImageView;

    if-nez v0, :cond_e

    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    if-nez v0, :cond_e

    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_11

    .line 464
    :cond_e
    invoke-direct {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->setupBackground()V

    .line 466
    :cond_11
    return-void
.end method

.method public setFontIconSize(I)V
    .registers 4
    .param p1, "iconSize"    # I

    .prologue
    .line 543
    invoke-virtual {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->getContext()Landroid/content/Context;

    move-result-object v0

    int-to-float v1, p1

    invoke-static {v0, v1}, Lmehdi/sakout/fancybuttons/Utils;->spToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconSize:I

    .line 544
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    if-eqz v0, :cond_15

    .line 545
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    int-to-float v1, p1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 546
    :cond_15
    return-void
.end method

.method public setGhost(Z)V
    .registers 3
    .param p1, "ghost"    # Z

    .prologue
    .line 641
    iput-boolean p1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mGhost:Z

    .line 643
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconView:Landroid/widget/ImageView;

    if-nez v0, :cond_e

    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    if-nez v0, :cond_e

    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_11

    .line 644
    :cond_e
    invoke-direct {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->setupBackground()V

    .line 647
    :cond_11
    return-void
.end method

.method public setIconColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 441
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    if-eqz v0, :cond_9

    .line 442
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 444
    :cond_9
    return-void
.end method

.method public setIconPadding(IIII)V
    .registers 10
    .param p1, "paddingLeft"    # I
    .param p2, "paddingTop"    # I
    .param p3, "paddingRight"    # I
    .param p4, "paddingBottom"    # I

    .prologue
    .line 498
    iput p1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingLeft:I

    .line 499
    iput p2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingTop:I

    .line 500
    iput p3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingRight:I

    .line 501
    iput p4, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingBottom:I

    .line 502
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconView:Landroid/widget/ImageView;

    if-eqz v0, :cond_19

    .line 503
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconView:Landroid/widget/ImageView;

    iget v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingLeft:I

    iget v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingTop:I

    iget v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingRight:I

    iget v4, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingBottom:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 505
    :cond_19
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    if-eqz v0, :cond_2a

    .line 506
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    iget v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingLeft:I

    iget v2, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingTop:I

    iget v3, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingRight:I

    iget v4, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPaddingBottom:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 508
    :cond_2a
    return-void
.end method

.method public setIconPosition(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 554
    if-lez p1, :cond_b

    const/4 v0, 0x5

    if-ge p1, v0, :cond_b

    .line 555
    iput p1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPosition:I

    .line 559
    :goto_7
    invoke-direct {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->initializeFancyButton()V

    .line 560
    return-void

    .line 557
    :cond_b
    const/4 v0, 0x1

    iput v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconPosition:I

    goto :goto_7
.end method

.method public setIconResource(I)V
    .registers 4
    .param p1, "drawable"    # I

    .prologue
    .line 515
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconResource:Landroid/graphics/drawable/Drawable;

    .line 516
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconView:Landroid/widget/ImageView;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    if-eqz v0, :cond_1b

    .line 517
    :cond_14
    const/4 v0, 0x0

    iput-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    .line 518
    invoke-direct {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->initializeFancyButton()V

    .line 522
    :goto_1a
    return-void

    .line 521
    :cond_1b
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconView:Landroid/widget/ImageView;

    iget-object v1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconResource:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1a
.end method

.method public setIconResource(Ljava/lang/String;)V
    .registers 3
    .param p1, "icon"    # Ljava/lang/String;

    .prologue
    .line 529
    iput-object p1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIcon:Ljava/lang/String;

    .line 530
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    if-nez v0, :cond_d

    .line 531
    const/4 v0, 0x0

    iput-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconView:Landroid/widget/ImageView;

    .line 532
    invoke-direct {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->initializeFancyButton()V

    .line 536
    :goto_c
    return-void

    .line 535
    :cond_d
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_c
.end method

.method public setRadius(I)V
    .registers 3
    .param p1, "radius"    # I

    .prologue
    .line 590
    iput p1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mRadius:I

    .line 591
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mIconView:Landroid/widget/ImageView;

    if-nez v0, :cond_e

    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mFontIconView:Landroid/widget/TextView;

    if-nez v0, :cond_e

    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_11

    .line 592
    :cond_e
    invoke-direct {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->setupBackground()V

    .line 594
    :cond_11
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 415
    iput-object p1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mText:Ljava/lang/String;

    .line 416
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    if-nez v0, :cond_a

    .line 417
    invoke-direct {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->initializeFancyButton()V

    .line 420
    :goto_9
    return-void

    .line 419
    :cond_a
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_9
.end method

.method public setTextColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 428
    iput p1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextColor:I

    .line 429
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    if-nez v0, :cond_a

    .line 430
    invoke-direct {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->initializeFancyButton()V

    .line 434
    :goto_9
    return-void

    .line 432
    :cond_a
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_9
.end method

.method public setTextGravity(I)V
    .registers 3
    .param p1, "gravity"    # I

    .prologue
    .line 484
    iput p1, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextGravity:I

    .line 485
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_b

    .line 486
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setGravity(I)V

    .line 488
    :cond_b
    return-void
.end method

.method public setTextSize(I)V
    .registers 4
    .param p1, "textSize"    # I

    .prologue
    .line 473
    invoke-virtual {p0}, Lmehdi/sakout/fancybuttons/FancyButton;->getContext()Landroid/content/Context;

    move-result-object v0

    int-to-float v1, p1

    invoke-static {v0, v1}, Lmehdi/sakout/fancybuttons/Utils;->spToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mDefaultTextSize:I

    .line 474
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_15

    .line 475
    iget-object v0, p0, Lmehdi/sakout/fancybuttons/FancyButton;->mTextView:Landroid/widget/TextView;

    int-to-float v1, p1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 476
    :cond_15
    return-void
.end method
