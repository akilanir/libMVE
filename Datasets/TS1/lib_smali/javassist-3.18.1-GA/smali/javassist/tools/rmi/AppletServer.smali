.class public Ljavassist/tools/rmi/AppletServer;
.super Ljavassist/tools/web/Webserver;
.source "AppletServer.java"


# static fields
.field private static final okHeader:[B


# instance fields
.field private exportedNames:Ljava/util/Hashtable;

.field private exportedObjects:Ljava/util/Vector;

.field private stubGen:Ljavassist/tools/rmi/StubGenerator;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 43
    const-string v0, "HTTP/1.0 200 OK\r\n\r\n"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    sput-object v0, Ljavassist/tools/rmi/AppletServer;->okHeader:[B

    return-void
.end method

.method public constructor <init>(I)V
    .registers 4
    .param p1, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavassist/NotFoundException;,
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 65
    invoke-static {}, Ljavassist/ClassPool;->getDefault()Ljavassist/ClassPool;

    move-result-object v0

    new-instance v1, Ljavassist/tools/rmi/StubGenerator;

    invoke-direct {v1}, Ljavassist/tools/rmi/StubGenerator;-><init>()V

    invoke-direct {p0, v0, v1, p1}, Ljavassist/tools/rmi/AppletServer;-><init>(Ljavassist/ClassPool;Ljavassist/tools/rmi/StubGenerator;I)V

    .line 66
    return-void
.end method

.method public constructor <init>(ILjavassist/ClassPool;)V
    .registers 5
    .param p1, "port"    # I
    .param p2, "src"    # Ljavassist/ClassPool;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavassist/NotFoundException;,
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 77
    new-instance v0, Ljavassist/ClassPool;

    invoke-direct {v0, p2}, Ljavassist/ClassPool;-><init>(Ljavassist/ClassPool;)V

    new-instance v1, Ljavassist/tools/rmi/StubGenerator;

    invoke-direct {v1}, Ljavassist/tools/rmi/StubGenerator;-><init>()V

    invoke-direct {p0, v0, v1, p1}, Ljavassist/tools/rmi/AppletServer;-><init>(Ljavassist/ClassPool;Ljavassist/tools/rmi/StubGenerator;I)V

    .line 78
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "port"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavassist/NotFoundException;,
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 54
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Ljavassist/tools/rmi/AppletServer;-><init>(I)V

    .line 55
    return-void
.end method

.method private constructor <init>(Ljavassist/ClassPool;Ljavassist/tools/rmi/StubGenerator;I)V
    .registers 5
    .param p1, "loader"    # Ljavassist/ClassPool;
    .param p2, "gen"    # Ljavassist/tools/rmi/StubGenerator;
    .param p3, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavassist/NotFoundException;,
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 83
    invoke-direct {p0, p3}, Ljavassist/tools/web/Webserver;-><init>(I)V

    .line 84
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Ljavassist/tools/rmi/AppletServer;->exportedNames:Ljava/util/Hashtable;

    .line 85
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Ljavassist/tools/rmi/AppletServer;->exportedObjects:Ljava/util/Vector;

    .line 86
    iput-object p2, p0, Ljavassist/tools/rmi/AppletServer;->stubGen:Ljavassist/tools/rmi/StubGenerator;

    .line 87
    invoke-virtual {p0, p1, p2}, Ljavassist/tools/rmi/AppletServer;->addTranslator(Ljavassist/ClassPool;Ljavassist/Translator;)V

    .line 88
    return-void
.end method

.method private convertRvalue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "rvalue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 212
    if-nez p1, :cond_5

    move-object p1, v1

    .line 219
    .end local p1    # "rvalue":Ljava/lang/Object;
    :cond_4
    :goto_4
    return-object p1

    .line 215
    .restart local p1    # "rvalue":Ljava/lang/Object;
    :cond_5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 216
    .local v0, "classname":Ljava/lang/String;
    iget-object v2, p0, Ljavassist/tools/rmi/AppletServer;->stubGen:Ljavassist/tools/rmi/StubGenerator;

    invoke-virtual {v2, v0}, Ljavassist/tools/rmi/StubGenerator;->isProxyClass(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 217
    new-instance v2, Ljavassist/tools/rmi/RemoteRef;

    invoke-virtual {p0, v1, p1}, Ljavassist/tools/rmi/AppletServer;->exportObject(Ljava/lang/String;Ljava/lang/Object;)I

    move-result v1

    invoke-direct {v2, v1, v0}, Ljavassist/tools/rmi/RemoteRef;-><init>(ILjava/lang/String;)V

    move-object p1, v2

    goto :goto_4
.end method

.method private lookupName(Ljava/lang/String;Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 10
    .param p1, "cmd"    # Ljava/lang/String;
    .param p2, "ins"    # Ljava/io/InputStream;
    .param p3, "outs"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 225
    new-instance v1, Ljava/io/ObjectInputStream;

    invoke-direct {v1, p2}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 226
    .local v1, "in":Ljava/io/ObjectInputStream;
    invoke-static {v1}, Ljava/io/DataInputStream;->readUTF(Ljava/io/DataInput;)Ljava/lang/String;

    move-result-object v2

    .line 227
    .local v2, "name":Ljava/lang/String;
    iget-object v4, p0, Ljavassist/tools/rmi/AppletServer;->exportedNames:Ljava/util/Hashtable;

    invoke-virtual {v4, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/tools/rmi/ExportedObject;

    .line 228
    .local v0, "found":Ljavassist/tools/rmi/ExportedObject;
    sget-object v4, Ljavassist/tools/rmi/AppletServer;->okHeader:[B

    invoke-virtual {p3, v4}, Ljava/io/OutputStream;->write([B)V

    .line 229
    new-instance v3, Ljava/io/ObjectOutputStream;

    invoke-direct {v3, p3}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 230
    .local v3, "out":Ljava/io/ObjectOutputStream;
    if-nez v0, :cond_46

    .line 231
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "not found."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljavassist/tools/rmi/AppletServer;->logging2(Ljava/lang/String;)V

    .line 232
    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 233
    const-string v4, "error"

    invoke-virtual {v3, v4}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 241
    :goto_3c
    invoke-virtual {v3}, Ljava/io/ObjectOutputStream;->flush()V

    .line 242
    invoke-virtual {v3}, Ljava/io/ObjectOutputStream;->close()V

    .line 243
    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->close()V

    .line 244
    return-void

    .line 236
    :cond_46
    invoke-virtual {p0, v2}, Ljavassist/tools/rmi/AppletServer;->logging2(Ljava/lang/String;)V

    .line 237
    iget v4, v0, Ljavassist/tools/rmi/ExportedObject;->identifier:I

    invoke-virtual {v3, v4}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 238
    iget-object v4, v0, Ljavassist/tools/rmi/ExportedObject;->object:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    goto :goto_3c
.end method

.method private processRMI(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 14
    .param p1, "ins"    # Ljava/io/InputStream;
    .param p2, "outs"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 148
    new-instance v4, Ljava/io/ObjectInputStream;

    invoke-direct {v4, p1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 150
    .local v4, "in":Ljava/io/ObjectInputStream;
    invoke-virtual {v4}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v6

    .line 151
    .local v6, "objectId":I
    invoke-virtual {v4}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v5

    .line 152
    .local v5, "methodId":I
    const/4 v3, 0x0

    .line 153
    .local v3, "err":Ljava/lang/Exception;
    const/4 v8, 0x0

    .line 155
    .local v8, "rvalue":Ljava/lang/Object;
    :try_start_f
    iget-object v9, p0, Ljavassist/tools/rmi/AppletServer;->exportedObjects:Ljava/util/Vector;

    invoke-virtual {v9, v6}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavassist/tools/rmi/ExportedObject;

    .line 157
    .local v2, "eo":Ljavassist/tools/rmi/ExportedObject;
    invoke-direct {p0, v4}, Ljavassist/tools/rmi/AppletServer;->readParameters(Ljava/io/ObjectInputStream;)[Ljava/lang/Object;

    move-result-object v0

    .line 158
    .local v0, "args":[Ljava/lang/Object;
    iget-object v9, v2, Ljavassist/tools/rmi/ExportedObject;->methods:[Ljava/lang/reflect/Method;

    aget-object v9, v9, v5

    iget-object v10, v2, Ljavassist/tools/rmi/ExportedObject;->object:Ljava/lang/Object;

    invoke-virtual {v9, v10, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-direct {p0, v9}, Ljavassist/tools/rmi/AppletServer;->convertRvalue(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_28} :catch_4a

    move-result-object v8

    .line 166
    .end local v0    # "args":[Ljava/lang/Object;
    .end local v2    # "eo":Ljavassist/tools/rmi/ExportedObject;
    .end local v8    # "rvalue":Ljava/lang/Object;
    :goto_29
    sget-object v9, Ljavassist/tools/rmi/AppletServer;->okHeader:[B

    invoke-virtual {p2, v9}, Ljava/io/OutputStream;->write([B)V

    .line 167
    new-instance v7, Ljava/io/ObjectOutputStream;

    invoke-direct {v7, p2}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 168
    .local v7, "out":Ljava/io/ObjectOutputStream;
    if-eqz v3, :cond_54

    .line 169
    const/4 v9, 0x0

    invoke-virtual {v7, v9}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 170
    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 184
    :goto_40
    invoke-virtual {v7}, Ljava/io/ObjectOutputStream;->flush()V

    .line 185
    invoke-virtual {v7}, Ljava/io/ObjectOutputStream;->close()V

    .line 186
    invoke-virtual {v4}, Ljava/io/ObjectInputStream;->close()V

    .line 187
    return-void

    .line 161
    .end local v7    # "out":Ljava/io/ObjectOutputStream;
    .restart local v8    # "rvalue":Ljava/lang/Object;
    :catch_4a
    move-exception v1

    .line 162
    .local v1, "e":Ljava/lang/Exception;
    move-object v3, v1

    .line 163
    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Ljavassist/tools/rmi/AppletServer;->logging2(Ljava/lang/String;)V

    goto :goto_29

    .line 174
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v8    # "rvalue":Ljava/lang/Object;
    .restart local v7    # "out":Ljava/io/ObjectOutputStream;
    :cond_54
    const/4 v9, 0x1

    :try_start_55
    invoke-virtual {v7, v9}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 175
    invoke-virtual {v7, v8}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_5b
    .catch Ljava/io/NotSerializableException; {:try_start_55 .. :try_end_5b} :catch_5c
    .catch Ljava/io/InvalidClassException; {:try_start_55 .. :try_end_5b} :catch_65

    goto :goto_40

    .line 177
    :catch_5c
    move-exception v1

    .line 178
    .local v1, "e":Ljava/io/NotSerializableException;
    invoke-virtual {v1}, Ljava/io/NotSerializableException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Ljavassist/tools/rmi/AppletServer;->logging2(Ljava/lang/String;)V

    goto :goto_40

    .line 180
    .end local v1    # "e":Ljava/io/NotSerializableException;
    :catch_65
    move-exception v1

    .line 181
    .local v1, "e":Ljava/io/InvalidClassException;
    invoke-virtual {v1}, Ljava/io/InvalidClassException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Ljavassist/tools/rmi/AppletServer;->logging2(Ljava/lang/String;)V

    goto :goto_40
.end method

.method private readParameters(Ljava/io/ObjectInputStream;)[Ljava/lang/Object;
    .registers 10
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 192
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v4

    .line 193
    .local v4, "n":I
    new-array v1, v4, [Ljava/lang/Object;

    .line 194
    .local v1, "args":[Ljava/lang/Object;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_7
    if-ge v3, v4, :cond_25

    .line 195
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    .line 196
    .local v0, "a":Ljava/lang/Object;
    instance-of v6, v0, Ljavassist/tools/rmi/RemoteRef;

    if-eqz v6, :cond_20

    move-object v5, v0

    .line 197
    check-cast v5, Ljavassist/tools/rmi/RemoteRef;

    .line 198
    .local v5, "ref":Ljavassist/tools/rmi/RemoteRef;
    iget-object v6, p0, Ljavassist/tools/rmi/AppletServer;->exportedObjects:Ljava/util/Vector;

    iget v7, v5, Ljavassist/tools/rmi/RemoteRef;->oid:I

    invoke-virtual {v6, v7}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavassist/tools/rmi/ExportedObject;

    .line 200
    .local v2, "eo":Ljavassist/tools/rmi/ExportedObject;
    iget-object v0, v2, Ljavassist/tools/rmi/ExportedObject;->object:Ljava/lang/Object;

    .line 203
    .end local v2    # "eo":Ljavassist/tools/rmi/ExportedObject;
    .end local v5    # "ref":Ljavassist/tools/rmi/RemoteRef;
    :cond_20
    aput-object v0, v1, v3

    .line 194
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 206
    .end local v0    # "a":Ljava/lang/Object;
    :cond_25
    return-object v1
.end method


# virtual methods
.method public doReply(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/lang/String;)V
    .registers 5
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "out"    # Ljava/io/OutputStream;
    .param p3, "cmd"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavassist/tools/web/BadHttpRequest;
        }
    .end annotation

    .prologue
    .line 137
    const-string v0, "POST /rmi "

    invoke-virtual {p3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 138
    invoke-direct {p0, p1, p2}, Ljavassist/tools/rmi/AppletServer;->processRMI(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 143
    :goto_b
    return-void

    .line 139
    :cond_c
    const-string v0, "POST /lookup "

    invoke-virtual {p3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 140
    invoke-direct {p0, p3, p1, p2}, Ljavassist/tools/rmi/AppletServer;->lookupName(Ljava/lang/String;Ljava/io/InputStream;Ljava/io/OutputStream;)V

    goto :goto_b

    .line 142
    :cond_18
    invoke-super {p0, p1, p2, p3}, Ljavassist/tools/web/Webserver;->doReply(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/lang/String;)V

    goto :goto_b
.end method

.method public declared-synchronized exportObject(Ljava/lang/String;Ljava/lang/Object;)I
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 112
    monitor-enter p0

    :try_start_1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 113
    .local v0, "clazz":Ljava/lang/Class;
    new-instance v2, Ljavassist/tools/rmi/ExportedObject;

    invoke-direct {v2}, Ljavassist/tools/rmi/ExportedObject;-><init>()V

    .line 114
    .local v2, "eo":Ljavassist/tools/rmi/ExportedObject;
    iput-object p2, v2, Ljavassist/tools/rmi/ExportedObject;->object:Ljava/lang/Object;

    .line 115
    invoke-virtual {v0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v3

    iput-object v3, v2, Ljavassist/tools/rmi/ExportedObject;->methods:[Ljava/lang/reflect/Method;

    .line 116
    iget-object v3, p0, Ljavassist/tools/rmi/AppletServer;->exportedObjects:Ljava/util/Vector;

    invoke-virtual {v3, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 117
    iget-object v3, p0, Ljavassist/tools/rmi/AppletServer;->exportedObjects:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    iput v3, v2, Ljavassist/tools/rmi/ExportedObject;->identifier:I

    .line 118
    if-eqz p1, :cond_28

    .line 119
    iget-object v3, p0, Ljavassist/tools/rmi/AppletServer;->exportedNames:Ljava/util/Hashtable;

    invoke-virtual {v3, p1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_28
    .catchall {:try_start_1 .. :try_end_28} :catchall_38

    .line 122
    :cond_28
    :try_start_28
    iget-object v3, p0, Ljavassist/tools/rmi/AppletServer;->stubGen:Ljavassist/tools/rmi/StubGenerator;

    invoke-virtual {v3, v0}, Ljavassist/tools/rmi/StubGenerator;->makeProxyClass(Ljava/lang/Class;)Z
    :try_end_2d
    .catch Ljavassist/NotFoundException; {:try_start_28 .. :try_end_2d} :catch_31
    .catchall {:try_start_28 .. :try_end_2d} :catchall_38

    .line 128
    :try_start_2d
    iget v3, v2, Ljavassist/tools/rmi/ExportedObject;->identifier:I
    :try_end_2f
    .catchall {:try_start_2d .. :try_end_2f} :catchall_38

    monitor-exit p0

    return v3

    .line 124
    :catch_31
    move-exception v1

    .line 125
    .local v1, "e":Ljavassist/NotFoundException;
    :try_start_32
    new-instance v3, Ljavassist/CannotCompileException;

    invoke-direct {v3, v1}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v3
    :try_end_38
    .catchall {:try_start_32 .. :try_end_38} :catchall_38

    .line 112
    .end local v0    # "clazz":Ljava/lang/Class;
    .end local v1    # "e":Ljavassist/NotFoundException;
    .end local v2    # "eo":Ljavassist/tools/rmi/ExportedObject;
    :catchall_38
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public run()V
    .registers 1

    .prologue
    .line 94
    invoke-super {p0}, Ljavassist/tools/web/Webserver;->run()V

    .line 95
    return-void
.end method
