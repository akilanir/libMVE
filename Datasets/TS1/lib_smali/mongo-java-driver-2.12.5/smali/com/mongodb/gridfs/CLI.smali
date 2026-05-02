.class public Lcom/mongodb/gridfs/CLI;
.super Ljava/lang/Object;
.source "CLI.java"


# static fields
.field private static _gridfs:Lcom/mongodb/gridfs/GridFS;

.field private static _mongo:Lcom/mongodb/Mongo;

.field private static db:Ljava/lang/String;

.field private static uri:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 49
    const-string v0, "test"

    sput-object v0, Lcom/mongodb/gridfs/CLI;->db:Ljava/lang/String;

    .line 50
    const-string v0, "mongodb://127.0.0.1"

    sput-object v0, Lcom/mongodb/gridfs/CLI;->uri:Ljava/lang/String;

    .line 51
    const/4 v0, 0x0

    sput-object v0, Lcom/mongodb/gridfs/CLI;->_mongo:Lcom/mongodb/Mongo;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getGridFS()Lcom/mongodb/gridfs/GridFS;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 65
    sget-object v0, Lcom/mongodb/gridfs/CLI;->_gridfs:Lcom/mongodb/gridfs/GridFS;

    if-nez v0, :cond_15

    .line 66
    new-instance v0, Lcom/mongodb/gridfs/GridFS;

    invoke-static {}, Lcom/mongodb/gridfs/CLI;->getMongo()Lcom/mongodb/Mongo;

    move-result-object v1

    sget-object v2, Lcom/mongodb/gridfs/CLI;->db:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/mongodb/Mongo;->getDB(Ljava/lang/String;)Lcom/mongodb/DB;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/mongodb/gridfs/GridFS;-><init>(Lcom/mongodb/DB;)V

    sput-object v0, Lcom/mongodb/gridfs/CLI;->_gridfs:Lcom/mongodb/gridfs/GridFS;

    .line 67
    :cond_15
    sget-object v0, Lcom/mongodb/gridfs/CLI;->_gridfs:Lcom/mongodb/gridfs/GridFS;

    return-object v0
.end method

.method private static getMongo()Lcom/mongodb/Mongo;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 56
    sget-object v0, Lcom/mongodb/gridfs/CLI;->_mongo:Lcom/mongodb/Mongo;

    if-nez v0, :cond_12

    .line 57
    new-instance v0, Lcom/mongodb/MongoClient;

    new-instance v1, Lcom/mongodb/MongoClientURI;

    sget-object v2, Lcom/mongodb/gridfs/CLI;->uri:Ljava/lang/String;

    invoke-direct {v1, v2}, Lcom/mongodb/MongoClientURI;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/mongodb/MongoClient;-><init>(Lcom/mongodb/MongoClientURI;)V

    sput-object v0, Lcom/mongodb/gridfs/CLI;->_mongo:Lcom/mongodb/Mongo;

    .line 59
    :cond_12
    sget-object v0, Lcom/mongodb/gridfs/CLI;->_mongo:Lcom/mongodb/Mongo;

    return-object v0
.end method

