.class public Lcom/jcraft/jsch/ChannelSftp;
.super Lcom/jcraft/jsch/ChannelSession;
.source "ChannelSftp.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jcraft/jsch/ChannelSftp$LsEntrySelector;,
        Lcom/jcraft/jsch/ChannelSftp$LsEntry;,
        Lcom/jcraft/jsch/ChannelSftp$Header;,
        Lcom/jcraft/jsch/ChannelSftp$RequestQueue;
    }
.end annotation


# static fields
.field public static final APPEND:I = 0x2

.field private static final LOCAL_MAXIMUM_PACKET_SIZE:I = 0x8000

.field private static final LOCAL_WINDOW_SIZE_MAX:I = 0x200000

.field private static final MAX_MSG_LENGTH:I = 0x40000

.field public static final OVERWRITE:I = 0x0

.field public static final RESUME:I = 0x1

.field private static final SSH_FILEXFER_ATTR_ACMODTIME:I = 0x8

.field private static final SSH_FILEXFER_ATTR_EXTENDED:I = -0x80000000

.field private static final SSH_FILEXFER_ATTR_PERMISSIONS:I = 0x4

.field private static final SSH_FILEXFER_ATTR_SIZE:I = 0x1

.field private static final SSH_FILEXFER_ATTR_UIDGID:I = 0x2

.field private static final SSH_FXF_APPEND:I = 0x4

.field private static final SSH_FXF_CREAT:I = 0x8

.field private static final SSH_FXF_EXCL:I = 0x20

.field private static final SSH_FXF_READ:I = 0x1

.field private static final SSH_FXF_TRUNC:I = 0x10

.field private static final SSH_FXF_WRITE:I = 0x2

.field private static final SSH_FXP_ATTRS:B = 0x69t

.field private static final SSH_FXP_CLOSE:B = 0x4t

.field private static final SSH_FXP_DATA:B = 0x67t

.field private static final SSH_FXP_EXTENDED:B = -0x38t

.field private static final SSH_FXP_EXTENDED_REPLY:B = -0x37t

.field private static final SSH_FXP_FSETSTAT:B = 0xat

.field private static final SSH_FXP_FSTAT:B = 0x8t

.field private static final SSH_FXP_HANDLE:B = 0x66t

.field private static final SSH_FXP_INIT:B = 0x1t

.field private static final SSH_FXP_LSTAT:B = 0x7t

.field private static final SSH_FXP_MKDIR:B = 0xet

.field private static final SSH_FXP_NAME:B = 0x68t

.field private static final SSH_FXP_OPEN:B = 0x3t

.field private static final SSH_FXP_OPENDIR:B = 0xbt

.field private static final SSH_FXP_READ:B = 0x5t

.field private static final SSH_FXP_READDIR:B = 0xct

.field private static final SSH_FXP_READLINK:B = 0x13t

.field private static final SSH_FXP_REALPATH:B = 0x10t

.field private static final SSH_FXP_REMOVE:B = 0xdt

.field private static final SSH_FXP_RENAME:B = 0x12t

.field private static final SSH_FXP_RMDIR:B = 0xft

.field private static final SSH_FXP_SETSTAT:B = 0x9t

.field private static final SSH_FXP_STAT:B = 0x11t

.field private static final SSH_FXP_STATUS:B = 0x65t

.field private static final SSH_FXP_SYMLINK:B = 0x14t

.field private static final SSH_FXP_VERSION:B = 0x2t

.field private static final SSH_FXP_WRITE:B = 0x6t

.field public static final SSH_FX_BAD_MESSAGE:I = 0x5

.field public static final SSH_FX_CONNECTION_LOST:I = 0x7

.field public static final SSH_FX_EOF:I = 0x1

.field public static final SSH_FX_FAILURE:I = 0x4

.field public static final SSH_FX_NO_CONNECTION:I = 0x6

.field public static final SSH_FX_NO_SUCH_FILE:I = 0x2

.field public static final SSH_FX_OK:I = 0x0

.field public static final SSH_FX_OP_UNSUPPORTED:I = 0x8

.field public static final SSH_FX_PERMISSION_DENIED:I = 0x3

.field private static final UTF8:Ljava/lang/String; = "UTF-8"

.field private static final file_separator:Ljava/lang/String;

.field private static final file_separatorc:C

.field private static fs_is_bs:Z


# instance fields
.field private ackid:[I

.field private buf:Lcom/jcraft/jsch/Buffer;

.field private client_version:I

.field private cwd:Ljava/lang/String;

.field private extension_hardlink:Z

.field private extension_posix_rename:Z

.field private extension_statvfs:Z

.field private extensions:Ljava/util/Hashtable;

.field private fEncoding:Ljava/lang/String;

.field private fEncoding_is_utf8:Z

.field private home:Ljava/lang/String;

.field private interactive:Z

.field private io_in:Ljava/io/InputStream;

.field private lcwd:Ljava/lang/String;

.field private obuf:Lcom/jcraft/jsch/Buffer;

.field private opacket:Lcom/jcraft/jsch/Packet;

.field private packet:Lcom/jcraft/jsch/Packet;

.field private rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

.field private seq:I

.field private server_version:I

.field private version:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 173
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    sput-object v0, Lcom/jcraft/jsch/ChannelSftp;->file_separator:Ljava/lang/String;

    .line 174
    sget-char v0, Ljava/io/File;->separatorChar:C

    sput-char v0, Lcom/jcraft/jsch/ChannelSftp;->file_separatorc:C

    .line 175
    sget-char v0, Ljava/io/File;->separatorChar:C

    int-to-byte v0, v0

    const/16 v1, 0x5c

    if-ne v0, v1, :cond_13

    const/4 v0, 0x1

    :goto_10
    sput-boolean v0, Lcom/jcraft/jsch/ChannelSftp;->fs_is_bs:Z

    return-void

    :cond_13
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public constructor <init>()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    const/high16 v4, 0x200000

    const/4 v3, 0x3

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 213
    invoke-direct {p0}, Lcom/jcraft/jsch/ChannelSession;-><init>()V

    .line 134
    iput-boolean v1, p0, Lcom/jcraft/jsch/ChannelSftp;->interactive:Z

    .line 135
    iput v2, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    .line 136
    new-array v0, v2, [I

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->ackid:[I

    .line 145
    iput v3, p0, Lcom/jcraft/jsch/ChannelSftp;->client_version:I

    .line 146
    iput v3, p0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    .line 147
    iget v0, p0, Lcom/jcraft/jsch/ChannelSftp;->client_version:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->version:Ljava/lang/String;

    .line 149
    iput-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    .line 150
    iput-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    .line 152
    iput-boolean v1, p0, Lcom/jcraft/jsch/ChannelSftp;->extension_posix_rename:Z

    .line 153
    iput-boolean v1, p0, Lcom/jcraft/jsch/ChannelSftp;->extension_statvfs:Z

    .line 155
    iput-boolean v1, p0, Lcom/jcraft/jsch/ChannelSftp;->extension_hardlink:Z

    .line 182
    const-string v0, "UTF-8"

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    .line 183
    iput-boolean v2, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding_is_utf8:Z

    .line 185
    new-instance v0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    const/16 v1, 0x10

    invoke-direct {v0, p0, v1}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;-><init>(Lcom/jcraft/jsch/ChannelSftp;I)V

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    .line 214
    invoke-virtual {p0, v4}, Lcom/jcraft/jsch/ChannelSftp;->setLocalWindowSizeMax(I)V

    .line 215
    invoke-virtual {p0, v4}, Lcom/jcraft/jsch/ChannelSftp;->setLocalWindowSize(I)V

    .line 216
    const v0, 0x8000

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/ChannelSftp;->setLocalPacketSize(I)V

    .line 217
    return-void
.end method

.method private _get(Ljava/lang/String;Ljava/io/OutputStream;Lcom/jcraft/jsch/SftpProgressMonitor;IJ)V
    .registers 35
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "dst"    # Ljava/io/OutputStream;
    .param p3, "monitor"    # Lcom/jcraft/jsch/SftpProgressMonitor;
    .param p4, "mode"    # I
    .param p5, "skip"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 1020
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v26

    .line 1022
    .local v26, "srcb":[B
    :try_start_a
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->sendOPENR([B)V

    .line 1024
    new-instance v17, Lcom/jcraft/jsch/ChannelSftp$Header;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 1025
    .local v17, "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v2, v1}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v17

    .line 1026
    move-object/from16 v0, v17

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    move/from16 v19, v0

    .line 1027
    .local v19, "length":I
    move-object/from16 v0, v17

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    move/from16 v27, v0

    .line 1029
    .local v27, "type":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v2, v1}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1031
    const/16 v2, 0x65

    move/from16 v0, v27

    if-eq v0, v2, :cond_5a

    const/16 v2, 0x66

    move/from16 v0, v27

    if-eq v0, v2, :cond_5a

    .line 1032
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const/4 v7, 0x4

    const-string v8, ""

    invoke-direct {v2, v7, v8}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v2
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_52} :catch_52

    .line 1157
    .end local v17    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v19    # "length":I
    .end local v27    # "type":I
    :catch_52
    move-exception v15

    .line 1158
    .local v15, "e":Ljava/lang/Exception;
    instance-of v2, v15, Lcom/jcraft/jsch/SftpException;

    if-eqz v2, :cond_214

    check-cast v15, Lcom/jcraft/jsch/SftpException;

    .end local v15    # "e":Ljava/lang/Exception;
    throw v15

    .line 1035
    .restart local v17    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v19    # "length":I
    .restart local v27    # "type":I
    :cond_5a
    const/16 v2, 0x65

    move/from16 v0, v27

    if-ne v0, v2, :cond_73

    .line 1036
    :try_start_60
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v2}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v18

    .line 1037
    .local v18, "i":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v2, v1}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 1040
    .end local v18    # "i":I
    :cond_73
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v2}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v3

    .line 1042
    .local v3, "handle":[B
    const-wide/16 v21, 0x0

    .line 1043
    .local v21, "offset":J
    const/4 v2, 0x1

    move/from16 v0, p4

    if-ne v0, v2, :cond_84

    .line 1044
    add-long v21, v21, p5

    .line 1047
    :cond_84
    const/16 v24, 0x1

    .line 1048
    .local v24, "request_max":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    invoke-virtual {v2}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->init()V

    .line 1049
    move-wide/from16 v4, v21

    .line 1051
    .local v4, "request_offset":J
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v2, v2, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v2, v2

    add-int/lit8 v6, v2, -0xd

    .line 1052
    .local v6, "request_len":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    if-nez v2, :cond_a0

    const/16 v6, 0x400

    .line 1057
    :cond_a0
    :goto_a0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    invoke-virtual {v2}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->count()I

    move-result v2

    move/from16 v0, v24

    if-ge v2, v0, :cond_b8

    .line 1058
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/jcraft/jsch/ChannelSftp;->sendREAD([BJILcom/jcraft/jsch/ChannelSftp$RequestQueue;)V

    .line 1059
    int-to-long v7, v6

    add-long/2addr v4, v7

    goto :goto_a0

    .line 1062
    :cond_b8
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v2, v1}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v17

    .line 1063
    move-object/from16 v0, v17

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    move/from16 v19, v0

    .line 1064
    move-object/from16 v0, v17

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    move/from16 v27, v0
    :try_end_d0
    .catch Ljava/lang/Exception; {:try_start_60 .. :try_end_d0} :catch_52

    .line 1066
    const/16 v25, 0x0

    .line 1068
    .local v25, "rr":Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;
    :try_start_d2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    move-object/from16 v0, v17

    iget v7, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->rid:I

    invoke-virtual {v2, v7}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->get(I)Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;
    :try_end_dd
    .catch Lcom/jcraft/jsch/ChannelSftp$RequestQueue$OutOfOrderException; {:try_start_d2 .. :try_end_dd} :catch_119
    .catch Ljava/lang/Exception; {:try_start_d2 .. :try_end_dd} :catch_52

    move-result-object v25

    .line 1077
    const/16 v2, 0x65

    move/from16 v0, v27

    if-ne v0, v2, :cond_140

    .line 1078
    :try_start_e4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v2, v1}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1079
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v2}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v18

    .line 1080
    .restart local v18    # "i":I
    const/4 v2, 0x1

    move/from16 v0, v18

    if-ne v0, v2, :cond_135

    .line 1149
    .end local v18    # "i":I
    :cond_fc
    :goto_fc
    invoke-virtual/range {p2 .. p2}, Ljava/io/OutputStream;->flush()V

    .line 1151
    if-eqz p3, :cond_104

    invoke-interface/range {p3 .. p3}, Lcom/jcraft/jsch/SftpProgressMonitor;->end()V

    .line 1153
    :cond_104
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, v17

    invoke-virtual {v2, v0, v7}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->cancel(Lcom/jcraft/jsch/ChannelSftp$Header;Lcom/jcraft/jsch/Buffer;)V

    .line 1155
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v3, v1}, Lcom/jcraft/jsch/ChannelSftp;->_sendCLOSE([BLcom/jcraft/jsch/ChannelSftp$Header;)Z

    .line 1163
    return-void

    .line 1070
    :catch_119
    move-exception v15

    .line 1071
    .local v15, "e":Lcom/jcraft/jsch/ChannelSftp$RequestQueue$OutOfOrderException;
    iget-wide v4, v15, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$OutOfOrderException;->offset:J

    .line 1072
    move-object/from16 v0, v17

    iget v2, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    int-to-long v7, v2

    move-object/from16 v0, p0

    invoke-direct {v0, v7, v8}, Lcom/jcraft/jsch/ChannelSftp;->skip(J)V

    .line 1073
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, v17

    invoke-virtual {v2, v0, v7}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->cancel(Lcom/jcraft/jsch/ChannelSftp$Header;Lcom/jcraft/jsch/Buffer;)V

    goto/16 :goto_a0

    .line 1083
    .end local v15    # "e":Lcom/jcraft/jsch/ChannelSftp$RequestQueue$OutOfOrderException;
    .restart local v18    # "i":I
    :cond_135
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v2, v1}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 1086
    .end local v18    # "i":I
    :cond_140
    const/16 v2, 0x67

    move/from16 v0, v27

    if-ne v0, v2, :cond_fc

    .line 1090
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v2}, Lcom/jcraft/jsch/Buffer;->rewind()V

    .line 1091
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v2, v2, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v7, 0x0

    const/4 v8, 0x4

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v7, v8}, Lcom/jcraft/jsch/ChannelSftp;->fill([BII)I

    add-int/lit8 v19, v19, -0x4

    .line 1092
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v2}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v20

    .line 1104
    .local v20, "length_of_data":I
    sub-int v23, v19, v20

    .line 1106
    .local v23, "optional_data":I
    move/from16 v16, v20

    .line 1107
    .local v16, "foo":I
    :cond_168
    if-lez v16, :cond_1bd

    .line 1108
    move/from16 v13, v16

    .line 1109
    .local v13, "bar":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v2, v2, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v2, v2

    if-le v13, v2, :cond_17c

    .line 1110
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v2, v2, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v13, v2

    .line 1112
    :cond_17c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v7, v7, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v8, 0x0

    invoke-virtual {v2, v7, v8, v13}, Ljava/io/InputStream;->read([BII)I

    move-result v14

    .line 1113
    .local v14, "data_len":I
    if-ltz v14, :cond_fc

    .line 1117
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v2, v2, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v7, v14}, Ljava/io/OutputStream;->write([BII)V

    .line 1119
    int-to-long v7, v14

    add-long v21, v21, v7

    .line 1120
    sub-int v16, v16, v14

    .line 1122
    if-eqz p3, :cond_168

    .line 1123
    int-to-long v7, v14

    move-object/from16 v0, p3

    invoke-interface {v0, v7, v8}, Lcom/jcraft/jsch/SftpProgressMonitor;->count(J)Z

    move-result v2

    if-nez v2, :cond_168

    .line 1124
    move/from16 v0, v16

    int-to-long v7, v0

    move-object/from16 v0, p0

    invoke-direct {v0, v7, v8}, Lcom/jcraft/jsch/ChannelSftp;->skip(J)V

    .line 1125
    if-lez v23, :cond_fc

    .line 1126
    move/from16 v0, v23

    int-to-long v7, v0

    move-object/from16 v0, p0

    invoke-direct {v0, v7, v8}, Lcom/jcraft/jsch/ChannelSftp;->skip(J)V

    goto/16 :goto_fc

    .line 1135
    .end local v13    # "bar":I
    .end local v14    # "data_len":I
    :cond_1bd
    if-lez v23, :cond_1c7

    .line 1136
    move/from16 v0, v23

    int-to-long v7, v0

    move-object/from16 v0, p0

    invoke-direct {v0, v7, v8}, Lcom/jcraft/jsch/ChannelSftp;->skip(J)V

    .line 1139
    :cond_1c7
    move/from16 v0, v20

    int-to-long v7, v0

    move-object/from16 v0, v25

    iget-wide v9, v0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->length:J

    cmp-long v2, v7, v9

    if-gez v2, :cond_204

    .line 1140
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, v17

    invoke-virtual {v2, v0, v7}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->cancel(Lcom/jcraft/jsch/ChannelSftp$Header;Lcom/jcraft/jsch/Buffer;)V

    .line 1141
    move-object/from16 v0, v25

    iget-wide v7, v0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->offset:J

    move/from16 v0, v20

    int-to-long v9, v0

    add-long/2addr v9, v7

    move-object/from16 v0, v25

    iget-wide v7, v0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->length:J

    move/from16 v0, v20

    int-to-long v11, v0

    sub-long/2addr v7, v11

    long-to-int v11, v7

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    move-object/from16 v7, p0

    move-object v8, v3

    invoke-direct/range {v7 .. v12}, Lcom/jcraft/jsch/ChannelSftp;->sendREAD([BJILcom/jcraft/jsch/ChannelSftp$RequestQueue;)V

    .line 1142
    move-object/from16 v0, v25

    iget-wide v7, v0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->offset:J

    move-object/from16 v0, v25

    iget-wide v9, v0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->length:J

    add-long v4, v7, v9

    .line 1145
    :cond_204
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    invoke-virtual {v2}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->size()I
    :try_end_20b
    .catch Ljava/lang/Exception; {:try_start_e4 .. :try_end_20b} :catch_52

    move-result v2

    move/from16 v0, v24

    if-ge v0, v2, :cond_a0

    .line 1146
    add-int/lit8 v24, v24, 0x1

    goto/16 :goto_a0

    .line 1159
    .end local v3    # "handle":[B
    .end local v4    # "request_offset":J
    .end local v6    # "request_len":I
    .end local v16    # "foo":I
    .end local v17    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v19    # "length":I
    .end local v20    # "length_of_data":I
    .end local v21    # "offset":J
    .end local v23    # "optional_data":I
    .end local v24    # "request_max":I
    .end local v25    # "rr":Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;
    .end local v27    # "type":I
    .local v15, "e":Ljava/lang/Exception;
    :cond_214
    instance-of v2, v15, Ljava/lang/Throwable;

    if-eqz v2, :cond_221

    .line 1160
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const/4 v7, 0x4

    const-string v8, ""

    invoke-direct {v2, v7, v8, v15}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 1161
    :cond_221
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const/4 v7, 0x4

    const-string v8, ""

    invoke-direct {v2, v7, v8}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v2
.end method

.method private _lstat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;
    .registers 12
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x4

    .line 2297
    :try_start_1
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v6}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/jcraft/jsch/ChannelSftp;->sendLSTAT([B)V

    .line 2299
    new-instance v2, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v2, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 2300
    .local v2, "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v2}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v2

    .line 2301
    iget v4, v2, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 2302
    .local v4, "length":I
    iget v5, v2, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 2304
    .local v5, "type":I
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v4}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 2306
    const/16 v6, 0x69

    if-eq v5, v6, :cond_42

    .line 2307
    const/16 v6, 0x65

    if-ne v5, v6, :cond_31

    .line 2308
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    .line 2309
    .local v3, "i":I
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v3}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 2311
    .end local v3    # "i":I
    :cond_31
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const/4 v7, 0x4

    const-string v8, ""

    invoke-direct {v6, v7, v8}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_3a} :catch_3a

    .line 2316
    .end local v2    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v4    # "length":I
    .end local v5    # "type":I
    :catch_3a
    move-exception v1

    .line 2317
    .local v1, "e":Ljava/lang/Exception;
    instance-of v6, v1, Lcom/jcraft/jsch/SftpException;

    if-eqz v6, :cond_49

    check-cast v1, Lcom/jcraft/jsch/SftpException;

    .end local v1    # "e":Ljava/lang/Exception;
    throw v1

    .line 2313
    .restart local v2    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v4    # "length":I
    .restart local v5    # "type":I
    :cond_42
    :try_start_42
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-static {v6}, Lcom/jcraft/jsch/SftpATTRS;->getATTR(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/SftpATTRS;
    :try_end_47
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_47} :catch_3a

    move-result-object v0

    .line 2314
    .local v0, "attr":Lcom/jcraft/jsch/SftpATTRS;
    return-object v0

    .line 2318
    .end local v0    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    .end local v2    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v4    # "length":I
    .end local v5    # "type":I
    .restart local v1    # "e":Ljava/lang/Exception;
    :cond_49
    instance-of v6, v1, Ljava/lang/Throwable;

    if-eqz v6, :cond_55

    .line 2319
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v9, v7, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 2320
    :cond_55
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v9, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6
.end method

