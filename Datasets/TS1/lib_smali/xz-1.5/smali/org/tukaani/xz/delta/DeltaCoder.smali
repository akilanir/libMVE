.class abstract Lorg/tukaani/xz/delta/DeltaCoder;
.super Ljava/lang/Object;


# static fields
.field static final DISTANCE_MASK:I = 0xff

.field static final DISTANCE_MAX:I = 0x100

.field static final DISTANCE_MIN:I = 0x1


# instance fields
.field final distance:I

.field final history:[B

.field pos:I


# direct methods
.method constructor <init>(I)V
    .registers 4

    const/16 v1, 0x100

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-array v0, v1, [B

    iput-object v0, p0, Lorg/tukaani/xz/delta/DeltaCoder;->history:[B

    const/4 v0, 0x0

    iput v0, p0, Lorg/tukaani/xz/delta/DeltaCoder;->pos:I

    const/4 v0, 0x1

    if-lt p1, v0, :cond_11

    if-le p1, v1, :cond_17

    :cond_11
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :cond_17
    iput p1, p0, Lorg/tukaani/xz/delta/DeltaCoder;->distance:I

    return-void
.end method
