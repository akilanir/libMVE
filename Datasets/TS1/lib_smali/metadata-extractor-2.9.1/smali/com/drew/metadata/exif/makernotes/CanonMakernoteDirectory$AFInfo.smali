.class public final Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory$AFInfo;
.super Ljava/lang/Object;
.source "CanonMakernoteDirectory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/drew/metadata/exif/makernotes/CanonMakernoteDirectory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AFInfo"
.end annotation


# static fields
.field private static final OFFSET:I = 0xd200

.field public static final TAG_AF_AREA_HEIGHT:I = 0xd207

.field public static final TAG_AF_AREA_WIDTH:I = 0xd206

.field public static final TAG_AF_AREA_X_POSITIONS:I = 0xd208

.field public static final TAG_AF_AREA_Y_POSITIONS:I = 0xd209

.field public static final TAG_AF_IMAGE_HEIGHT:I = 0xd205

.field public static final TAG_AF_IMAGE_WIDTH:I = 0xd204

.field public static final TAG_AF_POINTS_IN_FOCUS:I = 0xd20a

.field public static final TAG_IMAGE_HEIGHT:I = 0xd203

.field public static final TAG_IMAGE_WIDTH:I = 0xd202

.field public static final TAG_NUM_AF_POINTS:I = 0xd200

.field public static final TAG_PRIMARY_AF_POINT_1:I = 0xd20b

.field public static final TAG_PRIMARY_AF_POINT_2:I = 0xd20c

.field public static final TAG_VALID_AF_POINTS:I = 0xd201


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 360
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
