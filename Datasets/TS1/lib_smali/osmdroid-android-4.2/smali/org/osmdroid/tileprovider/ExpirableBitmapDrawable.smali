.class public Lorg/osmdroid/tileprovider/ExpirableBitmapDrawable;
.super Landroid/graphics/drawable/BitmapDrawable;
.source "ExpirableBitmapDrawable.java"


# static fields
.field public static final EXPIRED:I = -0x1


# instance fields
.field private mState:[I


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;)V
    .registers 3
    .param p1, "pBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 18
    const/4 v0, 0x0

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/osmdroid/tileprovider/ExpirableBitmapDrawable;->mState:[I

    .line 19
    return-void
.end method

.method public static isDrawableExpired(Landroid/graphics/drawable/Drawable;)Z
    .registers 6
    .param p0, "pTile"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v2, 0x0

    .line 38
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v3

    if-nez v3, :cond_8

    .line 47
    :cond_7
    :goto_7
    return v2

    .line 41
    :cond_8
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v1

    .line 42
    .local v1, "state":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    array-length v3, v1

    if-ge v0, v3, :cond_7

    .line 43
    aget v3, v1, v0

    const/4 v4, -0x1

    if-ne v3, v4, :cond_17

    .line 44
    const/4 v2, 0x1

    goto :goto_7

    .line 42
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_d
.end method


# virtual methods
.method public getState()[I
    .registers 2

    .prologue
    .line 23
    iget-object v0, p0, Lorg/osmdroid/tileprovider/ExpirableBitmapDrawable;->mState:[I

    return-object v0
.end method

.method public isStateful()Z
    .registers 2

    .prologue
    .line 28
    iget-object v0, p0, Lorg/osmdroid/tileprovider/ExpirableBitmapDrawable;->mState:[I

    array-length v0, v0

    if-lez v0, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public setState([I)Z
    .registers 3
    .param p1, "pStateSet"    # [I

    .prologue
    .line 33
    iput-object p1, p0, Lorg/osmdroid/tileprovider/ExpirableBitmapDrawable;->mState:[I

    .line 34
    const/4 v0, 0x1

    return v0
.end method
