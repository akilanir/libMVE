.class public Lcom/mikepenz/materialdrawer/holder/ImageHolder;
.super Ljava/lang/Object;
.source "ImageHolder.java"


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field private mIIcon:Lcom/mikepenz/iconics/typeface/IIcon;

.field private mIcon:Landroid/graphics/drawable/Drawable;

.field private mIconRes:I

.field private mUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "iconRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIconRes:I

    .line 49
    iput p1, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIconRes:I

    .line 50
    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap;)V
    .registers 3
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIconRes:I

    .line 45
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mBitmap:Landroid/graphics/Bitmap;

    .line 46
    return-void
.end method

.method public constructor <init>(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIconRes:I

    .line 41
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIcon:Landroid/graphics/drawable/Drawable;

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;)V
    .registers 3
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIconRes:I

    .line 37
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mUri:Landroid/net/Uri;

    .line 38
    return-void
.end method

.method public constructor <init>(Lcom/mikepenz/iconics/typeface/IIcon;)V
    .registers 3
    .param p1, "iicon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIconRes:I

    .line 53
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    .line 54
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIconRes:I

    .line 33
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mUri:Landroid/net/Uri;

    .line 34
    return-void
.end method

.method public static applyDecidedIconOrSetGone(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/widget/ImageView;IZI)V
    .registers 9
    .param p0, "imageHolder"    # Lcom/mikepenz/materialdrawer/holder/ImageHolder;
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .param p2, "iconColor"    # I
    .param p3, "tint"    # Z
    .param p4, "paddingDp"    # I

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 259
    if-eqz p0, :cond_2d

    if-eqz p1, :cond_2d

    .line 260
    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {p0, v1, p2, p3, p4}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->decideIcon(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/content/Context;IZI)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 261
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_18

    .line 262
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 263
    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 273
    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_17
    :goto_17
    return-void

    .line 264
    .restart local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_18
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_29

    .line 265
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 266
    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_17

    .line 268
    :cond_29
    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_17

    .line 270
    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_2d
    if-eqz p1, :cond_17

    .line 271
    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_17
.end method

