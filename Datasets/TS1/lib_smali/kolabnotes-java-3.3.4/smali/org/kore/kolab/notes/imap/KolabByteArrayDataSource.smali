.class public Lorg/kore/kolab/notes/imap/KolabByteArrayDataSource;
.super Lkorex/mail/util/ByteArrayDataSource;
.source "KolabByteArrayDataSource.java"


# instance fields
.field private attachment:Lorg/kore/kolab/notes/Attachment;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;)V
    .registers 3
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    invoke-direct {p0, p1, p2}, Lkorex/mail/util/ByteArrayDataSource;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "data"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    invoke-direct {p0, p1, p2}, Lkorex/mail/util/ByteArrayDataSource;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    return-void
.end method

.method public constructor <init>(Lorg/kore/kolab/notes/Attachment;)V
    .registers 4
    .param p1, "att"    # Lorg/kore/kolab/notes/Attachment;

    .prologue
    .line 35
    invoke-virtual {p1}, Lorg/kore/kolab/notes/Attachment;->getData()[B

    move-result-object v0

    invoke-virtual {p1}, Lorg/kore/kolab/notes/Attachment;->getMimeType()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lkorex/mail/util/ByteArrayDataSource;-><init>([BLjava/lang/String;)V

    .line 36
    iput-object p1, p0, Lorg/kore/kolab/notes/imap/KolabByteArrayDataSource;->attachment:Lorg/kore/kolab/notes/Attachment;

    .line 37
    return-void
.end method

.method public constructor <init>([BLjava/lang/String;)V
    .registers 3
    .param p1, "data"    # [B
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0, p1, p2}, Lkorex/mail/util/ByteArrayDataSource;-><init>([BLjava/lang/String;)V

    .line 45
    return-void
.end method


# virtual methods
.method public getOutputStream()Ljava/io/OutputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    return-object v0
.end method
