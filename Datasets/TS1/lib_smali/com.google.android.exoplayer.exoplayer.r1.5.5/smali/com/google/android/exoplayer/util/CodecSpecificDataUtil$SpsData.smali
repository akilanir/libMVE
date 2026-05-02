.class public final Lcom/google/android/exoplayer/util/CodecSpecificDataUtil$SpsData;
.super Ljava/lang/Object;
.source "CodecSpecificDataUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SpsData"
.end annotation


# instance fields
.field public final height:I

.field public final pixelWidthAspectRatio:F

.field public final width:I


# direct methods
.method public constructor <init>(IIF)V
    .registers 4
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "pixelWidthAspectRatio"    # F

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput p1, p0, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil$SpsData;->width:I

    .line 40
    iput p2, p0, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil$SpsData;->height:I

    .line 41
    iput p3, p0, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil$SpsData;->pixelWidthAspectRatio:F

    .line 42
    return-void
.end method
