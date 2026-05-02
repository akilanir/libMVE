.class public Lorg/osmdroid/contributor/util/Util;
.super Ljava/lang/Object;
.source "Util.java"

# interfaces
.implements Lorg/osmdroid/contributor/util/constants/OpenStreetMapContributorConstants;


# static fields
.field public static final UTCSimpleDateFormat:Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 23
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ss\'Z\'"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/osmdroid/contributor/util/Util;->UTCSimpleDateFormat:Ljava/text/SimpleDateFormat;

    return-void
.end method

.method private constructor <init>()V
    .registers 3

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    sget-object v0, Lorg/osmdroid/contributor/util/Util;->UTCSimpleDateFormat:Ljava/text/SimpleDateFormat;

    const-string v1, "UTC"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 41
    return-void
.end method

.method public static final convertTimestampToUTCString(J)Ljava/lang/String;
    .registers 4
    .param p0, "aTimestamp"    # J

    .prologue
    .line 56
    sget-object v0, Lorg/osmdroid/contributor/util/Util;->UTCSimpleDateFormat:Ljava/text/SimpleDateFormat;

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isSufficienDataForUpload(Ljava/util/ArrayList;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/osmdroid/contributor/util/RecordedGeoPoint;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p0, "recordedGeoPoints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/osmdroid/contributor/util/RecordedGeoPoint;>;"
    const/4 v2, 0x0

    .line 61
    if-nez p0, :cond_4

    .line 72
    :cond_3
    :goto_3
    return v2

    .line 64
    :cond_4
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/16 v4, 0x64

    if-lt v3, v4, :cond_3

    .line 67
    invoke-static {p0}, Lorg/osmdroid/util/BoundingBoxE6;->fromGeoPoints(Ljava/util/ArrayList;)Lorg/osmdroid/util/BoundingBoxE6;

    move-result-object v0

    .line 68
    .local v0, "bb":Lorg/osmdroid/util/BoundingBoxE6;
    invoke-virtual {v0}, Lorg/osmdroid/util/BoundingBoxE6;->getDiagonalLengthInMeters()I

    move-result v1

    .line 69
    .local v1, "diagMeters":I
    const/16 v3, 0x12c

    if-lt v1, v3, :cond_3

    .line 72
    const/4 v2, 0x1

    goto :goto_3
.end method
