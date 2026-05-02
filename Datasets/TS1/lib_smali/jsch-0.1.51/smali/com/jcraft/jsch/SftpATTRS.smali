.class public Lcom/jcraft/jsch/SftpATTRS;
.super Ljava/lang/Object;
.source "SftpATTRS.java"


# static fields
.field public static final SSH_FILEXFER_ATTR_ACMODTIME:I = 0x8

.field public static final SSH_FILEXFER_ATTR_EXTENDED:I = -0x80000000

.field public static final SSH_FILEXFER_ATTR_PERMISSIONS:I = 0x4

.field public static final SSH_FILEXFER_ATTR_SIZE:I = 0x1

.field public static final SSH_FILEXFER_ATTR_UIDGID:I = 0x2

.field static final S_IEXEC:I = 0x40

.field static final S_IFBLK:I = 0x6000

.field static final S_IFCHR:I = 0x2000

.field static final S_IFDIR:I = 0x4000

.field static final S_IFIFO:I = 0x1000

.field static final S_IFLNK:I = 0xa000

.field static final S_IFMT:I = 0xf000

.field static final S_IFREG:I = 0x8000

.field static final S_IFSOCK:I = 0xc000

.field static final S_IREAD:I = 0x100

.field static final S_IRGRP:I = 0x20

.field static final S_IROTH:I = 0x4

.field static final S_IRUSR:I = 0x100

.field static final S_ISGID:I = 0x400

.field static final S_ISUID:I = 0x800

.field static final S_ISVTX:I = 0x200

.field static final S_IWGRP:I = 0x10

.field static final S_IWOTH:I = 0x2

.field static final S_IWRITE:I = 0x80

.field static final S_IWUSR:I = 0x80

.field static final S_IXGRP:I = 0x8

.field static final S_IXOTH:I = 0x1

.field static final S_IXUSR:I = 0x40

.field private static final pmask:I = 0xfff


# instance fields
.field atime:I

