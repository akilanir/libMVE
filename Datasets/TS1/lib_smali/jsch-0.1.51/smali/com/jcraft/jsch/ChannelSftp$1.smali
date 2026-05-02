.class Lcom/jcraft/jsch/ChannelSftp$1;
.super Ljava/io/OutputStream;
.source "ChannelSftp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;IJ)Ljava/io/OutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private _ackid:I

.field _data:[B

.field private ackcount:I

.field private ackid:[I

.field private header:Lcom/jcraft/jsch/ChannelSftp$Header;

.field private init:Z

.field private isClosed:Z

.field private startid:I

.field final synthetic this$0:Lcom/jcraft/jsch/ChannelSftp;

.field final synthetic val$_offset:[J

.field final synthetic val$handle:[B

.field final synthetic val$monitor:Lcom/jcraft/jsch/SftpProgressMonitor;

.field private writecount:I


# direct methods
.method constructor <init>(Lcom/jcraft/jsch/ChannelSftp;[B[JLcom/jcraft/jsch/SftpProgressMonitor;)V
    .registers 8

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 763
    iput-object p1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    iput-object p2, p0, Lcom/jcraft/jsch/ChannelSftp$1;->val$handle:[B

    iput-object p3, p0, Lcom/jcraft/jsch/ChannelSftp$1;->val$_offset:[J

    iput-object p4, p0, Lcom/jcraft/jsch/ChannelSftp$1;->val$monitor:Lcom/jcraft/jsch/SftpProgressMonitor;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 764
    iput-boolean v2, p0, Lcom/jcraft/jsch/ChannelSftp$1;->init:Z

    .line 765
    iput-boolean v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->isClosed:Z

    .line 766
    new-array v0, v2, [I

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->ackid:[I

    .line 767
    iput v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->startid:I

    .line 768
    iput v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->_ackid:I

    .line 769
    iput v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->ackcount:I

    .line 770
    iput v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->writecount:I

    .line 771
    new-instance v0, Lcom/jcraft/jsch/ChannelSftp$Header;

    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->header:Lcom/jcraft/jsch/ChannelSftp$Header;

    .line 821
    new-array v0, v2, [B

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->_data:[B

    return-void
.end method


# virtual methods
.method public close()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 849
    iget-boolean v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->isClosed:Z

    if-eqz v1, :cond_5

    .line 860
    :goto_4
    return-void

    .line 852
    :cond_5
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp$1;->flush()V

    .line 853
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->val$monitor:Lcom/jcraft/jsch/SftpProgressMonitor;

    if-eqz v1, :cond_11

    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->val$monitor:Lcom/jcraft/jsch/SftpProgressMonitor;

    invoke-interface {v1}, Lcom/jcraft/jsch/SftpProgressMonitor;->end()V

    .line 854
    :cond_11
    :try_start_11
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp$1;->val$handle:[B

    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSftp$1;->header:Lcom/jcraft/jsch/ChannelSftp$Header;

    # invokes: Lcom/jcraft/jsch/ChannelSftp;->_sendCLOSE([BLcom/jcraft/jsch/ChannelSftp$Header;)Z
    invoke-static {v1, v2, v3}, Lcom/jcraft/jsch/ChannelSftp;->access$400(Lcom/jcraft/jsch/ChannelSftp;[BLcom/jcraft/jsch/ChannelSftp$Header;)Z
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_1a} :catch_1e
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_1a} :catch_20

    .line 859
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->isClosed:Z

    goto :goto_4

    .line 855
    :catch_1e
    move-exception v0

    .local v0, "e":Ljava/io/IOException;
    throw v0

    .line 856
    .end local v0    # "e":Ljava/io/IOException;
    :catch_20
    move-exception v0

    .line 857
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public flush()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 829
    iget-boolean v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->isClosed:Z

    if-eqz v1, :cond_c

    .line 830
    new-instance v1, Ljava/io/IOException;

    const-string v2, "stream already closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 833
    :cond_c
    iget-boolean v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->init:Z

    if-nez v1, :cond_21

    .line 835
    :goto_10
    :try_start_10
    iget v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->writecount:I

    iget v2, p0, Lcom/jcraft/jsch/ChannelSftp$1;->ackcount:I

    if-le v1, v2, :cond_21

    .line 836
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSftp$1;->header:Lcom/jcraft/jsch/ChannelSftp$Header;

    # invokes: Lcom/jcraft/jsch/ChannelSftp;->checkStatus([ILcom/jcraft/jsch/ChannelSftp$Header;)Z
    invoke-static {v1, v2, v3}, Lcom/jcraft/jsch/ChannelSftp;->access$300(Lcom/jcraft/jsch/ChannelSftp;[ILcom/jcraft/jsch/ChannelSftp$Header;)Z

    move-result v1

    if-nez v1, :cond_22

    .line 846
    :cond_21
    return-void

    .line 839
    :cond_22
    iget v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->ackcount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->ackcount:I
    :try_end_28
    .catch Lcom/jcraft/jsch/SftpException; {:try_start_10 .. :try_end_28} :catch_29

    goto :goto_10

    .line 842
    :catch_29
    move-exception v0

    .line 843
    .local v0, "e":Lcom/jcraft/jsch/SftpException;
    new-instance v1, Ljava/io/IOException;

    invoke-virtual {v0}, Lcom/jcraft/jsch/SftpException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public write(I)V
    .registers 5
    .param p1, "foo"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 823
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->_data:[B

    int-to-byte v1, p1

    aput-byte v1, v0, v2

    .line 824
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->_data:[B

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v2, v1}, Lcom/jcraft/jsch/ChannelSftp$1;->write([BII)V

    .line 825
    return-void
.end method

.method public write([B)V
    .registers 4
    .param p1, "d"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 774
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/jcraft/jsch/ChannelSftp$1;->write([BII)V

    .line 775
    return-void
.end method

.method public write([BII)V
    .registers 13
    .param p1, "d"    # [B
    .param p2, "s"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 778
    iget-boolean v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->init:Z

    if-eqz v0, :cond_17

    .line 779
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    # getter for: Lcom/jcraft/jsch/ChannelSftp;->seq:I
    invoke-static {v0}, Lcom/jcraft/jsch/ChannelSftp;->access$000(Lcom/jcraft/jsch/ChannelSftp;)I

    move-result v0

    iput v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->startid:I

    .line 780
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    # getter for: Lcom/jcraft/jsch/ChannelSftp;->seq:I
    invoke-static {v0}, Lcom/jcraft/jsch/ChannelSftp;->access$000(Lcom/jcraft/jsch/ChannelSftp;)I

    move-result v0

    iput v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->_ackid:I

    .line 781
    iput-boolean v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->init:Z

    .line 784
    :cond_17
    iget-boolean v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->isClosed:Z

    if-eqz v0, :cond_23

    .line 785
    new-instance v0, Ljava/io/IOException;

    const-string v1, "stream already closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 789
    :cond_23
    move v6, p3

    .line 790
    .local v6, "_len":I
    :cond_24
    if-lez v6, :cond_ae

    .line 791
    :try_start_26
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->val$handle:[B

    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp$1;->val$_offset:[J

    const/4 v3, 0x0

    aget-wide v2, v2, v3

    move-object v4, p1

    move v5, p2

    # invokes: Lcom/jcraft/jsch/ChannelSftp;->sendWRITE([BJ[BII)I
    invoke-static/range {v0 .. v6}, Lcom/jcraft/jsch/ChannelSftp;->access$100(Lcom/jcraft/jsch/ChannelSftp;[BJ[BII)I

    move-result v8

    .line 792
    .local v8, "sent":I
    iget v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->writecount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->writecount:I

    .line 793
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->val$_offset:[J

    const/4 v1, 0x0

    aget-wide v2, v0, v1

    int-to-long v4, v8

    add-long/2addr v2, v4

    aput-wide v2, v0, v1

    .line 794
    add-int/2addr p2, v8

    .line 795
    sub-int/2addr v6, v8

    .line 796
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    # getter for: Lcom/jcraft/jsch/ChannelSftp;->seq:I
    invoke-static {v0}, Lcom/jcraft/jsch/ChannelSftp;->access$000(Lcom/jcraft/jsch/ChannelSftp;)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    iget v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->startid:I

    if-eq v0, v1, :cond_60

    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    # getter for: Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;
    invoke-static {v0}, Lcom/jcraft/jsch/ChannelSftp;->access$200(Lcom/jcraft/jsch/ChannelSftp;)Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    const/16 v1, 0x400

    if-lt v0, v1, :cond_24

    .line 798
    :cond_60
    :goto_60
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    # getter for: Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;
    invoke-static {v0}, Lcom/jcraft/jsch/ChannelSftp;->access$200(Lcom/jcraft/jsch/ChannelSftp;)Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    if-lez v0, :cond_24

    .line 799
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->ackid:[I

    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp$1;->header:Lcom/jcraft/jsch/ChannelSftp$Header;

    # invokes: Lcom/jcraft/jsch/ChannelSftp;->checkStatus([ILcom/jcraft/jsch/ChannelSftp$Header;)Z
    invoke-static {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->access$300(Lcom/jcraft/jsch/ChannelSftp;[ILcom/jcraft/jsch/ChannelSftp$Header;)Z

    move-result v0

    if-eqz v0, :cond_24

    .line 800
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->ackid:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    iput v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->_ackid:I

    .line 801
    iget v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->startid:I

    iget v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->_ackid:I

    if-gt v0, v1, :cond_91

    iget v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->_ackid:I

    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$1;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    # getter for: Lcom/jcraft/jsch/ChannelSftp;->seq:I
    invoke-static {v1}, Lcom/jcraft/jsch/ChannelSftp;->access$000(Lcom/jcraft/jsch/ChannelSftp;)I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-le v0, v1, :cond_9c

    .line 802
    :cond_91
    new-instance v0, Lcom/jcraft/jsch/SftpException;

    const/4 v1, 0x4

    const-string v2, ""

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v0
    :try_end_9a
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_9a} :catch_9a
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_9a} :catch_a3

    .line 817
    .end local v8    # "sent":I
    :catch_9a
    move-exception v7

    .local v7, "e":Ljava/io/IOException;
    throw v7

    .line 804
    .end local v7    # "e":Ljava/io/IOException;
    .restart local v8    # "sent":I
    :cond_9c
    :try_start_9c
    iget v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->ackcount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->ackcount:I
    :try_end_a2
    .catch Ljava/io/IOException; {:try_start_9c .. :try_end_a2} :catch_9a
    .catch Ljava/lang/Exception; {:try_start_9c .. :try_end_a2} :catch_a3

    goto :goto_60

    .line 818
    .end local v8    # "sent":I
    :catch_a3
    move-exception v7

    .local v7, "e":Ljava/lang/Exception;
    new-instance v0, Ljava/io/IOException;

    invoke-virtual {v7}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 812
    .end local v7    # "e":Ljava/lang/Exception;
    :cond_ae
    :try_start_ae
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->val$monitor:Lcom/jcraft/jsch/SftpProgressMonitor;

    if-eqz v0, :cond_c6

    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$1;->val$monitor:Lcom/jcraft/jsch/SftpProgressMonitor;

    int-to-long v1, p3

    invoke-interface {v0, v1, v2}, Lcom/jcraft/jsch/SftpProgressMonitor;->count(J)Z

    move-result v0

    if-nez v0, :cond_c6

    .line 813
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp$1;->close()V

    .line 814
    new-instance v0, Ljava/io/IOException;

    const-string v1, "canceled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_c6
    .catch Ljava/io/IOException; {:try_start_ae .. :try_end_c6} :catch_9a
    .catch Ljava/lang/Exception; {:try_start_ae .. :try_end_c6} :catch_a3

    .line 819
    :cond_c6
    return-void
.end method
