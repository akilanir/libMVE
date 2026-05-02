.class public abstract Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;
.super Ljava/lang/Object;
.source "BitmapTileSourceBase.java"

# interfaces
.implements Lorg/osmdroid/tileprovider/tilesource/ITileSource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException;
    }
.end annotation


# static fields
.field private static globalOrdinal:I


# instance fields
.field protected final mImageFilenameEnding:Ljava/lang/String;

.field private final mMaximumZoomLevel:I

.field private final mMinimumZoomLevel:I

.field protected final mName:Ljava/lang/String;

.field private final mOrdinal:I

.field private final mTileSizePixels:I

.field protected final random:Ljava/util/Random;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 19
    const/4 v0, 0x0

    sput v0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->globalOrdinal:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIILjava/lang/String;)V
    .registers 8
    .param p1, "aName"    # Ljava/lang/String;
    .param p2, "aZoomMinLevel"    # I
    .param p3, "aZoomMaxLevel"    # I
    .param p4, "aTileSizePixels"    # I
    .param p5, "aImageFilenameEnding"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->random:Ljava/util/Random;

    .line 44
    sget v0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->globalOrdinal:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->globalOrdinal:I

    iput v0, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mOrdinal:I

    .line 45
    iput-object p1, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mName:Ljava/lang/String;

    .line 46
    iput p2, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mMinimumZoomLevel:I

    .line 47
    iput p3, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mMaximumZoomLevel:I

    .line 48
    iput p4, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mTileSizePixels:I

    .line 49
    iput-object p5, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mImageFilenameEnding:Ljava/lang/String;

    .line 50
    return-void
.end method


# virtual methods
.method public getDrawable(Ljava/io/InputStream;)Landroid/graphics/drawable/Drawable;
    .registers 7
    .param p1, "aFileInputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 130
    :try_start_1
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 131
    .local v1, "bitmapOptions":Landroid/graphics/BitmapFactory$Options;
    invoke-static {}, Lorg/osmdroid/tileprovider/BitmapPool;->getInstance()Lorg/osmdroid/tileprovider/BitmapPool;

    move-result-object v4

    invoke-virtual {v4, v1}, Lorg/osmdroid/tileprovider/BitmapPool;->applyReusableOptions(Landroid/graphics/BitmapFactory$Options;)V

    .line 132
    const/4 v4, 0x0

    invoke-static {p1, v4, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 133
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_19

    .line 134
    new-instance v3, Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;

    invoke-direct {v3, v0}, Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V
    :try_end_19
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_19} :catch_1a

    .line 141
    :cond_19
    return-object v3

    .line 136
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "bitmapOptions":Landroid/graphics/BitmapFactory$Options;
    :catch_1a
    move-exception v2

    .line 137
    .local v2, "e":Ljava/lang/OutOfMemoryError;
    const-string v3, "OsmDroid"

    const-string v4, "OutOfMemoryError loading bitmap"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 139
    new-instance v3, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException;

    invoke-direct {v3, p0, v2}, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException;-><init>(Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public getDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .registers 8
    .param p1, "aFilePath"    # Ljava/lang/String;

    .prologue
    .line 91
    :try_start_0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 92
    .local v1, "bitmapOptions":Landroid/graphics/BitmapFactory$Options;
    invoke-static {}, Lorg/osmdroid/tileprovider/BitmapPool;->getInstance()Lorg/osmdroid/tileprovider/BitmapPool;

    move-result-object v3

    invoke-virtual {v3, v1}, Lorg/osmdroid/tileprovider/BitmapPool;->applyReusableOptions(Landroid/graphics/BitmapFactory$Options;)V

    .line 93
    invoke-static {p1, v1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 94
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_18

    .line 95
    new-instance v3, Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;

    invoke-direct {v3, v0}, Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V
    :try_end_17
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_17} :catch_3c

    .line 108
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "bitmapOptions":Landroid/graphics/BitmapFactory$Options;
    :goto_17
    return-object v3

    .line 99
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v1    # "bitmapOptions":Landroid/graphics/BitmapFactory$Options;
    :cond_18
    :try_start_18
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_20
    .catch Ljava/lang/Throwable; {:try_start_18 .. :try_end_20} :catch_22
    .catch Ljava/lang/OutOfMemoryError; {:try_start_18 .. :try_end_20} :catch_3c

    .line 108
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "bitmapOptions":Landroid/graphics/BitmapFactory$Options;
    :goto_20
    const/4 v3, 0x0

    goto :goto_17

    .line 100
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v1    # "bitmapOptions":Landroid/graphics/BitmapFactory$Options;
    :catch_22
    move-exception v2

    .line 101
    .local v2, "e":Ljava/lang/Throwable;
    :try_start_23
    const-string v3, "OsmDroid"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error deleting invalid file: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3b
    .catch Ljava/lang/OutOfMemoryError; {:try_start_23 .. :try_end_3b} :catch_3c

    goto :goto_20

    .line 104
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "bitmapOptions":Landroid/graphics/BitmapFactory$Options;
    .end local v2    # "e":Ljava/lang/Throwable;
    :catch_3c
    move-exception v2

    .line 105
    .local v2, "e":Ljava/lang/OutOfMemoryError;
    const-string v3, "OsmDroid"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "OutOfMemoryError loading bitmap: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    invoke-static {}, Ljava/lang/System;->gc()V

    goto :goto_20
.end method

.method public getMaximumZoomLevel()I
    .registers 2

    .prologue
    .line 77
    iget v0, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mMaximumZoomLevel:I

    return v0
.end method

.method public getMinimumZoomLevel()I
    .registers 2

    .prologue
    .line 72
    iget v0, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mMinimumZoomLevel:I

    return v0
.end method

.method public getTileRelativeFilenameString(Lorg/osmdroid/tileprovider/MapTile;)Ljava/lang/String;
    .registers 5
    .param p1, "tile"    # Lorg/osmdroid/tileprovider/MapTile;

    .prologue
    const/16 v2, 0x2f

    .line 113
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->pathBase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 116
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTile;->getZoomLevel()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 118
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTile;->getX()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 119
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 120
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTile;->getY()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->imageFilenameEnding()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getTileSizePixels()I
    .registers 2

    .prologue
    .line 82
    iget v0, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mTileSizePixels:I

    return v0
.end method

.method public imageFilenameEnding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 67
    iget-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mImageFilenameEnding:Ljava/lang/String;

    return-object v0
.end method

.method public name()Ljava/lang/String;
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public ordinal()I
    .registers 2

    .prologue
    .line 54
    iget v0, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mOrdinal:I

    return v0
.end method

.method public pathBase()Ljava/lang/String;
    .registers 2

    .prologue
    .line 63
    iget-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mName:Ljava/lang/String;

    return-object v0
.end method
