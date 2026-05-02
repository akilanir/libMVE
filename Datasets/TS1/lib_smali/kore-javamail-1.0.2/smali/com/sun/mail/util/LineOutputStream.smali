.class public Lcom/sun/mail/util/LineOutputStream;
.super Ljava/io/FilterOutputStream;
.source "LineOutputStream.java"


# static fields
.field private static newline:[B


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 60
    const/4 v0, 0x2

    new-array v0, v0, [B

    sput-object v0, Lcom/sun/mail/util/LineOutputStream;->newline:[B

    .line 61
    sget-object v0, Lcom/sun/mail/util/LineOutputStream;->newline:[B

    const/4 v1, 0x0

    const/16 v2, 0xd

    aput-byte v2, v0, v1

    .line 62
    sget-object v0, Lcom/sun/mail/util/LineOutputStream;->newline:[B

    const/4 v1, 0x1

    const/16 v2, 0xa

    aput-byte v2, v0, v1

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 2
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 66
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 67
    return-void
.end method


# virtual methods
.method public writeln()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    iget-object v0, p0, Lcom/sun/mail/util/LineOutputStream;->out:Ljava/io/OutputStream;

    sget-object v1, Lcom/sun/mail/util/LineOutputStream;->newline:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 77
    return-void
.end method

.method public writeln(Ljava/lang/String;)V
    .registers 5
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    invoke-static {p1}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 71
    .local v0, "bytes":[B
    iget-object v1, p0, Lcom/sun/mail/util/LineOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 72
    iget-object v1, p0, Lcom/sun/mail/util/LineOutputStream;->out:Ljava/io/OutputStream;

    sget-object v2, Lcom/sun/mail/util/LineOutputStream;->newline:[B

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 73
    return-void
.end method
