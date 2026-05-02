.class Lkorex/mail/util/ByteArrayDataSource$DSByteArrayOutputStream;
.super Ljava/io/ByteArrayOutputStream;
.source "ByteArrayDataSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkorex/mail/util/ByteArrayDataSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DSByteArrayOutputStream"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public getBuf()[B
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Lkorex/mail/util/ByteArrayDataSource$DSByteArrayOutputStream;->buf:[B

    return-object v0
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 72
    iget v0, p0, Lkorex/mail/util/ByteArrayDataSource$DSByteArrayOutputStream;->count:I

    return v0
.end method
