.class public final Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory$FocalLength;
.super Ljava/lang/Object;
.source "CanonMakernoteDirectory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "FocalLength"
.end annotation


# static fields
.field private static final OFFSET:I = 0xc200

.field public static final TAG_AEB_BRACKET_VALUE:I = 0xc211

.field public static final TAG_AF_POINT_USED:I = 0xc20e

.field public static final TAG_AUTO_EXPOSURE_BRACKETING:I = 0xc210

.field public static final TAG_FLASH_BIAS:I = 0xc20f

.field public static final TAG_SEQUENCE_NUMBER:I = 0xc209

.field public static final TAG_SUBJECT_DISTANCE:I = 0xc213

.field public static final TAG_WHITE_BALANCE:I = 0xc207


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 269
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