.method public static applyMultiIconTo(Landroid/graphics/drawable/Drawable;ILandroid/graphics/drawable/Drawable;IZLandroid/widget/ImageView;)V
    .registers 7
    .param p0, "icon"    # Landroid/graphics/drawable/Drawable;
    .param p1, "iconColor"    # I
    .param p2, "selectedIcon"    # Landroid/graphics/drawable/Drawable;
    .param p3, "selectedIconColor"    # I
    .param p4, "tinted"    # Z
    .param p5, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 287
    if-eqz p0, :cond_1f

    .line 289
    if-eqz p2, :cond_10

    .line 290
    invoke-static {p0, p2}, Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;->getIconStateList(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v0

    invoke-virtual {p5, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 297
    :goto_b
    const/4 v0, 0x0

    invoke-virtual {p5, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 302
    :goto_f
    return-void

    .line 291
    :cond_10
    if-eqz p4, :cond_1b

    .line 292
    new-instance v0, Lcom/mikepenz/materialdrawer/util/PressedEffectStateListDrawable;

    invoke-direct {v0, p0, p1, p3}, Lcom/mikepenz/materialdrawer/util/PressedEffectStateListDrawable;-><init>(Landroid/graphics/drawable/Drawable;II)V

    invoke-virtual {p5, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_b

    .line 294
    :cond_1b
    invoke-virtual {p5, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_b

    .line 300
    :cond_1f
    const/16 v0, 0x8

    invoke-virtual {p5, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_f
.end method

.method public static applyTo(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/widget/ImageView;)Z
    .registers 3
    .param p0, "imageHolder"    # Lcom/mikepenz/materialdrawer/holder/ImageHolder;
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 157
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->applyTo(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/widget/ImageView;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static applyTo(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/widget/ImageView;Ljava/lang/String;)Z
    .registers 4
    .param p0, "imageHolder"    # Lcom/mikepenz/materialdrawer/holder/ImageHolder;
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 169
    if-eqz p0, :cond_9

    if-eqz p1, :cond_9

    .line 170
    invoke-virtual {p0, p1, p2}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->applyTo(Landroid/widget/ImageView;Ljava/lang/String;)Z

    move-result v0

    .line 172
    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public static applyToOrSetGone(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/widget/ImageView;)V
    .registers 3
    .param p0, "imageHolder"    # Lcom/mikepenz/materialdrawer/holder/ImageHolder;
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 211
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->applyToOrSetGone(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/widget/ImageView;Ljava/lang/String;)V

    .line 212
    return-void
.end method

.method public static applyToOrSetGone(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/widget/ImageView;Ljava/lang/String;)V
    .registers 5
    .param p0, "imageHolder"    # Lcom/mikepenz/materialdrawer/holder/ImageHolder;
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 222
    invoke-static {p0, p1, p2}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->applyTo(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/widget/ImageView;Ljava/lang/String;)Z

    move-result v0

    .line 223
    .local v0, "imageSet":Z
    if-eqz p1, :cond_c

    .line 224
    if-eqz v0, :cond_d

    .line 225
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 230
    :cond_c
    :goto_c
    return-void

    .line 227
    :cond_d
    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_c
.end method

.method public static applyToOrSetInvisible(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/widget/ImageView;)V
    .registers 3
    .param p0, "imageHolder"    # Lcom/mikepenz/materialdrawer/holder/ImageHolder;
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 182
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->applyToOrSetInvisible(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/widget/ImageView;Ljava/lang/String;)V

    .line 183
    return-void
.end method

.method public static applyToOrSetInvisible(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/widget/ImageView;Ljava/lang/String;)V
    .registers 5
    .param p0, "imageHolder"    # Lcom/mikepenz/materialdrawer/holder/ImageHolder;
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 193
    invoke-static {p0, p1, p2}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->applyTo(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/widget/ImageView;Ljava/lang/String;)Z

    move-result v0

    .line 194
    .local v0, "imageSet":Z
    if-eqz p1, :cond_c

    .line 195
    if-eqz v0, :cond_d

    .line 196
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 201
    :cond_c
    :goto_c
    return-void

    .line 198
    :cond_d
    const/4 v1, 0x4

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_c
.end method

.method public static decideIcon(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/content/Context;IZI)Landroid/graphics/drawable/Drawable;
    .registers 6
    .param p0, "imageHolder"    # Lcom/mikepenz/materialdrawer/holder/ImageHolder;
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "iconColor"    # I
    .param p3, "tint"    # Z
    .param p4, "paddingDp"    # I

    .prologue
    .line 242
    if-nez p0, :cond_4

    .line 243
    const/4 v0, 0x0

    .line 245
    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->decideIcon(Landroid/content/Context;IZI)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_3
.end method


# virtual methods
.method public applyTo(Landroid/widget/ImageView;)Z
    .registers 3
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 84
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->applyTo(Landroid/widget/ImageView;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public applyTo(Landroid/widget/ImageView;Ljava/lang/String;)Z
    .registers 6
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 95
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mUri:Landroid/net/Uri;

    if-eqz v0, :cond_31

    .line 96
    const-string v0, "http"

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    const-string v0, "https"

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 97
    :cond_20
    invoke-static {}, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->getInstance()Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;

    move-result-object v0

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mUri:Landroid/net/Uri;

    invoke-virtual {v0, p1, v1, p2}, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->setImage(Landroid/widget/ImageView;Landroid/net/Uri;Ljava/lang/String;)V

    .line 113
    :goto_29
    const/4 v0, 0x1

    :goto_2a
    return v0

    .line 99
    :cond_2b
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mUri:Landroid/net/Uri;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    goto :goto_29

    .line 101
    :cond_31
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_3b

    .line 102
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_29

    .line 103
    :cond_3b
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_45

    .line 104
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_29

    .line 105
    :cond_45
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIconRes:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_50

    .line 106
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIconRes:I

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_29

    .line 107
    :cond_50
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    if-eqz v0, :cond_67

    .line 108
    new-instance v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    invoke-direct {v0, v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Lcom/mikepenz/iconics/typeface/IIcon;)V

    invoke-virtual {v0}, Lcom/mikepenz/iconics/IconicsDrawable;->actionBar()Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_29

    .line 110
    :cond_67
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 111
    const/4 v0, 0x0

    goto :goto_2a
.end method

.method public decideIcon(Landroid/content/Context;IZI)Landroid/graphics/drawable/Drawable;
    .registers 9
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "iconColor"    # I
    .param p3, "tint"    # Z
    .param p4, "paddingDp"    # I

    .prologue
    .line 125
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIcon:Landroid/graphics/drawable/Drawable;

    .line 127
    .local v0, "icon":Landroid/graphics/drawable/Drawable;
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    if-eqz v2, :cond_2d

    .line 128
    new-instance v2, Lcom/mikepenz/iconics/IconicsDrawable;

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    invoke-direct {v2, p1, v3}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Lcom/mikepenz/iconics/typeface/IIcon;)V

    invoke-virtual {v2, p2}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v2

    const/16 v3, 0x18

    invoke-virtual {v2, v3}, Lcom/mikepenz/iconics/IconicsDrawable;->sizeDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v2

    invoke-virtual {v2, p4}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    .line 141
    :cond_1b
    :goto_1b
    if-eqz v0, :cond_2c

    if-eqz p3, :cond_2c

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    if-nez v2, :cond_2c

    .line 142
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 143
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, p2, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 146
    :cond_2c
    return-object v0

    .line 129
    :cond_2d
    iget v2, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIconRes:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_39

    .line 130
    iget v2, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIconRes:I

    invoke-static {p1, v2}, Lcom/mikepenz/materialize/util/UIUtils;->getCompatDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_1b

    .line 131
    :cond_39
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mUri:Landroid/net/Uri;

    if-eqz v2, :cond_1b

    .line 133
    :try_start_3d
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mUri:Landroid/net/Uri;

    invoke-virtual {v2, v3}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1

    .line 134
    .local v1, "inputStream":Ljava/io/InputStream;
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    :try_end_50
    .catch Ljava/io/FileNotFoundException; {:try_start_3d .. :try_end_50} :catch_52

    move-result-object v0

    goto :goto_1b

    .line 135
    .end local v1    # "inputStream":Ljava/io/InputStream;
    :catch_52
    move-exception v2

    goto :goto_1b
.end method

.method public getBitmap()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getIIcon()Lcom/mikepenz/iconics/typeface/IIcon;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    return-object v0
.end method

.method public getIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIcon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getIconRes()I
    .registers 2

    .prologue
    .line 69
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mIconRes:I

    return v0
.end method

.method public getUri()Landroid/net/Uri;
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->mUri:Landroid/net/Uri;

    return-object v0
.end method
