.class public Lcom/mongodb/gridfs/GridFSInputFile;
.super Lcom/mongodb/gridfs/GridFSFile;
.source "GridFSInputFile.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;
    }
.end annotation


# instance fields
.field private _buffer:[B

.field private _closeStreamOnPersist:Z

.field private _currentBufferPosition:I

.field private _currentChunkNumber:I

.field private final _in:Ljava/io/InputStream;

.field private _messageDigester:Ljava/security/MessageDigest;

.field private _outputStream:Ljava/io/OutputStream;

.field private _savedChunks:Z

.field private _totalBytes:J


# direct methods
.method protected constructor <init>(Lcom/mongodb/gridfs/GridFS;)V
    .registers 3
    .param p1, "fs"    # Lcom/mongodb/gridfs/GridFS;

    .prologue
    const/4 v0, 0x0

    .line 114
    invoke-direct {p0, p1, v0, v0}, Lcom/mongodb/gridfs/GridFSInputFile;-><init>(Lcom/mongodb/gridfs/GridFS;Ljava/io/InputStream;Ljava/lang/String;)V

    .line 115
    return-void
.end method

.method protected constructor <init>(Lcom/mongodb/gridfs/GridFS;Ljava/io/InputStream;Ljava/lang/String;)V
    .registers 5
    .param p1, "fs"    # Lcom/mongodb/gridfs/GridFS;
    .param p2, "in"    # Ljava/io/InputStream;
    .param p3, "filename"    # Ljava/lang/String;

    .prologue
    .line 87
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/mongodb/gridfs/GridFSInputFile;-><init>(Lcom/mongodb/gridfs/GridFS;Ljava/io/InputStream;Ljava/lang/String;Z)V

    .line 88
    return-void
.end method

.method protected constructor <init>(Lcom/mongodb/gridfs/GridFS;Ljava/io/InputStream;Ljava/lang/String;Z)V
    .registers 9
    .param p1, "fs"    # Lcom/mongodb/gridfs/GridFS;
    .param p2, "in"    # Ljava/io/InputStream;
    .param p3, "filename"    # Ljava/lang/String;
    .param p4, "closeStreamOnPersist"    # Z

    .prologue
    const/4 v3, 0x0

    const/4 v1, 0x0

    .line 57
    invoke-direct {p0}, Lcom/mongodb/gridfs/GridFSFile;-><init>()V

    .line 337
    iput-boolean v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_savedChunks:Z

    .line 338
    iput-object v3, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_buffer:[B

    .line 339
    iput v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentChunkNumber:I

    .line 340
    iput v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    .line 341
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_totalBytes:J

    .line 342
    iput-object v3, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_messageDigester:Ljava/security/MessageDigest;

    .line 343
    iput-object v3, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_outputStream:Ljava/io/OutputStream;

    .line 58
    iput-object p1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_fs:Lcom/mongodb/gridfs/GridFS;

    .line 59
    iput-object p2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_in:Ljava/io/InputStream;

    .line 60
    iput-object p3, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_filename:Ljava/lang/String;

    .line 61
    iput-boolean p4, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_closeStreamOnPersist:Z

    .line 63
    new-instance v1, Lorg/bson/types/ObjectId;

    invoke-direct {v1}, Lorg/bson/types/ObjectId;-><init>()V

    iput-object v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_id:Ljava/lang/Object;

    .line 64
    const-wide/32 v1, 0x3fc00

    iput-wide v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    .line 65
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    iput-object v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_uploadDate:Ljava/util/Date;

    .line 67
    :try_start_30
    const-string v1, "MD5"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    iput-object v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_messageDigester:Ljava/security/MessageDigest;
    :try_end_38
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_30 .. :try_end_38} :catch_45

    .line 71
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_messageDigester:Ljava/security/MessageDigest;

    invoke-virtual {v1}, Ljava/security/MessageDigest;->reset()V

    .line 72
    iget-wide v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    long-to-int v1, v1

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_buffer:[B

    .line 73
    return-void

    .line 68
    :catch_45
    move-exception v0

    .line 69
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "No MD5!"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected constructor <init>(Lcom/mongodb/gridfs/GridFS;Ljava/lang/String;)V
    .registers 4
    .param p1, "fs"    # Lcom/mongodb/gridfs/GridFS;
    .param p2, "filename"    # Ljava/lang/String;

    .prologue
    .line 102
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/mongodb/gridfs/GridFSInputFile;-><init>(Lcom/mongodb/gridfs/GridFS;Ljava/io/InputStream;Ljava/lang/String;)V

    .line 103
    return-void
.end method

.method private _dumpBuffer(Z)V
    .registers 9
    .param p1, "writePartial"    # Z

    .prologue
    const/4 v6, 0x0

    .line 264
    iget v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    int-to-long v2, v2

    iget-wide v4, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_d

    if-nez p1, :cond_d

    .line 287
    :cond_c
    :goto_c
    return-void

    .line 268
    :cond_d
    iget v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    if-eqz v2, :cond_c

    .line 273
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_buffer:[B

    .line 274
    .local v1, "writeBuffer":[B
    iget v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    int-to-long v2, v2

    iget-wide v4, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_27

    .line 275
    iget v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    new-array v1, v2, [B

    .line 276
    iget-object v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_buffer:[B

    iget v3, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    invoke-static {v2, v6, v1, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 279
    :cond_27
    iget-object v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_id:Ljava/lang/Object;

    iget v3, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentChunkNumber:I

    invoke-virtual {p0, v2, v3, v1}, Lcom/mongodb/gridfs/GridFSInputFile;->createChunk(Ljava/lang/Object;I[B)Lcom/mongodb/DBObject;

    move-result-object v0

    .line 281
    .local v0, "chunk":Lcom/mongodb/DBObject;
    iget-object v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_fs:Lcom/mongodb/gridfs/GridFS;

    iget-object v2, v2, Lcom/mongodb/gridfs/GridFS;->_chunkCollection:Lcom/mongodb/DBCollection;

    invoke-virtual {v2, v0}, Lcom/mongodb/DBCollection;->save(Lcom/mongodb/DBObject;)Lcom/mongodb/WriteResult;

    .line 283
    iget v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentChunkNumber:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentChunkNumber:I

    .line 284
    iget-wide v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_totalBytes:J

    array-length v4, v1

    int-to-long v4, v4

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_totalBytes:J

    .line 285
    iget-object v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_messageDigester:Ljava/security/MessageDigest;

    invoke-virtual {v2, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 286
    iput v6, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    goto :goto_c
.end method

.method private _finishData()V
    .registers 3

    .prologue
    .line 321
    iget-boolean v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_savedChunks:Z

    if-nez v0, :cond_27

    .line 322
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_messageDigester:Ljava/security/MessageDigest;

    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    invoke-static {v0}, Lcom/mongodb/util/Util;->toHex([B)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_md5:Ljava/lang/String;

    .line 323
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_messageDigester:Ljava/security/MessageDigest;

    .line 324
    iget-wide v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_totalBytes:J

    iput-wide v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_length:J

    .line 325
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_savedChunks:Z

    .line 327
    :try_start_1a
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_in:Ljava/io/InputStream;

    if-eqz v0, :cond_27

    iget-boolean v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_closeStreamOnPersist:Z

    if-eqz v0, :cond_27

    .line 328
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_27} :catch_28

    .line 333
    :cond_27
    :goto_27
    return-void

    .line 329
    :catch_28
    move-exception v0

    goto :goto_27
.end method

.method private _readStream2Buffer()I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 304
    const/4 v0, 0x0

    .line 305
    .local v0, "bytesRead":I
    :cond_1
    :goto_1
    iget v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    int-to-long v1, v1

    iget-wide v3, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    cmp-long v1, v1, v3

    if-gez v1, :cond_2e

    if-ltz v0, :cond_2e

    .line 306
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_in:Ljava/io/InputStream;

    iget-object v2, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_buffer:[B

    iget v3, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    iget-wide v4, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    long-to-int v4, v4

    iget v5, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    sub-int/2addr v4, v5

    invoke-virtual {v1, v2, v3, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 308
    if-lez v0, :cond_24

    .line 309
    iget v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    goto :goto_1

    .line 310
    :cond_24
    if-nez v0, :cond_1

    .line 311
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "i\'m doing something wrong"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 314
    :cond_2e
    return v0
.end method

.method static synthetic access$000(Lcom/mongodb/gridfs/GridFSInputFile;)I
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/gridfs/GridFSInputFile;

    .prologue
    .line 42
    iget v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    return v0
.end method

.method static synthetic access$012(Lcom/mongodb/gridfs/GridFSInputFile;I)I
    .registers 3
    .param p0, "x0"    # Lcom/mongodb/gridfs/GridFSInputFile;
    .param p1, "x1"    # I

    .prologue
    .line 42
    iget v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    return v0
.end method

.method static synthetic access$100(Lcom/mongodb/gridfs/GridFSInputFile;)[B
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/gridfs/GridFSInputFile;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_buffer:[B

    return-object v0
.end method

.method static synthetic access$200(Lcom/mongodb/gridfs/GridFSInputFile;Z)V
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/gridfs/GridFSInputFile;
    .param p1, "x1"    # Z

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/mongodb/gridfs/GridFSInputFile;->_dumpBuffer(Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/mongodb/gridfs/GridFSInputFile;)V
    .registers 1
    .param p0, "x0"    # Lcom/mongodb/gridfs/GridFSInputFile;

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/mongodb/gridfs/GridFSInputFile;->_finishData()V

    return-void
.end method

.method static synthetic access$401(Lcom/mongodb/gridfs/GridFSInputFile;)V
    .registers 1
    .param p0, "x0"    # Lcom/mongodb/gridfs/GridFSInputFile;

    .prologue
    .line 42
    invoke-super {p0}, Lcom/mongodb/gridfs/GridFSFile;->save()V

    return-void
.end method


# virtual methods
.method protected createChunk(Ljava/lang/Object;I[B)Lcom/mongodb/DBObject;
    .registers 7
    .param p1, "id"    # Ljava/lang/Object;
    .param p2, "currentChunkNumber"    # I
    .param p3, "writeBuffer"    # [B

    .prologue
    .line 290
    invoke-static {}, Lcom/mongodb/BasicDBObjectBuilder;->start()Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v0

    const-string v1, "files_id"

    invoke-virtual {v0, v1, p1}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v0

    const-string v1, "n"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v0

    const-string v1, "data"

    invoke-virtual {v0, v1, p3}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/BasicDBObjectBuilder;->get()Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .registers 2

    .prologue
    .line 249
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_outputStream:Ljava/io/OutputStream;

    if-nez v0, :cond_b

    .line 250
    new-instance v0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;

    invoke-direct {v0, p0}, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;-><init>(Lcom/mongodb/gridfs/GridFSInputFile;)V

    iput-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_outputStream:Ljava/io/OutputStream;

    .line 252
    :cond_b
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_outputStream:Ljava/io/OutputStream;

    return-object v0
.end method

.method public save()V
    .registers 3

    .prologue
    .line 158
    iget-wide v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/gridfs/GridFSInputFile;->save(J)V

    .line 159
    return-void
.end method

.method public save(J)V
    .registers 6
    .param p1, "chunkSize"    # J

    .prologue
    .line 170
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_outputStream:Ljava/io/OutputStream;

    if-eqz v1, :cond_c

    .line 171
    new-instance v1, Lcom/mongodb/MongoException;

    const-string v2, "cannot mix OutputStream and regular save()"

    invoke-direct {v1, v2}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 175
    :cond_c
    iget-boolean v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_savedChunks:Z

    if-nez v1, :cond_13

    .line 177
    :try_start_10
    invoke-virtual {p0, p1, p2}, Lcom/mongodb/gridfs/GridFSInputFile;->saveChunks(J)I
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_13} :catch_17

    .line 183
    :cond_13
    invoke-super {p0}, Lcom/mongodb/gridfs/GridFSFile;->save()V

    .line 184
    return-void

    .line 178
    :catch_17
    move-exception v0

    .line 179
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v1, Lcom/mongodb/MongoException;

    const-string v2, "couldn\'t save chunks"

    invoke-direct {v1, v2, v0}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public saveChunks()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 196
    iget-wide v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/gridfs/GridFSInputFile;->saveChunks(J)I

    move-result v0

    return v0
.end method

.method public saveChunks(J)I
    .registers 6
    .param p1, "chunkSize"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 213
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_outputStream:Ljava/io/OutputStream;

    if-eqz v1, :cond_c

    .line 214
    new-instance v1, Lcom/mongodb/MongoException;

    const-string v2, "cannot mix OutputStream and regular save()"

    invoke-direct {v1, v2}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 215
    :cond_c
    iget-boolean v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_savedChunks:Z

    if-eqz v1, :cond_18

    .line 216
    new-instance v1, Lcom/mongodb/MongoException;

    const-string v2, "chunks already saved!"

    invoke-direct {v1, v2}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 218
    :cond_18
    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    if-gtz v1, :cond_26

    .line 219
    new-instance v1, Lcom/mongodb/MongoException;

    const-string v2, "chunkSize must be greater than zero"

    invoke-direct {v1, v2}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 222
    :cond_26
    iget-wide v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    cmp-long v1, v1, p1

    if-eqz v1, :cond_35

    .line 223
    iput-wide p1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    .line 224
    iget-wide v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    long-to-int v1, v1

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_buffer:[B

    .line 227
    :cond_35
    const/4 v0, 0x0

    .line 228
    .local v0, "bytesRead":I
    :goto_36
    if-ltz v0, :cond_44

    .line 229
    const/4 v1, 0x0

    iput v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I

    .line 230
    invoke-direct {p0}, Lcom/mongodb/gridfs/GridFSInputFile;->_readStream2Buffer()I

    move-result v0

    .line 231
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/mongodb/gridfs/GridFSInputFile;->_dumpBuffer(Z)V

    goto :goto_36

    .line 235
    :cond_44
    invoke-direct {p0}, Lcom/mongodb/gridfs/GridFSInputFile;->_finishData()V

    .line 236
    iget v1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_currentChunkNumber:I

    return v1
.end method

.method public setChunkSize(J)V
    .registers 5
    .param p1, "chunkSize"    # J

    .prologue
    .line 146
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_outputStream:Ljava/io/OutputStream;

    if-nez v0, :cond_8

    iget-boolean v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_savedChunks:Z

    if-eqz v0, :cond_9

    .line 150
    :cond_8
    :goto_8
    return-void

    .line 148
    :cond_9
    iput-wide p1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    .line 149
    iget-wide v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    long-to-int v0, v0

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_buffer:[B

    goto :goto_8
.end method

.method public setContentType(Ljava/lang/String;)V
    .registers 2
    .param p1, "ct"    # Ljava/lang/String;

    .prologue
    .line 138
    iput-object p1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_contentType:Ljava/lang/String;

    .line 139
    return-void
.end method

.method public setFilename(Ljava/lang/String;)V
    .registers 2
    .param p1, "fn"    # Ljava/lang/String;

    .prologue
    .line 128
    iput-object p1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_filename:Ljava/lang/String;

    .line 129
    return-void
.end method

.method public setId(Ljava/lang/Object;)V
    .registers 2
    .param p1, "id"    # Ljava/lang/Object;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/mongodb/gridfs/GridFSInputFile;->_id:Ljava/lang/Object;

    .line 119
    return-void
.end method
