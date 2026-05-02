.class public Lcom/jcraft/jsch/SftpStatVFS;
.super Ljava/lang/Object;
.source "SftpStatVFS.java"


# instance fields
.field atime:I

.field private bavail:J

.field private bfree:J

.field private blocks:J

.field private bsize:J

.field extended:[Ljava/lang/String;

.field private favail:J

.field private ffree:J

.field private files:J

.field private flag:J

.field flags:I

.field private frsize:J

.field private fsid:J

.field gid:I

.field mtime:I

.field private namemax:J

.field permissions:I

.field size:J

.field uid:I


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const/4 v0, 0x0

    iput v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->flags:I

    .line 61
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->extended:[Ljava/lang/String;

    .line 64
    return-void
.end method

.method static getStatVFS(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/SftpStatVFS;
    .registers 8
    .param p0, "buf"    # Lcom/jcraft/jsch/Buffer;

    .prologue
    const-wide/16 v4, 0x0

    .line 67
    new-instance v1, Lcom/jcraft/jsch/SftpStatVFS;

    invoke-direct {v1}, Lcom/jcraft/jsch/SftpStatVFS;-><init>()V

    .line 69
    .local v1, "statvfs":Lcom/jcraft/jsch/SftpStatVFS;
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->bsize:J

    .line 70
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->frsize:J

    .line 71
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->blocks:J

    .line 72
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->bfree:J

    .line 73
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->bavail:J

    .line 74
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->files:J

    .line 75
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->ffree:J

    .line 76
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->favail:J

    .line 77
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->fsid:J

    .line 78
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    long-to-int v0, v2

    .line 79
    .local v0, "flag":I
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->namemax:J

    .line 81
    and-int/lit8 v2, v0, 0x1

    if-eqz v2, :cond_5c

    const-wide/16 v2, 0x1

    :goto_4e
    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->flag:J

    .line 83
    iget-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->flag:J

    and-int/lit8 v6, v0, 0x2

    if-eqz v6, :cond_58

    const-wide/16 v4, 0x2

    :cond_58
    or-long/2addr v2, v4

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->flag:J

    .line 86
    return-object v1

    :cond_5c
    move-wide v2, v4

    .line 81
    goto :goto_4e
.end method


# virtual methods
.method public getAvail()J
    .registers 5

    .prologue
    .line 114
    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getFragmentSize()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getFreeBlocks()J

    move-result-wide v2

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x400

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public getAvailBlocks()J
    .registers 3

    .prologue
    .line 93
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->bavail:J

    return-wide v0
.end method

.method public getAvailForNonRoot()J
    .registers 5

    .prologue
    .line 110
    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getFragmentSize()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getAvailBlocks()J

    move-result-wide v2

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x400

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public getAvailINodes()J
    .registers 3

    .prologue
    .line 96
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->favail:J

    return-wide v0
.end method

.method public getBlockSize()J
    .registers 3

    .prologue
    .line 89
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->bsize:J

    return-wide v0
.end method

.method public getBlocks()J
    .registers 3

    .prologue
    .line 91
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->blocks:J

    return-wide v0
.end method

.method public getCapacity()I
    .registers 7

    .prologue
    .line 118
    const-wide/16 v0, 0x64

    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getBlocks()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getFreeBlocks()J

    move-result-wide v4

    sub-long/2addr v2, v4

    mul-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getBlocks()J

    move-result-wide v2

    div-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

.method public getFileSystemID()J
    .registers 3

    .prologue
    .line 97
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->fsid:J

    return-wide v0
.end method

.method public getFragmentSize()J
    .registers 3

    .prologue
    .line 90
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->frsize:J

    return-wide v0
.end method

.method public getFreeBlocks()J
    .registers 3

    .prologue
    .line 92
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->bfree:J

    return-wide v0
.end method

.method public getFreeINodes()J
    .registers 3

    .prologue
    .line 95
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->ffree:J

    return-wide v0
.end method

.method public getINodes()J
    .registers 3

    .prologue
    .line 94
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->files:J

    return-wide v0
.end method

.method public getMaximumFilenameLength()J
    .registers 3

    .prologue
    .line 99
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->namemax:J

    return-wide v0
.end method

.method public getMountFlag()J
    .registers 3

    .prologue
    .line 98
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->flag:J

    return-wide v0
.end method

.method public getSize()J
    .registers 5

    .prologue
    .line 102
    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getFragmentSize()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getBlocks()J

    move-result-wide v2

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x400

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public getUsed()J
    .registers 7

    .prologue
    .line 106
    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getFragmentSize()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getBlocks()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getFreeBlocks()J

    move-result-wide v4

    sub-long/2addr v2, v4

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x400

    div-long/2addr v0, v2

    return-wide v0
.end method
