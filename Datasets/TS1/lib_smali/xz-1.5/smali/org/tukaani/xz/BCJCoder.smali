.class abstract Lorg/tukaani/xz/BCJCoder;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/tukaani/xz/FilterCoder;


# static fields
.field public static final ARMTHUMB_FILTER_ID:J = 0x8L

.field public static final ARM_FILTER_ID:J = 0x7L

.field public static final IA64_FILTER_ID:J = 0x6L

.field public static final POWERPC_FILTER_ID:J = 0x5L

.field public static final SPARC_FILTER_ID:J = 0x9L

.field public static final X86_FILTER_ID:J = 0x4L


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isBCJFilterID(J)Z
    .registers 4

    const-wide/16 v0, 0x4

    cmp-long v0, p0, v0

    if-ltz v0, :cond_e

    const-wide/16 v0, 0x9

    cmp-long v0, p0, v0

    if-gtz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method


# virtual methods
.method public changesSize()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public lastOK()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public nonLastOK()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method
