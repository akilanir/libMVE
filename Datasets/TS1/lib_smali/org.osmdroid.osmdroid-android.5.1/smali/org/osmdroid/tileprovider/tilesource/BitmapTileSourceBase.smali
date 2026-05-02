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
    .line 20
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
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->random:Ljava/util/Random;

    .line 45
    sget v0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->globalOrdinal:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->globalOrdinal:I

    iput v0, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mOrdinal:I

    .line 46
    iput-object p1, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mName:Ljava/lang/String;

    .line 47
    iput p2, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mMinimumZoomLevel:I

    .line 48
    iput p3, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mMaximumZoomLevel:I

    .line 49
    iput p4, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mTileSizePixels:I

    .line 50
    iput-object p5, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mImageFilenameEnding:Ljava/lang/String;

    .line 51
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

    .line 146
    :try_start_1
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 147
    .local v1, "bitmapOptions":Landroid/graphics/BitmapFactory$Options;
    invoke-static {}, Lorg/osmdroid/tileprovider/BitmapPool;->getInstance()Lorg/osmdroid/tileprovider/BitmapPool;

    move-result-object v4

    invoke-virtual {v4, v1}, Lorg/osmdroid/tileprovider/BitmapPool;->applyReusableOptions(Landroid/graphics/BitmapFactory$Options;)V

    .line 148
    const/4 v4, 0x0

    invoke-static {p1, v4, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 149
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_19

    .line 150
    new-instance v3, Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;

    invoke-direct {v3, v0}, Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V
    :try_end_19
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_19} :catch_1a

    .line 157
    :cond_19
    return-object v3

    .line 152
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "bitmapOptions":Landroid/graphics/BitmapFactory$Options;
    :catch_1a
    move-exception v2

    .line 153
    .local v2, "e":Ljava/lang/OutOfMemoryError;
    const-string v3, "OsmDroid"

    const-string v4, "OutOfMemoryError loading bitmap"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 155
    new-instance v3, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException;

    invoke-direct {v3, p0, v2}, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException;-><init>(Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public getDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .registers 9
    .param p1, "aFilePath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException;
        }
    .end annotation

    .prologue
    .line 93
    :try_start_0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 94
    .local v1, "bitmapOptions":Landroid/graphics/BitmapFactory$Options;
    invoke-static {}, Lorg/osmdroid/tileprovider/BitmapPool;->getInstance()Lorg/osmdroid/tileprovider/BitmapPool;

    move-result-object v4

    invoke-virtual {v4, v1}, Lorg/osmdroid/tileprovider/BitmapPool;->applyReusableOptions(Landroid/graphics/BitmapFactory$Options;)V

    .line 97
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xf

    if-ne v4, v5, :cond_1e

    .line 98
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 101
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    :goto_16
    if-eqz v0, :cond_23

    .line 102
    new-instance v4, Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;

    invoke-direct {v4, v0}, Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 124
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "bitmapOptions":Landroid/graphics/BitmapFactory$Options;
    :goto_1d
    return-object v4

    .line 100
    .restart local v1    # "bitmapOptions":Landroid/graphics/BitmapFactory$Options;
    :cond_1e
    invoke-static {p1, v1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    goto :goto_16

    .line 104
    :cond_23
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 105
    .local v2, "bmp":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_8c

    .line 107
    const-string v4, "OsmDroid"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " is an invalid image file, deleting..."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_46
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_46} :catch_6a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_46} :catch_ab

    .line 109
    :try_start_46
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->delete()Z
    :try_end_4e
    .catch Ljava/lang/Throwable; {:try_start_46 .. :try_end_4e} :catch_50
    .catch Ljava/lang/OutOfMemoryError; {:try_start_46 .. :try_end_4e} :catch_6a
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_4e} :catch_ab

    .line 124
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "bitmapOptions":Landroid/graphics/BitmapFactory$Options;
    .end local v2    # "bmp":Ljava/io/File;
    :goto_4e
    const/4 v4, 0x0

    goto :goto_1d

    .line 110
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v1    # "bitmapOptions":Landroid/graphics/BitmapFactory$Options;
    .restart local v2    # "bmp":Ljava/io/File;
    :catch_50
    move-exception v3

    .line 111
    .local v3, "e":Ljava/lang/Throwable;
    :try_start_51
    const-string v4, "OsmDroid"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error deleting invalid file: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_69
    .catch Ljava/lang/OutOfMemoryError; {:try_start_51 .. :try_end_69} :catch_6a
    .catch Ljava/lang/Exception; {:try_start_51 .. :try_end_69} :catch_ab

    goto :goto_4e

    .line 116
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "bitmapOptions":Landroid/graphics/BitmapFactory$Options;
    .end local v2    # "bmp":Ljava/io/File;
    .end local v3    # "e":Ljava/lang/Throwable;
    :catch_6a
    move-exception v3

    .line 117
    .local v3, "e":Ljava/lang/OutOfMemoryError;
    const-string v4, "OsmDroid"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "OutOfMemoryError loading bitmap: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 119
    new-instance v4, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException;

    invoke-direct {v4, p0, v3}, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException;-><init>(Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;Ljava/lang/Throwable;)V

    throw v4

    .line 114
    .end local v3    # "e":Ljava/lang/OutOfMemoryError;
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v1    # "bitmapOptions":Landroid/graphics/BitmapFactory$Options;
    .restart local v2    # "bmp":Ljava/io/File;
    :cond_8c
    :try_start_8c
    const-string v4, "OsmDroid"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Request tile: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " does not exist"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_aa
    .catch Ljava/lang/OutOfMemoryError; {:try_start_8c .. :try_end_aa} :catch_6a
    .catch Ljava/lang/Exception; {:try_start_8c .. :try_end_aa} :catch_ab

    goto :goto_4e

    .line 120
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "bitmapOptions":Landroid/graphics/BitmapFactory$Options;
    .end local v2    # "bmp":Ljava/io/File;
    :catch_ab
    move-exception v3

    .line 121
    .local v3, "e":Ljava/lang/Exception;
    const-string v4, "OsmDroid"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected error loading bitmap: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 122
    invoke-static {}, Ljava/lang/System;->gc()V

    goto :goto_4e
.end method

.method public getMaximumZoomLevel()I
    .registers 2

    .prologue
    .line 78
    iget v0, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mMaximumZoomLevel:I

    return v0
.end method

.method public getMinimumZoomLevel()I
    .registers 2

    .prologue
    .line 73
    iget v0, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mMinimumZoomLevel:I

    return v0
.end method

.method public getTileRelativeFilenameString(Lorg/osmdroid/tileprovider/MapTile;)Ljava/lang/String;
    .registers 5
    .param p1, "tile"    # Lorg/osmdroid/tileprovider/MapTile;

    .prologue
    const/16 v2, 0x2f

    .line 129
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 130
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->pathBase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 132
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTile;->getZoomLevel()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 133
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 134
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTile;->getX()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 135
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 136
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTile;->getY()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->imageFilenameEnding()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getTileSizePixels()I
    .registers 2

    .prologue
    .line 83
    iget v0, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mTileSizePixels:I

    return v0
.end method

.method public imageFilenameEnding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mImageFilenameEnding:Ljava/lang/String;

    return-object v0
.end method

.method public name()Ljava/lang/String;
    .registers 2

    .prologue
    .line 60
    iget-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public ordinal()I
    .registers 2

    .prologue
    .line 55
    iget v0, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mOrdinal:I

    return v0
.end method

.method public pathBase()Ljava/lang/String;
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase;->mName:Ljava/lang/String;

    return-object v0
.end method
