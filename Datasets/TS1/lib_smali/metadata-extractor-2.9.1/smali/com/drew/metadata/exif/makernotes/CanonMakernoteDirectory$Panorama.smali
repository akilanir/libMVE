.class public final Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory$Panorama;
.super Ljava/lang/Object;
.source "CanonMakernoteDirectory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Panorama"
.end annotation


# static fields
.field private static final OFFSET:I = 0xc500

.field public static final TAG_PANORAMA_DIRECTION:I = 0xc505

.field public static final TAG_PANORAMA_FRAME_NUMBER:I = 0xc502


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 350
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