.method public static main([Ljava/lang/String;)V
    .registers 21
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 72
    move-object/from16 v0, p0

    array-length v13, v0

    const/4 v14, 0x1

    if-ge v13, v14, :cond_a

    .line 73
    invoke-static {}, Lcom/mongodb/gridfs/CLI;->printUsage()V

    .line 167
    :cond_9
    :goto_9
    return-void

    .line 77
    :cond_a
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_b
    move-object/from16 v0, p0

    array-length v13, v0

    if-ge v5, v13, :cond_9

    .line 78
    aget-object v12, p0, v5

    .line 80
    .local v12, "s":Ljava/lang/String;
    const-string v13, "--db"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_25

    .line 81
    add-int/lit8 v13, v5, 0x1

    aget-object v13, p0, v13

    sput-object v13, Lcom/mongodb/gridfs/CLI;->db:Ljava/lang/String;

    .line 82
    add-int/lit8 v5, v5, 0x1

    .line 77
    :goto_22
    add-int/lit8 v5, v5, 0x1

    goto :goto_b

    .line 86
    :cond_25
    const-string v13, "--host"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_49

    .line 87
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mongodb://"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    add-int/lit8 v14, v5, 0x1

    aget-object v14, p0, v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    sput-object v13, Lcom/mongodb/gridfs/CLI;->uri:Ljava/lang/String;

    .line 88
    add-int/lit8 v5, v5, 0x1

    .line 89
    goto :goto_22

    .line 92
    :cond_49
    const-string v13, "--uri"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_5a

    .line 93
    add-int/lit8 v13, v5, 0x1

    aget-object v13, p0, v13

    sput-object v13, Lcom/mongodb/gridfs/CLI;->uri:Ljava/lang/String;

    .line 94
    add-int/lit8 v5, v5, 0x1

    .line 95
    goto :goto_22

    .line 98
    :cond_5a
    const-string v13, "help"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_66

    .line 99
    invoke-static {}, Lcom/mongodb/gridfs/CLI;->printUsage()V

    goto :goto_9

    .line 103
    :cond_66
    const-string v13, "list"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_c8

    .line 104
    invoke-static {}, Lcom/mongodb/gridfs/CLI;->getGridFS()Lcom/mongodb/gridfs/GridFS;

    move-result-object v4

    .line 106
    .local v4, "fs":Lcom/mongodb/gridfs/GridFS;
    sget-object v13, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v14, "%-60s %-10s\n"

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v17, "Filename"

    aput-object v17, v15, v16

    const/16 v16, 0x1

    const-string v17, "Length"

    aput-object v17, v15, v16

    invoke-virtual {v13, v14, v15}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 108
    invoke-virtual {v4}, Lcom/mongodb/gridfs/GridFS;->getFileList()Lcom/mongodb/DBCursor;

    move-result-object v13

    invoke-virtual {v13}, Lcom/mongodb/DBCursor;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_90
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_9

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/mongodb/DBObject;

    .line 109
    .local v9, "o":Lcom/mongodb/DBObject;
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v15, "%-60s %-10d\n"

    const/4 v13, 0x2

    new-array v0, v13, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/4 v13, 0x0

    const-string v17, "filename"

    move-object/from16 v0, v17

    invoke-interface {v9, v0}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v17

    aput-object v17, v16, v13

    const/16 v17, 0x1

    const-string v13, "length"

    invoke-interface {v9, v13}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Number;

    invoke-virtual {v13}, Ljava/lang/Number;->longValue()J

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v16, v17

    invoke-virtual/range {v14 .. v16}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    goto :goto_90

    .line 114
    .end local v4    # "fs":Lcom/mongodb/gridfs/GridFS;
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v9    # "o":Lcom/mongodb/DBObject;
    :cond_c8
    const-string v13, "get"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_101

    .line 115
    invoke-static {}, Lcom/mongodb/gridfs/CLI;->getGridFS()Lcom/mongodb/gridfs/GridFS;

    move-result-object v4

    .line 116
    .restart local v4    # "fs":Lcom/mongodb/gridfs/GridFS;
    add-int/lit8 v13, v5, 0x1

    aget-object v3, p0, v13

    .line 117
    .local v3, "fn":Ljava/lang/String;
    invoke-virtual {v4, v3}, Lcom/mongodb/gridfs/GridFS;->findOne(Ljava/lang/String;)Lcom/mongodb/gridfs/GridFSDBFile;

    move-result-object v2

    .line 118
    .local v2, "f":Lcom/mongodb/gridfs/GridFSDBFile;
    if-nez v2, :cond_f8

    .line 119
    sget-object v13, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "can\'t find file: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_9

    .line 123
    :cond_f8
    invoke-virtual {v2}, Lcom/mongodb/gridfs/GridFSDBFile;->getFilename()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2, v13}, Lcom/mongodb/gridfs/GridFSDBFile;->writeTo(Ljava/lang/String;)J

    goto/16 :goto_9

    .line 127
    .end local v2    # "f":Lcom/mongodb/gridfs/GridFSDBFile;
    .end local v3    # "fn":Ljava/lang/String;
    .end local v4    # "fs":Lcom/mongodb/gridfs/GridFS;
    :cond_101
    const-string v13, "put"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_122

    .line 128
    invoke-static {}, Lcom/mongodb/gridfs/CLI;->getGridFS()Lcom/mongodb/gridfs/GridFS;

    move-result-object v4

    .line 129
    .restart local v4    # "fs":Lcom/mongodb/gridfs/GridFS;
    add-int/lit8 v13, v5, 0x1

    aget-object v3, p0, v13

    .line 130
    .restart local v3    # "fn":Ljava/lang/String;
    new-instance v13, Ljava/io/File;

    invoke-direct {v13, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v13}, Lcom/mongodb/gridfs/GridFS;->createFile(Ljava/io/File;)Lcom/mongodb/gridfs/GridFSInputFile;

    move-result-object v2

    .line 131
    .local v2, "f":Lcom/mongodb/gridfs/GridFSInputFile;
    invoke-virtual {v2}, Lcom/mongodb/gridfs/GridFSInputFile;->save()V

    .line 132
    invoke-virtual {v2}, Lcom/mongodb/gridfs/GridFSInputFile;->validate()V

    goto/16 :goto_9

    .line 137
    .end local v2    # "f":Lcom/mongodb/gridfs/GridFSInputFile;
    .end local v3    # "fn":Ljava/lang/String;
    .end local v4    # "fs":Lcom/mongodb/gridfs/GridFS;
    :cond_122
    const-string v13, "md5"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1a5

    .line 138
    invoke-static {}, Lcom/mongodb/gridfs/CLI;->getGridFS()Lcom/mongodb/gridfs/GridFS;

    move-result-object v4

    .line 139
    .restart local v4    # "fs":Lcom/mongodb/gridfs/GridFS;
    add-int/lit8 v13, v5, 0x1

    aget-object v3, p0, v13

    .line 140
    .restart local v3    # "fn":Ljava/lang/String;
    invoke-virtual {v4, v3}, Lcom/mongodb/gridfs/GridFS;->findOne(Ljava/lang/String;)Lcom/mongodb/gridfs/GridFSDBFile;

    move-result-object v2

    .line 141
    .local v2, "f":Lcom/mongodb/gridfs/GridFSDBFile;
    if-nez v2, :cond_152

    .line 142
    sget-object v13, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "can\'t find file: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_9

    .line 146
    :cond_152
    const-string v13, "MD5"

    invoke-static {v13}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v8

    .line 147
    .local v8, "md5":Ljava/security/MessageDigest;
    invoke-virtual {v8}, Ljava/security/MessageDigest;->reset()V

    .line 148
    new-instance v7, Ljava/security/DigestInputStream;

    invoke-virtual {v2}, Lcom/mongodb/gridfs/GridFSDBFile;->getInputStream()Ljava/io/InputStream;

    move-result-object v13

    invoke-direct {v7, v13, v8}, Ljava/security/DigestInputStream;-><init>(Ljava/io/InputStream;Ljava/security/MessageDigest;)V

    .line 149
    .local v7, "is":Ljava/security/DigestInputStream;
    const/4 v11, 0x0

    .line 150
    .local v11, "read":I
    :goto_165
    invoke-virtual {v7}, Ljava/security/DigestInputStream;->read()I

    move-result v13

    if-ltz v13, :cond_177

    .line 151
    add-int/lit8 v11, v11, 0x1

    .line 152
    const/16 v13, 0x11

    new-array v13, v13, [B

    invoke-virtual {v7, v13}, Ljava/security/DigestInputStream;->read([B)I

    move-result v10

    .line 153
    .local v10, "r":I
    if-gez v10, :cond_1a3

    .line 157
    .end local v10    # "r":I
    :cond_177
    invoke-virtual {v8}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    .line 158
    .local v1, "digest":[B
    sget-object v13, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "length: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " md5: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-static {v1}, Lcom/mongodb/util/Util;->toHex([B)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_9

    .line 155
    .end local v1    # "digest":[B
    .restart local v10    # "r":I
    :cond_1a3
    add-int/2addr v11, v10

    .line 156
    goto :goto_165

    .line 163
    .end local v2    # "f":Lcom/mongodb/gridfs/GridFSDBFile;
    .end local v3    # "fn":Ljava/lang/String;
    .end local v4    # "fs":Lcom/mongodb/gridfs/GridFS;
    .end local v7    # "is":Ljava/security/DigestInputStream;
    .end local v8    # "md5":Ljava/security/MessageDigest;
    .end local v10    # "r":I
    .end local v11    # "read":I
    :cond_1a5
    sget-object v13, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "unknown option: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_9
.end method

.method private static printUsage()V
    .registers 2

    .prologue
    .line 41
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Usage : [--db database] action"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 42
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "  where  action is one of:"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 43
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "      list                      : lists all files in the store"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 44
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "      put filename              : puts the file filename into the store"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 45
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "      get filename1 filename2   : gets filename1 from store and sends to filename2"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 46
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "      md5 filename              : does an md5 hash on a file in the db (for testing)"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 47
    return-void
.end method
