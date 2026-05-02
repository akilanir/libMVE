.class Lcom/sun/mail/pop3/TempFile;
.super Ljava/lang/Object;
.source "TempFile.java"


# instance fields
.field private file:Ljava/io/File;

.field private sf:Lcom/sun/mail/pop3/WritableSharedFile;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 4
    .param p1, "dir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    const-string v0, "pop3."

    const-string v1, ".mbox"

    invoke-static {v0, v1, p1}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/pop3/TempFile;->file:Ljava/io/File;

    .line 67
    iget-object v0, p0, Lcom/sun/mail/pop3/TempFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->deleteOnExit()V

    .line 68
    new-instance v0, Lcom/sun/mail/pop3/WritableSharedFile;

    iget-object v1, p0, Lcom/sun/mail/pop3/TempFile;->file:Ljava/io/File;

    invoke-direct {v0, v1}, Lcom/sun/mail/pop3/WritableSharedFile;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lcom/sun/mail/pop3/TempFile;->sf:Lcom/sun/mail/pop3/WritableSharedFile;

    .line 69
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2

    .prologue
    .line 83
    :try_start_0
    iget-object v0, p0, Lcom/sun/mail/pop3/TempFile;->sf:Lcom/sun/mail/pop3/WritableSharedFile;

    invoke-virtual {v0}, Lcom/sun/mail/pop3/WritableSharedFile;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_b

    .line 87
    :goto_5
    iget-object v0, p0, Lcom/sun/mail/pop3/TempFile;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 88
    return-void

    .line 84
    :catch_b
    move-exception v0

    goto :goto_5
.end method

.method protected finalize()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 91
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 92
    invoke-virtual {p0}, Lcom/sun/mail/pop3/TempFile;->close()V

    .line 93
    return-void
.end method

.method public getAppendStream()Lcom/sun/mail/pop3/AppendStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    iget-object v0, p0, Lcom/sun/mail/pop3/TempFile;->sf:Lcom/sun/mail/pop3/WritableSharedFile;

    invoke-virtual {v0}, Lcom/sun/mail/pop3/WritableSharedFile;->getAppendStream()Lcom/sun/mail/pop3/AppendStream;

    move-result-object v0

    return-object v0
.end method
