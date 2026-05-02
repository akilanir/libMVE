.class Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;
.super Ljava/lang/Thread;
.source "ParcelFileDescriptorUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "TransferThread"
.end annotation


# instance fields
.field final mIn:Ljava/io/InputStream;

.field final mOut:Ljava/io/OutputStream;


# direct methods
.method constructor <init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 57
    const-string v0, "IPC Transfer Thread"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 58
    iput-object p1, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mIn:Ljava/io/InputStream;

    .line 59
    iput-object p2, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mOut:Ljava/io/OutputStream;

    .line 60
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->setDaemon(Z)V

    .line 61
    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .line 65
    const/16 v3, 0x1000

    new-array v0, v3, [B

    .line 69
    .local v0, "buf":[B
    :goto_4
    :try_start_4
    iget-object v3, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mIn:Ljava/io/InputStream;

    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "len":I
    if-lez v2, :cond_26

    .line 70
    iget-object v3, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mOut:Ljava/io/OutputStream;

    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4, v2}, Ljava/io/OutputStream;->write([BII)V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_12} :catch_13
    .catchall {:try_start_4 .. :try_end_12} :catchall_33

    goto :goto_4

    .line 72
    .end local v2    # "len":I
    :catch_13
    move-exception v1

    .line 73
    .local v1, "e":Ljava/io/IOException;
    :try_start_14
    const-string v3, "OpenPgp API"

    const-string v4, "IOException when writing to out"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1b
    .catchall {:try_start_14 .. :try_end_1b} :catchall_33

    .line 76
    :try_start_1b
    iget-object v3, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mIn:Ljava/io/InputStream;

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_20} :catch_45

    .line 80
    :goto_20
    :try_start_20
    iget-object v3, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mOut:Ljava/io/OutputStream;

    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_25} :catch_43

    .line 84
    .end local v1    # "e":Ljava/io/IOException;
    :goto_25
    return-void

    .line 76
    .restart local v2    # "len":I
    :cond_26
    :try_start_26
    iget-object v3, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mIn:Ljava/io/InputStream;

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_2b
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_2b} :catch_47

    .line 80
    :goto_2b
    :try_start_2b
    iget-object v3, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mOut:Ljava/io/OutputStream;

    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_30
    .catch Ljava/io/IOException; {:try_start_2b .. :try_end_30} :catch_31

    goto :goto_25

    .line 81
    :catch_31
    move-exception v3

    goto :goto_25

    .line 75
    .end local v2    # "len":I
    :catchall_33
    move-exception v3

    .line 76
    :try_start_34
    iget-object v4, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mIn:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_39
    .catch Ljava/io/IOException; {:try_start_34 .. :try_end_39} :catch_41

    .line 80
    :goto_39
    :try_start_39
    iget-object v4, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mOut:Ljava/io/OutputStream;

    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_3e
    .catch Ljava/io/IOException; {:try_start_39 .. :try_end_3e} :catch_3f

    .line 82
    :goto_3e
    throw v3

    .line 81
    :catch_3f
    move-exception v4

    goto :goto_3e

    .line 77
    :catch_41
    move-exception v4

    goto :goto_39

    .line 81
    .restart local v1    # "e":Ljava/io/IOException;
    :catch_43
    move-exception v3

    goto :goto_25

    .line 77
    :catch_45
    move-exception v3

    goto :goto_20

    .end local v1    # "e":Ljava/io/IOException;
    .restart local v2    # "len":I
    :catch_47
    move-exception v3

    goto :goto_2b
.end method
