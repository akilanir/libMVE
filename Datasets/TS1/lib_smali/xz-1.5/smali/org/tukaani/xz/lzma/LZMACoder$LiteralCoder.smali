.class abstract Lorg/tukaani/xz/lzma/LZMACoder$LiteralCoder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/tukaani/xz/lzma/LZMACoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "LiteralCoder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/tukaani/xz/lzma/LZMACoder$LiteralCoder$LiteralSubcoder;
    }
.end annotation


# instance fields
.field private final lc:I

.field private final literalPosMask:I

.field private final this$0:Lorg/tukaani/xz/lzma/LZMACoder;


# direct methods
.method constructor <init>(Lorg/tukaani/xz/lzma/LZMACoder;II)V
    .registers 5

    iput-object p1, p0, Lorg/tukaani/xz/lzma/LZMACoder$LiteralCoder;->this$0:Lorg/tukaani/xz/lzma/LZMACoder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lorg/tukaani/xz/lzma/LZMACoder$LiteralCoder;->lc:I

    const/4 v0, 0x1

    shl-int/2addr v0, p3

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/tukaani/xz/lzma/LZMACoder$LiteralCoder;->literalPosMask:I

    return-void
.end method


# virtual methods
.method final getSubcoderIndex(II)I
    .registers 6

    iget v0, p0, Lorg/tukaani/xz/lzma/LZMACoder$LiteralCoder;->lc:I

    rsub-int/lit8 v0, v0, 0x8

    shr-int v0, p1, v0

    iget v1, p0, Lorg/tukaani/xz/lzma/LZMACoder$LiteralCoder;->literalPosMask:I

    and-int/2addr v1, p2

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMACoder$LiteralCoder;->lc:I

    shl-int/2addr v1, v2

    add-int/2addr v0, v1

    return v0
.end method
