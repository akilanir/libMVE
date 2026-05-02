.class Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;
.super Ljava/lang/Object;
.source "DTLSReliableHandshake.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Message"
.end annotation


# instance fields
.field private final body:[B

.field private final message_seq:I

.field private final msg_type:S


# direct methods
.method private constructor <init>(IS[B)V
    .registers 4
    .param p1, "message_seq"    # I
    .param p2, "msg_type"    # S
    .param p3, "body"    # [B

    .prologue
    .line 418
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 419
    iput p1, p0, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->message_seq:I

    .line 420
    iput-short p2, p0, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->msg_type:S

    .line 421
    iput-object p3, p0, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->body:[B

    .line 422
    return-void
.end method

.method synthetic constructor <init>(IS[BLorg/spongycastle/crypto/tls/DTLSReliableHandshake$1;)V
    .registers 5
    .param p1, "x0"    # I
    .param p2, "x1"    # S
    .param p3, "x2"    # [B
    .param p4, "x3"    # Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$1;

    .prologue
    .line 411
    invoke-direct {p0, p1, p2, p3}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;-><init>(IS[B)V

    return-void
.end method


# virtual methods
.method public getBody()[B
    .registers 2

    .prologue
    .line 436
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->body:[B

    return-object v0
.end method

.method public getSeq()I
    .registers 2

    .prologue
    .line 426
    iget v0, p0, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->message_seq:I

    return v0
.end method

.method public getType()S
    .registers 2

    .prologue
    .line 431
    iget-short v0, p0, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->msg_type:S

    return v0
.end method
