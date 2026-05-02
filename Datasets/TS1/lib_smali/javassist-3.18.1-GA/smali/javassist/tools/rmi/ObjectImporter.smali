.class public Ljavassist/tools/rmi/ObjectImporter;
.super Ljava/lang/Object;
.source "ObjectImporter.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final proxyConstructorParamTypes:[Ljava/lang/Class;


# instance fields
.field private final endofline:[B

.field protected lookupCommand:[B

.field private orgPort:I

.field private orgServername:Ljava/lang/String;

.field private port:I

.field protected rmiCommand:[B

.field private servername:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 186
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Ljavassist/tools/rmi/ObjectImporter;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v2, v0, v1

    sput-object v0, Ljavassist/tools/rmi/ObjectImporter;->proxyConstructorParamTypes:[Ljava/lang/Class;

    return-void
.end method

.method public constructor <init>(Ljava/applet/Applet;)V
    .registers 4
    .param p1, "applet"    # Ljava/applet/Applet;

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    const/4 v1, 0x2

    new-array v1, v1, [B

    fill-array-data v1, :array_30

    iput-object v1, p0, Ljavassist/tools/rmi/ObjectImporter;->endofline:[B

    .line 80
    const-string v1, "POST /lookup HTTP/1.0"

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    iput-object v1, p0, Ljavassist/tools/rmi/ObjectImporter;->lookupCommand:[B

    .line 81
    const-string v1, "POST /rmi HTTP/1.0"

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    iput-object v1, p0, Ljavassist/tools/rmi/ObjectImporter;->rmiCommand:[B

    .line 92
    invoke-virtual {p1}, Ljava/applet/Applet;->getCodeBase()Ljava/net/URL;

    move-result-object v0

    .line 93
    .local v0, "codebase":Ljava/net/URL;
    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Ljavassist/tools/rmi/ObjectImporter;->servername:Ljava/lang/String;

    iput-object v1, p0, Ljavassist/tools/rmi/ObjectImporter;->orgServername:Ljava/lang/String;

    .line 94
    invoke-virtual {v0}, Ljava/net/URL;->getPort()I

    move-result v1

    iput v1, p0, Ljavassist/tools/rmi/ObjectImporter;->port:I

    iput v1, p0, Ljavassist/tools/rmi/ObjectImporter;->orgPort:I

    .line 95
    return-void

    .line 76
    :array_30
    .array-data 1
        0xdt
        0xat
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 4
    .param p1, "servername"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    const/4 v0, 0x2

    new-array v0, v0, [B

    fill-array-data v0, :array_24

    iput-object v0, p0, Ljavassist/tools/rmi/ObjectImporter;->endofline:[B

    .line 80
    const-string v0, "POST /lookup HTTP/1.0"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    iput-object v0, p0, Ljavassist/tools/rmi/ObjectImporter;->lookupCommand:[B

    .line 81
    const-string v0, "POST /rmi HTTP/1.0"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    iput-object v0, p0, Ljavassist/tools/rmi/ObjectImporter;->rmiCommand:[B

    .line 111
    iput-object p1, p0, Ljavassist/tools/rmi/ObjectImporter;->servername:Ljava/lang/String;

    iput-object p1, p0, Ljavassist/tools/rmi/ObjectImporter;->orgServername:Ljava/lang/String;

    .line 112
    iput p2, p0, Ljavassist/tools/rmi/ObjectImporter;->port:I

    iput p2, p0, Ljavassist/tools/rmi/ObjectImporter;->orgPort:I

    .line 113
    return-void

    .line 76
    :array_24
    .array-data 1
        0xdt
        0xat
    .end array-data
.end method

.method private createProxy(ILjava/lang/String;)Ljava/lang/Object;
    .registers 8
    .param p1, "oid"    # I
    .param p2, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 190
    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 191
    .local v0, "c":Ljava/lang/Class;
    sget-object v2, Ljavassist/tools/rmi/ObjectImporter;->proxyConstructorParamTypes:[Ljava/lang/Class;

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 192
    .local v1, "cons":Ljava/lang/reflect/Constructor;
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/Integer;

    invoke-direct {v4, p1}, Ljava/lang/Integer;-><init>(I)V

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method private skipHeader(Ljava/io/InputStream;)V
    .registers 5
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 278
    :cond_0
    const/4 v1, 0x0

    .line 279
    .local v1, "len":I
    :goto_1
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v0

    .local v0, "c":I
    if-ltz v0, :cond_e

    const/16 v2, 0xd

    if-eq v0, v2, :cond_e

    .line 280
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 282
    :cond_e
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    .line 283
    if-gtz v1, :cond_0

    .line 284
    return-void
.end method

.method private writeParameters(Ljava/io/ObjectOutputStream;[Ljava/lang/Object;)V
    .registers 8
    .param p1, "dout"    # Ljava/io/ObjectOutputStream;
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 289
    array-length v1, p2

    .line 290
    .local v1, "n":I
    invoke-virtual {p1, v1}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 291
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    if-ge v0, v1, :cond_26

    .line 292
    aget-object v3, p2, v0

    instance-of v3, v3, Ljavassist/tools/rmi/Proxy;

    if-eqz v3, :cond_20

    .line 293
    aget-object v2, p2, v0

    check-cast v2, Ljavassist/tools/rmi/Proxy;

    .line 294
    .local v2, "p":Ljavassist/tools/rmi/Proxy;
    new-instance v3, Ljavassist/tools/rmi/RemoteRef;

    invoke-interface {v2}, Ljavassist/tools/rmi/Proxy;->_getObjectId()I

    move-result v4

    invoke-direct {v3, v4}, Ljavassist/tools/rmi/RemoteRef;-><init>(I)V

    invoke-virtual {p1, v3}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 291
    .end local v2    # "p":Ljavassist/tools/rmi/Proxy;
    :goto_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 297
    :cond_20
    aget-object v3, p2, v0

    invoke-virtual {p1, v3}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    goto :goto_1d

    .line 298
    :cond_26
    return-void
.end method


# virtual methods
.method public call(II[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 17
    .param p1, "objectid"    # I
    .param p2, "methodid"    # I
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/tools/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 225
    :try_start_0
    new-instance v10, Ljava/net/Socket;

    iget-object v11, p0, Ljavassist/tools/rmi/ObjectImporter;->servername:Ljava/lang/String;

    iget v12, p0, Ljavassist/tools/rmi/ObjectImporter;->port:I

    invoke-direct {v10, v11, v12}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    .line 226
    .local v10, "sock":Ljava/net/Socket;
    new-instance v6, Ljava/io/BufferedOutputStream;

    invoke-virtual {v10}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v11

    invoke-direct {v6, v11}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 228
    .local v6, "out":Ljava/io/OutputStream;
    iget-object v11, p0, Ljavassist/tools/rmi/ObjectImporter;->rmiCommand:[B

    invoke-virtual {v6, v11}, Ljava/io/OutputStream;->write([B)V

    .line 229
    iget-object v11, p0, Ljavassist/tools/rmi/ObjectImporter;->endofline:[B

    invoke-virtual {v6, v11}, Ljava/io/OutputStream;->write([B)V

    .line 230
    iget-object v11, p0, Ljavassist/tools/rmi/ObjectImporter;->endofline:[B

    invoke-virtual {v6, v11}, Ljava/io/OutputStream;->write([B)V

    .line 232
    new-instance v2, Ljava/io/ObjectOutputStream;

    invoke-direct {v2, v6}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 233
    .local v2, "dout":Ljava/io/ObjectOutputStream;
    invoke-virtual {v2, p1}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 234
    invoke-virtual {v2, p2}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 235
    move-object/from16 v0, p3

    invoke-direct {p0, v2, v0}, Ljavassist/tools/rmi/ObjectImporter;->writeParameters(Ljava/io/ObjectOutputStream;[Ljava/lang/Object;)V

    .line 236
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->flush()V

    .line 238
    new-instance v5, Ljava/io/BufferedInputStream;

    invoke-virtual {v10}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v11

    invoke-direct {v5, v11}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 239
    .local v5, "ins":Ljava/io/InputStream;
    invoke-direct {p0, v5}, Ljavassist/tools/rmi/ObjectImporter;->skipHeader(Ljava/io/InputStream;)V

    .line 240
    new-instance v1, Ljava/io/ObjectInputStream;

    invoke-direct {v1, v5}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 241
    .local v1, "din":Ljava/io/ObjectInputStream;
    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v8

    .line 242
    .local v8, "result":Z
    const/4 v9, 0x0

    .line 243
    .local v9, "rvalue":Ljava/lang/Object;
    const/4 v4, 0x0

    .line 244
    .local v4, "errmsg":Ljava/lang/String;
    if-eqz v8, :cond_6d

    .line 245
    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v9

    .line 249
    .end local v9    # "rvalue":Ljava/lang/Object;
    :goto_51
    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->close()V

    .line 250
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->close()V

    .line 251
    invoke-virtual {v10}, Ljava/net/Socket;->close()V

    .line 253
    instance-of v11, v9, Ljavassist/tools/rmi/RemoteRef;

    if-eqz v11, :cond_6a

    .line 254
    move-object v0, v9

    check-cast v0, Ljavassist/tools/rmi/RemoteRef;

    move-object v7, v0

    .line 255
    .local v7, "ref":Ljavassist/tools/rmi/RemoteRef;
    iget v11, v7, Ljavassist/tools/rmi/RemoteRef;->oid:I

    iget-object v12, v7, Ljavassist/tools/rmi/RemoteRef;->classname:Ljava/lang/String;

    invoke-direct {p0, v11, v12}, Ljavassist/tools/rmi/ObjectImporter;->createProxy(ILjava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    .line 268
    .end local v7    # "ref":Ljavassist/tools/rmi/RemoteRef;
    :cond_6a
    if-eqz v8, :cond_87

    .line 269
    return-object v9

    .line 247
    .restart local v9    # "rvalue":Ljava/lang/Object;
    :cond_6d
    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;
    :try_end_70
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_70} :catch_72
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_70} :catch_79
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_70} :catch_80

    move-result-object v4

    goto :goto_51

    .line 258
    .end local v1    # "din":Ljava/io/ObjectInputStream;
    .end local v2    # "dout":Ljava/io/ObjectOutputStream;
    .end local v4    # "errmsg":Ljava/lang/String;
    .end local v5    # "ins":Ljava/io/InputStream;
    .end local v6    # "out":Ljava/io/OutputStream;
    .end local v8    # "result":Z
    .end local v9    # "rvalue":Ljava/lang/Object;
    .end local v10    # "sock":Ljava/net/Socket;
    :catch_72
    move-exception v3

    .line 259
    .local v3, "e":Ljava/lang/ClassNotFoundException;
    new-instance v11, Ljavassist/tools/rmi/RemoteException;

    invoke-direct {v11, v3}, Ljavassist/tools/rmi/RemoteException;-><init>(Ljava/lang/Exception;)V

    throw v11

    .line 261
    .end local v3    # "e":Ljava/lang/ClassNotFoundException;
    :catch_79
    move-exception v3

    .line 262
    .local v3, "e":Ljava/io/IOException;
    new-instance v11, Ljavassist/tools/rmi/RemoteException;

    invoke-direct {v11, v3}, Ljavassist/tools/rmi/RemoteException;-><init>(Ljava/lang/Exception;)V

    throw v11

    .line 264
    .end local v3    # "e":Ljava/io/IOException;
    :catch_80
    move-exception v3

    .line 265
    .local v3, "e":Ljava/lang/Exception;
    new-instance v11, Ljavassist/tools/rmi/RemoteException;

    invoke-direct {v11, v3}, Ljavassist/tools/rmi/RemoteException;-><init>(Ljava/lang/Exception;)V

    throw v11

    .line 271
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v1    # "din":Ljava/io/ObjectInputStream;
    .restart local v2    # "dout":Ljava/io/ObjectOutputStream;
    .restart local v4    # "errmsg":Ljava/lang/String;
    .restart local v5    # "ins":Ljava/io/InputStream;
    .restart local v6    # "out":Ljava/io/OutputStream;
    .restart local v8    # "result":Z
    .restart local v10    # "sock":Ljava/net/Socket;
    :cond_87
    new-instance v11, Ljavassist/tools/rmi/RemoteException;

    invoke-direct {v11, v4}, Ljavassist/tools/rmi/RemoteException;-><init>(Ljava/lang/String;)V

    throw v11
.end method

.method public getObject(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 124
    :try_start_0
    invoke-virtual {p0, p1}, Ljavassist/tools/rmi/ObjectImporter;->lookupObject(Ljava/lang/String;)Ljava/lang/Object;
    :try_end_3
    .catch Ljavassist/tools/rmi/ObjectNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    .line 127
    :goto_4
    return-object v1

    .line 126
    :catch_5
    move-exception v0

    .line 127
    .local v0, "e":Ljavassist/tools/rmi/ObjectNotFoundException;
    const/4 v1, 0x0

    goto :goto_4
.end method

.method public lookupObject(Ljava/lang/String;)Ljava/lang/Object;
    .registers 12
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/tools/rmi/ObjectNotFoundException;
        }
    .end annotation

    .prologue
    .line 156
    :try_start_0
    new-instance v7, Ljava/net/Socket;

    iget-object v8, p0, Ljavassist/tools/rmi/ObjectImporter;->servername:Ljava/lang/String;

    iget v9, p0, Ljavassist/tools/rmi/ObjectImporter;->port:I

    invoke-direct {v7, v8, v9}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    .line 157
    .local v7, "sock":Ljava/net/Socket;
    invoke-virtual {v7}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v6

    .line 158
    .local v6, "out":Ljava/io/OutputStream;
    iget-object v8, p0, Ljavassist/tools/rmi/ObjectImporter;->lookupCommand:[B

    invoke-virtual {v6, v8}, Ljava/io/OutputStream;->write([B)V

    .line 159
    iget-object v8, p0, Ljavassist/tools/rmi/ObjectImporter;->endofline:[B

    invoke-virtual {v6, v8}, Ljava/io/OutputStream;->write([B)V

    .line 160
    iget-object v8, p0, Ljavassist/tools/rmi/ObjectImporter;->endofline:[B

    invoke-virtual {v6, v8}, Ljava/io/OutputStream;->write([B)V

    .line 162
    new-instance v2, Ljava/io/ObjectOutputStream;

    invoke-direct {v2, v6}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 163
    .local v2, "dout":Ljava/io/ObjectOutputStream;
    invoke-virtual {v2, p1}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 164
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->flush()V

    .line 166
    new-instance v4, Ljava/io/BufferedInputStream;

    invoke-virtual {v7}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v4, v8}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 167
    .local v4, "in":Ljava/io/InputStream;
    invoke-direct {p0, v4}, Ljavassist/tools/rmi/ObjectImporter;->skipHeader(Ljava/io/InputStream;)V

    .line 168
    new-instance v1, Ljava/io/ObjectInputStream;

    invoke-direct {v1, v4}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 169
    .local v1, "din":Ljava/io/ObjectInputStream;
    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v5

    .line 170
    .local v5, "n":I
    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    .line 171
    .local v0, "classname":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->close()V

    .line 172
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->close()V

    .line 173
    invoke-virtual {v7}, Ljava/net/Socket;->close()V

    .line 175
    if-ltz v5, :cond_5a

    .line 176
    invoke-direct {p0, v5, v0}, Ljavassist/tools/rmi/ObjectImporter;->createProxy(ILjava/lang/String;)Ljava/lang/Object;
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_4e} :catch_50

    move-result-object v8

    return-object v8

    .line 178
    .end local v0    # "classname":Ljava/lang/String;
    .end local v1    # "din":Ljava/io/ObjectInputStream;
    .end local v2    # "dout":Ljava/io/ObjectOutputStream;
    .end local v4    # "in":Ljava/io/InputStream;
    .end local v5    # "n":I
    .end local v6    # "out":Ljava/io/OutputStream;
    .end local v7    # "sock":Ljava/net/Socket;
    :catch_50
    move-exception v3

    .line 179
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 180
    new-instance v8, Ljavassist/tools/rmi/ObjectNotFoundException;

    invoke-direct {v8, p1, v3}, Ljavassist/tools/rmi/ObjectNotFoundException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v8

    .line 183
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v0    # "classname":Ljava/lang/String;
    .restart local v1    # "din":Ljava/io/ObjectInputStream;
    .restart local v2    # "dout":Ljava/io/ObjectOutputStream;
    .restart local v4    # "in":Ljava/io/InputStream;
    .restart local v5    # "n":I
    .restart local v6    # "out":Ljava/io/OutputStream;
    .restart local v7    # "sock":Ljava/net/Socket;
    :cond_5a
    new-instance v8, Ljavassist/tools/rmi/ObjectNotFoundException;

    invoke-direct {v8, p1}, Ljavassist/tools/rmi/ObjectNotFoundException;-><init>(Ljava/lang/String;)V

    throw v8
.end method

.method public setHttpProxy(Ljava/lang/String;I)V
    .registers 7
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    .line 136
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "POST http://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Ljavassist/tools/rmi/ObjectImporter;->orgServername:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Ljavassist/tools/rmi/ObjectImporter;->orgPort:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 137
    .local v1, "proxyHeader":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/lookup HTTP/1.0"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 138
    .local v0, "cmd":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    iput-object v2, p0, Ljavassist/tools/rmi/ObjectImporter;->lookupCommand:[B

    .line 139
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/rmi HTTP/1.0"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 140
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    iput-object v2, p0, Ljavassist/tools/rmi/ObjectImporter;->rmiCommand:[B

    .line 141
    iput-object p1, p0, Ljavassist/tools/rmi/ObjectImporter;->servername:Ljava/lang/String;

    .line 142
    iput p2, p0, Ljavassist/tools/rmi/ObjectImporter;->port:I

    .line 143
    return-void
.end method
