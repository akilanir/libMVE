.class public Lorg/apache/commons/io/FileSystemUtils;
.super Ljava/lang/Object;
.source "FileSystemUtils.java"


# static fields
.field private static final INIT_PROBLEM:I = -0x1

.field private static final INSTANCE:Lorg/apache/commons/io/FileSystemUtils;

.field private static final OS:I

.field private static final OTHER:I = 0x0

.field private static final POSIX_UNIX:I = 0x3

.field private static final UNIX:I = 0x2

.field private static final WINDOWS:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, -0x1

    .line 52
    new-instance v3, Lorg/apache/commons/io/FileSystemUtils;

    invoke-direct {v3}, Lorg/apache/commons/io/FileSystemUtils;-><init>()V

    sput-object v3, Lorg/apache/commons/io/FileSystemUtils;->INSTANCE:Lorg/apache/commons/io/FileSystemUtils;

    .line 68
    const/4 v1, 0x0

    .line 70
    .local v1, "os":I
    :try_start_9
    const-string v3, "os.name"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 71
    .local v2, "osName":Ljava/lang/String;
    if-nez v2, :cond_1e

    .line 72
    new-instance v3, Ljava/io/IOException;

    const-string v4, "os.name not found"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_19} :catch_19

    .line 96
    .end local v2    # "osName":Ljava/lang/String;
    :catch_19
    move-exception v0

    .line 97
    .local v0, "ex":Ljava/lang/Exception;
    const/4 v1, -0x1

    .line 99
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_1b
    sput v1, Lorg/apache/commons/io/FileSystemUtils;->OS:I

    .line 100
    return-void

    .line 74
    .restart local v2    # "osName":Ljava/lang/String;
    :cond_1e
    :try_start_1e
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 76
    const-string v3, "windows"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-eq v3, v4, :cond_2c

    .line 77
    const/4 v1, 0x1

    goto :goto_1b

    .line 78
    :cond_2c
    const-string v3, "linux"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-ne v3, v4, :cond_7c

    const-string v3, "sun os"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-ne v3, v4, :cond_7c

    const-string v3, "sunos"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-ne v3, v4, :cond_7c

    const-string v3, "solaris"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-ne v3, v4, :cond_7c

    const-string v3, "mpe/ix"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-ne v3, v4, :cond_7c

    const-string v3, "freebsd"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-ne v3, v4, :cond_7c

    const-string v3, "irix"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-ne v3, v4, :cond_7c

    const-string v3, "digital unix"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-ne v3, v4, :cond_7c

    const-string v3, "unix"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-ne v3, v4, :cond_7c

    const-string v3, "mac os x"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-eq v3, v4, :cond_7e

    .line 88
    :cond_7c
    const/4 v1, 0x2

    goto :goto_1b

    .line 89
    :cond_7e
    const-string v3, "hp-ux"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-ne v3, v4, :cond_8e

    const-string v3, "aix"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    :try_end_8b
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_8b} :catch_19

    move-result v3

    if-eq v3, v4, :cond_90

    .line 91
    :cond_8e
    const/4 v1, 0x3

    goto :goto_1b

    .line 93
    :cond_90
    const/4 v1, 0x0

    goto :goto_1b
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    return-void
.end method

.method public static freeSpace(Ljava/lang/String;)J
    .registers 4
    .param p0, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 137
    sget-object v0, Lorg/apache/commons/io/FileSystemUtils;->INSTANCE:Lorg/apache/commons/io/FileSystemUtils;

    sget v1, Lorg/apache/commons/io/FileSystemUtils;->OS:I

    const/4 v2, 0x0

    invoke-virtual {v0, p0, v1, v2}, Lorg/apache/commons/io/FileSystemUtils;->freeSpaceOS(Ljava/lang/String;IZ)J

    move-result-wide v0

    return-wide v0
.end method

