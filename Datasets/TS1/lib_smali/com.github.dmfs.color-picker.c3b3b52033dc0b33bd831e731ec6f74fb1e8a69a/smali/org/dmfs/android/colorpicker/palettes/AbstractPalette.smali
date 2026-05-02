.class public abstract Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;
.super Ljava/lang/Object;
.source "AbstractPalette.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ParcelCreator"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getColor(I)I
.end method

.method public abstract getColorName(I)Ljava/lang/String;
.end method

.method public abstract getId()Ljava/lang/String;
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract getNumberOfColors()I
.end method

.method public abstract getNumberOfColumns()I
.end method
