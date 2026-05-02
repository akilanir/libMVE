.class public final Lcom/drew/imaging/PhotographicConversions;
.super Ljava/lang/Object;
.source "PhotographicConversions.java"


# static fields
.field public static final ROOT_TWO:D


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 30
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    sput-wide v0, Lcom/drew/imaging/PhotographicConversions;->ROOT_TWO:D

    return-void
.end method

.method private constructor <init>()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "Not intended for instantiation."

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static apertureToFStop(D)D
    .registers 4
    .param p0, "aperture"    # D

    .prologue
    .line 45
    sget-wide v0, Lcom/drew/imaging/PhotographicConversions;->ROOT_TWO:D

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    return-wide v0
.end method

.method public static shutterSpeedToExposureTime(D)D
    .registers 6
    .param p0, "shutterSpeed"    # D

    .prologue
    .line 59
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    move-result-wide v2

    mul-double/2addr v2, p0

    invoke-static {v2, v3}, Ljava/lang/Math;->exp(D)D

    move-result-wide v2

    div-double/2addr v0, v2

    double-to-float v0, v0

    float-to-double v0, v0

    return-wide v0
.end method