.method public static freeSpaceKb(Ljava/lang/String;)J
    .registers 4
    .param p0, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 166
    sget-object v0, Lorg/apache/commons/io/FileSystemUtils;->INSTANCE:Lorg/apache/commons/io/FileSystemUtils;

    sget v1, Lorg/apache/commons/io/FileSystemUtils;->OS:I

    const/4 v2, 0x1

    invoke-virtual {v0, p0, v1, v2}, Lorg/apache/commons/io/FileSystemUtils;->freeSpaceOS(Ljava/lang/String;IZ)J

    move-result-wide v0

    return-wide v0
.end method


# virtual methods
.method freeSpaceOS(Ljava/lang/String;IZ)J
    .registers 8
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "os"    # I
    .param p3, "kb"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 189
    if-nez p1, :cond_a

    .line 190
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Path must not be empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 192
    :cond_a
    packed-switch p2, :pswitch_data_38

    .line 202
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Exception caught when determining operating system"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 194
    :pswitch_15
    if-eqz p3, :cond_1f

    invoke-virtual {p0, p1}, Lorg/apache/commons/io/FileSystemUtils;->freeSpaceWindows(Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, 0x400

    div-long/2addr v0, v2

    .line 198
    :goto_1e
    return-wide v0

    .line 194
    :cond_1f
    invoke-virtual {p0, p1}, Lorg/apache/commons/io/FileSystemUtils;->freeSpaceWindows(Ljava/lang/String;)J

    move-result-wide v0

    goto :goto_1e

    .line 196
    :pswitch_24
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p3, v0}, Lorg/apache/commons/io/FileSystemUtils;->freeSpaceUnix(Ljava/lang/String;ZZ)J

    move-result-wide v0

    goto :goto_1e

    .line 198
    :pswitch_2a
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p3, v0}, Lorg/apache/commons/io/FileSystemUtils;->freeSpaceUnix(Ljava/lang/String;ZZ)J

    move-result-wide v0

    goto :goto_1e

    .line 200
    :pswitch_30
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unsupported operating system"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 192
    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_30
        :pswitch_15
        :pswitch_24
        :pswitch_2a
    .end packed-switch
.end method

