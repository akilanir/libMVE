.class public Lorg/spongycastle/crypto/tls/TlsNullCompression;
.super Ljava/lang/Object;
.source "TlsNullCompression.java"

# interfaces
.implements Lorg/spongycastle/crypto/tls/TlsCompression;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compress(Ljava/io/OutputStream;)Ljava/io/OutputStream;
    .registers 2
    .param p1, "output"    # Ljava/io/OutputStream;

    .prologue
    .line 10
    return-object p1
.end method

.method public decompress(Ljava/io/OutputStream;)Ljava/io/OutputStream;
    .registers 2
    .param p1, "output"    # Ljava/io/OutputStream;

    .prologue
    .line 15
    return-object p1
.end method
