.class Lcom/google/common/hash/Hashing$SipHash24Holder;
.super Ljava/lang/Object;
.source "Hashing.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/hash/Hashing;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SipHash24Holder"
.end annotation


# static fields
.field static final SIP_HASH_24:Lcom/google/common/hash/HashFunction;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    .line 162
    new-instance v0, Lcom/google/common/hash/SipHashFunction;

    const/4 v1, 0x2

    const/4 v2, 0x4

    const-wide v3, 0x706050403020100L

    const-wide v5, 0xf0e0d0c0b0a0908L

    invoke-direct/range {v0 .. v6}, Lcom/google/common/hash/SipHashFunction;-><init>(IIJJ)V

    sput-object v0, Lcom/google/common/hash/Hashing$SipHash24Holder;->SIP_HASH_24:Lcom/google/common/hash/HashFunction;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 161
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