.method freeSpaceUnix(Ljava/lang/String;ZZ)J
    .registers 14
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "kb"    # Z
    .param p3, "posix"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 306
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_e

    .line 307
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "Path must not be empty"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 309
    :cond_e
    invoke-static {p1}, Lorg/apache/commons/io/FilenameUtils;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 312
    const-string v1, "-"

    .line 313
    .local v1, "flags":Ljava/lang/String;
    if-eqz p2, :cond_29

    .line 314
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "k"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 316
    :cond_29
    if-eqz p3, :cond_3e

    .line 317
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "P"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 319
    :cond_3e
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    const/4 v8, 0x1

    if-le v7, v8, :cond_82

    const/4 v7, 0x3

    new-array v0, v7, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "df"

    aput-object v8, v0, v7

    const/4 v7, 0x1

    aput-object v1, v0, v7

    const/4 v7, 0x2

    aput-object p1, v0, v7

    .line 323
    .local v0, "cmdAttribs":[Ljava/lang/String;
    :goto_53
    const/4 v7, 0x3

    invoke-virtual {p0, v0, v7}, Lorg/apache/commons/io/FileSystemUtils;->performCommand([Ljava/lang/String;I)Ljava/util/List;

    move-result-object v5

    .line 324
    .local v5, "lines":Ljava/util/List;
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v7

    const/4 v8, 0x2

    if-ge v7, v8, :cond_8e

    .line 326
    new-instance v7, Ljava/io/IOException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "Command line \'df\' did not return info as expected for path \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "\'- response was "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 319
    .end local v0    # "cmdAttribs":[Ljava/lang/String;
    .end local v5    # "lines":Ljava/util/List;
    :cond_82
    const/4 v7, 0x2

    new-array v0, v7, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "df"

    aput-object v8, v0, v7

    const/4 v7, 0x1

    aput-object p1, v0, v7

    goto :goto_53

    .line 330
    .restart local v0    # "cmdAttribs":[Ljava/lang/String;
    .restart local v5    # "lines":Ljava/util/List;
    :cond_8e
    const/4 v7, 0x1

    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 333
    .local v3, "line2":Ljava/lang/String;
    new-instance v6, Ljava/util/StringTokenizer;

    const-string v7, " "

    invoke-direct {v6, v3, v7}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 334
    .local v6, "tok":Ljava/util/StringTokenizer;
    invoke-virtual {v6}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v7

    const/4 v8, 0x4

    if-ge v7, v8, :cond_ed

    .line 336
    invoke-virtual {v6}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_ce

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v7

    const/4 v8, 0x3

    if-lt v7, v8, :cond_ce

    .line 337
    const/4 v7, 0x2

    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 338
    .local v4, "line3":Ljava/lang/String;
    new-instance v6, Ljava/util/StringTokenizer;

    .end local v6    # "tok":Ljava/util/StringTokenizer;
    const-string v7, " "

    invoke-direct {v6, v4, v7}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 347
    .end local v4    # "line3":Ljava/lang/String;
    .restart local v6    # "tok":Ljava/util/StringTokenizer;
    :goto_bf
    invoke-virtual {v6}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 348
    invoke-virtual {v6}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 349
    invoke-virtual {v6}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    .line 350
    .local v2, "freeSpace":Ljava/lang/String;
    invoke-virtual {p0, v2, p1}, Lorg/apache/commons/io/FileSystemUtils;->parseBytes(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v7

    return-wide v7

    .line 340
    .end local v2    # "freeSpace":Ljava/lang/String;
    :cond_ce
    new-instance v7, Ljava/io/IOException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "Command line \'df\' did not return data as expected for path \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "\'- check path is valid"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 345
    :cond_ed
    invoke-virtual {v6}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    goto :goto_bf
.end method

.method freeSpaceWindows(Ljava/lang/String;)J
    .registers 11
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, 0x2

    .line 216
    invoke-static {p1}, Lorg/apache/commons/io/FilenameUtils;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 217
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-le v4, v6, :cond_19

    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x3a

    if-ne v4, v5, :cond_19

    .line 218
    invoke-virtual {p1, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 222
    :cond_19
    const/4 v4, 0x3

    new-array v0, v4, [Ljava/lang/String;

    const-string v4, "cmd.exe"

    aput-object v4, v0, v7

    const-string v4, "/C"

    aput-object v4, v0, v8

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "dir /-c "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v0, v6

    .line 225
    .local v0, "cmdAttribs":[Ljava/lang/String;
    const v4, 0x7fffffff

    invoke-virtual {p0, v0, v4}, Lorg/apache/commons/io/FileSystemUtils;->performCommand([Ljava/lang/String;I)Ljava/util/List;

    move-result-object v3

    .line 231
    .local v3, "lines":Ljava/util/List;
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v1, v4, -0x1

    .local v1, "i":I
    :goto_46
    if-ltz v1, :cond_5c

    .line 232
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 233
    .local v2, "line":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_59

    .line 234
    invoke-virtual {p0, v2, p1}, Lorg/apache/commons/io/FileSystemUtils;->parseDir(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v4

    return-wide v4

    .line 231
    :cond_59
    add-int/lit8 v1, v1, -0x1

    goto :goto_46

    .line 238
    .end local v2    # "line":Ljava/lang/String;
    :cond_5c
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Command line \'dir /-c\' did not return any info for path \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method openProcess([Ljava/lang/String;)Ljava/lang/Process;
    .registers 3
    .param p1, "cmdAttribs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 454
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v0

    return-object v0
.end method

.method parseBytes(Ljava/lang/String;Ljava/lang/String;)J
    .registers 9
    .param p1, "freeSpace"    # Ljava/lang/String;
    .param p2, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 364
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    .line 365
    .local v0, "bytes":J
    const-wide/16 v3, 0x0

    cmp-long v3, v0, v3

    if-gez v3, :cond_49

    .line 366
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Command line \'df\' did not find free space in response for path \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\'- check path is valid"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_29
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_29} :catch_29

    .line 372
    .end local v0    # "bytes":J
    :catch_29
    move-exception v2

    .line 373
    .local v2, "ex":Ljava/lang/NumberFormatException;
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Command line \'df\' did not return numeric data as expected for path \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\'- check path is valid"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 370
    .end local v2    # "ex":Ljava/lang/NumberFormatException;
    .restart local v0    # "bytes":J
    :cond_49
    return-wide v0
.end method

.method parseDir(Ljava/lang/String;Ljava/lang/String;)J
    .registers 13
    .param p1, "line"    # Ljava/lang/String;
    .param p2, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x2e

    const/16 v8, 0x2c

    .line 256
    const/4 v2, 0x0

    .line 257
    .local v2, "bytesStart":I
    const/4 v1, 0x0

    .line 258
    .local v1, "bytesEnd":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v4, v7, -0x1

    .line 259
    .local v4, "j":I
    :goto_c
    if-ltz v4, :cond_1a

    .line 260
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 261
    .local v3, "c":C
    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v7

    if-eqz v7, :cond_4d

    .line 264
    add-int/lit8 v1, v4, 0x1

    .line 269
    .end local v3    # "c":C
    :cond_1a
    :goto_1a
    if-ltz v4, :cond_2c

    .line 270
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 271
    .restart local v3    # "c":C
    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v7

    if-nez v7, :cond_50

    if-eq v3, v8, :cond_50

    if-eq v3, v9, :cond_50

    .line 274
    add-int/lit8 v2, v4, 0x1

    .line 279
    .end local v3    # "c":C
    :cond_2c
    if-gez v4, :cond_53

    .line 280
    new-instance v7, Ljava/io/IOException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "Command line \'dir /-c\' did not return valid info for path \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 267
    .restart local v3    # "c":C
    :cond_4d
    add-int/lit8 v4, v4, -0x1

    .line 268
    goto :goto_c

    .line 277
    :cond_50
    add-int/lit8 v4, v4, -0x1

    .line 278
    goto :goto_1a

    .line 286
    .end local v3    # "c":C
    :cond_53
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v7}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 287
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/4 v5, 0x0

    .local v5, "k":I
    :goto_5d
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v7

    if-ge v5, v7, :cond_78

    .line 288
    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v7

    if-eq v7, v8, :cond_6f

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v7

    if-ne v7, v9, :cond_75

    .line 289
    :cond_6f
    add-int/lit8 v6, v5, -0x1

    .end local v5    # "k":I
    .local v6, "k":I
    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->deleteCharAt(I)Ljava/lang/StringBuffer;

    move v5, v6

    .line 287
    .end local v6    # "k":I
    .restart local v5    # "k":I
    :cond_75
    add-int/lit8 v5, v5, 0x1

    goto :goto_5d

    .line 292
    :cond_78
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7, p2}, Lorg/apache/commons/io/FileSystemUtils;->parseBytes(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v7

    return-wide v7
.end method

.method performCommand([Ljava/lang/String;I)Ljava/util/List;
    .registers 15
    .param p1, "cmdAttribs"    # [Ljava/lang/String;
    .param p2, "max"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 397
    new-instance v6, Ljava/util/ArrayList;

    const/16 v9, 0x14

    invoke-direct {v6, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 398
    .local v6, "lines":Ljava/util/List;
    const/4 v8, 0x0

    .line 399
    .local v8, "proc":Ljava/lang/Process;
    const/4 v2, 0x0

    .line 400
    .local v2, "in":Ljava/io/InputStream;
    const/4 v7, 0x0

    .line 401
    .local v7, "out":Ljava/io/OutputStream;
    const/4 v0, 0x0

    .line 402
    .local v0, "err":Ljava/io/InputStream;
    const/4 v3, 0x0

    .line 404
    .local v3, "inr":Ljava/io/BufferedReader;
    :try_start_c
    invoke-virtual {p0, p1}, Lorg/apache/commons/io/FileSystemUtils;->openProcess([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v8

    .line 405
    invoke-virtual {v8}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 406
    invoke-virtual {v8}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v7

    .line 407
    invoke-virtual {v8}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v0

    .line 408
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v9, Ljava/io/InputStreamReader;

    invoke-direct {v9, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v4, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_26
    .catch Ljava/lang/InterruptedException; {:try_start_c .. :try_end_26} :catch_ee
    .catchall {:try_start_c .. :try_end_26} :catchall_a3

    .line 409
    .end local v3    # "inr":Ljava/io/BufferedReader;
    .local v4, "inr":Ljava/io/BufferedReader;
    :try_start_26
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    .line 410
    .local v5, "line":Ljava/lang/String;
    :goto_2a
    if-eqz v5, :cond_42

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v9

    if-ge v9, p2, :cond_42

    .line 411
    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 412
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 413
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    goto :goto_2a

    .line 416
    :cond_42
    invoke-virtual {v8}, Ljava/lang/Process;->waitFor()I

    .line 417
    invoke-virtual {v8}, Ljava/lang/Process;->exitValue()I

    move-result v9

    if-eqz v9, :cond_b6

    .line 419
    new-instance v9, Ljava/io/IOException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "Command line returned OS error code \'"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v8}, Ljava/lang/Process;->exitValue()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\' for command "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_76
    .catch Ljava/lang/InterruptedException; {:try_start_26 .. :try_end_76} :catch_76
    .catchall {:try_start_26 .. :try_end_76} :catchall_d9

    .line 431
    .end local v5    # "line":Ljava/lang/String;
    :catch_76
    move-exception v1

    move-object v3, v4

    .line 432
    .end local v4    # "inr":Ljava/io/BufferedReader;
    .local v1, "ex":Ljava/lang/InterruptedException;
    .restart local v3    # "inr":Ljava/io/BufferedReader;
    :goto_78
    :try_start_78
    new-instance v9, Ljava/io/IOException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "Command line threw an InterruptedException \'"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v1}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\' for command "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_a3
    .catchall {:try_start_78 .. :try_end_a3} :catchall_a3

    .line 436
    .end local v1    # "ex":Ljava/lang/InterruptedException;
    :catchall_a3
    move-exception v9

    :goto_a4
    invoke-static {v2}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 437
    invoke-static {v7}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    .line 438
    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 439
    invoke-static {v3}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/Reader;)V

    .line 440
    if-eqz v8, :cond_b5

    .line 441
    invoke-virtual {v8}, Ljava/lang/Process;->destroy()V

    :cond_b5
    throw v9

    .line 423
    .end local v3    # "inr":Ljava/io/BufferedReader;
    .restart local v4    # "inr":Ljava/io/BufferedReader;
    .restart local v5    # "line":Ljava/lang/String;
    :cond_b6
    :try_start_b6
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v9

    if-nez v9, :cond_dc

    .line 425
    new-instance v9, Ljava/io/IOException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "Command line did not return any info for command "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_d9
    .catch Ljava/lang/InterruptedException; {:try_start_b6 .. :try_end_d9} :catch_76
    .catchall {:try_start_b6 .. :try_end_d9} :catchall_d9

    .line 436
    .end local v5    # "line":Ljava/lang/String;
    :catchall_d9
    move-exception v9

    move-object v3, v4

    .end local v4    # "inr":Ljava/io/BufferedReader;
    .restart local v3    # "inr":Ljava/io/BufferedReader;
    goto :goto_a4

    .end local v3    # "inr":Ljava/io/BufferedReader;
    .restart local v4    # "inr":Ljava/io/BufferedReader;
    .restart local v5    # "line":Ljava/lang/String;
    :cond_dc
    invoke-static {v2}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 437
    invoke-static {v7}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    .line 438
    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 439
    invoke-static {v4}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/Reader;)V

    .line 440
    if-eqz v8, :cond_ed

    .line 441
    invoke-virtual {v8}, Ljava/lang/Process;->destroy()V

    :cond_ed
    return-object v6

    .line 431
    .end local v4    # "inr":Ljava/io/BufferedReader;
    .end local v5    # "line":Ljava/lang/String;
    .restart local v3    # "inr":Ljava/io/BufferedReader;
    :catch_ee
    move-exception v1

    goto :goto_78
.end method