.field extended:[Ljava/lang/String;

.field flags:I

.field gid:I

.field mtime:I

.field permissions:I

.field size:J

.field uid:I


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 135
    const/4 v0, 0x0

    iput v0, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    .line 142
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/SftpATTRS;->extended:[Ljava/lang/String;

    .line 145
    return-void
.end method

.method static getATTR(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/SftpATTRS;
    .registers 7
    .param p0, "buf"    # Lcom/jcraft/jsch/Buffer;

    .prologue
    .line 148
    new-instance v0, Lcom/jcraft/jsch/SftpATTRS;

    invoke-direct {v0}, Lcom/jcraft/jsch/SftpATTRS;-><init>()V

    .line 149
    .local v0, "attr":Lcom/jcraft/jsch/SftpATTRS;
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    iput v3, v0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    .line 150
    iget v3, v0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    and-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_17

    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v3

    iput-wide v3, v0, Lcom/jcraft/jsch/SftpATTRS;->size:J

    .line 151
    :cond_17
    iget v3, v0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    and-int/lit8 v3, v3, 0x2

    if-eqz v3, :cond_29

    .line 152
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    iput v3, v0, Lcom/jcraft/jsch/SftpATTRS;->uid:I

    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    iput v3, v0, Lcom/jcraft/jsch/SftpATTRS;->gid:I

    .line 154
    :cond_29
    iget v3, v0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    and-int/lit8 v3, v3, 0x4

    if-eqz v3, :cond_35

    .line 155
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    iput v3, v0, Lcom/jcraft/jsch/SftpATTRS;->permissions:I

    .line 157
    :cond_35
    iget v3, v0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    and-int/lit8 v3, v3, 0x8

    if-eqz v3, :cond_41

    .line 158
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    iput v3, v0, Lcom/jcraft/jsch/SftpATTRS;->atime:I

    .line 160
    :cond_41
    iget v3, v0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    and-int/lit8 v3, v3, 0x8

    if-eqz v3, :cond_4d

    .line 161
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    iput v3, v0, Lcom/jcraft/jsch/SftpATTRS;->mtime:I

    .line 163
    :cond_4d
    iget v3, v0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    const/high16 v4, -0x80000000

    and-int/2addr v3, v4

    if-eqz v3, :cond_84

    .line 164
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v1

    .line 165
    .local v1, "count":I
    if-lez v1, :cond_84

    .line 166
    mul-int/lit8 v3, v1, 0x2

    new-array v3, v3, [Ljava/lang/String;

    iput-object v3, v0, Lcom/jcraft/jsch/SftpATTRS;->extended:[Ljava/lang/String;

    .line 167
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_61
    if-ge v2, v1, :cond_84

    .line 168
    iget-object v3, v0, Lcom/jcraft/jsch/SftpATTRS;->extended:[Ljava/lang/String;

    mul-int/lit8 v4, v2, 0x2

    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v5

    invoke-static {v5}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    .line 169
    iget-object v3, v0, Lcom/jcraft/jsch/SftpATTRS;->extended:[Ljava/lang/String;

    mul-int/lit8 v4, v2, 0x2

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v5

    invoke-static {v5}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    .line 167
    add-int/lit8 v2, v2, 0x1

    goto :goto_61

    .line 173
    .end local v1    # "count":I
    .end local v2    # "i":I
    :cond_84
    return-object v0
.end method

.method private isType(I)Z
    .registers 4
    .param p1, "mask"    # I

    .prologue
    .line 241
    iget v0, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_10

    iget v0, p0, Lcom/jcraft/jsch/SftpATTRS;->permissions:I

    const v1, 0xf000

    and-int/2addr v0, v1

    if-ne v0, p1, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method


# virtual methods
.method dump(Lcom/jcraft/jsch/Buffer;)V
    .registers 6
    .param p1, "buf"    # Lcom/jcraft/jsch/Buffer;

    .prologue
    .line 197
    iget v2, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    invoke-virtual {p1, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 198
    iget v2, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_10

    iget-wide v2, p0, Lcom/jcraft/jsch/SftpATTRS;->size:J

    invoke-virtual {p1, v2, v3}, Lcom/jcraft/jsch/Buffer;->putLong(J)V

    .line 199
    :cond_10
    iget v2, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_20

    .line 200
    iget v2, p0, Lcom/jcraft/jsch/SftpATTRS;->uid:I

    invoke-virtual {p1, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    iget v2, p0, Lcom/jcraft/jsch/SftpATTRS;->gid:I

    invoke-virtual {p1, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 202
    :cond_20
    iget v2, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    and-int/lit8 v2, v2, 0x4

    if-eqz v2, :cond_2b

    .line 203
    iget v2, p0, Lcom/jcraft/jsch/SftpATTRS;->permissions:I

    invoke-virtual {p1, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 205
    :cond_2b
    iget v2, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    and-int/lit8 v2, v2, 0x8

    if-eqz v2, :cond_36

    iget v2, p0, Lcom/jcraft/jsch/SftpATTRS;->atime:I

    invoke-virtual {p1, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 206
    :cond_36
    iget v2, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    and-int/lit8 v2, v2, 0x8

    if-eqz v2, :cond_41

    iget v2, p0, Lcom/jcraft/jsch/SftpATTRS;->mtime:I

    invoke-virtual {p1, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 207
    :cond_41
    iget v2, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    const/high16 v3, -0x80000000

    and-int/2addr v2, v3

    if-eqz v2, :cond_71

    .line 208
    iget-object v2, p0, Lcom/jcraft/jsch/SftpATTRS;->extended:[Ljava/lang/String;

    array-length v2, v2

    div-int/lit8 v0, v2, 0x2

    .line 209
    .local v0, "count":I
    if-lez v0, :cond_71

    .line 210
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_50
    if-ge v1, v0, :cond_71

    .line 211
    iget-object v2, p0, Lcom/jcraft/jsch/SftpATTRS;->extended:[Ljava/lang/String;

    mul-int/lit8 v3, v1, 0x2

    aget-object v2, v2, v3

    invoke-static {v2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 212
    iget-object v2, p0, Lcom/jcraft/jsch/SftpATTRS;->extended:[Ljava/lang/String;

    mul-int/lit8 v3, v1, 0x2

    add-int/lit8 v3, v3, 0x1

    aget-object v2, v2, v3

    invoke-static {v2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 210
    add-int/lit8 v1, v1, 0x1

    goto :goto_50

    .line 216
    .end local v0    # "count":I
    .end local v1    # "i":I
    :cond_71
    return-void
.end method

.method public getATime()I
    .registers 2

    .prologue
    .line 278
    iget v0, p0, Lcom/jcraft/jsch/SftpATTRS;->atime:I

    return v0
.end method

.method public getAtimeString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 111
    new-instance v0, Ljava/util/Date;

    iget v1, p0, Lcom/jcraft/jsch/SftpATTRS;->atime:I

    int-to-long v1, v1

    const-wide/16 v3, 0x3e8

    mul-long/2addr v1, v3

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 112
    .local v0, "date":Ljava/util/Date;
    invoke-virtual {v0}, Ljava/util/Date;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getExtended()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 280
    iget-object v0, p0, Lcom/jcraft/jsch/SftpATTRS;->extended:[Ljava/lang/String;

    return-object v0
.end method

.method public getFlags()I
    .registers 2

    .prologue
    .line 273
    iget v0, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    return v0
.end method

.method public getGId()I
    .registers 2

    .prologue
    .line 276
    iget v0, p0, Lcom/jcraft/jsch/SftpATTRS;->gid:I

    return v0
.end method

.method public getMTime()I
    .registers 2

    .prologue
    .line 279
    iget v0, p0, Lcom/jcraft/jsch/SftpATTRS;->mtime:I

    return v0
.end method

.method public getMtimeString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 116
    new-instance v0, Ljava/util/Date;

    iget v1, p0, Lcom/jcraft/jsch/SftpATTRS;->mtime:I

    int-to-long v1, v1

    const-wide/16 v3, 0x3e8

    mul-long/2addr v1, v3

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 117
    .local v0, "date":Ljava/util/Date;
    invoke-virtual {v0}, Ljava/util/Date;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getPermissions()I
    .registers 2

    .prologue
    .line 277
    iget v0, p0, Lcom/jcraft/jsch/SftpATTRS;->permissions:I

    return v0
.end method

.method public getPermissionsString()Ljava/lang/String;
    .registers 8

    .prologue
    const/16 v6, 0x73

    const/16 v5, 0x78

    const/16 v4, 0x77

    const/16 v3, 0x72

    const/16 v2, 0x2d

    .line 73
    new-instance v0, Ljava/lang/StringBuffer;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 75
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpATTRS;->isDir()Z

    move-result v1

    if-eqz v1, :cond_72

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 79
    :goto_1c
    iget v1, p0, Lcom/jcraft/jsch/SftpATTRS;->permissions:I

    and-int/lit16 v1, v1, 0x100

    if-eqz v1, :cond_82

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 82
    :goto_25
    iget v1, p0, Lcom/jcraft/jsch/SftpATTRS;->permissions:I

    and-int/lit16 v1, v1, 0x80

    if-eqz v1, :cond_86

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 85
    :goto_2e
    iget v1, p0, Lcom/jcraft/jsch/SftpATTRS;->permissions:I

    and-int/lit16 v1, v1, 0x800

    if-eqz v1, :cond_8a

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 89
    :goto_37
    iget v1, p0, Lcom/jcraft/jsch/SftpATTRS;->permissions:I

    and-int/lit8 v1, v1, 0x20

    if-eqz v1, :cond_98

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 92
    :goto_40
    iget v1, p0, Lcom/jcraft/jsch/SftpATTRS;->permissions:I

    and-int/lit8 v1, v1, 0x10

    if-eqz v1, :cond_9c

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 95
    :goto_49
    iget v1, p0, Lcom/jcraft/jsch/SftpATTRS;->permissions:I

    and-int/lit16 v1, v1, 0x400

    if-eqz v1, :cond_a0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 99
    :goto_52
    iget v1, p0, Lcom/jcraft/jsch/SftpATTRS;->permissions:I

    and-int/lit8 v1, v1, 0x4

    if-eqz v1, :cond_ae

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 102
    :goto_5b
    iget v1, p0, Lcom/jcraft/jsch/SftpATTRS;->permissions:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_b2

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 105
    :goto_64
    iget v1, p0, Lcom/jcraft/jsch/SftpATTRS;->permissions:I

    and-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_b6

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 107
    :goto_6d
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 76
    :cond_72
    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpATTRS;->isLink()Z

    move-result v1

    if-eqz v1, :cond_7e

    const/16 v1, 0x6c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1c

    .line 77
    :cond_7e
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1c

    .line 80
    :cond_82
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_25

    .line 83
    :cond_86
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2e

    .line 86
    :cond_8a
    iget v1, p0, Lcom/jcraft/jsch/SftpATTRS;->permissions:I

    and-int/lit8 v1, v1, 0x40

    if-eqz v1, :cond_94

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_37

    .line 87
    :cond_94
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_37

    .line 90
    :cond_98
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_40

    .line 93
    :cond_9c
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_49

    .line 96
    :cond_a0
    iget v1, p0, Lcom/jcraft/jsch/SftpATTRS;->permissions:I

    and-int/lit8 v1, v1, 0x8

    if-eqz v1, :cond_aa

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_52

    .line 97
    :cond_aa
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_52

    .line 100
    :cond_ae
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_5b

    .line 103
    :cond_b2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_64

    .line 106
    :cond_b6
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_6d
.end method

.method public getSize()J
    .registers 3

    .prologue
    .line 274
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpATTRS;->size:J

    return-wide v0
.end method

.method public getUId()I
    .registers 2

    .prologue
    .line 275
    iget v0, p0, Lcom/jcraft/jsch/SftpATTRS;->uid:I

    return v0
.end method

.method public isBlk()Z
    .registers 2

    .prologue
    .line 258
    const/16 v0, 0x6000

    invoke-direct {p0, v0}, Lcom/jcraft/jsch/SftpATTRS;->isType(I)Z

    move-result v0

    return v0
.end method

.method public isChr()Z
    .registers 2

    .prologue
    .line 254
    const/16 v0, 0x2000

    invoke-direct {p0, v0}, Lcom/jcraft/jsch/SftpATTRS;->isType(I)Z

    move-result v0

    return v0
.end method

.method public isDir()Z
    .registers 2

    .prologue
    .line 250
    const/16 v0, 0x4000

    invoke-direct {p0, v0}, Lcom/jcraft/jsch/SftpATTRS;->isType(I)Z

    move-result v0

    return v0
.end method

.method public isFifo()Z
    .registers 2

    .prologue
    .line 262
    const/16 v0, 0x1000

    invoke-direct {p0, v0}, Lcom/jcraft/jsch/SftpATTRS;->isType(I)Z

    move-result v0

    return v0
.end method

.method public isLink()Z
    .registers 2

    .prologue
    .line 266
    const v0, 0xa000

    invoke-direct {p0, v0}, Lcom/jcraft/jsch/SftpATTRS;->isType(I)Z

    move-result v0

    return v0
.end method

.method public isReg()Z
    .registers 2

    .prologue
    .line 246
    const v0, 0x8000

    invoke-direct {p0, v0}, Lcom/jcraft/jsch/SftpATTRS;->isType(I)Z

    move-result v0

    return v0
.end method

.method public isSock()Z
    .registers 2

    .prologue
    .line 270
    const v0, 0xc000

    invoke-direct {p0, v0}, Lcom/jcraft/jsch/SftpATTRS;->isType(I)Z

    move-result v0

    return v0
.end method

.method length()I
    .registers 6

    .prologue
    .line 177
    const/4 v2, 0x4

    .line 179
    .local v2, "len":I
    iget v3, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    and-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_9

    add-int/lit8 v2, v2, 0x8

    .line 180
    :cond_9
    iget v3, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    and-int/lit8 v3, v3, 0x2

    if-eqz v3, :cond_11

    add-int/lit8 v2, v2, 0x8

    .line 181
    :cond_11
    iget v3, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    and-int/lit8 v3, v3, 0x4

    if-eqz v3, :cond_19

    add-int/lit8 v2, v2, 0x4

    .line 182
    :cond_19
    iget v3, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    and-int/lit8 v3, v3, 0x8

    if-eqz v3, :cond_21

    add-int/lit8 v2, v2, 0x8

    .line 183
    :cond_21
    iget v3, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    const/high16 v4, -0x80000000

    and-int/2addr v3, v4

    if-eqz v3, :cond_53

    .line 184
    add-int/lit8 v2, v2, 0x4

    .line 185
    iget-object v3, p0, Lcom/jcraft/jsch/SftpATTRS;->extended:[Ljava/lang/String;

    array-length v3, v3

    div-int/lit8 v0, v3, 0x2

    .line 186
    .local v0, "count":I
    if-lez v0, :cond_53

    .line 187
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_32
    if-ge v1, v0, :cond_53

    .line 188
    add-int/lit8 v2, v2, 0x4

    iget-object v3, p0, Lcom/jcraft/jsch/SftpATTRS;->extended:[Ljava/lang/String;

    mul-int/lit8 v4, v1, 0x2

    aget-object v3, v3, v4

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v2, v3

    .line 189
    add-int/lit8 v2, v2, 0x4

    iget-object v3, p0, Lcom/jcraft/jsch/SftpATTRS;->extended:[Ljava/lang/String;

    mul-int/lit8 v4, v1, 0x2

    add-int/lit8 v4, v4, 0x1

    aget-object v3, v3, v4

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v2, v3

    .line 187
    add-int/lit8 v1, v1, 0x1

    goto :goto_32

    .line 193
    .end local v0    # "count":I
    .end local v1    # "i":I
    :cond_53
    return v2
.end method

.method public setACMODTIME(II)V
    .registers 4
    .param p1, "atime"    # I
    .param p2, "mtime"    # I

    .prologue
    .line 230
    iget v0, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    .line 231
    iput p1, p0, Lcom/jcraft/jsch/SftpATTRS;->atime:I

    .line 232
    iput p2, p0, Lcom/jcraft/jsch/SftpATTRS;->mtime:I

    .line 233
    return-void
.end method

.method setFLAGS(I)V
    .registers 2
    .param p1, "flags"    # I

    .prologue
    .line 218
    iput p1, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    .line 219
    return-void
.end method

.method public setPERMISSIONS(I)V
    .registers 4
    .param p1, "permissions"    # I

    .prologue
    .line 235
    iget v0, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    .line 236
    iget v0, p0, Lcom/jcraft/jsch/SftpATTRS;->permissions:I

    and-int/lit16 v0, v0, -0x1000

    and-int/lit16 v1, p1, 0xfff

    or-int p1, v0, v1

    .line 237
    iput p1, p0, Lcom/jcraft/jsch/SftpATTRS;->permissions:I

    .line 238
    return-void
.end method

.method public setSIZE(J)V
    .registers 4
    .param p1, "size"    # J

    .prologue
    .line 221
    iget v0, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    .line 222
    iput-wide p1, p0, Lcom/jcraft/jsch/SftpATTRS;->size:J

    .line 223
    return-void
.end method

.method public setUIDGID(II)V
    .registers 4
    .param p1, "uid"    # I
    .param p2, "gid"    # I

    .prologue
    .line 225
    iget v0, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/jcraft/jsch/SftpATTRS;->flags:I

    .line 226
    iput p1, p0, Lcom/jcraft/jsch/SftpATTRS;->uid:I

    .line 227
    iput p2, p0, Lcom/jcraft/jsch/SftpATTRS;->gid:I

    .line 228
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 283
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpATTRS;->getPermissionsString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpATTRS;->getUId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpATTRS;->getGId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpATTRS;->getSize()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpATTRS;->getMtimeString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