.method private _realpath(Ljava/lang/String;)[B
    .registers 11
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;,
            Ljava/io/IOException;,
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/16 v7, 0x65

    .line 2325
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v6}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/jcraft/jsch/ChannelSftp;->sendREALPATH([B)V

    .line 2327
    new-instance v0, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v0, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 2328
    .local v0, "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v0}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v0

    .line 2329
    iget v3, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 2330
    .local v3, "length":I
    iget v5, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 2332
    .local v5, "type":I
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v3}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 2334
    if-eq v5, v7, :cond_2e

    const/16 v6, 0x68

    if-eq v5, v6, :cond_2e

    .line 2335
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const/4 v7, 0x4

    const-string v8, ""

    invoke-direct {v6, v7, v8}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6

    .line 2338
    :cond_2e
    if-ne v5, v7, :cond_3b

    .line 2339
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v1

    .line 2340
    .local v1, "i":I
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v1}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 2342
    .end local v1    # "i":I
    :cond_3b
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v1

    .line 2344
    .restart local v1    # "i":I
    const/4 v4, 0x0

    .local v4, "str":[B
    move v2, v1

    .line 2345
    .end local v1    # "i":I
    .local v2, "i":I
    :goto_43
    add-int/lit8 v1, v2, -0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    if-lez v2, :cond_5e

    .line 2346
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v4

    .line 2347
    iget v6, p0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    const/4 v7, 0x3

    if-gt v6, v7, :cond_57

    .line 2348
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Buffer;->getString()[B

    .line 2350
    :cond_57
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-static {v6}, Lcom/jcraft/jsch/SftpATTRS;->getATTR(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/SftpATTRS;

    move v2, v1

    .line 2351
    .end local v1    # "i":I
    .restart local v2    # "i":I
    goto :goto_43

    .line 2352
    .end local v2    # "i":I
    .restart local v1    # "i":I
    :cond_5e
    return-object v4
.end method

.method private _sendCLOSE([BLcom/jcraft/jsch/ChannelSftp$Header;)Z
    .registers 4
    .param p1, "handle"    # [B
    .param p2, "header"    # Lcom/jcraft/jsch/ChannelSftp$Header;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2464
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendCLOSE([B)V

    .line 2465
    const/4 v0, 0x0

    invoke-direct {p0, v0, p2}, Lcom/jcraft/jsch/ChannelSftp;->checkStatus([ILcom/jcraft/jsch/ChannelSftp$Header;)Z

    move-result v0

    return v0
.end method

.method private _setStat(Ljava/lang/String;Lcom/jcraft/jsch/SftpATTRS;)V
    .registers 12
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "attr"    # Lcom/jcraft/jsch/SftpATTRS;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    .line 2377
    :try_start_1
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v5}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v5

    invoke-direct {p0, v5, p2}, Lcom/jcraft/jsch/ChannelSftp;->sendSETSTAT([BLcom/jcraft/jsch/SftpATTRS;)V

    .line 2379
    new-instance v1, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v1, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 2380
    .local v1, "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v1}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v1

    .line 2381
    iget v3, v1, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 2382
    .local v3, "length":I
    iget v4, v1, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 2384
    .local v4, "type":I
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v3}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 2386
    const/16 v5, 0x65

    if-eq v4, v5, :cond_33

    .line 2387
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const/4 v6, 0x4

    const-string v7, ""

    invoke-direct {v5, v6, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v5
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_2b} :catch_2b

    .line 2394
    .end local v1    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v3    # "length":I
    .end local v4    # "type":I
    :catch_2b
    move-exception v0

    .line 2395
    .local v0, "e":Ljava/lang/Exception;
    instance-of v5, v0, Lcom/jcraft/jsch/SftpException;

    if-eqz v5, :cond_41

    check-cast v0, Lcom/jcraft/jsch/SftpException;

    .end local v0    # "e":Ljava/lang/Exception;
    throw v0

    .line 2389
    .restart local v1    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v3    # "length":I
    .restart local v4    # "type":I
    :cond_33
    :try_start_33
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v5}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v2

    .line 2390
    .local v2, "i":I
    if-eqz v2, :cond_40

    .line 2391
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v2}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_40} :catch_2b

    .line 2400
    :cond_40
    return-void

    .line 2396
    .end local v1    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v2    # "i":I
    .end local v3    # "length":I
    .end local v4    # "type":I
    .restart local v0    # "e":Ljava/lang/Exception;
    :cond_41
    instance-of v5, v0, Ljava/lang/Throwable;

    if-eqz v5, :cond_4d

    .line 2397
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const-string v6, ""

    invoke-direct {v5, v8, v6, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 2398
    :cond_4d
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const-string v6, ""

    invoke-direct {v5, v8, v6}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v5
.end method

.method private _stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;
    .registers 3
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 2215
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/jcraft/jsch/ChannelSftp;->_stat([B)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v0

    return-object v0
.end method

.method private _stat([B)Lcom/jcraft/jsch/SftpATTRS;
    .registers 12
    .param p1, "path"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x4

    .line 2186
    :try_start_1
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendSTAT([B)V

    .line 2188
    new-instance v2, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v2, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 2189
    .local v2, "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v2}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v2

    .line 2190
    iget v4, v2, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 2191
    .local v4, "length":I
    iget v5, v2, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 2193
    .local v5, "type":I
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v4}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 2195
    const/16 v6, 0x69

    if-eq v5, v6, :cond_3c

    .line 2196
    const/16 v6, 0x65

    if-ne v5, v6, :cond_2b

    .line 2197
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    .line 2198
    .local v3, "i":I
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v3}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 2200
    .end local v3    # "i":I
    :cond_2b
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const/4 v7, 0x4

    const-string v8, ""

    invoke-direct {v6, v7, v8}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_34} :catch_34

    .line 2205
    .end local v2    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v4    # "length":I
    .end local v5    # "type":I
    :catch_34
    move-exception v1

    .line 2206
    .local v1, "e":Ljava/lang/Exception;
    instance-of v6, v1, Lcom/jcraft/jsch/SftpException;

    if-eqz v6, :cond_43

    check-cast v1, Lcom/jcraft/jsch/SftpException;

    .end local v1    # "e":Ljava/lang/Exception;
    throw v1

    .line 2202
    .restart local v2    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v4    # "length":I
    .restart local v5    # "type":I
    :cond_3c
    :try_start_3c
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-static {v6}, Lcom/jcraft/jsch/SftpATTRS;->getATTR(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/SftpATTRS;
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_3c .. :try_end_41} :catch_34

    move-result-object v0

    .line 2203
    .local v0, "attr":Lcom/jcraft/jsch/SftpATTRS;
    return-object v0

    .line 2207
    .end local v0    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    .end local v2    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v4    # "length":I
    .end local v5    # "type":I
    .restart local v1    # "e":Ljava/lang/Exception;
    :cond_43
    instance-of v6, v1, Ljava/lang/Throwable;

    if-eqz v6, :cond_4f

    .line 2208
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v9, v7, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 2209
    :cond_4f
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v9, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6
.end method

.method private _statVFS(Ljava/lang/String;)Lcom/jcraft/jsch/SftpStatVFS;
    .registers 3
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 2275
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/jcraft/jsch/ChannelSftp;->_statVFS([B)Lcom/jcraft/jsch/SftpStatVFS;

    move-result-object v0

    return-object v0
.end method

.method private _statVFS([B)Lcom/jcraft/jsch/SftpStatVFS;
    .registers 12
    .param p1, "path"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x4

    .line 2237
    iget-boolean v6, p0, Lcom/jcraft/jsch/ChannelSftp;->extension_statvfs:Z

    if-nez v6, :cond_f

    .line 2238
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const/16 v7, 0x8

    const-string v8, "statvfs@openssh.com is not supported"

    invoke-direct {v6, v7, v8}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6

    .line 2244
    :cond_f
    :try_start_f
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendSTATVFS([B)V

    .line 2246
    new-instance v1, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v1, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 2247
    .local v1, "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v1}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v1

    .line 2248
    iget v3, v1, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 2249
    .local v3, "length":I
    iget v5, v1, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 2251
    .local v5, "type":I
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v3}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 2253
    const/16 v6, 0xc9

    if-eq v5, v6, :cond_4a

    .line 2254
    const/16 v6, 0x65

    if-ne v5, v6, :cond_39

    .line 2255
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v2

    .line 2256
    .local v2, "i":I
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v6, v2}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 2258
    .end local v2    # "i":I
    :cond_39
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const/4 v7, 0x4

    const-string v8, ""

    invoke-direct {v6, v7, v8}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_42} :catch_42

    .line 2265
    .end local v1    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v3    # "length":I
    .end local v5    # "type":I
    :catch_42
    move-exception v0

    .line 2266
    .local v0, "e":Ljava/lang/Exception;
    instance-of v6, v0, Lcom/jcraft/jsch/SftpException;

    if-eqz v6, :cond_51

    check-cast v0, Lcom/jcraft/jsch/SftpException;

    .end local v0    # "e":Ljava/lang/Exception;
    throw v0

    .line 2261
    .restart local v1    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v3    # "length":I
    .restart local v5    # "type":I
    :cond_4a
    :try_start_4a
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-static {v6}, Lcom/jcraft/jsch/SftpStatVFS;->getStatVFS(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/SftpStatVFS;
    :try_end_4f
    .catch Ljava/lang/Exception; {:try_start_4a .. :try_end_4f} :catch_42

    move-result-object v4

    .line 2262
    .local v4, "stat":Lcom/jcraft/jsch/SftpStatVFS;
    return-object v4

    .line 2267
    .end local v1    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v3    # "length":I
    .end local v4    # "stat":Lcom/jcraft/jsch/SftpStatVFS;
    .end local v5    # "type":I
    .restart local v0    # "e":Ljava/lang/Exception;
    :cond_51
    instance-of v6, v0, Ljava/lang/Throwable;

    if-eqz v6, :cond_5d

    .line 2268
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v9, v7, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 2269
    :cond_5d
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v9, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6
.end method

.method static synthetic access$000(Lcom/jcraft/jsch/ChannelSftp;)I
    .registers 2
    .param p0, "x0"    # Lcom/jcraft/jsch/ChannelSftp;

    .prologue
    .line 36
    iget v0, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    return v0
.end method

.method static synthetic access$100(Lcom/jcraft/jsch/ChannelSftp;[BJ[BII)I
    .registers 8
    .param p0, "x0"    # Lcom/jcraft/jsch/ChannelSftp;
    .param p1, "x1"    # [B
    .param p2, "x2"    # J
    .param p4, "x3"    # [B
    .param p5, "x4"    # I
    .param p6, "x5"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct/range {p0 .. p6}, Lcom/jcraft/jsch/ChannelSftp;->sendWRITE([BJ[BII)I

    move-result v0

    return v0
.end method

.method static synthetic access$1000(Lcom/jcraft/jsch/ChannelSftp;[BJILcom/jcraft/jsch/ChannelSftp$RequestQueue;)V
    .registers 6
    .param p0, "x0"    # Lcom/jcraft/jsch/ChannelSftp;
    .param p1, "x1"    # [B
    .param p2, "x2"    # J
    .param p4, "x3"    # I
    .param p5, "x4"    # Lcom/jcraft/jsch/ChannelSftp$RequestQueue;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct/range {p0 .. p5}, Lcom/jcraft/jsch/ChannelSftp;->sendREAD([BJILcom/jcraft/jsch/ChannelSftp$RequestQueue;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/jcraft/jsch/ChannelSftp;Lcom/jcraft/jsch/Buffer;I)V
    .registers 3
    .param p0, "x0"    # Lcom/jcraft/jsch/ChannelSftp;
    .param p1, "x1"    # Lcom/jcraft/jsch/Buffer;
    .param p2, "x2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    return-void
.end method

.method static synthetic access$1200(Lcom/jcraft/jsch/ChannelSftp;[BII)I
    .registers 5
    .param p0, "x0"    # Lcom/jcraft/jsch/ChannelSftp;
    .param p1, "x1"    # [B
    .param p2, "x2"    # I
    .param p3, "x3"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct {p0, p1, p2, p3}, Lcom/jcraft/jsch/ChannelSftp;->fill([BII)I

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/jcraft/jsch/ChannelSftp;)Ljava/io/InputStream;
    .registers 2
    .param p0, "x0"    # Lcom/jcraft/jsch/ChannelSftp;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    return-object v0
.end method

.method static synthetic access$300(Lcom/jcraft/jsch/ChannelSftp;[ILcom/jcraft/jsch/ChannelSftp$Header;)Z
    .registers 4
    .param p0, "x0"    # Lcom/jcraft/jsch/ChannelSftp;
    .param p1, "x1"    # [I
    .param p2, "x2"    # Lcom/jcraft/jsch/ChannelSftp$Header;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSftp;->checkStatus([ILcom/jcraft/jsch/ChannelSftp$Header;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lcom/jcraft/jsch/ChannelSftp;[BLcom/jcraft/jsch/ChannelSftp$Header;)Z
    .registers 4
    .param p0, "x0"    # Lcom/jcraft/jsch/ChannelSftp;
    .param p1, "x1"    # [B
    .param p2, "x2"    # Lcom/jcraft/jsch/ChannelSftp$Header;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSftp;->_sendCLOSE([BLcom/jcraft/jsch/ChannelSftp$Header;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/jcraft/jsch/ChannelSftp;Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;
    .registers 4
    .param p0, "x0"    # Lcom/jcraft/jsch/ChannelSftp;
    .param p1, "x1"    # Lcom/jcraft/jsch/Buffer;
    .param p2, "x2"    # Lcom/jcraft/jsch/ChannelSftp$Header;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/jcraft/jsch/ChannelSftp;J)V
    .registers 3
    .param p0, "x0"    # Lcom/jcraft/jsch/ChannelSftp;
    .param p1, "x1"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSftp;->skip(J)V

    return-void
.end method

.method static synthetic access$700(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/Buffer;
    .registers 2
    .param p0, "x0"    # Lcom/jcraft/jsch/ChannelSftp;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    return-object v0
.end method

.method static synthetic access$800(Lcom/jcraft/jsch/ChannelSftp;)I
    .registers 2
    .param p0, "x0"    # Lcom/jcraft/jsch/ChannelSftp;

    .prologue
    .line 36
    iget v0, p0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    return v0
.end method

.method static synthetic access$900(Lcom/jcraft/jsch/ChannelSftp;)Lcom/jcraft/jsch/ChannelSftp$RequestQueue;
    .registers 2
    .param p0, "x0"    # Lcom/jcraft/jsch/ChannelSftp;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    return-object v0
.end method

.method private checkStatus([ILcom/jcraft/jsch/ChannelSftp$Header;)Z
    .registers 9
    .param p1, "ackid"    # [I
    .param p2, "header"    # Lcom/jcraft/jsch/ChannelSftp$Header;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 2446
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v3, p2}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object p2

    .line 2447
    iget v1, p2, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 2448
    .local v1, "length":I
    iget v2, p2, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 2449
    .local v2, "type":I
    if-eqz p1, :cond_11

    .line 2450
    const/4 v3, 0x0

    iget v4, p2, Lcom/jcraft/jsch/ChannelSftp$Header;->rid:I

    aput v4, p1, v3

    .line 2452
    :cond_11
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v3, v1}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 2454
    const/16 v3, 0x65

    if-eq v2, v3, :cond_23

    .line 2455
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v4, 0x4

    const-string v5, ""

    invoke-direct {v3, v4, v5}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 2457
    :cond_23
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v0

    .line 2458
    .local v0, "i":I
    if-eqz v0, :cond_30

    .line 2459
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v3, v0}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 2461
    :cond_30
    const/4 v3, 0x1

    return v3
.end method

.method private fill([BII)I
    .registers 8
    .param p1, "buf"    # [B
    .param p2, "s"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2879
    const/4 v1, 0x0

    .line 2880
    .local v1, "i":I
    move v0, p2

    .line 2881
    .local v0, "foo":I
    :goto_2
    if-lez p3, :cond_17

    .line 2882
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 2883
    if-gtz v1, :cond_14

    .line 2884
    new-instance v2, Ljava/io/IOException;

    const-string v3, "inputstream is closed"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 2887
    :cond_14
    add-int/2addr p2, v1

    .line 2888
    sub-int/2addr p3, v1

    goto :goto_2

    .line 2890
    :cond_17
    sub-int v2, p2, v0

    return v2
.end method

.method private fill(Lcom/jcraft/jsch/Buffer;I)V
    .registers 5
    .param p1, "buf"    # Lcom/jcraft/jsch/Buffer;
    .param p2, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2873
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->reset()V

    .line 2874
    iget-object v0, p1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p2}, Lcom/jcraft/jsch/ChannelSftp;->fill([BII)I

    .line 2875
    invoke-virtual {p1, p2}, Lcom/jcraft/jsch/Buffer;->skip(I)V

    .line 2876
    return-void
.end method

.method private getCwd()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 2424
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->cwd:Ljava/lang/String;

    if-nez v0, :cond_a

    .line 2425
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getHome()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->cwd:Ljava/lang/String;

    .line 2426
    :cond_a
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->cwd:Ljava/lang/String;

    return-object v0
.end method

.method private glob_local(Ljava/lang/String;)Ljava/util/Vector;
    .registers 14
    .param p1, "_path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/16 v11, 0x5c

    const/4 v10, 0x0

    .line 2783
    new-instance v7, Ljava/util/Vector;

    invoke-direct {v7}, Ljava/util/Vector;-><init>()V

    .line 2784
    .local v7, "v":Ljava/util/Vector;
    const-string v8, "UTF-8"

    invoke-static {p1, v8}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v4

    .line 2785
    .local v4, "path":[B
    array-length v8, v4

    add-int/lit8 v2, v8, -0x1

    .line 2786
    .local v2, "i":I
    :goto_11
    if-ltz v2, :cond_3d

    .line 2787
    aget-byte v8, v4, v2

    const/16 v9, 0x2a

    if-eq v8, v9, :cond_22

    aget-byte v8, v4, v2

    const/16 v9, 0x3f

    if-eq v8, v9, :cond_22

    .line 2788
    add-int/lit8 v2, v2, -0x1

    .line 2789
    goto :goto_11

    .line 2791
    :cond_22
    sget-boolean v8, Lcom/jcraft/jsch/ChannelSftp;->fs_is_bs:Z

    if-nez v8, :cond_3d

    if-lez v2, :cond_3d

    add-int/lit8 v8, v2, -0x1

    aget-byte v8, v4, v8

    if-ne v8, v11, :cond_3d

    .line 2793
    add-int/lit8 v2, v2, -0x1

    .line 2794
    if-lez v2, :cond_3d

    add-int/lit8 v8, v2, -0x1

    aget-byte v8, v4, v8

    if-ne v8, v11, :cond_3d

    .line 2795
    add-int/lit8 v2, v2, -0x1

    .line 2796
    add-int/lit8 v2, v2, -0x1

    .line 2797
    goto :goto_11

    .line 2803
    :cond_3d
    if-gez v2, :cond_4e

    sget-boolean v8, Lcom/jcraft/jsch/ChannelSftp;->fs_is_bs:Z

    if-eqz v8, :cond_47

    .end local p1    # "_path":Ljava/lang/String;
    :goto_43
    invoke-virtual {v7, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 2838
    :cond_46
    :goto_46
    return-object v7

    .line 2803
    .restart local p1    # "_path":Ljava/lang/String;
    :cond_47
    invoke-static {p1}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_43

    .line 2810
    :cond_4c
    add-int/lit8 v2, v2, -0x1

    .line 2805
    :cond_4e
    if-ltz v2, :cond_60

    .line 2806
    aget-byte v8, v4, v2

    sget-char v9, Lcom/jcraft/jsch/ChannelSftp;->file_separatorc:C

    if-eq v8, v9, :cond_60

    sget-boolean v8, Lcom/jcraft/jsch/ChannelSftp;->fs_is_bs:Z

    if-eqz v8, :cond_4c

    aget-byte v8, v4, v2

    const/16 v9, 0x2f

    if-ne v8, v9, :cond_4c

    .line 2813
    :cond_60
    if-gez v2, :cond_6f

    sget-boolean v8, Lcom/jcraft/jsch/ChannelSftp;->fs_is_bs:Z

    if-eqz v8, :cond_6a

    .end local p1    # "_path":Ljava/lang/String;
    :goto_66
    invoke-virtual {v7, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_46

    .restart local p1    # "_path":Ljava/lang/String;
    :cond_6a
    invoke-static {p1}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_66

    .line 2816
    :cond_6f
    if-nez v2, :cond_d6

    const/4 v8, 0x1

    new-array v1, v8, [B

    sget-char v8, Lcom/jcraft/jsch/ChannelSftp;->file_separatorc:C

    int-to-byte v8, v8

    aput-byte v8, v1, v10

    .line 2822
    .local v1, "dir":[B
    :goto_79
    array-length v8, v4

    sub-int/2addr v8, v2

    add-int/lit8 v8, v8, -0x1

    new-array v5, v8, [B

    .line 2823
    .local v5, "pattern":[B
    add-int/lit8 v8, v2, 0x1

    array-length v9, v5

    invoke-static {v4, v8, v5, v10, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2827
    :try_start_85
    new-instance v8, Ljava/io/File;

    const-string v9, "UTF-8"

    invoke-static {v1, v9}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v0

    .line 2828
    .local v0, "children":[Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v1}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Lcom/jcraft/jsch/ChannelSftp;->file_separator:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 2829
    .local v6, "pdir":Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_ac
    array-length v8, v0

    if-ge v3, v8, :cond_46

    .line 2831
    aget-object v8, v0, v3

    const-string v9, "UTF-8"

    invoke-static {v8, v9}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v8

    invoke-static {v5, v8}, Lcom/jcraft/jsch/Util;->glob([B[B)Z

    move-result v8

    if-eqz v8, :cond_d3

    .line 2832
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    aget-object v9, v0, v3

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_d3
    .catch Ljava/lang/Exception; {:try_start_85 .. :try_end_d3} :catch_dc

    .line 2829
    :cond_d3
    add-int/lit8 v3, v3, 0x1

    goto :goto_ac

    .line 2818
    .end local v0    # "children":[Ljava/lang/String;
    .end local v1    # "dir":[B
    .end local v3    # "j":I
    .end local v5    # "pattern":[B
    .end local v6    # "pdir":Ljava/lang/String;
    :cond_d6
    new-array v1, v2, [B

    .line 2819
    .restart local v1    # "dir":[B
    invoke-static {v4, v10, v1, v10, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_79

    .line 2836
    .restart local v5    # "pattern":[B
    :catch_dc
    move-exception v8

    goto/16 :goto_46
.end method

.method private glob_remote(Ljava/lang/String;)Ljava/util/Vector;
    .registers 29
    .param p1, "_path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2652
    new-instance v23, Ljava/util/Vector;

    invoke-direct/range {v23 .. v23}, Ljava/util/Vector;-><init>()V

    .line 2653
    .local v23, "v":Ljava/util/Vector;
    const/16 v16, 0x0

    .line 2655
    .local v16, "i":I
    const/16 v24, 0x2f

    move-object/from16 v0, p1

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v12

    .line 2656
    .local v12, "foo":I
    if-gez v12, :cond_1b

    .line 2657
    invoke-static/range {p1 .. p1}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 2765
    .end local v23    # "v":Ljava/util/Vector;
    :cond_1a
    :goto_1a
    return-object v23

    .line 2661
    .restart local v23    # "v":Ljava/util/Vector;
    :cond_1b
    const/16 v25, 0x0

    if-nez v12, :cond_83

    const/16 v24, 0x1

    :goto_21
    move-object/from16 v0, p1

    move/from16 v1, v25

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 2662
    .local v9, "dir":Ljava/lang/String;
    add-int/lit8 v24, v12, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 2664
    .local v5, "_pattern":Ljava/lang/String;
    invoke-static {v9}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 2666
    const/16 v19, 0x0

    .line 2667
    .local v19, "pattern":[B
    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v6, v0, [[B

    .line 2668
    .local v6, "_pattern_utf8":[[B
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v6}, Lcom/jcraft/jsch/ChannelSftp;->isPattern(Ljava/lang/String;[[B)Z

    move-result v20

    .line 2670
    .local v20, "pattern_has_wildcard":Z
    if-nez v20, :cond_86

    .line 2671
    const-string v24, "/"

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_68

    .line 2672
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 2673
    :cond_68
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-static {v5}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_1a

    .end local v5    # "_pattern":Ljava/lang/String;
    .end local v6    # "_pattern_utf8":[[B
    .end local v9    # "dir":Ljava/lang/String;
    .end local v19    # "pattern":[B
    .end local v20    # "pattern_has_wildcard":Z
    :cond_83
    move/from16 v24, v12

    .line 2661
    goto :goto_21

    .line 2677
    .restart local v5    # "_pattern":Ljava/lang/String;
    .restart local v6    # "_pattern_utf8":[[B
    .restart local v9    # "dir":Ljava/lang/String;
    .restart local v19    # "pattern":[B
    .restart local v20    # "pattern_has_wildcard":Z
    :cond_86
    const/16 v24, 0x0

    aget-object v19, v6, v24

    .line 2679
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-static {v9, v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v24

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->sendOPENDIR([B)V

    .line 2681
    new-instance v15, Lcom/jcraft/jsch/ChannelSftp$Header;

    move-object/from16 v0, p0

    invoke-direct {v15, v0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 2682
    .local v15, "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1, v15}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v15

    .line 2683
    iget v0, v15, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    move/from16 v18, v0

    .line 2684
    .local v18, "length":I
    iget v0, v15, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    move/from16 v22, v0

    .line 2686
    .local v22, "type":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 2688
    const/16 v24, 0x65

    move/from16 v0, v22

    move/from16 v1, v24

    if-eq v0, v1, :cond_e3

    const/16 v24, 0x66

    move/from16 v0, v22

    move/from16 v1, v24

    if-eq v0, v1, :cond_e3

    .line 2689
    new-instance v24, Lcom/jcraft/jsch/SftpException;

    const/16 v25, 0x4

    const-string v26, ""

    invoke-direct/range {v24 .. v26}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v24

    .line 2691
    :cond_e3
    const/16 v24, 0x65

    move/from16 v0, v22

    move/from16 v1, v24

    if-ne v0, v1, :cond_104

    .line 2692
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v16

    .line 2693
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 2696
    :cond_104
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v14

    .line 2697
    .local v14, "handle":[B
    const/16 v21, 0x0

    .line 2700
    .local v21, "pdir":Ljava/lang/String;
    :cond_110
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/jcraft/jsch/ChannelSftp;->sendREADDIR([B)V

    .line 2701
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1, v15}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v15

    .line 2702
    iget v0, v15, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    move/from16 v18, v0

    .line 2703
    iget v0, v15, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    move/from16 v22, v0

    .line 2705
    const/16 v24, 0x65

    move/from16 v0, v22

    move/from16 v1, v24

    if-eq v0, v1, :cond_145

    const/16 v24, 0x68

    move/from16 v0, v22

    move/from16 v1, v24

    if-eq v0, v1, :cond_145

    .line 2706
    new-instance v24, Lcom/jcraft/jsch/SftpException;

    const/16 v25, 0x4

    const-string v26, ""

    invoke-direct/range {v24 .. v26}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v24

    .line 2708
    :cond_145
    const/16 v24, 0x65

    move/from16 v0, v22

    move/from16 v1, v24

    if-ne v0, v1, :cond_168

    .line 2709
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 2763
    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lcom/jcraft/jsch/ChannelSftp;->_sendCLOSE([BLcom/jcraft/jsch/ChannelSftp$Header;)Z

    move-result v24

    if-nez v24, :cond_1a

    .line 2765
    const/16 v23, 0x0

    goto/16 :goto_1a

    .line 2713
    :cond_168
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/jcraft/jsch/Buffer;->rewind()V

    .line 2714
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const/16 v26, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    invoke-direct {v0, v1, v2, v3}, Lcom/jcraft/jsch/ChannelSftp;->fill([BII)I

    add-int/lit8 v18, v18, -0x4

    .line 2715
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v8

    .line 2720
    .local v8, "count":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/jcraft/jsch/Buffer;->reset()V

    .line 2721
    :goto_1a1
    if-lez v8, :cond_110

    .line 2722
    if-lez v18, :cond_217

    .line 2723
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/jcraft/jsch/Buffer;->shift()V

    .line 2724
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move/from16 v25, v0

    add-int v25, v25, v18

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_2bc

    move/from16 v17, v18

    .line 2725
    .local v17, "j":I
    :goto_1d5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move/from16 v26, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move/from16 v2, v26

    move/from16 v3, v17

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v16

    .line 2726
    if-lez v16, :cond_110

    .line 2727
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move/from16 v25, v0

    add-int v25, v25, v16

    move/from16 v0, v25

    move-object/from16 v1, v24

    iput v0, v1, Lcom/jcraft/jsch/Buffer;->index:I

    .line 2728
    sub-int v18, v18, v16

    .line 2731
    .end local v17    # "j":I
    :cond_217
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v11

    .line 2733
    .local v11, "filename":[B
    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    move/from16 v24, v0

    const/16 v25, 0x3

    move/from16 v0, v24

    move/from16 v1, v25

    if-gt v0, v1, :cond_238

    .line 2734
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/jcraft/jsch/Buffer;->getString()[B

    .line 2736
    :cond_238
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    invoke-static/range {v24 .. v24}, Lcom/jcraft/jsch/SftpATTRS;->getATTR(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v7

    .line 2738
    .local v7, "attrs":Lcom/jcraft/jsch/SftpATTRS;
    move-object v4, v11

    .line 2739
    .local v4, "_filename":[B
    const/4 v10, 0x0

    .line 2740
    .local v10, "f":Ljava/lang/String;
    const/4 v13, 0x0

    .line 2742
    .local v13, "found":Z
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding_is_utf8:Z

    move/from16 v24, v0

    if-nez v24, :cond_261

    .line 2743
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-static {v11, v0}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2744
    const-string v24, "UTF-8"

    move-object/from16 v0, v24

    invoke-static {v10, v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v4

    .line 2746
    :cond_261
    move-object/from16 v0, v19

    invoke-static {v0, v4}, Lcom/jcraft/jsch/Util;->glob([B[B)Z

    move-result v13

    .line 2748
    if-eqz v13, :cond_2b8

    .line 2749
    if-nez v10, :cond_277

    .line 2750
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-static {v11, v0}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2752
    :cond_277
    if-nez v21, :cond_29e

    .line 2753
    move-object/from16 v21, v9

    .line 2754
    const-string v24, "/"

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v24

    if-nez v24, :cond_29e

    .line 2755
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 2758
    :cond_29e
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 2760
    :cond_2b8
    add-int/lit8 v8, v8, -0x1

    .line 2761
    goto/16 :goto_1a1

    .line 2724
    .end local v4    # "_filename":[B
    .end local v7    # "attrs":Lcom/jcraft/jsch/SftpATTRS;
    .end local v10    # "f":Ljava/lang/String;
    .end local v11    # "filename":[B
    .end local v13    # "found":Z
    :cond_2bc
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move/from16 v25, v0

    sub-int v17, v24, v25

    goto/16 :goto_1d5
.end method

.method private header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;
    .registers 7
    .param p1, "buf"    # Lcom/jcraft/jsch/Buffer;
    .param p2, "header"    # Lcom/jcraft/jsch/ChannelSftp$Header;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2907
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->rewind()V

    .line 2908
    iget-object v1, p1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v2, 0x0

    const/16 v3, 0x9

    invoke-direct {p0, v1, v2, v3}, Lcom/jcraft/jsch/ChannelSftp;->fill([BII)I

    move-result v0

    .line 2909
    .local v0, "i":I
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v1

    add-int/lit8 v1, v1, -0x5

    iput v1, p2, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 2910
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v1

    and-int/lit16 v1, v1, 0xff

    iput v1, p2, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 2911
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v1

    iput v1, p2, Lcom/jcraft/jsch/ChannelSftp$Header;->rid:I

    .line 2912
    return-object p2
.end method

.method private static isLocalAbsolutePath(Ljava/lang/String;)Z
    .registers 2
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 2854
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isAbsolute()Z

    move-result v0

    return v0
.end method

.method private isPattern(Ljava/lang/String;)Z
    .registers 3
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 2869
    const/4 v0, 0x0

    check-cast v0, [[B

    invoke-direct {p0, p1, v0}, Lcom/jcraft/jsch/ChannelSftp;->isPattern(Ljava/lang/String;[[B)Z

    move-result v0

    return v0
.end method

.method private isPattern(Ljava/lang/String;[[B)Z
    .registers 5
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "utf8"    # [[B

    .prologue
    .line 2862
    const-string v1, "UTF-8"

    invoke-static {p1, v1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    .line 2863
    .local v0, "_path":[B
    if-eqz p2, :cond_b

    .line 2864
    const/4 v1, 0x0

    aput-object v0, p2, v1

    .line 2865
    :cond_b
    invoke-direct {p0, v0}, Lcom/jcraft/jsch/ChannelSftp;->isPattern([B)Z

    move-result v1

    return v1
.end method

.method private isPattern([B)Z
    .registers 6
    .param p1, "path"    # [B

    .prologue
    .line 2769
    array-length v1, p1

    .line 2770
    .local v1, "length":I
    const/4 v0, 0x0

    .line 2771
    .local v0, "i":I
    :goto_2
    if-ge v0, v1, :cond_21

    .line 2772
    aget-byte v2, p1, v0

    const/16 v3, 0x2a

    if-eq v2, v3, :cond_10

    aget-byte v2, p1, v0

    const/16 v3, 0x3f

    if-ne v2, v3, :cond_12

    .line 2773
    :cond_10
    const/4 v2, 0x1

    .line 2778
    :goto_11
    return v2

    .line 2774
    :cond_12
    aget-byte v2, p1, v0

    const/16 v3, 0x5c

    if-ne v2, v3, :cond_1e

    add-int/lit8 v2, v0, 0x1

    if-ge v2, v1, :cond_1e

    .line 2775
    add-int/lit8 v0, v0, 0x1

    .line 2776
    :cond_1e
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 2778
    :cond_21
    const/4 v2, 0x0

    goto :goto_11
.end method

.method private isRemoteDir(Ljava/lang/String;)Z
    .registers 8
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 1972
    :try_start_1
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v5}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/jcraft/jsch/ChannelSftp;->sendSTAT([B)V

    .line 1974
    new-instance v1, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v1, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 1975
    .local v1, "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v1}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v1

    .line 1976
    iget v2, v1, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 1977
    .local v2, "length":I
    iget v3, v1, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 1979
    .local v3, "type":I
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v2}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1981
    const/16 v5, 0x69

    if-eq v3, v5, :cond_23

    .line 1988
    .end local v1    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v2    # "length":I
    .end local v3    # "type":I
    :goto_22
    return v4

    .line 1984
    .restart local v1    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v2    # "length":I
    .restart local v3    # "type":I
    :cond_23
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-static {v5}, Lcom/jcraft/jsch/SftpATTRS;->getATTR(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v0

    .line 1985
    .local v0, "attr":Lcom/jcraft/jsch/SftpATTRS;
    invoke-virtual {v0}, Lcom/jcraft/jsch/SftpATTRS;->isDir()Z
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_2c} :catch_2e

    move-result v4

    goto :goto_22

    .line 1987
    .end local v0    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    .end local v1    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v2    # "length":I
    .end local v3    # "type":I
    :catch_2e
    move-exception v5

    goto :goto_22
.end method

.method private isUnique(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;,
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2936
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v0

    .line 2937
    .local v0, "v":Ljava/util/Vector;
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_2d

    .line 2938
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const/4 v2, 0x4

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is not unique: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/util/Vector;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 2940
    :cond_2d
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    check-cast v1, Ljava/lang/String;

    return-object v1
.end method

.method private localAbsolutePath(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 2924
    invoke-static {p1}, Lcom/jcraft/jsch/ChannelSftp;->isLocalAbsolutePath(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 2926
    .end local p1    # "path":Ljava/lang/String;
    :goto_6
    return-object p1

    .line 2925
    .restart local p1    # "path":Ljava/lang/String;
    :cond_7
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->lcwd:Ljava/lang/String;

    sget-object v1, Lcom/jcraft/jsch/ChannelSftp;->file_separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_25

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->lcwd:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_6

    .line 2926
    :cond_25
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->lcwd:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/jcraft/jsch/ChannelSftp;->file_separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_6
.end method

.method private putHEAD(BI)V
    .registers 4
    .param p1, "type"    # B
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2648
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v0, p1, p2}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(Lcom/jcraft/jsch/Buffer;BI)V

    .line 2649
    return-void
.end method

.method private putHEAD(Lcom/jcraft/jsch/Buffer;BI)V
    .registers 5
    .param p1, "buf"    # Lcom/jcraft/jsch/Buffer;
    .param p2, "type"    # B
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2640
    const/16 v0, 0x5e

    invoke-virtual {p1, v0}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 2641
    iget v0, p0, Lcom/jcraft/jsch/ChannelSftp;->recipient:I

    invoke-virtual {p1, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2642
    add-int/lit8 v0, p3, 0x4

    invoke-virtual {p1, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2643
    invoke-virtual {p1, p3}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2644
    invoke-virtual {p1, p2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 2645
    return-void
.end method

.method private read([BII)V
    .registers 8
    .param p1, "buf"    # [B
    .param p2, "s"    # I
    .param p3, "l"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 2434
    const/4 v0, 0x0

    .line 2435
    .local v0, "i":I
    :goto_1
    if-lez p3, :cond_17

    .line 2436
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 2437
    if-gtz v0, :cond_14

    .line 2438
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const/4 v2, 0x4

    const-string v3, ""

    invoke-direct {v1, v2, v3}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 2440
    :cond_14
    add-int/2addr p2, v0

    .line 2441
    sub-int/2addr p3, v0

    goto :goto_1

    .line 2443
    :cond_17
    return-void
.end method

.method private remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 2916
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2f

    if-ne v1, v2, :cond_a

    .line 2920
    .end local p1    # "path":Ljava/lang/String;
    :goto_9
    return-object p1

    .line 2917
    .restart local p1    # "path":Ljava/lang/String;
    :cond_a
    invoke-direct {p0}, Lcom/jcraft/jsch/ChannelSftp;->getCwd()Ljava/lang/String;

    move-result-object v0

    .line 2919
    .local v0, "cwd":Ljava/lang/String;
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_28

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_9

    .line 2920
    :cond_28
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_9
.end method

.method private sendCLOSE([B)V
    .registers 3
    .param p1, "path"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2538
    const/4 v0, 0x4

    invoke-direct {p0, v0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B)V

    .line 2539
    return-void
.end method

.method private sendFSTAT([B)V
    .registers 3
    .param p1, "handle"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2493
    const/16 v0, 0x8

    invoke-direct {p0, v0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B)V

    .line 2494
    return-void
.end method

.method private sendHARDLINK([B[B)V
    .registers 5
    .param p1, "p1"    # [B
    .param p2, "p2"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2522
    const/4 v0, 0x0

    const-string v1, "hardlink@openssh.com"

    invoke-direct {p0, v0, p1, p2, v1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B[BLjava/lang/String;)V

    .line 2523
    return-void
.end method

.method private sendINIT()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2469
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2470
    const/4 v0, 0x1

    const/4 v1, 0x5

    invoke-direct {p0, v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(BI)V

    .line 2471
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2472
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v0

    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    const/16 v2, 0x9

    invoke-virtual {v0, v1, p0, v2}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V

    .line 2473
    return-void
.end method

.method private sendLSTAT([B)V
    .registers 3
    .param p1, "path"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2490
    const/4 v0, 0x7

    invoke-direct {p0, v0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B)V

    .line 2491
    return-void
.end method

.method private sendMKDIR([BLcom/jcraft/jsch/SftpATTRS;)V
    .registers 7
    .param p1, "path"    # [B
    .param p2, "attr"    # Lcom/jcraft/jsch/SftpATTRS;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v1, 0x4

    .line 2507
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2508
    const/16 v2, 0xe

    array-length v0, p1

    add-int/lit8 v3, v0, 0x9

    if-eqz p2, :cond_42

    invoke-virtual {p2}, Lcom/jcraft/jsch/SftpATTRS;->length()I

    move-result v0

    :goto_11
    add-int/2addr v0, v3

    invoke-direct {p0, v2, v0}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(BI)V

    .line 2509
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget v2, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2510
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2511
    if-eqz p2, :cond_44

    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {p2, v0}, Lcom/jcraft/jsch/SftpATTRS;->dump(Lcom/jcraft/jsch/Buffer;)V

    .line 2513
    :goto_2c
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v0

    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    array-length v3, p1

    add-int/lit8 v3, v3, 0x9

    if-eqz p2, :cond_3b

    invoke-virtual {p2}, Lcom/jcraft/jsch/SftpATTRS;->length()I

    move-result v1

    :cond_3b
    add-int/2addr v1, v3

    add-int/lit8 v1, v1, 0x4

    invoke-virtual {v0, v2, p0, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V

    .line 2514
    return-void

    :cond_42
    move v0, v1

    .line 2508
    goto :goto_11

    .line 2512
    :cond_44
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    goto :goto_2c
.end method

.method private sendOPEN([BI)V
    .registers 6
    .param p1, "path"    # [B
    .param p2, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2550
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2551
    const/4 v0, 0x3

    array-length v1, p1

    add-int/lit8 v1, v1, 0x11

    invoke-direct {p0, v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(BI)V

    .line 2552
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget v1, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2553
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2554
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, p2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2555
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2556
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v0

    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    array-length v2, p1

    add-int/lit8 v2, v2, 0x11

    add-int/lit8 v2, v2, 0x4

    invoke-virtual {v0, v1, p0, v2}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V

    .line 2557
    return-void
.end method

.method private sendOPENA([B)V
    .registers 3
    .param p1, "path"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2547
    const/16 v0, 0xa

    invoke-direct {p0, p1, v0}, Lcom/jcraft/jsch/ChannelSftp;->sendOPEN([BI)V

    .line 2548
    return-void
.end method

.method private sendOPENDIR([B)V
    .registers 3
    .param p1, "path"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2528
    const/16 v0, 0xb

    invoke-direct {p0, v0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B)V

    .line 2529
    return-void
.end method

.method private sendOPENR([B)V
    .registers 3
    .param p1, "path"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2541
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/jcraft/jsch/ChannelSftp;->sendOPEN([BI)V

    .line 2542
    return-void
.end method

.method private sendOPENW([B)V
    .registers 3
    .param p1, "path"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2544
    const/16 v0, 0x1a

    invoke-direct {p0, p1, v0}, Lcom/jcraft/jsch/ChannelSftp;->sendOPEN([BI)V

    .line 2545
    return-void
.end method

.method private sendPacketPath(B[B)V
    .registers 4
    .param p1, "fxp"    # B
    .param p2, "path"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2559
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, p1, p2, v0}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[BLjava/lang/String;)V

    .line 2560
    return-void
.end method

.method private sendPacketPath(B[BLjava/lang/String;)V
    .registers 8
    .param p1, "fxp"    # B
    .param p2, "path"    # [B
    .param p3, "extension"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2562
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2563
    array-length v1, p2

    add-int/lit8 v0, v1, 0x9

    .line 2564
    .local v0, "len":I
    if-nez p3, :cond_29

    .line 2565
    invoke-direct {p0, p1, v0}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(BI)V

    .line 2566
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget v2, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2574
    :goto_18
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v1, p2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2575
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v1

    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    add-int/lit8 v3, v0, 0x4

    invoke-virtual {v1, v2, p0, v3}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V

    .line 2576
    return-void

    .line 2569
    :cond_29
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x4

    add-int/2addr v0, v1

    .line 2570
    const/16 v1, -0x38

    invoke-direct {p0, v1, v0}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(BI)V

    .line 2571
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget v2, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2572
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-static {p3}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    goto :goto_18
.end method

.method private sendPacketPath(B[B[B)V
    .registers 5
    .param p1, "fxp"    # B
    .param p2, "p1"    # [B
    .param p3, "p2"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2579
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B[BLjava/lang/String;)V

    .line 2580
    return-void
.end method

.method private sendPacketPath(B[B[BLjava/lang/String;)V
    .registers 9
    .param p1, "fxp"    # B
    .param p2, "p1"    # [B
    .param p3, "p2"    # [B
    .param p4, "extension"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2582
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2583
    array-length v1, p2

    add-int/lit8 v1, v1, 0xd

    array-length v2, p3

    add-int v0, v1, v2

    .line 2584
    .local v0, "len":I
    if-nez p4, :cond_31

    .line 2585
    invoke-direct {p0, p1, v0}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(BI)V

    .line 2586
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget v2, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2594
    :goto_1b
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v1, p2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2595
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v1, p3}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2596
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v1

    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    add-int/lit8 v3, v0, 0x4

    invoke-virtual {v1, v2, p0, v3}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V

    .line 2597
    return-void

    .line 2589
    :cond_31
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x4

    add-int/2addr v0, v1

    .line 2590
    const/16 v1, -0x38

    invoke-direct {p0, v1, v0}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(BI)V

    .line 2591
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget v2, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2592
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-static {p4}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    goto :goto_1b
.end method

.method private sendREAD([BJI)V
    .registers 11
    .param p1, "handle"    # [B
    .param p2, "offset"    # J
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2623
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/jcraft/jsch/ChannelSftp;->sendREAD([BJILcom/jcraft/jsch/ChannelSftp$RequestQueue;)V

    .line 2624
    return-void
.end method

.method private sendREAD([BJILcom/jcraft/jsch/ChannelSftp$RequestQueue;)V
    .registers 9
    .param p1, "handle"    # [B
    .param p2, "offset"    # J
    .param p4, "length"    # I
    .param p5, "rrq"    # Lcom/jcraft/jsch/ChannelSftp$RequestQueue;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2627
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2628
    const/4 v0, 0x5

    array-length v1, p1

    add-int/lit8 v1, v1, 0x15

    invoke-direct {p0, v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(BI)V

    .line 2629
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget v1, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2630
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2631
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, p2, p3}, Lcom/jcraft/jsch/Buffer;->putLong(J)V

    .line 2632
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, p4}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2633
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v0

    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    array-length v2, p1

    add-int/lit8 v2, v2, 0x15

    add-int/lit8 v2, v2, 0x4

    invoke-virtual {v0, v1, p0, v2}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V

    .line 2634
    if-eqz p5, :cond_3d

    .line 2635
    iget v0, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p5, v0, p2, p3, p4}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->add(IJI)V

    .line 2637
    :cond_3d
    return-void
.end method

.method private sendREADDIR([B)V
    .registers 3
    .param p1, "path"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2531
    const/16 v0, 0xc

    invoke-direct {p0, v0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B)V

    .line 2532
    return-void
.end method

.method private sendREADLINK([B)V
    .registers 3
    .param p1, "path"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2525
    const/16 v0, 0x13

    invoke-direct {p0, v0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B)V

    .line 2526
    return-void
.end method

.method private sendREALPATH([B)V
    .registers 3
    .param p1, "path"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2476
    const/16 v0, 0x10

    invoke-direct {p0, v0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B)V

    .line 2477
    return-void
.end method

.method private sendREMOVE([B)V
    .registers 3
    .param p1, "path"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2504
    const/16 v0, 0xd

    invoke-direct {p0, v0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B)V

    .line 2505
    return-void
.end method

.method private sendRENAME([B[B)V
    .registers 5
    .param p1, "p1"    # [B
    .param p2, "p2"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2534
    const/16 v1, 0x12

    iget-boolean v0, p0, Lcom/jcraft/jsch/ChannelSftp;->extension_posix_rename:Z

    if-eqz v0, :cond_c

    const-string v0, "posix-rename@openssh.com"

    :goto_8
    invoke-direct {p0, v1, p1, p2, v0}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B[BLjava/lang/String;)V

    .line 2536
    return-void

    .line 2534
    :cond_c
    const/4 v0, 0x0

    goto :goto_8
.end method

.method private sendRMDIR([B)V
    .registers 3
    .param p1, "path"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2516
    const/16 v0, 0xf

    invoke-direct {p0, v0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B)V

    .line 2517
    return-void
.end method

.method private sendSETSTAT([BLcom/jcraft/jsch/SftpATTRS;)V
    .registers 7
    .param p1, "path"    # [B
    .param p2, "attr"    # Lcom/jcraft/jsch/SftpATTRS;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2496
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2497
    const/16 v0, 0x9

    array-length v1, p1

    add-int/lit8 v1, v1, 0x9

    invoke-virtual {p2}, Lcom/jcraft/jsch/SftpATTRS;->length()I

    move-result v2

    add-int/2addr v1, v2

    invoke-direct {p0, v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(BI)V

    .line 2498
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    iget v1, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2499
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2500
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {p2, v0}, Lcom/jcraft/jsch/SftpATTRS;->dump(Lcom/jcraft/jsch/Buffer;)V

    .line 2501
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v0

    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    array-length v2, p1

    add-int/lit8 v2, v2, 0x9

    invoke-virtual {p2}, Lcom/jcraft/jsch/SftpATTRS;->length()I

    move-result v3

    add-int/2addr v2, v3

    add-int/lit8 v2, v2, 0x4

    invoke-virtual {v0, v1, p0, v2}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V

    .line 2502
    return-void
.end method

.method private sendSTAT([B)V
    .registers 3
    .param p1, "path"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2479
    const/16 v0, 0x11

    invoke-direct {p0, v0, p1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B)V

    .line 2480
    return-void
.end method

.method private sendSTATVFS([B)V
    .registers 4
    .param p1, "path"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2482
    const/4 v0, 0x0

    const-string v1, "statvfs@openssh.com"

    invoke-direct {p0, v0, p1, v1}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[BLjava/lang/String;)V

    .line 2483
    return-void
.end method

.method private sendSYMLINK([B[B)V
    .registers 4
    .param p1, "p1"    # [B
    .param p2, "p2"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2519
    const/16 v0, 0x14

    invoke-direct {p0, v0, p1, p2}, Lcom/jcraft/jsch/ChannelSftp;->sendPacketPath(B[B[B)V

    .line 2520
    return-void
.end method

.method private sendWRITE([BJ[BII)I
    .registers 11
    .param p1, "handle"    # [B
    .param p2, "offset"    # J
    .param p4, "data"    # [B
    .param p5, "start"    # I
    .param p6, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 2601
    move v0, p6

    .line 2602
    .local v0, "_length":I
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->opacket:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 2603
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    iget-object v1, v1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v1, v1

    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    iget v2, v2, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/lit8 v2, v2, 0xd

    add-int/lit8 v2, v2, 0x15

    array-length v3, p1

    add-int/2addr v2, v3

    add-int/2addr v2, p6

    add-int/lit8 v2, v2, 0x54

    if-ge v1, v2, :cond_2d

    .line 2604
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    iget-object v1, v1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v1, v1

    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    iget v2, v2, Lcom/jcraft/jsch/Buffer;->index:I

    add-int/lit8 v2, v2, 0xd

    add-int/lit8 v2, v2, 0x15

    array-length v3, p1

    add-int/2addr v2, v3

    add-int/lit8 v2, v2, 0x54

    sub-int v0, v1, v2

    .line 2608
    :cond_2d
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    const/4 v2, 0x6

    array-length v3, p1

    add-int/lit8 v3, v3, 0x15

    add-int/2addr v3, v0

    invoke-direct {p0, v1, v2, v3}, Lcom/jcraft/jsch/ChannelSftp;->putHEAD(Lcom/jcraft/jsch/Buffer;BI)V

    .line 2609
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    iget v2, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2610
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v1, p1}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 2611
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v1, p2, p3}, Lcom/jcraft/jsch/Buffer;->putLong(J)V

    .line 2612
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    iget-object v1, v1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    if-eq v1, p4, :cond_67

    .line 2613
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v1, p4, p5, v0}, Lcom/jcraft/jsch/Buffer;->putString([BII)V

    .line 2619
    :goto_57
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v1

    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->opacket:Lcom/jcraft/jsch/Packet;

    array-length v3, p1

    add-int/lit8 v3, v3, 0x15

    add-int/2addr v3, v0

    add-int/lit8 v3, v3, 0x4

    invoke-virtual {v1, v2, p0, v3}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V

    .line 2620
    return v0

    .line 2616
    :cond_67
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v1, v0}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 2617
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v1, v0}, Lcom/jcraft/jsch/Buffer;->skip(I)V

    goto :goto_57
.end method

.method private setCwd(Ljava/lang/String;)V
    .registers 2
    .param p1, "cwd"    # Ljava/lang/String;

    .prologue
    .line 2430
    iput-object p1, p0, Lcom/jcraft/jsch/ChannelSftp;->cwd:Ljava/lang/String;

    .line 2431
    return-void
.end method

.method private skip(J)V
    .registers 8
    .param p1, "foo"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v3, 0x0

    .line 2893
    :goto_2
    cmp-long v2, p1, v3

    if-lez v2, :cond_10

    .line 2894
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    .line 2895
    .local v0, "bar":J
    cmp-long v2, v0, v3

    if-gtz v2, :cond_11

    .line 2899
    .end local v0    # "bar":J
    :cond_10
    return-void

    .line 2897
    .restart local v0    # "bar":J
    :cond_11
    sub-long/2addr p1, v0

    .line 2898
    goto :goto_2
.end method

.method private throwStatusError(Lcom/jcraft/jsch/Buffer;I)V
    .registers 6
    .param p1, "buf"    # Lcom/jcraft/jsch/Buffer;
    .param p2, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 2842
    iget v1, p0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    const/4 v2, 0x3

    if-lt v1, v2, :cond_1c

    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getLength()I

    move-result v1

    const/4 v2, 0x4

    if-lt v1, v2, :cond_1c

    .line 2844
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v0

    .line 2846
    .local v0, "str":[B
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const-string v2, "UTF-8"

    invoke-static {v0, v2}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p2, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 2849
    .end local v0    # "str":[B
    :cond_1c
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const-string v2, "Failure"

    invoke-direct {v1, p2, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public _put(Ljava/io/InputStream;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V
    .registers 40
    .param p1, "src"    # Ljava/io/InputStream;
    .param p2, "dst"    # Ljava/lang/String;
    .param p3, "monitor"    # Lcom/jcraft/jsch/SftpProgressMonitor;
    .param p4, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 559
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v3, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v3}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 561
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-static {v0, v3}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_12} :catch_62

    move-result-object v20

    .line 562
    .local v20, "dstb":[B
    const-wide/16 v27, 0x0

    .line 563
    .local v27, "skip":J
    const/4 v3, 0x1

    move/from16 v0, p4

    if-eq v0, v3, :cond_1f

    const/4 v3, 0x2

    move/from16 v0, p4

    if-ne v0, v3, :cond_2b

    .line 565
    :cond_1f
    :try_start_1f
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->_stat([B)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v15

    .line 566
    .local v15, "attr":Lcom/jcraft/jsch/SftpATTRS;
    invoke-virtual {v15}, Lcom/jcraft/jsch/SftpATTRS;->getSize()J
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_2a} :catch_290

    move-result-wide v27

    .line 572
    .end local v15    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    :cond_2b
    :goto_2b
    const/4 v3, 0x1

    move/from16 v0, p4

    if-ne v0, v3, :cond_6c

    const-wide/16 v33, 0x0

    cmp-long v3, v27, v33

    if-lez v3, :cond_6c

    .line 573
    :try_start_36
    move-object/from16 v0, p1

    move-wide/from16 v1, v27

    invoke-virtual {v0, v1, v2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v29

    .line 574
    .local v29, "skipped":J
    cmp-long v3, v29, v27

    if-gez v3, :cond_6c

    .line 575
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v8, 0x4

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "failed to resume for "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-direct {v3, v8, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_62} :catch_62

    .line 685
    .end local v20    # "dstb":[B
    .end local v27    # "skip":J
    .end local v29    # "skipped":J
    :catch_62
    move-exception v21

    .line 686
    .local v21, "e":Ljava/lang/Exception;
    move-object/from16 v0, v21

    instance-of v3, v0, Lcom/jcraft/jsch/SftpException;

    if-eqz v3, :cond_26e

    check-cast v21, Lcom/jcraft/jsch/SftpException;

    .end local v21    # "e":Ljava/lang/Exception;
    throw v21

    .line 579
    .restart local v20    # "dstb":[B
    .restart local v27    # "skip":J
    :cond_6c
    if-nez p4, :cond_cd

    :try_start_6e
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->sendOPENW([B)V

    .line 582
    :goto_75
    new-instance v22, Lcom/jcraft/jsch/ChannelSftp$Header;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 583
    .local v22, "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v3, v1}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v22

    .line 584
    move-object/from16 v0, v22

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    move/from16 v24, v0

    .line 585
    .local v24, "length":I
    move-object/from16 v0, v22

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    move/from16 v32, v0

    .line 587
    .local v32, "type":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-direct {v0, v3, v1}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 589
    const/16 v3, 0x65

    move/from16 v0, v32

    if-eq v0, v3, :cond_d5

    const/16 v3, 0x66

    move/from16 v0, v32

    if-eq v0, v3, :cond_d5

    .line 590
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v8, 0x4

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "invalid type="

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-direct {v3, v8, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 580
    .end local v22    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v24    # "length":I
    .end local v32    # "type":I
    :cond_cd
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->sendOPENA([B)V

    goto :goto_75

    .line 592
    .restart local v22    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v24    # "length":I
    .restart local v32    # "type":I
    :cond_d5
    const/16 v3, 0x65

    move/from16 v0, v32

    if-ne v0, v3, :cond_ee

    .line 593
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v23

    .line 594
    .local v23, "i":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-direct {v0, v3, v1}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 596
    .end local v23    # "i":I
    :cond_ee
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v3}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v4

    .line 597
    .local v4, "handle":[B
    const/4 v7, 0x0

    .line 599
    .local v7, "data":[B
    const/16 v19, 0x1

    .line 601
    .local v19, "dontcopy":Z
    if-nez v19, :cond_10a

    .line 602
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    iget-object v3, v3, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v3, v3

    array-length v8, v4

    add-int/lit8 v8, v8, 0x27

    add-int/lit8 v8, v8, 0x54

    sub-int/2addr v3, v8

    new-array v7, v3, [B

    .line 608
    :cond_10a
    const-wide/16 v5, 0x0

    .line 609
    .local v5, "offset":J
    const/4 v3, 0x1

    move/from16 v0, p4

    if-eq v0, v3, :cond_116

    const/4 v3, 0x2

    move/from16 v0, p4

    if-ne v0, v3, :cond_118

    .line 610
    :cond_116
    add-long v5, v5, v27

    .line 613
    :cond_118
    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    move/from16 v31, v0

    .line 614
    .local v31, "startid":I
    const/4 v14, 0x0

    .line 615
    .local v14, "ackcount":I
    const/4 v13, 0x0

    .line 616
    .local v13, "_s":I
    const/4 v12, 0x0

    .line 618
    .local v12, "_datalen":I
    if-nez v19, :cond_16c

    .line 619
    array-length v12, v7

    .line 627
    :goto_124
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    invoke-virtual {v3}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->size()I

    move-result v16

    .line 630
    .local v16, "bulk_requests":I
    :cond_12c
    const/16 v25, 0x0

    .line 631
    .local v25, "nread":I
    const/16 v17, 0x0

    .line 632
    .local v17, "count":I
    move/from16 v26, v13

    .line 633
    .local v26, "s":I
    move/from16 v18, v12

    .line 636
    .local v18, "datalen":I
    :cond_134
    move-object/from16 v0, p1

    move/from16 v1, v26

    move/from16 v2, v18

    invoke-virtual {v0, v7, v1, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v25

    .line 637
    if-lez v25, :cond_146

    .line 638
    add-int v26, v26, v25

    .line 639
    sub-int v18, v18, v25

    .line 640
    add-int v17, v17, v25

    .line 643
    :cond_146
    if-lez v18, :cond_14a

    if-gtz v25, :cond_134

    .line 644
    :cond_14a
    if-gtz v17, :cond_180

    .line 675
    :goto_14c
    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    sub-int v10, v3, v31

    .line 676
    .local v10, "_ackcount":I
    :goto_152
    if-le v10, v14, :cond_15f

    .line 677
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v3, v1}, Lcom/jcraft/jsch/ChannelSftp;->checkStatus([ILcom/jcraft/jsch/ChannelSftp$Header;)Z

    move-result v3

    if-nez v3, :cond_26a

    .line 682
    :cond_15f
    if-eqz p3, :cond_164

    invoke-interface/range {p3 .. p3}, Lcom/jcraft/jsch/SftpProgressMonitor;->end()V

    .line 683
    :cond_164
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v4, v1}, Lcom/jcraft/jsch/ChannelSftp;->_sendCLOSE([BLcom/jcraft/jsch/ChannelSftp$Header;)Z

    .line 691
    return-void

    .line 622
    .end local v10    # "_ackcount":I
    .end local v16    # "bulk_requests":I
    .end local v17    # "count":I
    .end local v18    # "datalen":I
    .end local v25    # "nread":I
    .end local v26    # "s":I
    :cond_16c
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    iget-object v7, v3, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .line 623
    array-length v3, v4

    add-int/lit8 v13, v3, 0x27

    .line 624
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    iget-object v3, v3, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v3, v3

    sub-int/2addr v3, v13

    add-int/lit8 v12, v3, -0x54

    goto :goto_124

    .line 646
    .restart local v16    # "bulk_requests":I
    .restart local v17    # "count":I
    .restart local v18    # "datalen":I
    .restart local v25    # "nread":I
    .restart local v26    # "s":I
    :cond_180
    move/from16 v9, v17

    .line 647
    .local v9, "foo":I
    :goto_182
    if-lez v9, :cond_250

    .line 648
    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v3, v3, -0x1

    move/from16 v0, v31

    if-eq v3, v0, :cond_199

    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    sub-int v3, v3, v31

    sub-int/2addr v3, v14

    move/from16 v0, v16

    if-lt v3, v0, :cond_246

    .line 650
    :cond_199
    :goto_199
    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    sub-int v3, v3, v31

    sub-int/2addr v3, v14

    move/from16 v0, v16

    if-lt v3, v0, :cond_246

    .line 651
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->ackid:[I

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v3, v1}, Lcom/jcraft/jsch/ChannelSftp;->checkStatus([ILcom/jcraft/jsch/ChannelSftp$Header;)Z

    move-result v3

    if-eqz v3, :cond_246

    .line 652
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->ackid:[I

    const/4 v8, 0x0

    aget v11, v3, v8

    .line 653
    .local v11, "_ackid":I
    move/from16 v0, v31

    if-gt v0, v11, :cond_1c5

    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    add-int/lit8 v3, v3, -0x1

    if-le v11, v3, :cond_207

    .line 654
    :cond_1c5
    move-object/from16 v0, p0

    iget v3, v0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    if-ne v11, v3, :cond_20a

    .line 655
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "ack error: startid="

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v33, " seq="

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    move/from16 v33, v0

    move/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v33, " _ackid="

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 661
    :cond_207
    add-int/lit8 v14, v14, 0x1

    .line 662
    goto :goto_199

    .line 658
    :cond_20a
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v8, 0x4

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "ack error: startid="

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, " seq="

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp;->seq:I

    move/from16 v34, v0

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, " _ackid="

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-direct {v3, v8, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 668
    .end local v11    # "_ackid":I
    :cond_246
    const/4 v8, 0x0

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v9}, Lcom/jcraft/jsch/ChannelSftp;->sendWRITE([BJ[BII)I

    move-result v3

    sub-int/2addr v9, v3

    goto/16 :goto_182

    .line 670
    :cond_250
    move/from16 v0, v17

    int-to-long v0, v0

    move-wide/from16 v33, v0

    add-long v5, v5, v33

    .line 671
    if-eqz p3, :cond_12c

    move/from16 v0, v17

    int-to-long v0, v0

    move-wide/from16 v33, v0

    move-object/from16 v0, p3

    move-wide/from16 v1, v33

    invoke-interface {v0, v1, v2}, Lcom/jcraft/jsch/SftpProgressMonitor;->count(J)Z
    :try_end_265
    .catch Ljava/lang/Exception; {:try_start_6e .. :try_end_265} :catch_62

    move-result v3

    if-nez v3, :cond_12c

    goto/16 :goto_14c

    .line 680
    .end local v9    # "foo":I
    .restart local v10    # "_ackcount":I
    :cond_26a
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_152

    .line 687
    .end local v4    # "handle":[B
    .end local v5    # "offset":J
    .end local v7    # "data":[B
    .end local v10    # "_ackcount":I
    .end local v12    # "_datalen":I
    .end local v13    # "_s":I
    .end local v14    # "ackcount":I
    .end local v16    # "bulk_requests":I
    .end local v17    # "count":I
    .end local v18    # "datalen":I
    .end local v19    # "dontcopy":Z
    .end local v20    # "dstb":[B
    .end local v22    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v24    # "length":I
    .end local v25    # "nread":I
    .end local v26    # "s":I
    .end local v27    # "skip":J
    .end local v31    # "startid":I
    .end local v32    # "type":I
    .restart local v21    # "e":Ljava/lang/Exception;
    :cond_26e
    move-object/from16 v0, v21

    instance-of v3, v0, Ljava/lang/Throwable;

    if-eqz v3, :cond_283

    .line 688
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v8, 0x4

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, v21

    invoke-direct {v3, v8, v0, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 689
    :cond_283
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v8, 0x4

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-direct {v3, v8, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 568
    .end local v21    # "e":Ljava/lang/Exception;
    .restart local v20    # "dstb":[B
    .restart local v27    # "skip":J
    :catch_290
    move-exception v3

    goto/16 :goto_2b
.end method

.method public cd(Ljava/lang/String;)V
    .registers 10
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x4

    .line 337
    :try_start_1
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v3, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v3}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 339
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 340
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 342
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->_realpath(Ljava/lang/String;)[B

    move-result-object v2

    .line 343
    .local v2, "str":[B
    invoke-direct {p0, v2}, Lcom/jcraft/jsch/ChannelSftp;->_stat([B)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v0

    .line 345
    .local v0, "attr":Lcom/jcraft/jsch/SftpATTRS;
    invoke-virtual {v0}, Lcom/jcraft/jsch/SftpATTRS;->getFlags()I

    move-result v3

    and-int/lit8 v3, v3, 0x4

    if-nez v3, :cond_42

    .line 346
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v4, 0x4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Can\'t change directory: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_3a} :catch_3a

    .line 356
    .end local v0    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    .end local v2    # "str":[B
    :catch_3a
    move-exception v1

    .line 357
    .local v1, "e":Ljava/lang/Exception;
    instance-of v3, v1, Lcom/jcraft/jsch/SftpException;

    if-eqz v3, :cond_6c

    check-cast v1, Lcom/jcraft/jsch/SftpException;

    .end local v1    # "e":Ljava/lang/Exception;
    throw v1

    .line 349
    .restart local v0    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    .restart local v2    # "str":[B
    :cond_42
    :try_start_42
    invoke-virtual {v0}, Lcom/jcraft/jsch/SftpATTRS;->isDir()Z

    move-result v3

    if-nez v3, :cond_62

    .line 350
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v4, 0x4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Can\'t change directory: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 354
    :cond_62
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/jcraft/jsch/ChannelSftp;->setCwd(Ljava/lang/String;)V
    :try_end_6b
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_6b} :catch_3a

    .line 362
    return-void

    .line 358
    .end local v0    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    .end local v2    # "str":[B
    .restart local v1    # "e":Ljava/lang/Exception;
    :cond_6c
    instance-of v3, v1, Ljava/lang/Throwable;

    if-eqz v3, :cond_78

    .line 359
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const-string v4, ""

    invoke-direct {v3, v7, v4, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 360
    :cond_78
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const-string v4, ""

    invoke-direct {v3, v7, v4}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3
.end method

.method public chgrp(ILjava/lang/String;)V
    .registers 12
    .param p1, "gid"    # I
    .param p2, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    .line 1993
    :try_start_1
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v6, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 1995
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1997
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v4

    .line 1998
    .local v4, "v":Ljava/util/Vector;
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v5

    .line 1999
    .local v5, "vsize":I
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_15
    if-ge v3, v5, :cond_50

    .line 2000
    invoke-virtual {v4, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    move-object v0, v6

    check-cast v0, Ljava/lang/String;

    move-object p2, v0

    .line 2002
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->_stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v1

    .line 2004
    .local v1, "attr":Lcom/jcraft/jsch/SftpATTRS;
    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Lcom/jcraft/jsch/SftpATTRS;->setFLAGS(I)V

    .line 2005
    iget v6, v1, Lcom/jcraft/jsch/SftpATTRS;->uid:I

    invoke-virtual {v1, v6, p1}, Lcom/jcraft/jsch/SftpATTRS;->setUIDGID(II)V

    .line 2006
    invoke-direct {p0, p2, v1}, Lcom/jcraft/jsch/ChannelSftp;->_setStat(Ljava/lang/String;Lcom/jcraft/jsch/SftpATTRS;)V
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_31} :catch_34

    .line 1999
    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    .line 2009
    .end local v1    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    .end local v3    # "j":I
    .end local v4    # "v":Ljava/util/Vector;
    .end local v5    # "vsize":I
    :catch_34
    move-exception v2

    .line 2010
    .local v2, "e":Ljava/lang/Exception;
    instance-of v6, v2, Lcom/jcraft/jsch/SftpException;

    if-eqz v6, :cond_3c

    check-cast v2, Lcom/jcraft/jsch/SftpException;

    .end local v2    # "e":Ljava/lang/Exception;
    throw v2

    .line 2011
    .restart local v2    # "e":Ljava/lang/Exception;
    :cond_3c
    instance-of v6, v2, Ljava/lang/Throwable;

    if-eqz v6, :cond_48

    .line 2012
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v8, v7, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 2013
    :cond_48
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v8, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6

    .line 2015
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v3    # "j":I
    .restart local v4    # "v":Ljava/util/Vector;
    .restart local v5    # "vsize":I
    :cond_50
    return-void
.end method

.method public chmod(ILjava/lang/String;)V
    .registers 12
    .param p1, "permissions"    # I
    .param p2, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    .line 2045
    :try_start_1
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v6, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 2047
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 2049
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v4

    .line 2050
    .local v4, "v":Ljava/util/Vector;
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v5

    .line 2051
    .local v5, "vsize":I
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_15
    if-ge v3, v5, :cond_4e

    .line 2052
    invoke-virtual {v4, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    move-object v0, v6

    check-cast v0, Ljava/lang/String;

    move-object p2, v0

    .line 2054
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->_stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v1

    .line 2056
    .local v1, "attr":Lcom/jcraft/jsch/SftpATTRS;
    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Lcom/jcraft/jsch/SftpATTRS;->setFLAGS(I)V

    .line 2057
    invoke-virtual {v1, p1}, Lcom/jcraft/jsch/SftpATTRS;->setPERMISSIONS(I)V

    .line 2058
    invoke-direct {p0, p2, v1}, Lcom/jcraft/jsch/ChannelSftp;->_setStat(Ljava/lang/String;Lcom/jcraft/jsch/SftpATTRS;)V
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_2f} :catch_32

    .line 2051
    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    .line 2061
    .end local v1    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    .end local v3    # "j":I
    .end local v4    # "v":Ljava/util/Vector;
    .end local v5    # "vsize":I
    :catch_32
    move-exception v2

    .line 2062
    .local v2, "e":Ljava/lang/Exception;
    instance-of v6, v2, Lcom/jcraft/jsch/SftpException;

    if-eqz v6, :cond_3a

    check-cast v2, Lcom/jcraft/jsch/SftpException;

    .end local v2    # "e":Ljava/lang/Exception;
    throw v2

    .line 2063
    .restart local v2    # "e":Ljava/lang/Exception;
    :cond_3a
    instance-of v6, v2, Ljava/lang/Throwable;

    if-eqz v6, :cond_46

    .line 2064
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v8, v7, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 2065
    :cond_46
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v8, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6

    .line 2067
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v3    # "j":I
    .restart local v4    # "v":Ljava/util/Vector;
    .restart local v5    # "vsize":I
    :cond_4e
    return-void
.end method

.method public chown(ILjava/lang/String;)V
    .registers 12
    .param p1, "uid"    # I
    .param p2, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    .line 2019
    :try_start_1
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v6, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 2021
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 2023
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v4

    .line 2024
    .local v4, "v":Ljava/util/Vector;
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v5

    .line 2025
    .local v5, "vsize":I
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_15
    if-ge v3, v5, :cond_50

    .line 2026
    invoke-virtual {v4, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    move-object v0, v6

    check-cast v0, Ljava/lang/String;

    move-object p2, v0

    .line 2028
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->_stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v1

    .line 2030
    .local v1, "attr":Lcom/jcraft/jsch/SftpATTRS;
    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Lcom/jcraft/jsch/SftpATTRS;->setFLAGS(I)V

    .line 2031
    iget v6, v1, Lcom/jcraft/jsch/SftpATTRS;->gid:I

    invoke-virtual {v1, p1, v6}, Lcom/jcraft/jsch/SftpATTRS;->setUIDGID(II)V

    .line 2032
    invoke-direct {p0, p2, v1}, Lcom/jcraft/jsch/ChannelSftp;->_setStat(Ljava/lang/String;Lcom/jcraft/jsch/SftpATTRS;)V
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_31} :catch_34

    .line 2025
    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    .line 2035
    .end local v1    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    .end local v3    # "j":I
    .end local v4    # "v":Ljava/util/Vector;
    .end local v5    # "vsize":I
    :catch_34
    move-exception v2

    .line 2036
    .local v2, "e":Ljava/lang/Exception;
    instance-of v6, v2, Lcom/jcraft/jsch/SftpException;

    if-eqz v6, :cond_3c

    check-cast v2, Lcom/jcraft/jsch/SftpException;

    .end local v2    # "e":Ljava/lang/Exception;
    throw v2

    .line 2037
    .restart local v2    # "e":Ljava/lang/Exception;
    :cond_3c
    instance-of v6, v2, Ljava/lang/Throwable;

    if-eqz v6, :cond_48

    .line 2038
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v8, v7, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 2039
    :cond_48
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v8, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6

    .line 2041
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v3    # "j":I
    .restart local v4    # "v":Ljava/util/Vector;
    .restart local v5    # "vsize":I
    :cond_50
    return-void
.end method

.method public disconnect()V
    .registers 1

    .prologue
    .line 2858
    invoke-super {p0}, Lcom/jcraft/jsch/ChannelSession;->disconnect()V

    .line 2859
    return-void
.end method

.method public exit()V
    .registers 1

    .prologue
    .line 321
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->disconnect()V

    return-void
.end method

.method public get(Ljava/lang/String;)Ljava/io/InputStream;
    .registers 5
    .param p1, "src"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 1266
    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->get(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;J)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/String;I)Ljava/io/InputStream;
    .registers 6
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 1276
    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->get(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;J)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;)Ljava/io/InputStream;
    .registers 5
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "monitor"    # Lcom/jcraft/jsch/SftpProgressMonitor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 1269
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->get(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;J)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)Ljava/io/InputStream;
    .registers 6
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "monitor"    # Lcom/jcraft/jsch/SftpProgressMonitor;
    .param p3, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 1282
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->get(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;J)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;J)Ljava/io/InputStream;
    .registers 18
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "monitor"    # Lcom/jcraft/jsch/SftpProgressMonitor;
    .param p3, "skip"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 1287
    :try_start_0
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v1, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 1289
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1290
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1292
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v11

    .line 1294
    .local v11, "srcb":[B
    invoke-direct {p0, v11}, Lcom/jcraft/jsch/ChannelSftp;->_stat([B)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v6

    .line 1295
    .local v6, "attr":Lcom/jcraft/jsch/SftpATTRS;
    if-eqz p2, :cond_27

    .line 1296
    const/4 v1, 0x1

    const-string v3, "??"

    invoke-virtual {v6}, Lcom/jcraft/jsch/SftpATTRS;->getSize()J

    move-result-wide v4

    move-object v0, p2

    move-object v2, p1

    invoke-interface/range {v0 .. v5}, Lcom/jcraft/jsch/SftpProgressMonitor;->init(ILjava/lang/String;Ljava/lang/String;J)V

    .line 1299
    :cond_27
    invoke-direct {p0, v11}, Lcom/jcraft/jsch/ChannelSftp;->sendOPENR([B)V

    .line 1301
    new-instance v8, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v8, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 1302
    .local v8, "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v1, v8}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v8

    .line 1303
    iget v10, v8, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 1304
    .local v10, "length":I
    iget v12, v8, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 1306
    .local v12, "type":I
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v1, v10}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1308
    const/16 v1, 0x65

    if-eq v12, v1, :cond_57

    const/16 v1, 0x66

    if-eq v12, v1, :cond_57

    .line 1309
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const/4 v2, 0x4

    const-string v3, ""

    invoke-direct {v1, v2, v3}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1
    :try_end_4f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_4f} :catch_4f

    .line 1510
    .end local v6    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    .end local v8    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v10    # "length":I
    .end local v11    # "srcb":[B
    .end local v12    # "type":I
    :catch_4f
    move-exception v7

    .line 1511
    .local v7, "e":Ljava/lang/Exception;
    instance-of v1, v7, Lcom/jcraft/jsch/SftpException;

    if-eqz v1, :cond_7b

    check-cast v7, Lcom/jcraft/jsch/SftpException;

    .end local v7    # "e":Ljava/lang/Exception;
    throw v7

    .line 1311
    .restart local v6    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    .restart local v8    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v10    # "length":I
    .restart local v11    # "srcb":[B
    .restart local v12    # "type":I
    :cond_57
    const/16 v1, 0x65

    if-ne v12, v1, :cond_66

    .line 1312
    :try_start_5b
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v9

    .line 1313
    .local v9, "i":I
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v1, v9}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 1316
    .end local v9    # "i":I
    :cond_66
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v5

    .line 1318
    .local v5, "handle":[B
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    invoke-virtual {v1}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->init()V

    .line 1320
    new-instance v0, Lcom/jcraft/jsch/ChannelSftp$2;

    move-object v1, p0

    move-wide/from16 v2, p3

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/jcraft/jsch/ChannelSftp$2;-><init>(Lcom/jcraft/jsch/ChannelSftp;JLcom/jcraft/jsch/SftpProgressMonitor;[B)V
    :try_end_7a
    .catch Ljava/lang/Exception; {:try_start_5b .. :try_end_7a} :catch_4f

    .line 1508
    .local v0, "in":Ljava/io/InputStream;
    return-object v0

    .line 1512
    .end local v0    # "in":Ljava/io/InputStream;
    .end local v5    # "handle":[B
    .end local v6    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    .end local v8    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v10    # "length":I
    .end local v11    # "srcb":[B
    .end local v12    # "type":I
    .restart local v7    # "e":Ljava/lang/Exception;
    :cond_7b
    instance-of v1, v7, Ljava/lang/Throwable;

    if-eqz v1, :cond_88

    .line 1513
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const/4 v2, 0x4

    const-string v3, ""

    invoke-direct {v1, v2, v3, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 1514
    :cond_88
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const/4 v2, 0x4

    const-string v3, ""

    invoke-direct {v1, v2, v3}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1
.end method

.method public get(Ljava/lang/String;Ljava/io/OutputStream;)V
    .registers 10
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "dst"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 984
    const/4 v3, 0x0

    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v6}, Lcom/jcraft/jsch/ChannelSftp;->get(Ljava/lang/String;Ljava/io/OutputStream;Lcom/jcraft/jsch/SftpProgressMonitor;IJ)V

    .line 985
    return-void
.end method

.method public get(Ljava/lang/String;Ljava/io/OutputStream;Lcom/jcraft/jsch/SftpProgressMonitor;)V
    .registers 11
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "dst"    # Ljava/io/OutputStream;
    .param p3, "monitor"    # Lcom/jcraft/jsch/SftpProgressMonitor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 988
    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-virtual/range {v0 .. v6}, Lcom/jcraft/jsch/ChannelSftp;->get(Ljava/lang/String;Ljava/io/OutputStream;Lcom/jcraft/jsch/SftpProgressMonitor;IJ)V

    .line 989
    return-void
.end method

.method public get(Ljava/lang/String;Ljava/io/OutputStream;Lcom/jcraft/jsch/SftpProgressMonitor;IJ)V
    .registers 15
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "dst"    # Ljava/io/OutputStream;
    .param p3, "monitor"    # Lcom/jcraft/jsch/SftpProgressMonitor;
    .param p4, "mode"    # I
    .param p5, "skip"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 994
    :try_start_0
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v0}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 996
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 997
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 999
    if-eqz p3, :cond_27

    .line 1000
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->_stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v6

    .line 1001
    .local v6, "attr":Lcom/jcraft/jsch/SftpATTRS;
    const/4 v1, 0x1

    const-string v3, "??"

    invoke-virtual {v6}, Lcom/jcraft/jsch/SftpATTRS;->getSize()J

    move-result-wide v4

    move-object v0, p3

    move-object v2, p1

    invoke-interface/range {v0 .. v5}, Lcom/jcraft/jsch/SftpProgressMonitor;->init(ILjava/lang/String;Ljava/lang/String;J)V

    .line 1002
    const/4 v0, 0x1

    if-ne p4, v0, :cond_27

    .line 1003
    invoke-interface {p3, p5, p6}, Lcom/jcraft/jsch/SftpProgressMonitor;->count(J)Z

    .line 1006
    .end local v6    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    :cond_27
    invoke-direct/range {p0 .. p6}, Lcom/jcraft/jsch/ChannelSftp;->_get(Ljava/lang/String;Ljava/io/OutputStream;Lcom/jcraft/jsch/SftpProgressMonitor;IJ)V
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2a} :catch_2b

    .line 1014
    return-void

    .line 1008
    :catch_2b
    move-exception v7

    .line 1009
    .local v7, "e":Ljava/lang/Exception;
    instance-of v0, v7, Lcom/jcraft/jsch/SftpException;

    if-eqz v0, :cond_33

    check-cast v7, Lcom/jcraft/jsch/SftpException;

    .end local v7    # "e":Ljava/lang/Exception;
    throw v7

    .line 1010
    .restart local v7    # "e":Ljava/lang/Exception;
    :cond_33
    instance-of v0, v7, Ljava/lang/Throwable;

    if-eqz v0, :cond_40

    .line 1011
    new-instance v0, Lcom/jcraft/jsch/SftpException;

    const/4 v1, 0x4

    const-string v2, ""

    invoke-direct {v0, v1, v2, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 1012
    :cond_40
    new-instance v0, Lcom/jcraft/jsch/SftpException;

    const/4 v1, 0x4

    const-string v2, ""

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v0
.end method

.method public get(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "dst"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 873
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->get(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V

    .line 874
    return-void
.end method

.method public get(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;)V
    .registers 5
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "dst"    # Ljava/lang/String;
    .param p3, "monitor"    # Lcom/jcraft/jsch/SftpProgressMonitor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 877
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/jcraft/jsch/ChannelSftp;->get(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V

    .line 878
    return-void
.end method

.method public get(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V
    .registers 34
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "dst"    # Ljava/lang/String;
    .param p3, "monitor"    # Lcom/jcraft/jsch/SftpProgressMonitor;
    .param p4, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 883
    const/4 v13, 0x0

    .line 884
    .local v13, "_dstExist":Z
    const/4 v5, 0x0

    .line 886
    .local v5, "_dst":Ljava/lang/String;
    :try_start_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v2, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v2}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 888
    invoke-direct/range {p0 .. p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 889
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->localAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 891
    invoke-direct/range {p0 .. p1}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v27

    .line 892
    .local v27, "v":Ljava/util/Vector;
    invoke-virtual/range {v27 .. v27}, Ljava/util/Vector;->size()I

    move-result v28

    .line 893
    .local v28, "vsize":I
    if-nez v28, :cond_50

    .line 894
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const/4 v3, 0x2

    const-string v6, "No such file"

    invoke-direct {v2, v3, v6}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v2
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2a} :catch_2a

    .line 970
    .end local v27    # "v":Ljava/util/Vector;
    .end local v28    # "vsize":I
    :catch_2a
    move-exception v18

    .line 971
    .local v18, "e":Ljava/lang/Exception;
    if-nez v13, :cond_47

    if-eqz v5, :cond_47

    .line 972
    new-instance v14, Ljava/io/File;

    invoke-direct {v14, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 973
    .local v14, "_dstFile":Ljava/io/File;
    invoke-virtual {v14}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_47

    invoke-virtual {v14}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/16 v6, 0x0

    cmp-long v2, v2, v6

    if-nez v2, :cond_47

    .line 974
    invoke-virtual {v14}, Ljava/io/File;->delete()Z

    .line 977
    .end local v14    # "_dstFile":Ljava/io/File;
    :cond_47
    move-object/from16 v0, v18

    instance-of v2, v0, Lcom/jcraft/jsch/SftpException;

    if-eqz v2, :cond_193

    check-cast v18, Lcom/jcraft/jsch/SftpException;

    .end local v18    # "e":Ljava/lang/Exception;
    throw v18

    .line 897
    .restart local v27    # "v":Ljava/util/Vector;
    .restart local v28    # "vsize":I
    :cond_50
    :try_start_50
    new-instance v16, Ljava/io/File;

    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 898
    .local v16, "dstFile":Ljava/io/File;
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->isDirectory()Z

    move-result v21

    .line 899
    .local v21, "isDstDir":Z
    const/16 v17, 0x0

    .line 900
    .local v17, "dstsb":Ljava/lang/StringBuffer;
    if-eqz v21, :cond_c5

    .line 901
    sget-object v2, Lcom/jcraft/jsch/ChannelSftp;->file_separator:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_80

    .line 902
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/jcraft/jsch/ChannelSftp;->file_separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 904
    :cond_80
    new-instance v17, Ljava/lang/StringBuffer;

    .end local v17    # "dstsb":Ljava/lang/StringBuffer;
    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 911
    .restart local v17    # "dstsb":Ljava/lang/StringBuffer;
    :cond_89
    const/16 v22, 0x0

    .local v22, "j":I
    :goto_8b
    move/from16 v0, v22

    move/from16 v1, v28

    if-ge v0, v1, :cond_13a

    .line 912
    move-object/from16 v0, v27

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    move-object v0, v2

    check-cast v0, Ljava/lang/String;

    move-object v4, v0

    .line 913
    .local v4, "_src":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/jcraft/jsch/ChannelSftp;->_stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v15

    .line 914
    .local v15, "attr":Lcom/jcraft/jsch/SftpATTRS;
    invoke-virtual {v15}, Lcom/jcraft/jsch/SftpATTRS;->isDir()Z

    move-result v2

    if-eqz v2, :cond_d3

    .line 915
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const/4 v3, 0x4

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "not supported to get directory "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v3, v6}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v2

    .line 906
    .end local v4    # "_src":Ljava/lang/String;
    .end local v15    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    .end local v22    # "j":I
    :cond_c5
    const/4 v2, 0x1

    move/from16 v0, v28

    if-le v0, v2, :cond_89

    .line 907
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const/4 v3, 0x4

    const-string v6, "Copying multiple files, but destination is missing or a file."

    invoke-direct {v2, v3, v6}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v2

    .line 919
    .restart local v4    # "_src":Ljava/lang/String;
    .restart local v15    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    .restart local v22    # "j":I
    :cond_d3
    const/4 v5, 0x0

    .line 920
    if-eqz v21, :cond_133

    .line 921
    const/16 v2, 0x2f

    invoke-virtual {v4, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v20

    .line 922
    .local v20, "i":I
    const/4 v2, -0x1

    move/from16 v0, v20

    if-ne v0, v2, :cond_127

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 924
    :goto_e6
    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 925
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuffer;->delete(II)Ljava/lang/StringBuffer;

    .line 931
    .end local v20    # "i":I
    :goto_f7
    new-instance v14, Ljava/io/File;

    invoke-direct {v14, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 932
    .restart local v14    # "_dstFile":Ljava/io/File;
    const/4 v2, 0x1

    move/from16 v0, p4

    if-ne v0, v2, :cond_13b

    .line 933
    invoke-virtual {v15}, Lcom/jcraft/jsch/SftpATTRS;->getSize()J

    move-result-wide v25

    .line 934
    .local v25, "size_of_src":J
    invoke-virtual {v14}, Ljava/io/File;->length()J

    move-result-wide v23

    .line 935
    .local v23, "size_of_dst":J
    cmp-long v2, v23, v25

    if-lez v2, :cond_136

    .line 936
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const/4 v3, 0x4

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "failed to resume for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v3, v6}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v2

    .line 923
    .end local v14    # "_dstFile":Ljava/io/File;
    .end local v23    # "size_of_dst":J
    .end local v25    # "size_of_src":J
    .restart local v20    # "i":I
    :cond_127
    add-int/lit8 v2, v20, 0x1

    invoke-virtual {v4, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_e6

    .line 928
    .end local v20    # "i":I
    :cond_133
    move-object/from16 v5, p2

    goto :goto_f7

    .line 939
    .restart local v14    # "_dstFile":Ljava/io/File;
    .restart local v23    # "size_of_dst":J
    .restart local v25    # "size_of_src":J
    :cond_136
    cmp-long v2, v23, v25

    if-nez v2, :cond_13b

    .line 982
    .end local v4    # "_src":Ljava/lang/String;
    .end local v14    # "_dstFile":Ljava/io/File;
    .end local v15    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    .end local v23    # "size_of_dst":J
    .end local v25    # "size_of_src":J
    :cond_13a
    return-void

    .line 944
    .restart local v4    # "_src":Ljava/lang/String;
    .restart local v14    # "_dstFile":Ljava/io/File;
    .restart local v15    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    :cond_13b
    if-eqz p3, :cond_155

    .line 945
    const/4 v3, 0x1

    invoke-virtual {v15}, Lcom/jcraft/jsch/SftpATTRS;->getSize()J

    move-result-wide v6

    move-object/from16 v2, p3

    invoke-interface/range {v2 .. v7}, Lcom/jcraft/jsch/SftpProgressMonitor;->init(ILjava/lang/String;Ljava/lang/String;J)V

    .line 946
    const/4 v2, 0x1

    move/from16 v0, p4

    if-ne v0, v2, :cond_155

    .line 947
    invoke-virtual {v14}, Ljava/io/File;->length()J

    move-result-wide v2

    move-object/from16 v0, p3

    invoke-interface {v0, v2, v3}, Lcom/jcraft/jsch/SftpProgressMonitor;->count(J)Z

    .line 951
    :cond_155
    const/4 v8, 0x0

    .line 952
    .local v8, "fos":Ljava/io/FileOutputStream;
    invoke-virtual {v14}, Ljava/io/File;->exists()Z
    :try_end_159
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_159} :catch_2a

    move-result v13

    .line 954
    if-nez p4, :cond_181

    .line 955
    :try_start_15c
    new-instance v19, Ljava/io/FileOutputStream;

    move-object/from16 v0, v19

    invoke-direct {v0, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .local v19, "fos":Ljava/io/FileOutputStream;
    move-object/from16 v8, v19

    .line 961
    .end local v19    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    :goto_165
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v11

    move-object/from16 v6, p0

    move-object v7, v4

    move-object/from16 v9, p3

    move/from16 v10, p4

    invoke-direct/range {v6 .. v12}, Lcom/jcraft/jsch/ChannelSftp;->_get(Ljava/lang/String;Ljava/io/OutputStream;Lcom/jcraft/jsch/SftpProgressMonitor;IJ)V
    :try_end_178
    .catchall {:try_start_15c .. :try_end_178} :catchall_18c

    .line 964
    if-eqz v8, :cond_17d

    .line 965
    :try_start_17a
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V
    :try_end_17d
    .catch Ljava/lang/Exception; {:try_start_17a .. :try_end_17d} :catch_2a

    .line 911
    :cond_17d
    add-int/lit8 v22, v22, 0x1

    goto/16 :goto_8b

    .line 958
    :cond_181
    :try_start_181
    new-instance v19, Ljava/io/FileOutputStream;

    const/4 v2, 0x1

    move-object/from16 v0, v19

    invoke-direct {v0, v5, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V
    :try_end_189
    .catchall {:try_start_181 .. :try_end_189} :catchall_18c

    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .restart local v19    # "fos":Ljava/io/FileOutputStream;
    move-object/from16 v8, v19

    .end local v19    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos":Ljava/io/FileOutputStream;
    goto :goto_165

    .line 964
    :catchall_18c
    move-exception v2

    if-eqz v8, :cond_192

    .line 965
    :try_start_18f
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    :cond_192
    throw v2
    :try_end_193
    .catch Ljava/lang/Exception; {:try_start_18f .. :try_end_193} :catch_2a

    .line 978
    .end local v4    # "_src":Ljava/lang/String;
    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .end local v14    # "_dstFile":Ljava/io/File;
    .end local v15    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    .end local v16    # "dstFile":Ljava/io/File;
    .end local v17    # "dstsb":Ljava/lang/StringBuffer;
    .end local v21    # "isDstDir":Z
    .end local v22    # "j":I
    .end local v27    # "v":Ljava/util/Vector;
    .end local v28    # "vsize":I
    .restart local v18    # "e":Ljava/lang/Exception;
    :cond_193
    move-object/from16 v0, v18

    instance-of v2, v0, Ljava/lang/Throwable;

    if-eqz v2, :cond_1a4

    .line 979
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const/4 v3, 0x4

    const-string v6, ""

    move-object/from16 v0, v18

    invoke-direct {v2, v3, v6, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 980
    :cond_1a4
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const/4 v3, 0x4

    const-string v6, ""

    invoke-direct {v2, v3, v6}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v2
.end method

.method public getBulkRequests()I
    .registers 2

    .prologue
    .line 209
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->size()I

    move-result v0

    return v0
.end method

.method public getExtension(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 2965
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    if-nez v0, :cond_6

    .line 2966
    const/4 v0, 0x0

    .line 2967
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_5
.end method

.method public getHome()Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x4

    .line 2406
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->home:Ljava/lang/String;

    if-nez v2, :cond_1a

    .line 2408
    :try_start_5
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v2, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v2}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 2410
    const-string v2, ""

    invoke-direct {p0, v2}, Lcom/jcraft/jsch/ChannelSftp;->_realpath(Ljava/lang/String;)[B

    move-result-object v0

    .line 2411
    .local v0, "_home":[B
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->home:Ljava/lang/String;
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_1a} :catch_1d

    .line 2420
    .end local v0    # "_home":[B
    :cond_1a
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->home:Ljava/lang/String;

    return-object v2

    .line 2413
    :catch_1d
    move-exception v1

    .line 2414
    .local v1, "e":Ljava/lang/Exception;
    instance-of v2, v1, Lcom/jcraft/jsch/SftpException;

    if-eqz v2, :cond_25

    check-cast v1, Lcom/jcraft/jsch/SftpException;

    .end local v1    # "e":Ljava/lang/Exception;
    throw v1

    .line 2415
    .restart local v1    # "e":Ljava/lang/Exception;
    :cond_25
    instance-of v2, v1, Ljava/lang/Throwable;

    if-eqz v2, :cond_31

    .line 2416
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const-string v3, ""

    invoke-direct {v2, v4, v3, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 2417
    :cond_31
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const-string v3, ""

    invoke-direct {v2, v4, v3}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v2
.end method

.method public getServerVersion()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 2944
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->isConnected()Z

    move-result v0

    if-nez v0, :cond_f

    .line 2945
    new-instance v0, Lcom/jcraft/jsch/SftpException;

    const/4 v1, 0x4

    const-string v2, "The channel is not connected."

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v0

    .line 2947
    :cond_f
    iget v0, p0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    return v0
.end method

.method public hardlink(Ljava/lang/String;Ljava/lang/String;)V
    .registers 14
    .param p1, "oldpath"    # Ljava/lang/String;
    .param p2, "newpath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v10, 0x4

    .line 1828
    iget-boolean v7, p0, Lcom/jcraft/jsch/ChannelSftp;->extension_hardlink:Z

    if-nez v7, :cond_10

    .line 1829
    new-instance v7, Lcom/jcraft/jsch/SftpException;

    const/16 v8, 0x8

    const-string v9, "hardlink@openssh.com is not supported"

    invoke-direct {v7, v8, v9}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v7

    .line 1834
    :cond_10
    :try_start_10
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v7, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v7}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 1836
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1837
    .local v0, "_oldpath":Ljava/lang/String;
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1839
    invoke-direct {p0, v0}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1840
    const/4 v7, 0x0

    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v9, 0x2f

    if-eq v7, v9, :cond_59

    .line 1841
    invoke-direct {p0}, Lcom/jcraft/jsch/ChannelSftp;->getCwd()Ljava/lang/String;

    move-result-object v1

    .line 1842
    .local v1, "cwd":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v9

    const-string v7, "/"

    invoke-virtual {v1, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_57

    move v7, v8

    :goto_3d
    add-int/2addr v7, v9

    invoke-virtual {v0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 1848
    .end local v1    # "cwd":Ljava/lang/String;
    :goto_42
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->isPattern(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5b

    .line 1849
    new-instance v7, Lcom/jcraft/jsch/SftpException;

    const/4 v8, 0x4

    invoke-direct {v7, v8, p2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v7
    :try_end_4f
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_4f} :catch_4f

    .line 1871
    .end local v0    # "_oldpath":Ljava/lang/String;
    :catch_4f
    move-exception v2

    .line 1872
    .local v2, "e":Ljava/lang/Exception;
    instance-of v7, v2, Lcom/jcraft/jsch/SftpException;

    if-eqz v7, :cond_9e

    check-cast v2, Lcom/jcraft/jsch/SftpException;

    .end local v2    # "e":Ljava/lang/Exception;
    throw v2

    .line 1842
    .restart local v0    # "_oldpath":Ljava/lang/String;
    .restart local v1    # "cwd":Ljava/lang/String;
    :cond_57
    const/4 v7, 0x1

    goto :goto_3d

    .line 1845
    .end local v1    # "cwd":Ljava/lang/String;
    :cond_59
    move-object p1, v0

    goto :goto_42

    .line 1851
    :cond_5b
    :try_start_5b
    invoke-static {p2}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1853
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v7

    iget-object v8, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p2, v8}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v8

    invoke-direct {p0, v7, v8}, Lcom/jcraft/jsch/ChannelSftp;->sendHARDLINK([B[B)V

    .line 1856
    new-instance v3, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v3, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 1857
    .local v3, "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v7, v3}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v3

    .line 1858
    iget v5, v3, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 1859
    .local v5, "length":I
    iget v6, v3, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 1861
    .local v6, "type":I
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v7, v5}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1863
    const/16 v7, 0x65

    if-eq v6, v7, :cond_8f

    .line 1864
    new-instance v7, Lcom/jcraft/jsch/SftpException;

    const/4 v8, 0x4

    const-string v9, ""

    invoke-direct {v7, v8, v9}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v7

    .line 1867
    :cond_8f
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v7}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v4

    .line 1868
    .local v4, "i":I
    if-nez v4, :cond_98

    .line 1877
    :goto_97
    return-void

    .line 1869
    :cond_98
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v7, v4}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V
    :try_end_9d
    .catch Ljava/lang/Exception; {:try_start_5b .. :try_end_9d} :catch_4f

    goto :goto_97

    .line 1873
    .end local v0    # "_oldpath":Ljava/lang/String;
    .end local v3    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v4    # "i":I
    .end local v5    # "length":I
    .end local v6    # "type":I
    .restart local v2    # "e":Ljava/lang/Exception;
    :cond_9e
    instance-of v7, v2, Ljava/lang/Throwable;

    if-eqz v7, :cond_aa

    .line 1874
    new-instance v7, Lcom/jcraft/jsch/SftpException;

    const-string v8, ""

    invoke-direct {v7, v10, v8, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 1875
    :cond_aa
    new-instance v7, Lcom/jcraft/jsch/SftpException;

    const-string v8, ""

    invoke-direct {v7, v10, v8}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v7
.end method

.method init()V
    .registers 1

    .prologue
    .line 220
    return-void
.end method

.method public lcd(Ljava/lang/String;)V
    .registers 5
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 323
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->localAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 324
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 326
    :try_start_f
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_17} :catch_24

    move-result-object p1

    .line 329
    :goto_18
    iput-object p1, p0, Lcom/jcraft/jsch/ChannelSftp;->lcwd:Ljava/lang/String;

    .line 330
    return-void

    .line 332
    :cond_1b
    new-instance v0, Lcom/jcraft/jsch/SftpException;

    const/4 v1, 0x2

    const-string v2, "No such directory"

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v0

    .line 328
    :catch_24
    move-exception v0

    goto :goto_18
.end method

.method public lpwd()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2403
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->lcwd:Ljava/lang/String;

    return-object v0
.end method

.method public ls(Ljava/lang/String;)Ljava/util/Vector;
    .registers 4
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 1519
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    .line 1520
    .local v1, "v":Ljava/util/Vector;
    new-instance v0, Lcom/jcraft/jsch/ChannelSftp$3;

    invoke-direct {v0, p0, v1}, Lcom/jcraft/jsch/ChannelSftp$3;-><init>(Lcom/jcraft/jsch/ChannelSftp;Ljava/util/Vector;)V

    .line 1526
    .local v0, "selector":Lcom/jcraft/jsch/ChannelSftp$LsEntrySelector;
    invoke-virtual {p0, p1, v0}, Lcom/jcraft/jsch/ChannelSftp;->ls(Ljava/lang/String;Lcom/jcraft/jsch/ChannelSftp$LsEntrySelector;)V

    .line 1527
    return-object v1
.end method

.method public ls(Ljava/lang/String;Lcom/jcraft/jsch/ChannelSftp$LsEntrySelector;)V
    .registers 35
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "selector"    # Lcom/jcraft/jsch/ChannelSftp$LsEntrySelector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 1543
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    move-object/from16 v29, v0

    check-cast v29, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual/range {v29 .. v29}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 1545
    invoke-direct/range {p0 .. p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1546
    const/16 v24, 0x0

    .line 1547
    .local v24, "pattern":[B
    new-instance v28, Ljava/util/Vector;

    invoke-direct/range {v28 .. v28}, Ljava/util/Vector;-><init>()V

    .line 1549
    .local v28, "v":Ljava/util/Vector;
    const/16 v29, 0x2f

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v16

    .line 1550
    .local v16, "foo":I
    const/16 v30, 0x0

    if-nez v16, :cond_bb

    const/16 v29, 0x1

    :goto_26
    move-object/from16 v0, p1

    move/from16 v1, v30

    move/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    .line 1551
    .local v11, "dir":Ljava/lang/String;
    add-int/lit8 v29, v16, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 1552
    .local v5, "_pattern":Ljava/lang/String;
    invoke-static {v11}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 1556
    const/16 v29, 0x1

    move/from16 v0, v29

    new-array v6, v0, [[B

    .line 1557
    .local v6, "_pattern_utf8":[[B
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v6}, Lcom/jcraft/jsch/ChannelSftp;->isPattern(Ljava/lang/String;[[B)Z

    move-result v25

    .line 1559
    .local v25, "pattern_has_wildcard":Z
    if-eqz v25, :cond_bf

    .line 1560
    const/16 v29, 0x0

    aget-object v24, v6, v29

    .line 1592
    :goto_50
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    invoke-static {v11, v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v29

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->sendOPENDIR([B)V

    .line 1594
    new-instance v18, Lcom/jcraft/jsch/ChannelSftp$Header;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 1595
    .local v18, "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v18

    .line 1596
    move-object/from16 v0, v18

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    move/from16 v22, v0

    .line 1597
    .local v22, "length":I
    move-object/from16 v0, v18

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    move/from16 v26, v0

    .line 1599
    .local v26, "type":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1601
    const/16 v29, 0x65

    move/from16 v0, v26

    move/from16 v1, v29

    if-eq v0, v1, :cond_fb

    const/16 v29, 0x66

    move/from16 v0, v26

    move/from16 v1, v29

    if-eq v0, v1, :cond_fb

    .line 1602
    new-instance v29, Lcom/jcraft/jsch/SftpException;

    const/16 v30, 0x4

    const-string v31, ""

    invoke-direct/range {v29 .. v31}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v29
    :try_end_b1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_b1} :catch_b1

    .line 1717
    .end local v5    # "_pattern":Ljava/lang/String;
    .end local v6    # "_pattern_utf8":[[B
    .end local v11    # "dir":Ljava/lang/String;
    .end local v16    # "foo":I
    .end local v18    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v22    # "length":I
    .end local v24    # "pattern":[B
    .end local v25    # "pattern_has_wildcard":Z
    .end local v26    # "type":I
    .end local v28    # "v":Ljava/util/Vector;
    :catch_b1
    move-exception v12

    .line 1718
    .local v12, "e":Ljava/lang/Exception;
    instance-of v0, v12, Lcom/jcraft/jsch/SftpException;

    move/from16 v29, v0

    if-eqz v29, :cond_331

    check-cast v12, Lcom/jcraft/jsch/SftpException;

    .end local v12    # "e":Ljava/lang/Exception;
    throw v12

    .restart local v16    # "foo":I
    .restart local v24    # "pattern":[B
    .restart local v28    # "v":Ljava/util/Vector;
    :cond_bb
    move/from16 v29, v16

    .line 1550
    goto/16 :goto_26

    .line 1563
    .restart local v5    # "_pattern":Ljava/lang/String;
    .restart local v6    # "_pattern_utf8":[[B
    .restart local v11    # "dir":Ljava/lang/String;
    .restart local v25    # "pattern_has_wildcard":Z
    :cond_bf
    :try_start_bf
    invoke-static/range {p1 .. p1}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .line 1565
    .local v27, "upath":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->_stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v7

    .line 1566
    .local v7, "attr":Lcom/jcraft/jsch/SftpATTRS;
    invoke-virtual {v7}, Lcom/jcraft/jsch/SftpATTRS;->isDir()Z

    move-result v29

    if-eqz v29, :cond_d7

    .line 1567
    const/16 v24, 0x0

    .line 1568
    move-object/from16 v11, v27

    goto/16 :goto_50

    .line 1580
    :cond_d7
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding_is_utf8:Z

    move/from16 v29, v0

    if-eqz v29, :cond_e9

    .line 1581
    const/16 v29, 0x0

    aget-object v24, v6, v29

    .line 1582
    invoke-static/range {v24 .. v24}, Lcom/jcraft/jsch/Util;->unquote([B)[B

    move-result-object v24

    goto/16 :goto_50

    .line 1585
    :cond_e9
    invoke-static {v5}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1586
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    invoke-static {v5, v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v24

    goto/16 :goto_50

    .line 1604
    .end local v7    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    .end local v27    # "upath":Ljava/lang/String;
    .restart local v18    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v22    # "length":I
    .restart local v26    # "type":I
    :cond_fb
    const/16 v29, 0x65

    move/from16 v0, v26

    move/from16 v1, v29

    if-ne v0, v1, :cond_11c

    .line 1605
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v19

    .line 1606
    .local v19, "i":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 1609
    .end local v19    # "i":I
    :cond_11c
    const/4 v9, 0x0

    .line 1610
    .local v9, "cancel":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v17

    .line 1612
    .local v17, "handle":[B
    :cond_127
    if-nez v9, :cond_18f

    .line 1614
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->sendREADDIR([B)V

    .line 1616
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v18

    .line 1617
    move-object/from16 v0, v18

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    move/from16 v22, v0

    .line 1618
    move-object/from16 v0, v18

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    move/from16 v26, v0

    .line 1619
    const/16 v29, 0x65

    move/from16 v0, v26

    move/from16 v1, v29

    if-eq v0, v1, :cond_166

    const/16 v29, 0x68

    move/from16 v0, v26

    move/from16 v1, v29

    if-eq v0, v1, :cond_166

    .line 1620
    new-instance v29, Lcom/jcraft/jsch/SftpException;

    const/16 v30, 0x4

    const-string v31, ""

    invoke-direct/range {v29 .. v31}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v29

    .line 1622
    :cond_166
    const/16 v29, 0x65

    move/from16 v0, v26

    move/from16 v1, v29

    if-ne v0, v1, :cond_1a8

    .line 1623
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1624
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v19

    .line 1625
    .restart local v19    # "i":I
    const/16 v29, 0x1

    move/from16 v0, v19

    move/from16 v1, v29

    if-ne v0, v1, :cond_199

    .line 1697
    .end local v19    # "i":I
    :cond_18f
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->_sendCLOSE([BLcom/jcraft/jsch/ChannelSftp$Header;)Z

    .line 1723
    return-void

    .line 1627
    .restart local v19    # "i":I
    :cond_199
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 1630
    .end local v19    # "i":I
    :cond_1a8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/jcraft/jsch/Buffer;->rewind()V

    .line 1631
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v29, v0

    const/16 v30, 0x0

    const/16 v31, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v31

    invoke-direct {v0, v1, v2, v3}, Lcom/jcraft/jsch/ChannelSftp;->fill([BII)I

    add-int/lit8 v22, v22, -0x4

    .line 1632
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v10

    .line 1637
    .local v10, "count":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/jcraft/jsch/Buffer;->reset()V

    .line 1638
    :goto_1e1
    if-lez v10, :cond_127

    .line 1639
    if-lez v22, :cond_24f

    .line 1640
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/jcraft/jsch/Buffer;->shift()V

    .line 1641
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    array-length v0, v0

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget v0, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move/from16 v30, v0

    add-int v30, v30, v22

    move/from16 v0, v29

    move/from16 v1, v30

    if-le v0, v1, :cond_287

    move/from16 v20, v22

    .line 1644
    .local v20, "j":I
    :goto_215
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget v0, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move/from16 v30, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v20

    invoke-direct {v0, v1, v2, v3}, Lcom/jcraft/jsch/ChannelSftp;->fill([BII)I

    move-result v19

    .line 1645
    .restart local v19    # "i":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget v0, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move/from16 v30, v0

    add-int v30, v30, v19

    move/from16 v0, v30

    move-object/from16 v1, v29

    iput v0, v1, Lcom/jcraft/jsch/Buffer;->index:I

    .line 1646
    sub-int v22, v22, v19

    .line 1648
    .end local v19    # "i":I
    .end local v20    # "j":I
    :cond_24f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v14

    .line 1649
    .local v14, "filename":[B
    const/16 v23, 0x0

    .line 1650
    .local v23, "longname":[B
    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    move/from16 v29, v0

    const/16 v30, 0x3

    move/from16 v0, v29

    move/from16 v1, v30

    if-gt v0, v1, :cond_273

    .line 1651
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v23

    .line 1653
    :cond_273
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    invoke-static/range {v29 .. v29}, Lcom/jcraft/jsch/SftpATTRS;->getATTR(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v8

    .line 1655
    .local v8, "attrs":Lcom/jcraft/jsch/SftpATTRS;
    const/16 v29, 0x1

    move/from16 v0, v29

    if-ne v9, v0, :cond_2a8

    .line 1656
    add-int/lit8 v10, v10, -0x1

    .line 1657
    goto/16 :goto_1e1

    .line 1641
    .end local v8    # "attrs":Lcom/jcraft/jsch/SftpATTRS;
    .end local v14    # "filename":[B
    .end local v23    # "longname":[B
    :cond_287
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    array-length v0, v0

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget v0, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move/from16 v30, v0

    sub-int v20, v29, v30

    goto/16 :goto_215

    .line 1660
    .restart local v8    # "attrs":Lcom/jcraft/jsch/SftpATTRS;
    .restart local v14    # "filename":[B
    .restart local v23    # "longname":[B
    :cond_2a8
    const/4 v15, 0x0

    .line 1661
    .local v15, "find":Z
    const/4 v13, 0x0

    .line 1662
    .local v13, "f":Ljava/lang/String;
    if-nez v24, :cond_2f5

    .line 1663
    const/4 v15, 0x1

    .line 1677
    :goto_2ad
    if-eqz v15, :cond_2f1

    .line 1678
    if-nez v13, :cond_2bd

    .line 1679
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    invoke-static {v14, v0}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1681
    :cond_2bd
    const/16 v21, 0x0

    .line 1682
    .local v21, "l":Ljava/lang/String;
    if-nez v23, :cond_322

    .line 1685
    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8}, Lcom/jcraft/jsch/SftpATTRS;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    const-string v30, " "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 1691
    :goto_2de
    new-instance v29, Lcom/jcraft/jsch/ChannelSftp$LsEntry;

    move-object/from16 v0, v29

    move-object/from16 v1, p0

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v13, v2, v8}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;-><init>(Lcom/jcraft/jsch/ChannelSftp;Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpATTRS;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/jcraft/jsch/ChannelSftp$LsEntrySelector;->select(Lcom/jcraft/jsch/ChannelSftp$LsEntry;)I

    move-result v9

    .line 1694
    .end local v21    # "l":Ljava/lang/String;
    :cond_2f1
    add-int/lit8 v10, v10, -0x1

    .line 1695
    goto/16 :goto_1e1

    .line 1665
    :cond_2f5
    if-nez v25, :cond_2fe

    .line 1666
    move-object/from16 v0, v24

    invoke-static {v0, v14}, Lcom/jcraft/jsch/Util;->array_equals([B[B)Z

    move-result v15

    goto :goto_2ad

    .line 1669
    :cond_2fe
    move-object v4, v14

    .line 1670
    .local v4, "_filename":[B
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding_is_utf8:Z

    move/from16 v29, v0

    if-nez v29, :cond_31b

    .line 1671
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    invoke-static {v4, v0}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1672
    const-string v29, "UTF-8"

    move-object/from16 v0, v29

    invoke-static {v13, v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v4

    .line 1674
    :cond_31b
    move-object/from16 v0, v24

    invoke-static {v0, v4}, Lcom/jcraft/jsch/Util;->glob([B[B)Z

    move-result v15

    goto :goto_2ad

    .line 1688
    .end local v4    # "_filename":[B
    .restart local v21    # "l":Ljava/lang/String;
    :cond_322
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v29, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v29

    invoke-static {v0, v1}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;
    :try_end_32f
    .catch Ljava/lang/Exception; {:try_start_bf .. :try_end_32f} :catch_b1

    move-result-object v21

    goto :goto_2de

    .line 1719
    .end local v5    # "_pattern":Ljava/lang/String;
    .end local v6    # "_pattern_utf8":[[B
    .end local v8    # "attrs":Lcom/jcraft/jsch/SftpATTRS;
    .end local v9    # "cancel":I
    .end local v10    # "count":I
    .end local v11    # "dir":Ljava/lang/String;
    .end local v13    # "f":Ljava/lang/String;
    .end local v14    # "filename":[B
    .end local v15    # "find":Z
    .end local v16    # "foo":I
    .end local v17    # "handle":[B
    .end local v18    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v21    # "l":Ljava/lang/String;
    .end local v22    # "length":I
    .end local v23    # "longname":[B
    .end local v24    # "pattern":[B
    .end local v25    # "pattern_has_wildcard":Z
    .end local v26    # "type":I
    .end local v28    # "v":Ljava/util/Vector;
    .restart local v12    # "e":Ljava/lang/Exception;
    :cond_331
    instance-of v0, v12, Ljava/lang/Throwable;

    move/from16 v29, v0

    if-eqz v29, :cond_347

    .line 1720
    new-instance v29, Lcom/jcraft/jsch/SftpException;

    const/16 v30, 0x4

    const-string v31, ""

    move-object/from16 v0, v29

    move/from16 v1, v30

    move-object/from16 v2, v31

    invoke-direct {v0, v1, v2, v12}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v29

    .line 1721
    :cond_347
    new-instance v29, Lcom/jcraft/jsch/SftpException;

    const/16 v30, 0x4

    const-string v31, ""

    invoke-direct/range {v29 .. v31}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v29
.end method

.method public lstat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;
    .registers 6
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x4

    .line 2280
    :try_start_1
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v1, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 2282
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2283
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2285
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->_lstat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_13} :catch_15

    move-result-object v1

    return-object v1

    .line 2287
    :catch_15
    move-exception v0

    .line 2288
    .local v0, "e":Ljava/lang/Exception;
    instance-of v1, v0, Lcom/jcraft/jsch/SftpException;

    if-eqz v1, :cond_1d

    check-cast v0, Lcom/jcraft/jsch/SftpException;

    .end local v0    # "e":Ljava/lang/Exception;
    throw v0

    .line 2289
    .restart local v0    # "e":Ljava/lang/Exception;
    :cond_1d
    instance-of v1, v0, Ljava/lang/Throwable;

    if-eqz v1, :cond_29

    .line 2290
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const-string v2, ""

    invoke-direct {v1, v3, v2, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 2291
    :cond_29
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const-string v2, ""

    invoke-direct {v1, v3, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1
.end method

.method public mkdir(Ljava/lang/String;)V
    .registers 11
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    .line 2136
    :try_start_1
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v5, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v5}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 2138
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2140
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v5}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v5

    const/4 v6, 0x0

    invoke-direct {p0, v5, v6}, Lcom/jcraft/jsch/ChannelSftp;->sendMKDIR([BLcom/jcraft/jsch/SftpATTRS;)V

    .line 2142
    new-instance v1, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v1, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 2143
    .local v1, "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v1}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v1

    .line 2144
    iget v3, v1, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 2145
    .local v3, "length":I
    iget v4, v1, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 2147
    .local v4, "type":I
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v3}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 2149
    const/16 v5, 0x65

    if-eq v4, v5, :cond_3f

    .line 2150
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const/4 v6, 0x4

    const-string v7, ""

    invoke-direct {v5, v6, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v5
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_37} :catch_37

    .line 2157
    .end local v1    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v3    # "length":I
    .end local v4    # "type":I
    :catch_37
    move-exception v0

    .line 2158
    .local v0, "e":Ljava/lang/Exception;
    instance-of v5, v0, Lcom/jcraft/jsch/SftpException;

    if-eqz v5, :cond_4e

    check-cast v0, Lcom/jcraft/jsch/SftpException;

    .end local v0    # "e":Ljava/lang/Exception;
    throw v0

    .line 2153
    .restart local v1    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v3    # "length":I
    .restart local v4    # "type":I
    :cond_3f
    :try_start_3f
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v5}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v2

    .line 2154
    .local v2, "i":I
    if-nez v2, :cond_48

    .line 2163
    :goto_47
    return-void

    .line 2155
    :cond_48
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v5, v2}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_3f .. :try_end_4d} :catch_37

    goto :goto_47

    .line 2159
    .end local v1    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v2    # "i":I
    .end local v3    # "length":I
    .end local v4    # "type":I
    .restart local v0    # "e":Ljava/lang/Exception;
    :cond_4e
    instance-of v5, v0, Ljava/lang/Throwable;

    if-eqz v5, :cond_5a

    .line 2160
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const-string v6, ""

    invoke-direct {v5, v8, v6, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 2161
    :cond_5a
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const-string v6, ""

    invoke-direct {v5, v8, v6}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v5
.end method

.method public put(Ljava/lang/String;)Ljava/io/OutputStream;
    .registers 4
    .param p1, "dst"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 694
    const/4 v0, 0x0

    check-cast v0, Lcom/jcraft/jsch/SftpProgressMonitor;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/String;I)Ljava/io/OutputStream;
    .registers 4
    .param p1, "dst"    # Ljava/lang/String;
    .param p2, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 697
    const/4 v0, 0x0

    check-cast v0, Lcom/jcraft/jsch/SftpProgressMonitor;

    invoke-virtual {p0, p1, v0, p2}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)Ljava/io/OutputStream;
    .registers 10
    .param p1, "dst"    # Ljava/lang/String;
    .param p2, "monitor"    # Lcom/jcraft/jsch/SftpProgressMonitor;
    .param p3, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 700
    const-wide/16 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;IJ)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;IJ)Ljava/io/OutputStream;
    .registers 24
    .param p1, "dst"    # Ljava/lang/String;
    .param p2, "monitor"    # Lcom/jcraft/jsch/SftpProgressMonitor;
    .param p3, "mode"    # I
    .param p4, "offset"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 716
    :try_start_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v14, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v14}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 718
    invoke-direct/range {p0 .. p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 719
    invoke-direct/range {p0 .. p1}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 721
    invoke-direct/range {p0 .. p1}, Lcom/jcraft/jsch/ChannelSftp;->isRemoteDir(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_3d

    .line 722
    new-instance v14, Lcom/jcraft/jsch/SftpException;

    const/4 v15, 0x4

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " is a directory"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v14 .. v16}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v14
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_35} :catch_35

    .line 864
    :catch_35
    move-exception v5

    .line 865
    .local v5, "e":Ljava/lang/Exception;
    instance-of v14, v5, Lcom/jcraft/jsch/SftpException;

    if-eqz v14, :cond_d2

    check-cast v5, Lcom/jcraft/jsch/SftpException;

    .end local v5    # "e":Ljava/lang/Exception;
    throw v5

    .line 725
    :cond_3d
    :try_start_3d
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-static {v0, v14}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_3d .. :try_end_46} :catch_35

    move-result-object v4

    .line 727
    .local v4, "dstb":[B
    const-wide/16 v11, 0x0

    .line 728
    .local v11, "skip":J
    const/4 v14, 0x1

    move/from16 v0, p3

    if-eq v0, v14, :cond_53

    const/4 v14, 0x2

    move/from16 v0, p3

    if-ne v0, v14, :cond_5d

    .line 730
    :cond_53
    :try_start_53
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/jcraft/jsch/ChannelSftp;->_stat([B)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v3

    .line 731
    .local v3, "attr":Lcom/jcraft/jsch/SftpATTRS;
    invoke-virtual {v3}, Lcom/jcraft/jsch/SftpATTRS;->getSize()J
    :try_end_5c
    .catch Ljava/lang/Exception; {:try_start_53 .. :try_end_5c} :catch_ea

    move-result-wide v11

    .line 738
    .end local v3    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    :cond_5d
    :goto_5d
    if-nez p3, :cond_93

    :try_start_5f
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/jcraft/jsch/ChannelSftp;->sendOPENW([B)V

    .line 741
    :goto_64
    new-instance v7, Lcom/jcraft/jsch/ChannelSftp$Header;

    move-object/from16 v0, p0

    invoke-direct {v7, v0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 742
    .local v7, "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v7}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v7

    .line 743
    iget v9, v7, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 744
    .local v9, "length":I
    iget v13, v7, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 746
    .local v13, "type":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v9}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 748
    const/16 v14, 0x65

    if-eq v13, v14, :cond_99

    const/16 v14, 0x66

    if-eq v13, v14, :cond_99

    .line 749
    new-instance v14, Lcom/jcraft/jsch/SftpException;

    const/4 v15, 0x4

    const-string v16, ""

    invoke-direct/range {v14 .. v16}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v14

    .line 739
    .end local v7    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v9    # "length":I
    .end local v13    # "type":I
    :cond_93
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/jcraft/jsch/ChannelSftp;->sendOPENA([B)V

    goto :goto_64

    .line 751
    .restart local v7    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v9    # "length":I
    .restart local v13    # "type":I
    :cond_99
    const/16 v14, 0x65

    if-ne v13, v14, :cond_ae

    .line 752
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v14}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v8

    .line 753
    .local v8, "i":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v8}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V

    .line 755
    .end local v8    # "i":I
    :cond_ae
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v14}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v6

    .line 757
    .local v6, "handle":[B
    const/4 v14, 0x1

    move/from16 v0, p3

    if-eq v0, v14, :cond_c0

    const/4 v14, 0x2

    move/from16 v0, p3

    if-ne v0, v14, :cond_c2

    .line 758
    :cond_c0
    add-long p4, p4, v11

    .line 761
    :cond_c2
    const/4 v14, 0x1

    new-array v2, v14, [J

    .line 762
    .local v2, "_offset":[J
    const/4 v14, 0x0

    aput-wide p4, v2, v14

    .line 763
    new-instance v10, Lcom/jcraft/jsch/ChannelSftp$1;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v10, v0, v6, v2, v1}, Lcom/jcraft/jsch/ChannelSftp$1;-><init>(Lcom/jcraft/jsch/ChannelSftp;[B[JLcom/jcraft/jsch/SftpProgressMonitor;)V
    :try_end_d1
    .catch Ljava/lang/Exception; {:try_start_5f .. :try_end_d1} :catch_35

    .line 862
    .local v10, "out":Ljava/io/OutputStream;
    return-object v10

    .line 866
    .end local v2    # "_offset":[J
    .end local v4    # "dstb":[B
    .end local v6    # "handle":[B
    .end local v7    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v9    # "length":I
    .end local v10    # "out":Ljava/io/OutputStream;
    .end local v11    # "skip":J
    .end local v13    # "type":I
    .restart local v5    # "e":Ljava/lang/Exception;
    :cond_d2
    instance-of v14, v5, Ljava/lang/Throwable;

    if-eqz v14, :cond_e1

    .line 867
    new-instance v14, Lcom/jcraft/jsch/SftpException;

    const/4 v15, 0x4

    const-string v16, ""

    move-object/from16 v0, v16

    invoke-direct {v14, v15, v0, v5}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v14

    .line 868
    :cond_e1
    new-instance v14, Lcom/jcraft/jsch/SftpException;

    const/4 v15, 0x4

    const-string v16, ""

    invoke-direct/range {v14 .. v16}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v14

    .line 733
    .end local v5    # "e":Ljava/lang/Exception;
    .restart local v4    # "dstb":[B
    .restart local v11    # "skip":J
    :catch_ea
    move-exception v14

    goto/16 :goto_5d
.end method

.method public put(Ljava/io/InputStream;Ljava/lang/String;)V
    .registers 5
    .param p1, "src"    # Ljava/io/InputStream;
    .param p2, "dst"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 492
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/io/InputStream;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V

    .line 493
    return-void
.end method

.method public put(Ljava/io/InputStream;Ljava/lang/String;I)V
    .registers 5
    .param p1, "src"    # Ljava/io/InputStream;
    .param p2, "dst"    # Ljava/lang/String;
    .param p3, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 495
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/io/InputStream;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V

    .line 496
    return-void
.end method

.method public put(Ljava/io/InputStream;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;)V
    .registers 5
    .param p1, "src"    # Ljava/io/InputStream;
    .param p2, "dst"    # Ljava/lang/String;
    .param p3, "monitor"    # Lcom/jcraft/jsch/SftpProgressMonitor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 499
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/io/InputStream;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V

    .line 500
    return-void
.end method

.method public put(Ljava/io/InputStream;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V
    .registers 16
    .param p1, "src"    # Ljava/io/InputStream;
    .param p2, "dst"    # Ljava/lang/String;
    .param p3, "monitor"    # Lcom/jcraft/jsch/SftpProgressMonitor;
    .param p4, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x4

    .line 515
    :try_start_1
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v1, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 517
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 519
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v8

    .line 520
    .local v8, "v":Ljava/util/Vector;
    invoke-virtual {v8}, Ljava/util/Vector;->size()I

    move-result v9

    .line 521
    .local v9, "vsize":I
    const/4 v1, 0x1

    if-eq v9, v1, :cond_60

    .line 522
    if-nez v9, :cond_55

    .line 523
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->isPattern(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_51

    .line 524
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const/4 v2, 0x4

    invoke-direct {v1, v2, p2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_26} :catch_26

    .line 542
    .end local v8    # "v":Ljava/util/Vector;
    .end local v9    # "vsize":I
    :catch_26
    move-exception v7

    .line 543
    .local v7, "e":Ljava/lang/Exception;
    instance-of v1, v7, Lcom/jcraft/jsch/SftpException;

    if-eqz v1, :cond_7e

    move-object v1, v7

    .line 544
    check-cast v1, Lcom/jcraft/jsch/SftpException;

    iget v1, v1, Lcom/jcraft/jsch/SftpException;->id:I

    if-ne v1, v10, :cond_7b

    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->isRemoteDir(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7b

    .line 546
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is a directory"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v10, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 526
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v8    # "v":Ljava/util/Vector;
    .restart local v9    # "vsize":I
    :cond_51
    :try_start_51
    invoke-static {p2}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 528
    :cond_55
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const/4 v2, 0x4

    invoke-virtual {v8}, Ljava/util/Vector;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 531
    :cond_60
    const/4 v1, 0x0

    invoke-virtual {v8, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    move-object p2, v0

    .line 534
    if-eqz p3, :cond_77

    .line 535
    const/4 v2, 0x0

    const-string v3, "-"

    const-wide/16 v5, -0x1

    move-object v1, p3

    move-object v4, p2

    invoke-interface/range {v1 .. v6}, Lcom/jcraft/jsch/SftpProgressMonitor;->init(ILjava/lang/String;Ljava/lang/String;J)V

    .line 540
    :cond_77
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/jcraft/jsch/ChannelSftp;->_put(Ljava/io/InputStream;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V
    :try_end_7a
    .catch Ljava/lang/Exception; {:try_start_51 .. :try_end_7a} :catch_26

    .line 554
    return-void

    .line 548
    .end local v8    # "v":Ljava/util/Vector;
    .end local v9    # "vsize":I
    .restart local v7    # "e":Ljava/lang/Exception;
    :cond_7b
    check-cast v7, Lcom/jcraft/jsch/SftpException;

    .end local v7    # "e":Ljava/lang/Exception;
    throw v7

    .line 550
    .restart local v7    # "e":Ljava/lang/Exception;
    :cond_7e
    instance-of v1, v7, Ljava/lang/Throwable;

    if-eqz v1, :cond_8c

    .line 551
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    invoke-virtual {v7}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v10, v2, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 552
    :cond_8c
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    invoke-virtual {v7}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v10, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "dst"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 365
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V

    .line 366
    return-void
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;I)V
    .registers 5
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "dst"    # Ljava/lang/String;
    .param p3, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 368
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V

    .line 369
    return-void
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;)V
    .registers 5
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "dst"    # Ljava/lang/String;
    .param p3, "monitor"    # Lcom/jcraft/jsch/SftpProgressMonitor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 372
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V

    .line 373
    return-void
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V
    .registers 29
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "dst"    # Ljava/lang/String;
    .param p3, "monitor"    # Lcom/jcraft/jsch/SftpProgressMonitor;
    .param p4, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 389
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v3, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v3}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 391
    invoke-direct/range {p0 .. p1}, Lcom/jcraft/jsch/ChannelSftp;->localAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 392
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 394
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v22

    .line 395
    .local v22, "v":Ljava/util/Vector;
    invoke-virtual/range {v22 .. v22}, Ljava/util/Vector;->size()I

    move-result v23

    .line 396
    .local v23, "vsize":I
    const/4 v3, 0x1

    move/from16 v0, v23

    if-eq v0, v3, :cond_52

    .line 397
    if-nez v23, :cond_47

    .line 398
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->isPattern(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_43

    .line 399
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v4, 0x4

    move-object/from16 v0, p2

    invoke-direct {v3, v4, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3b} :catch_3b

    .line 484
    .end local v22    # "v":Ljava/util/Vector;
    .end local v23    # "vsize":I
    :catch_3b
    move-exception v11

    .line 485
    .local v11, "e":Ljava/lang/Exception;
    instance-of v3, v11, Lcom/jcraft/jsch/SftpException;

    if-eqz v3, :cond_171

    check-cast v11, Lcom/jcraft/jsch/SftpException;

    .end local v11    # "e":Ljava/lang/Exception;
    throw v11

    .line 401
    .restart local v22    # "v":Ljava/util/Vector;
    .restart local v23    # "vsize":I
    :cond_43
    :try_start_43
    invoke-static/range {p2 .. p2}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 403
    :cond_47
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v4, 0x4

    invoke-virtual/range {v22 .. v22}, Ljava/util/Vector;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v4, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 406
    :cond_52
    const/4 v3, 0x0

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object v0, v3

    check-cast v0, Ljava/lang/String;

    move-object/from16 p2, v0

    .line 409
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/ChannelSftp;->isRemoteDir(Ljava/lang/String;)Z

    move-result v16

    .line 411
    .local v16, "isRemoteDir":Z
    invoke-direct/range {p0 .. p1}, Lcom/jcraft/jsch/ChannelSftp;->glob_local(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v22

    .line 412
    invoke-virtual/range {v22 .. v22}, Ljava/util/Vector;->size()I

    move-result v23

    .line 414
    const/4 v10, 0x0

    .line 415
    .local v10, "dstsb":Ljava/lang/StringBuffer;
    if-eqz v16, :cond_115

    .line 416
    const-string v3, "/"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_92

    .line 417
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 419
    :cond_92
    new-instance v10, Ljava/lang/StringBuffer;

    .end local v10    # "dstsb":Ljava/lang/StringBuffer;
    move-object/from16 v0, p2

    invoke-direct {v10, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 426
    .restart local v10    # "dstsb":Ljava/lang/StringBuffer;
    :cond_99
    const/16 v17, 0x0

    .local v17, "j":I
    :goto_9b
    move/from16 v0, v17

    move/from16 v1, v23

    if-ge v0, v1, :cond_134

    .line 427
    move-object/from16 v0, v22

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object v0, v3

    check-cast v0, Ljava/lang/String;

    move-object v5, v0

    .line 428
    .local v5, "_src":Ljava/lang/String;
    const/4 v6, 0x0

    .line 429
    .local v6, "_dst":Ljava/lang/String;
    if-eqz v16, :cond_12d

    .line 430
    sget-char v3, Lcom/jcraft/jsch/ChannelSftp;->file_separatorc:C

    invoke-virtual {v5, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v14

    .line 431
    .local v14, "i":I
    sget-boolean v3, Lcom/jcraft/jsch/ChannelSftp;->fs_is_bs:Z

    if-eqz v3, :cond_c8

    .line 432
    const/16 v3, 0x2f

    invoke-virtual {v5, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v15

    .line 433
    .local v15, "ii":I
    const/4 v3, -0x1

    if-eq v15, v3, :cond_c8

    if-le v15, v14, :cond_c8

    .line 434
    move v14, v15

    .line 436
    .end local v15    # "ii":I
    :cond_c8
    const/4 v3, -0x1

    if-ne v14, v3, :cond_123

    invoke-virtual {v10, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 438
    :goto_ce
    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 439
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v10, v3, v4}, Ljava/lang/StringBuffer;->delete(II)Ljava/lang/StringBuffer;
    :try_end_dd
    .catch Ljava/lang/Exception; {:try_start_43 .. :try_end_dd} :catch_3b

    .line 446
    .end local v14    # "i":I
    :goto_dd
    const-wide/16 v18, 0x0

    .line 447
    .local v18, "size_of_dst":J
    const/4 v3, 0x1

    move/from16 v0, p4

    if-ne v0, v3, :cond_135

    .line 449
    :try_start_e4
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/jcraft/jsch/ChannelSftp;->_stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v9

    .line 450
    .local v9, "attr":Lcom/jcraft/jsch/SftpATTRS;
    invoke-virtual {v9}, Lcom/jcraft/jsch/SftpATTRS;->getSize()J
    :try_end_ed
    .catch Ljava/lang/Exception; {:try_start_e4 .. :try_end_ed} :catch_18e

    move-result-wide v18

    .line 455
    .end local v9    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    :goto_ee
    :try_start_ee
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v20

    .line 456
    .local v20, "size_of_src":J
    cmp-long v3, v20, v18

    if-gez v3, :cond_130

    .line 457
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v4, 0x4

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "failed to resume for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v4, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 421
    .end local v5    # "_src":Ljava/lang/String;
    .end local v6    # "_dst":Ljava/lang/String;
    .end local v17    # "j":I
    .end local v18    # "size_of_dst":J
    .end local v20    # "size_of_src":J
    :cond_115
    const/4 v3, 0x1

    move/from16 v0, v23

    if-le v0, v3, :cond_99

    .line 422
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v4, 0x4

    const-string v7, "Copying multiple files, but the destination is missing or a file."

    invoke-direct {v3, v4, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 437
    .restart local v5    # "_src":Ljava/lang/String;
    .restart local v6    # "_dst":Ljava/lang/String;
    .restart local v14    # "i":I
    .restart local v17    # "j":I
    :cond_123
    add-int/lit8 v3, v14, 0x1

    invoke-virtual {v5, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_ce

    .line 442
    .end local v14    # "i":I
    :cond_12d
    move-object/from16 v6, p2

    goto :goto_dd

    .line 460
    .restart local v18    # "size_of_dst":J
    .restart local v20    # "size_of_src":J
    :cond_130
    cmp-long v3, v20, v18

    if-nez v3, :cond_135

    .line 490
    .end local v5    # "_src":Ljava/lang/String;
    .end local v6    # "_dst":Ljava/lang/String;
    .end local v18    # "size_of_dst":J
    .end local v20    # "size_of_src":J
    :cond_134
    return-void

    .line 465
    .restart local v5    # "_src":Ljava/lang/String;
    .restart local v6    # "_dst":Ljava/lang/String;
    .restart local v18    # "size_of_dst":J
    :cond_135
    if-eqz p3, :cond_152

    .line 466
    const/4 v4, 0x0

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v7

    move-object/from16 v3, p3

    invoke-interface/range {v3 .. v8}, Lcom/jcraft/jsch/SftpProgressMonitor;->init(ILjava/lang/String;Ljava/lang/String;J)V

    .line 468
    const/4 v3, 0x1

    move/from16 v0, p4

    if-ne v0, v3, :cond_152

    .line 469
    move-object/from16 v0, p3

    move-wide/from16 v1, v18

    invoke-interface {v0, v1, v2}, Lcom/jcraft/jsch/SftpProgressMonitor;->count(J)Z
    :try_end_152
    .catch Ljava/lang/Exception; {:try_start_ee .. :try_end_152} :catch_3b

    .line 472
    :cond_152
    const/4 v12, 0x0

    .line 474
    .local v12, "fis":Ljava/io/FileInputStream;
    :try_start_153
    new-instance v13, Ljava/io/FileInputStream;

    invoke-direct {v13, v5}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_158
    .catchall {:try_start_153 .. :try_end_158} :catchall_16a

    .line 475
    .end local v12    # "fis":Ljava/io/FileInputStream;
    .local v13, "fis":Ljava/io/FileInputStream;
    :try_start_158
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move/from16 v2, p4

    invoke-virtual {v0, v13, v6, v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->_put(Ljava/io/InputStream;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;I)V
    :try_end_161
    .catchall {:try_start_158 .. :try_end_161} :catchall_18b

    .line 478
    if-eqz v13, :cond_166

    .line 479
    :try_start_163
    invoke-virtual {v13}, Ljava/io/FileInputStream;->close()V

    .line 426
    :cond_166
    add-int/lit8 v17, v17, 0x1

    goto/16 :goto_9b

    .line 478
    .end local v13    # "fis":Ljava/io/FileInputStream;
    .restart local v12    # "fis":Ljava/io/FileInputStream;
    :catchall_16a
    move-exception v3

    :goto_16b
    if-eqz v12, :cond_170

    .line 479
    invoke-virtual {v12}, Ljava/io/FileInputStream;->close()V

    :cond_170
    throw v3
    :try_end_171
    .catch Ljava/lang/Exception; {:try_start_163 .. :try_end_171} :catch_3b

    .line 486
    .end local v5    # "_src":Ljava/lang/String;
    .end local v6    # "_dst":Ljava/lang/String;
    .end local v10    # "dstsb":Ljava/lang/StringBuffer;
    .end local v12    # "fis":Ljava/io/FileInputStream;
    .end local v16    # "isRemoteDir":Z
    .end local v17    # "j":I
    .end local v18    # "size_of_dst":J
    .end local v22    # "v":Ljava/util/Vector;
    .end local v23    # "vsize":I
    .restart local v11    # "e":Ljava/lang/Exception;
    :cond_171
    instance-of v3, v11, Ljava/lang/Throwable;

    if-eqz v3, :cond_180

    .line 487
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v4, 0x4

    invoke-virtual {v11}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v4, v7, v11}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 488
    :cond_180
    new-instance v3, Lcom/jcraft/jsch/SftpException;

    const/4 v4, 0x4

    invoke-virtual {v11}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v4, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v3

    .line 478
    .end local v11    # "e":Ljava/lang/Exception;
    .restart local v5    # "_src":Ljava/lang/String;
    .restart local v6    # "_dst":Ljava/lang/String;
    .restart local v10    # "dstsb":Ljava/lang/StringBuffer;
    .restart local v13    # "fis":Ljava/io/FileInputStream;
    .restart local v16    # "isRemoteDir":Z
    .restart local v17    # "j":I
    .restart local v18    # "size_of_dst":J
    .restart local v22    # "v":Ljava/util/Vector;
    .restart local v23    # "vsize":I
    :catchall_18b
    move-exception v3

    move-object v12, v13

    .end local v13    # "fis":Ljava/io/FileInputStream;
    .restart local v12    # "fis":Ljava/io/FileInputStream;
    goto :goto_16b

    .line 452
    .end local v12    # "fis":Ljava/io/FileInputStream;
    :catch_18e
    move-exception v3

    goto/16 :goto_ee
.end method

.method public pwd()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 2402
    invoke-direct {p0}, Lcom/jcraft/jsch/ChannelSftp;->getCwd()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public quit()V
    .registers 1

    .prologue
    .line 320
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->disconnect()V

    return-void
.end method

.method public readlink(Ljava/lang/String;)Ljava/lang/String;
    .registers 13
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x68

    const/4 v8, 0x3

    const/4 v10, 0x4

    .line 1727
    :try_start_4
    iget v7, p0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    if-ge v7, v8, :cond_1a

    .line 1728
    new-instance v7, Lcom/jcraft/jsch/SftpException;

    const/16 v8, 0x8

    const-string v9, "The remote sshd is too old to support symlink operation."

    invoke-direct {v7, v8, v9}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v7
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_12} :catch_12

    .line 1766
    :catch_12
    move-exception v1

    .line 1767
    .local v1, "e":Ljava/lang/Exception;
    instance-of v7, v1, Lcom/jcraft/jsch/SftpException;

    if-eqz v7, :cond_8c

    check-cast v1, Lcom/jcraft/jsch/SftpException;

    .end local v1    # "e":Ljava/lang/Exception;
    throw v1

    .line 1732
    :cond_1a
    :try_start_1a
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v7, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v7}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 1734
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1736
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1738
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/jcraft/jsch/ChannelSftp;->sendREADLINK([B)V

    .line 1740
    new-instance v3, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v3, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 1741
    .local v3, "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v7, v3}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v3

    .line 1742
    iget v5, v3, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 1743
    .local v5, "length":I
    iget v6, v3, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 1745
    .local v6, "type":I
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v7, v5}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1747
    const/16 v7, 0x65

    if-eq v6, v7, :cond_55

    if-eq v6, v9, :cond_55

    .line 1748
    new-instance v7, Lcom/jcraft/jsch/SftpException;

    const/4 v8, 0x4

    const-string v9, ""

    invoke-direct {v7, v8, v9}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v7

    .line 1750
    :cond_55
    if-ne v6, v9, :cond_7f

    .line 1751
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v7}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v0

    .line 1752
    .local v0, "count":I
    const/4 v2, 0x0

    .line 1753
    .local v2, "filename":[B
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_5f
    if-ge v4, v0, :cond_78

    .line 1754
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v7}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v2

    .line 1755
    iget v7, p0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    if-gt v7, v8, :cond_70

    .line 1756
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v7}, Lcom/jcraft/jsch/Buffer;->getString()[B

    .line 1758
    :cond_70
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-static {v7}, Lcom/jcraft/jsch/SftpATTRS;->getATTR(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/SftpATTRS;

    .line 1753
    add-int/lit8 v4, v4, 0x1

    goto :goto_5f

    .line 1760
    :cond_78
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {v2, v7}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1772
    .end local v0    # "count":I
    .end local v2    # "filename":[B
    :goto_7e
    return-object v7

    .line 1763
    .end local v4    # "i":I
    :cond_7f
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v7}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v4

    .line 1764
    .restart local v4    # "i":I
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v7, v4}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V
    :try_end_8a
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_8a} :catch_12

    .line 1772
    const/4 v7, 0x0

    goto :goto_7e

    .line 1768
    .end local v3    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v4    # "i":I
    .end local v5    # "length":I
    .end local v6    # "type":I
    .restart local v1    # "e":Ljava/lang/Exception;
    :cond_8c
    instance-of v7, v1, Ljava/lang/Throwable;

    if-eqz v7, :cond_98

    .line 1769
    new-instance v7, Lcom/jcraft/jsch/SftpException;

    const-string v8, ""

    invoke-direct {v7, v10, v8, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 1770
    :cond_98
    new-instance v7, Lcom/jcraft/jsch/SftpException;

    const-string v8, ""

    invoke-direct {v7, v10, v8}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v7
.end method

.method public realpath(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x4

    .line 2972
    :try_start_1
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/jcraft/jsch/ChannelSftp;->_realpath(Ljava/lang/String;)[B

    move-result-object v0

    .line 2973
    .local v0, "_path":[B
    iget-object v2, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/jcraft/jsch/Util;->byte2str([BLjava/lang/String;)Ljava/lang/String;
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_e} :catch_10

    move-result-object v2

    return-object v2

    .line 2975
    .end local v0    # "_path":[B
    :catch_10
    move-exception v1

    .line 2976
    .local v1, "e":Ljava/lang/Exception;
    instance-of v2, v1, Lcom/jcraft/jsch/SftpException;

    if-eqz v2, :cond_18

    check-cast v1, Lcom/jcraft/jsch/SftpException;

    .end local v1    # "e":Ljava/lang/Exception;
    throw v1

    .line 2977
    .restart local v1    # "e":Ljava/lang/Exception;
    :cond_18
    instance-of v2, v1, Ljava/lang/Throwable;

    if-eqz v2, :cond_24

    .line 2978
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const-string v3, ""

    invoke-direct {v2, v4, v3, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 2979
    :cond_24
    new-instance v2, Lcom/jcraft/jsch/SftpException;

    const-string v3, ""

    invoke-direct {v2, v4, v3}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v2
.end method

.method public rename(Ljava/lang/String;Ljava/lang/String;)V
    .registers 15
    .param p1, "oldpath"    # Ljava/lang/String;
    .param p2, "newpath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x2

    const/4 v11, 0x4

    .line 1880
    iget v8, p0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    if-ge v8, v9, :cond_10

    .line 1881
    new-instance v8, Lcom/jcraft/jsch/SftpException;

    const/16 v9, 0x8

    const-string v10, "The remote sshd is too old to support rename operation."

    invoke-direct {v8, v9, v10}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v8

    .line 1886
    :cond_10
    :try_start_10
    iget-object v8, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v8, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v8}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 1888
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1889
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1891
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1893
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v6

    .line 1894
    .local v6, "v":Ljava/util/Vector;
    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v7

    .line 1895
    .local v7, "vsize":I
    if-lt v7, v9, :cond_40

    .line 1896
    new-instance v8, Lcom/jcraft/jsch/SftpException;

    const/4 v9, 0x4

    invoke-virtual {v6}, Ljava/util/Vector;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v8
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_38} :catch_38

    .line 1925
    .end local v6    # "v":Ljava/util/Vector;
    .end local v7    # "vsize":I
    :catch_38
    move-exception v1

    .line 1926
    .local v1, "e":Ljava/lang/Exception;
    instance-of v8, v1, Lcom/jcraft/jsch/SftpException;

    if-eqz v8, :cond_9f

    check-cast v1, Lcom/jcraft/jsch/SftpException;

    .end local v1    # "e":Ljava/lang/Exception;
    throw v1

    .line 1898
    .restart local v6    # "v":Ljava/util/Vector;
    .restart local v7    # "vsize":I
    :cond_40
    const/4 v8, 0x1

    if-ne v7, v8, :cond_7e

    .line 1899
    const/4 v8, 0x0

    :try_start_44
    invoke-virtual {v6, v8}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    move-object v0, v8

    check-cast v0, Ljava/lang/String;

    move-object p2, v0

    .line 1907
    :goto_4e
    iget-object v8, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v8}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v8

    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p2, v9}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v9

    invoke-direct {p0, v8, v9}, Lcom/jcraft/jsch/ChannelSftp;->sendRENAME([B[B)V

    .line 1910
    new-instance v2, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v2, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 1911
    .local v2, "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v8, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v8, v2}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v2

    .line 1912
    iget v4, v2, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 1913
    .local v4, "length":I
    iget v5, v2, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 1915
    .local v5, "type":I
    iget-object v8, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v8, v4}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1917
    const/16 v8, 0x65

    if-eq v5, v8, :cond_90

    .line 1918
    new-instance v8, Lcom/jcraft/jsch/SftpException;

    const/4 v9, 0x4

    const-string v10, ""

    invoke-direct {v8, v9, v10}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v8

    .line 1902
    .end local v2    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v4    # "length":I
    .end local v5    # "type":I
    :cond_7e
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->isPattern(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_8b

    .line 1903
    new-instance v8, Lcom/jcraft/jsch/SftpException;

    const/4 v9, 0x4

    invoke-direct {v8, v9, p2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v8

    .line 1904
    :cond_8b
    invoke-static {p2}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_4e

    .line 1921
    .restart local v2    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v4    # "length":I
    .restart local v5    # "type":I
    :cond_90
    iget-object v8, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v8}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    .line 1922
    .local v3, "i":I
    if-nez v3, :cond_99

    .line 1931
    :goto_98
    return-void

    .line 1923
    :cond_99
    iget-object v8, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v8, v3}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V
    :try_end_9e
    .catch Ljava/lang/Exception; {:try_start_44 .. :try_end_9e} :catch_38

    goto :goto_98

    .line 1927
    .end local v2    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v3    # "i":I
    .end local v4    # "length":I
    .end local v5    # "type":I
    .end local v6    # "v":Ljava/util/Vector;
    .end local v7    # "vsize":I
    .restart local v1    # "e":Ljava/lang/Exception;
    :cond_9f
    instance-of v8, v1, Ljava/lang/Throwable;

    if-eqz v8, :cond_ab

    .line 1928
    new-instance v8, Lcom/jcraft/jsch/SftpException;

    const-string v9, ""

    invoke-direct {v8, v11, v9, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 1929
    :cond_ab
    new-instance v8, Lcom/jcraft/jsch/SftpException;

    const-string v9, ""

    invoke-direct {v8, v11, v9}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v8
.end method

.method public rm(Ljava/lang/String;)V
    .registers 15
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x4

    .line 1934
    :try_start_1
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v9, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v9}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 1936
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1938
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v7

    .line 1939
    .local v7, "v":Ljava/util/Vector;
    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v8

    .line 1941
    .local v8, "vsize":I
    new-instance v2, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v2, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 1943
    .local v2, "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_1a
    if-ge v4, v8, :cond_77

    .line 1944
    invoke-virtual {v7, v4}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    move-object v0, v9

    check-cast v0, Ljava/lang/String;

    move-object p1, v0

    .line 1945
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v9}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/jcraft/jsch/ChannelSftp;->sendREMOVE([B)V

    .line 1947
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v9, v2}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v2

    .line 1948
    iget v5, v2, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 1949
    .local v5, "length":I
    iget v6, v2, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 1951
    .local v6, "type":I
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v9, v5}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1953
    const/16 v9, 0x65

    if-eq v6, v9, :cond_53

    .line 1954
    new-instance v9, Lcom/jcraft/jsch/SftpException;

    const/4 v10, 0x4

    const-string v11, ""

    invoke-direct {v9, v10, v11}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v9
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4b} :catch_4b

    .line 1962
    .end local v2    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v4    # "j":I
    .end local v5    # "length":I
    .end local v6    # "type":I
    .end local v7    # "v":Ljava/util/Vector;
    .end local v8    # "vsize":I
    :catch_4b
    move-exception v1

    .line 1963
    .local v1, "e":Ljava/lang/Exception;
    instance-of v9, v1, Lcom/jcraft/jsch/SftpException;

    if-eqz v9, :cond_63

    check-cast v1, Lcom/jcraft/jsch/SftpException;

    .end local v1    # "e":Ljava/lang/Exception;
    throw v1

    .line 1956
    .restart local v2    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v4    # "j":I
    .restart local v5    # "length":I
    .restart local v6    # "type":I
    .restart local v7    # "v":Ljava/util/Vector;
    .restart local v8    # "vsize":I
    :cond_53
    :try_start_53
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v9}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    .line 1957
    .local v3, "i":I
    if-eqz v3, :cond_60

    .line 1958
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v9, v3}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V
    :try_end_60
    .catch Ljava/lang/Exception; {:try_start_53 .. :try_end_60} :catch_4b

    .line 1943
    :cond_60
    add-int/lit8 v4, v4, 0x1

    goto :goto_1a

    .line 1964
    .end local v2    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v3    # "i":I
    .end local v4    # "j":I
    .end local v5    # "length":I
    .end local v6    # "type":I
    .end local v7    # "v":Ljava/util/Vector;
    .end local v8    # "vsize":I
    .restart local v1    # "e":Ljava/lang/Exception;
    :cond_63
    instance-of v9, v1, Ljava/lang/Throwable;

    if-eqz v9, :cond_6f

    .line 1965
    new-instance v9, Lcom/jcraft/jsch/SftpException;

    const-string v10, ""

    invoke-direct {v9, v12, v10, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 1966
    :cond_6f
    new-instance v9, Lcom/jcraft/jsch/SftpException;

    const-string v10, ""

    invoke-direct {v9, v12, v10}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v9

    .line 1968
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v4    # "j":I
    .restart local v7    # "v":Ljava/util/Vector;
    .restart local v8    # "vsize":I
    :cond_77
    return-void
.end method

.method public rmdir(Ljava/lang/String;)V
    .registers 15
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x4

    .line 2097
    :try_start_1
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v9, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v9}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 2099
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2101
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v7

    .line 2102
    .local v7, "v":Ljava/util/Vector;
    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v8

    .line 2104
    .local v8, "vsize":I
    new-instance v2, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v2, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 2106
    .local v2, "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_1a
    if-ge v4, v8, :cond_77

    .line 2107
    invoke-virtual {v7, v4}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    move-object v0, v9

    check-cast v0, Ljava/lang/String;

    move-object p1, v0

    .line 2108
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v9}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/jcraft/jsch/ChannelSftp;->sendRMDIR([B)V

    .line 2110
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v9, v2}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v2

    .line 2111
    iget v5, v2, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 2112
    .local v5, "length":I
    iget v6, v2, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 2114
    .local v6, "type":I
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v9, v5}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 2116
    const/16 v9, 0x65

    if-eq v6, v9, :cond_53

    .line 2117
    new-instance v9, Lcom/jcraft/jsch/SftpException;

    const/4 v10, 0x4

    const-string v11, ""

    invoke-direct {v9, v10, v11}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v9
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4b} :catch_4b

    .line 2126
    .end local v2    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v4    # "j":I
    .end local v5    # "length":I
    .end local v6    # "type":I
    .end local v7    # "v":Ljava/util/Vector;
    .end local v8    # "vsize":I
    :catch_4b
    move-exception v1

    .line 2127
    .local v1, "e":Ljava/lang/Exception;
    instance-of v9, v1, Lcom/jcraft/jsch/SftpException;

    if-eqz v9, :cond_63

    check-cast v1, Lcom/jcraft/jsch/SftpException;

    .end local v1    # "e":Ljava/lang/Exception;
    throw v1

    .line 2120
    .restart local v2    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v4    # "j":I
    .restart local v5    # "length":I
    .restart local v6    # "type":I
    .restart local v7    # "v":Ljava/util/Vector;
    .restart local v8    # "vsize":I
    :cond_53
    :try_start_53
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v9}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    .line 2121
    .local v3, "i":I
    if-eqz v3, :cond_60

    .line 2122
    iget-object v9, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v9, v3}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V
    :try_end_60
    .catch Ljava/lang/Exception; {:try_start_53 .. :try_end_60} :catch_4b

    .line 2106
    :cond_60
    add-int/lit8 v4, v4, 0x1

    goto :goto_1a

    .line 2128
    .end local v2    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v3    # "i":I
    .end local v4    # "j":I
    .end local v5    # "length":I
    .end local v6    # "type":I
    .end local v7    # "v":Ljava/util/Vector;
    .end local v8    # "vsize":I
    .restart local v1    # "e":Ljava/lang/Exception;
    :cond_63
    instance-of v9, v1, Ljava/lang/Throwable;

    if-eqz v9, :cond_6f

    .line 2129
    new-instance v9, Lcom/jcraft/jsch/SftpException;

    const-string v10, ""

    invoke-direct {v9, v12, v10, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 2130
    :cond_6f
    new-instance v9, Lcom/jcraft/jsch/SftpException;

    const-string v10, ""

    invoke-direct {v9, v12, v10}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v9

    .line 2132
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .restart local v4    # "j":I
    .restart local v7    # "v":Ljava/util/Vector;
    .restart local v8    # "vsize":I
    :cond_77
    return-void
.end method

.method public bridge synthetic run()V
    .registers 1

    .prologue
    .line 36
    invoke-super {p0}, Lcom/jcraft/jsch/ChannelSession;->run()V

    return-void
.end method

.method public bridge synthetic setAgentForwarding(Z)V
    .registers 2
    .param p1, "x0"    # Z

    .prologue
    .line 36
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setAgentForwarding(Z)V

    return-void
.end method

.method public setBulkRequests(I)V
    .registers 5
    .param p1, "bulk_requests"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 195
    if-lez p1, :cond_a

    .line 196
    new-instance v0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    invoke-direct {v0, p0, p1}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;-><init>(Lcom/jcraft/jsch/ChannelSftp;I)V

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->rq:Lcom/jcraft/jsch/ChannelSftp$RequestQueue;

    .line 200
    return-void

    .line 198
    :cond_a
    new-instance v0, Lcom/jcraft/jsch/JSchException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setBulkRequests: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " must be greater than 0."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic setEnv(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-super {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSession;->setEnv(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic setEnv(Ljava/util/Hashtable;)V
    .registers 2
    .param p1, "x0"    # Ljava/util/Hashtable;

    .prologue
    .line 36
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setEnv(Ljava/util/Hashtable;)V

    return-void
.end method

.method public bridge synthetic setEnv([B[B)V
    .registers 3
    .param p1, "x0"    # [B
    .param p2, "x1"    # [B

    .prologue
    .line 36
    invoke-super {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSession;->setEnv([B[B)V

    return-void
.end method

.method public setFilenameEncoding(Ljava/lang/String;)V
    .registers 6
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    .line 2951
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getServerVersion()I

    move-result v0

    .line 2952
    .local v0, "sversion":I
    const/4 v1, 0x3

    if-gt v1, v0, :cond_1b

    const/4 v1, 0x5

    if-gt v0, v1, :cond_1b

    const-string v1, "UTF-8"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1b

    .line 2954
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const/4 v2, 0x4

    const-string v3, "The encoding can not be changed for this sftp server."

    invoke-direct {v1, v2, v3}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1

    .line 2957
    :cond_1b
    const-string v1, "UTF-8"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_25

    .line 2958
    const-string p1, "UTF-8"

    .line 2960
    :cond_25
    iput-object p1, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    .line 2961
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding_is_utf8:Z

    .line 2962
    return-void
.end method

.method public setMtime(Ljava/lang/String;I)V
    .registers 12
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "mtime"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    .line 2071
    :try_start_1
    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v6, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v6}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 2073
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2075
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v4

    .line 2076
    .local v4, "v":Ljava/util/Vector;
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v5

    .line 2077
    .local v5, "vsize":I
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_15
    if-ge v3, v5, :cond_52

    .line 2078
    invoke-virtual {v4, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    move-object v0, v6

    check-cast v0, Ljava/lang/String;

    move-object p1, v0

    .line 2080
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->_stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v1

    .line 2082
    .local v1, "attr":Lcom/jcraft/jsch/SftpATTRS;
    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Lcom/jcraft/jsch/SftpATTRS;->setFLAGS(I)V

    .line 2083
    invoke-virtual {v1}, Lcom/jcraft/jsch/SftpATTRS;->getATime()I

    move-result v6

    invoke-virtual {v1, v6, p2}, Lcom/jcraft/jsch/SftpATTRS;->setACMODTIME(II)V

    .line 2084
    invoke-direct {p0, p1, v1}, Lcom/jcraft/jsch/ChannelSftp;->_setStat(Ljava/lang/String;Lcom/jcraft/jsch/SftpATTRS;)V
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_33} :catch_36

    .line 2077
    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    .line 2087
    .end local v1    # "attr":Lcom/jcraft/jsch/SftpATTRS;
    .end local v3    # "j":I
    .end local v4    # "v":Ljava/util/Vector;
    .end local v5    # "vsize":I
    :catch_36
    move-exception v2

    .line 2088
    .local v2, "e":Ljava/lang/Exception;
    instance-of v6, v2, Lcom/jcraft/jsch/SftpException;

    if-eqz v6, :cond_3e

    check-cast v2, Lcom/jcraft/jsch/SftpException;

    .end local v2    # "e":Ljava/lang/Exception;
    throw v2

    .line 2089
    .restart local v2    # "e":Ljava/lang/Exception;
    :cond_3e
    instance-of v6, v2, Ljava/lang/Throwable;

    if-eqz v6, :cond_4a

    .line 2090
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v8, v7, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 2091
    :cond_4a
    new-instance v6, Lcom/jcraft/jsch/SftpException;

    const-string v7, ""

    invoke-direct {v6, v8, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v6

    .line 2093
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v3    # "j":I
    .restart local v4    # "v":Ljava/util/Vector;
    .restart local v5    # "vsize":I
    :cond_52
    return-void
.end method

.method public bridge synthetic setPty(Z)V
    .registers 2
    .param p1, "x0"    # Z

    .prologue
    .line 36
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setPty(Z)V

    return-void
.end method

.method public bridge synthetic setPtySize(IIII)V
    .registers 5
    .param p1, "x0"    # I
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # I

    .prologue
    .line 36
    invoke-super {p0, p1, p2, p3, p4}, Lcom/jcraft/jsch/ChannelSession;->setPtySize(IIII)V

    return-void
.end method

.method public bridge synthetic setPtyType(Ljava/lang/String;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setPtyType(Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic setPtyType(Ljava/lang/String;IIII)V
    .registers 6
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # I
    .param p5, "x4"    # I

    .prologue
    .line 36
    invoke-super/range {p0 .. p5}, Lcom/jcraft/jsch/ChannelSession;->setPtyType(Ljava/lang/String;IIII)V

    return-void
.end method

.method public setStat(Ljava/lang/String;Lcom/jcraft/jsch/SftpATTRS;)V
    .registers 11
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "attr"    # Lcom/jcraft/jsch/SftpATTRS;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x4

    .line 2357
    :try_start_1
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v5, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v5}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 2359
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2361
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->glob_remote(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v3

    .line 2362
    .local v3, "v":Ljava/util/Vector;
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v4

    .line 2363
    .local v4, "vsize":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_15
    if-ge v2, v4, :cond_43

    .line 2364
    invoke-virtual {v3, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    move-object v0, v5

    check-cast v0, Ljava/lang/String;

    move-object p1, v0

    .line 2365
    invoke-direct {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSftp;->_setStat(Ljava/lang/String;Lcom/jcraft/jsch/SftpATTRS;)V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_24} :catch_27

    .line 2363
    add-int/lit8 v2, v2, 0x1

    goto :goto_15

    .line 2368
    .end local v2    # "j":I
    .end local v3    # "v":Ljava/util/Vector;
    .end local v4    # "vsize":I
    :catch_27
    move-exception v1

    .line 2369
    .local v1, "e":Ljava/lang/Exception;
    instance-of v5, v1, Lcom/jcraft/jsch/SftpException;

    if-eqz v5, :cond_2f

    check-cast v1, Lcom/jcraft/jsch/SftpException;

    .end local v1    # "e":Ljava/lang/Exception;
    throw v1

    .line 2370
    .restart local v1    # "e":Ljava/lang/Exception;
    :cond_2f
    instance-of v5, v1, Ljava/lang/Throwable;

    if-eqz v5, :cond_3b

    .line 2371
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const-string v6, ""

    invoke-direct {v5, v7, v6, v1}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 2372
    :cond_3b
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const-string v6, ""

    invoke-direct {v5, v7, v6}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v5

    .line 2374
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "j":I
    .restart local v3    # "v":Ljava/util/Vector;
    .restart local v4    # "vsize":I
    :cond_43
    return-void
.end method

.method public bridge synthetic setTerminalMode([B)V
    .registers 2
    .param p1, "x0"    # [B

    .prologue
    .line 36
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setTerminalMode([B)V

    return-void
.end method

.method public bridge synthetic setXForwarding(Z)V
    .registers 2
    .param p1, "x0"    # Z

    .prologue
    .line 36
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setXForwarding(Z)V

    return-void
.end method

.method public start()V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 225
    :try_start_0
    new-instance v7, Ljava/io/PipedOutputStream;

    invoke-direct {v7}, Ljava/io/PipedOutputStream;-><init>()V

    .line 226
    .local v7, "pos":Ljava/io/PipedOutputStream;
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v10, v7}, Lcom/jcraft/jsch/IO;->setOutputStream(Ljava/io/OutputStream;)V

    .line 227
    new-instance v6, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    iget v10, p0, Lcom/jcraft/jsch/ChannelSftp;->rmpsize:I

    invoke-direct {v6, p0, v7, v10}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;-><init>(Lcom/jcraft/jsch/Channel;Ljava/io/PipedOutputStream;I)V

    .line 228
    .local v6, "pis":Ljava/io/PipedInputStream;
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v10, v6}, Lcom/jcraft/jsch/IO;->setInputStream(Ljava/io/InputStream;)V

    .line 230
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->io:Lcom/jcraft/jsch/IO;

    iget-object v10, v10, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    iput-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    .line 232
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    if-nez v10, :cond_30

    .line 233
    new-instance v10, Lcom/jcraft/jsch/JSchException;

    const-string v11, "channel is down"

    invoke-direct {v10, v11}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_28} :catch_28

    .line 311
    .end local v6    # "pis":Ljava/io/PipedInputStream;
    .end local v7    # "pos":Ljava/io/PipedOutputStream;
    :catch_28
    move-exception v0

    .line 313
    .local v0, "e":Ljava/lang/Exception;
    instance-of v10, v0, Lcom/jcraft/jsch/JSchException;

    if-eqz v10, :cond_12e

    check-cast v0, Lcom/jcraft/jsch/JSchException;

    .end local v0    # "e":Ljava/lang/Exception;
    throw v0

    .line 236
    .restart local v6    # "pis":Ljava/io/PipedInputStream;
    .restart local v7    # "pos":Ljava/io/PipedOutputStream;
    :cond_30
    :try_start_30
    new-instance v8, Lcom/jcraft/jsch/RequestSftp;

    invoke-direct {v8}, Lcom/jcraft/jsch/RequestSftp;-><init>()V

    .line 237
    .local v8, "request":Lcom/jcraft/jsch/Request;
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v10

    invoke-virtual {v8, v10, p0}, Lcom/jcraft/jsch/Request;->request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V

    .line 246
    new-instance v10, Lcom/jcraft/jsch/Buffer;

    iget v11, p0, Lcom/jcraft/jsch/ChannelSftp;->lmpsize:I

    invoke-direct {v10, v11}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    iput-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    .line 247
    new-instance v10, Lcom/jcraft/jsch/Packet;

    iget-object v11, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {v10, v11}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    iput-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->packet:Lcom/jcraft/jsch/Packet;

    .line 249
    new-instance v10, Lcom/jcraft/jsch/Buffer;

    iget v11, p0, Lcom/jcraft/jsch/ChannelSftp;->rmpsize:I

    invoke-direct {v10, v11}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    iput-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    .line 250
    new-instance v10, Lcom/jcraft/jsch/Packet;

    iget-object v11, p0, Lcom/jcraft/jsch/ChannelSftp;->obuf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {v10, v11}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    iput-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->opacket:Lcom/jcraft/jsch/Packet;

    .line 252
    const/4 v4, 0x0

    .line 258
    .local v4, "i":I
    invoke-direct {p0}, Lcom/jcraft/jsch/ChannelSftp;->sendINIT()V

    .line 261
    new-instance v3, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v3, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 262
    .local v3, "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v10, v3}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v3

    .line 263
    iget v5, v3, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 264
    .local v5, "length":I
    const/high16 v10, 0x40000

    if-le v5, v10, :cond_8f

    .line 265
    new-instance v10, Lcom/jcraft/jsch/SftpException;

    const/4 v11, 0x4

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Received message is too long: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v10

    .line 268
    :cond_8f
    iget v9, v3, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 269
    .local v9, "type":I
    iget v10, v3, Lcom/jcraft/jsch/ChannelSftp$Header;->rid:I

    iput v10, p0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    .line 271
    new-instance v10, Ljava/util/Hashtable;

    invoke-direct {v10}, Ljava/util/Hashtable;-><init>()V

    iput-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    .line 272
    if-lez v5, :cond_c9

    .line 274
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v10, v5}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 275
    const/4 v2, 0x0

    .line 276
    .local v2, "extension_name":[B
    const/4 v1, 0x0

    .line 277
    .local v1, "extension_data":[B
    :goto_a5
    if-lez v5, :cond_c9

    .line 278
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v10}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v2

    .line 279
    array-length v10, v2

    add-int/lit8 v10, v10, 0x4

    sub-int/2addr v5, v10

    .line 280
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v10}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v1

    .line 281
    array-length v10, v1

    add-int/lit8 v10, v10, 0x4

    sub-int/2addr v5, v10

    .line 282
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    invoke-static {v2}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v11

    invoke-static {v1}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_a5

    .line 287
    .end local v1    # "extension_data":[B
    .end local v2    # "extension_name":[B
    :cond_c9
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    const-string v11, "posix-rename@openssh.com"

    invoke-virtual {v10, v11}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_e6

    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    const-string v11, "posix-rename@openssh.com"

    invoke-virtual {v10, v11}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    const-string v11, "1"

    invoke-virtual {v10, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_e6

    .line 289
    const/4 v10, 0x1

    iput-boolean v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extension_posix_rename:Z

    .line 292
    :cond_e6
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    const-string v11, "statvfs@openssh.com"

    invoke-virtual {v10, v11}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_103

    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    const-string v11, "statvfs@openssh.com"

    invoke-virtual {v10, v11}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    const-string v11, "2"

    invoke-virtual {v10, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_103

    .line 294
    const/4 v10, 0x1

    iput-boolean v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extension_statvfs:Z

    .line 304
    :cond_103
    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    const-string v11, "hardlink@openssh.com"

    invoke-virtual {v10, v11}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_120

    iget-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extensions:Ljava/util/Hashtable;

    const-string v11, "hardlink@openssh.com"

    invoke-virtual {v10, v11}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    const-string v11, "1"

    invoke-virtual {v10, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_120

    .line 306
    const/4 v10, 0x1

    iput-boolean v10, p0, Lcom/jcraft/jsch/ChannelSftp;->extension_hardlink:Z

    .line 309
    :cond_120
    new-instance v10, Ljava/io/File;

    const-string v11, "."

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/jcraft/jsch/ChannelSftp;->lcwd:Ljava/lang/String;
    :try_end_12d
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_12d} :catch_28

    .line 318
    return-void

    .line 314
    .end local v3    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v4    # "i":I
    .end local v5    # "length":I
    .end local v6    # "pis":Ljava/io/PipedInputStream;
    .end local v7    # "pos":Ljava/io/PipedOutputStream;
    .end local v8    # "request":Lcom/jcraft/jsch/Request;
    .end local v9    # "type":I
    .restart local v0    # "e":Ljava/lang/Exception;
    :cond_12e
    instance-of v10, v0, Ljava/lang/Throwable;

    if-eqz v10, :cond_13c

    .line 315
    new-instance v10, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v0}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 316
    :cond_13c
    new-instance v10, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v10
.end method

.method public stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;
    .registers 6
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x4

    .line 2167
    :try_start_1
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v1, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 2169
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2170
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2172
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->_stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_13} :catch_15

    move-result-object v1

    return-object v1

    .line 2174
    :catch_15
    move-exception v0

    .line 2175
    .local v0, "e":Ljava/lang/Exception;
    instance-of v1, v0, Lcom/jcraft/jsch/SftpException;

    if-eqz v1, :cond_1d

    check-cast v0, Lcom/jcraft/jsch/SftpException;

    .end local v0    # "e":Ljava/lang/Exception;
    throw v0

    .line 2176
    .restart local v0    # "e":Ljava/lang/Exception;
    :cond_1d
    instance-of v1, v0, Ljava/lang/Throwable;

    if-eqz v1, :cond_29

    .line 2177
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const-string v2, ""

    invoke-direct {v1, v3, v2, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 2178
    :cond_29
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const-string v2, ""

    invoke-direct {v1, v3, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1
.end method

.method public statVFS(Ljava/lang/String;)Lcom/jcraft/jsch/SftpStatVFS;
    .registers 6
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x4

    .line 2220
    :try_start_1
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v1, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 2222
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2223
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2225
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->_statVFS(Ljava/lang/String;)Lcom/jcraft/jsch/SftpStatVFS;
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_13} :catch_15

    move-result-object v1

    return-object v1

    .line 2227
    :catch_15
    move-exception v0

    .line 2228
    .local v0, "e":Ljava/lang/Exception;
    instance-of v1, v0, Lcom/jcraft/jsch/SftpException;

    if-eqz v1, :cond_1d

    check-cast v0, Lcom/jcraft/jsch/SftpException;

    .end local v0    # "e":Ljava/lang/Exception;
    throw v0

    .line 2229
    .restart local v0    # "e":Ljava/lang/Exception;
    :cond_1d
    instance-of v1, v0, Ljava/lang/Throwable;

    if-eqz v1, :cond_29

    .line 2230
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const-string v2, ""

    invoke-direct {v1, v3, v2, v0}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 2231
    :cond_29
    new-instance v1, Lcom/jcraft/jsch/SftpException;

    const-string v2, ""

    invoke-direct {v1, v3, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v1
.end method

.method public symlink(Ljava/lang/String;Ljava/lang/String;)V
    .registers 14
    .param p1, "oldpath"    # Ljava/lang/String;
    .param p2, "newpath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v10, 0x4

    .line 1776
    iget v7, p0, Lcom/jcraft/jsch/ChannelSftp;->server_version:I

    const/4 v9, 0x3

    if-ge v7, v9, :cond_11

    .line 1777
    new-instance v7, Lcom/jcraft/jsch/SftpException;

    const/16 v8, 0x8

    const-string v9, "The remote sshd is too old to support symlink operation."

    invoke-direct {v7, v8, v9}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v7

    .line 1782
    :cond_11
    :try_start_11
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->io_in:Ljava/io/InputStream;

    check-cast v7, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v7}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->updateReadSide()V

    .line 1784
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1785
    .local v0, "_oldpath":Ljava/lang/String;
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->remoteAbsolutePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1787
    invoke-direct {p0, v0}, Lcom/jcraft/jsch/ChannelSftp;->isUnique(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1788
    const/4 v7, 0x0

    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v9, 0x2f

    if-eq v7, v9, :cond_5a

    .line 1789
    invoke-direct {p0}, Lcom/jcraft/jsch/ChannelSftp;->getCwd()Ljava/lang/String;

    move-result-object v1

    .line 1790
    .local v1, "cwd":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v9

    const-string v7, "/"

    invoke-virtual {v1, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_58

    move v7, v8

    :goto_3e
    add-int/2addr v7, v9

    invoke-virtual {v0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 1796
    .end local v1    # "cwd":Ljava/lang/String;
    :goto_43
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/ChannelSftp;->isPattern(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5c

    .line 1797
    new-instance v7, Lcom/jcraft/jsch/SftpException;

    const/4 v8, 0x4

    invoke-direct {v7, v8, p2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v7
    :try_end_50
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_50} :catch_50

    .line 1819
    .end local v0    # "_oldpath":Ljava/lang/String;
    :catch_50
    move-exception v2

    .line 1820
    .local v2, "e":Ljava/lang/Exception;
    instance-of v7, v2, Lcom/jcraft/jsch/SftpException;

    if-eqz v7, :cond_9f

    check-cast v2, Lcom/jcraft/jsch/SftpException;

    .end local v2    # "e":Ljava/lang/Exception;
    throw v2

    .line 1790
    .restart local v0    # "_oldpath":Ljava/lang/String;
    .restart local v1    # "cwd":Ljava/lang/String;
    :cond_58
    const/4 v7, 0x1

    goto :goto_3e

    .line 1793
    .end local v1    # "cwd":Ljava/lang/String;
    :cond_5a
    move-object p1, v0

    goto :goto_43

    .line 1799
    :cond_5c
    :try_start_5c
    invoke-static {p2}, Lcom/jcraft/jsch/Util;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1801
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p1, v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v7

    iget-object v8, p0, Lcom/jcraft/jsch/ChannelSftp;->fEncoding:Ljava/lang/String;

    invoke-static {p2, v8}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v8

    invoke-direct {p0, v7, v8}, Lcom/jcraft/jsch/ChannelSftp;->sendSYMLINK([B[B)V

    .line 1804
    new-instance v3, Lcom/jcraft/jsch/ChannelSftp$Header;

    invoke-direct {v3, p0}, Lcom/jcraft/jsch/ChannelSftp$Header;-><init>(Lcom/jcraft/jsch/ChannelSftp;)V

    .line 1805
    .local v3, "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v7, v3}, Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object v3

    .line 1806
    iget v5, v3, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 1807
    .local v5, "length":I
    iget v6, v3, Lcom/jcraft/jsch/ChannelSftp$Header;->type:I

    .line 1809
    .local v6, "type":I
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v7, v5}, Lcom/jcraft/jsch/ChannelSftp;->fill(Lcom/jcraft/jsch/Buffer;I)V

    .line 1811
    const/16 v7, 0x65

    if-eq v6, v7, :cond_90

    .line 1812
    new-instance v7, Lcom/jcraft/jsch/SftpException;

    const/4 v8, 0x4

    const-string v9, ""

    invoke-direct {v7, v8, v9}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v7

    .line 1815
    :cond_90
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-virtual {v7}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v4

    .line 1816
    .local v4, "i":I
    if-nez v4, :cond_99

    .line 1825
    :goto_98
    return-void

    .line 1817
    :cond_99
    iget-object v7, p0, Lcom/jcraft/jsch/ChannelSftp;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {p0, v7, v4}, Lcom/jcraft/jsch/ChannelSftp;->throwStatusError(Lcom/jcraft/jsch/Buffer;I)V
    :try_end_9e
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_9e} :catch_50

    goto :goto_98

    .line 1821
    .end local v0    # "_oldpath":Ljava/lang/String;
    .end local v3    # "header":Lcom/jcraft/jsch/ChannelSftp$Header;
    .end local v4    # "i":I
    .end local v5    # "length":I
    .end local v6    # "type":I
    .restart local v2    # "e":Ljava/lang/Exception;
    :cond_9f
    instance-of v7, v2, Ljava/lang/Throwable;

    if-eqz v7, :cond_ab

    .line 1822
    new-instance v7, Lcom/jcraft/jsch/SftpException;

    const-string v8, ""

    invoke-direct {v7, v10, v8, v2}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 1823
    :cond_ab
    new-instance v7, Lcom/jcraft/jsch/SftpException;

    const-string v8, ""

    invoke-direct {v7, v10, v8}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v7
.end method

.method public version()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2404
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp;->version:Ljava/lang/String;

    return-object v0
.end method
