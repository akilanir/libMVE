.class public Ljavassist/tools/web/Webserver;
.super Ljava/lang/Object;
.source "Webserver.java"


# static fields
.field private static final endofline:[B

.field private static final typeClass:I = 0x2

.field private static final typeGif:I = 0x3

.field private static final typeHtml:I = 0x1

.field private static final typeJpeg:I = 0x4

.field private static final typeText:I = 0x5


# instance fields
.field private classPool:Ljavassist/ClassPool;

.field public debugDir:Ljava/lang/String;

.field public htmlfileBase:Ljava/lang/String;

.field private socket:Ljava/net/ServerSocket;

.field protected translator:Ljavassist/Translator;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    const/4 v0, 0x2

    new-array v0, v0, [B

    fill-array-data v0, :array_a

    sput-object v0, Ljavassist/tools/web/Webserver;->endofline:[B

    return-void

    nop

    :array_a
    .array-data 1
        0xdt
        0xat
    .end array-data
.end method

.method public constructor <init>(I)V
    .registers 4
    .param p1, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object v1, p0, Ljavassist/tools/web/Webserver;->debugDir:Ljava/lang/String;

    .line 72
    iput-object v1, p0, Ljavassist/tools/web/Webserver;->htmlfileBase:Ljava/lang/String;

    .line 103
    new-instance v0, Ljava/net/ServerSocket;

    invoke-direct {v0, p1}, Ljava/net/ServerSocket;-><init>(I)V

    iput-object v0, p0, Ljavassist/tools/web/Webserver;->socket:Ljava/net/ServerSocket;

    .line 104
    iput-object v1, p0, Ljavassist/tools/web/Webserver;->classPool:Ljavassist/ClassPool;

    .line 105
    iput-object v1, p0, Ljavassist/tools/web/Webserver;->translator:Ljavassist/Translator;

    .line 106
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "port"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Ljavassist/tools/web/Webserver;-><init>(I)V

    .line 95
    return-void
.end method

.method private checkFilename(Ljava/lang/String;I)V
    .registers 6
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/tools/web/BadHttpRequest;
        }
    .end annotation

    .prologue
    .line 320
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, p2, :cond_1e

    .line 321
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 322
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v2

    if-nez v2, :cond_1b

    const/16 v2, 0x2e

    if-eq v0, v2, :cond_1b

    const/16 v2, 0x2f

    if-eq v0, v2, :cond_1b

    .line 323
    new-instance v2, Ljavassist/tools/web/BadHttpRequest;

    invoke-direct {v2}, Ljavassist/tools/web/BadHttpRequest;-><init>()V

    throw v2

    .line 320
    :cond_1b
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 326
    .end local v0    # "c":C
    :cond_1e
    const-string v2, ".."

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-ltz v2, :cond_2c

    .line 327
    new-instance v2, Ljavassist/tools/web/BadHttpRequest;

    invoke-direct {v2}, Ljavassist/tools/web/BadHttpRequest;-><init>()V

    throw v2

    .line 328
    :cond_2c
    return-void
.end method

.method private letUsersSendClassfile(Ljava/io/OutputStream;Ljava/lang/String;I)Z
    .registers 11
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavassist/tools/web/BadHttpRequest;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 334
    iget-object v5, p0, Ljavassist/tools/web/Webserver;->classPool:Ljavassist/ClassPool;

    if-nez v5, :cond_6

    .line 355
    :goto_5
    return v4

    .line 338
    :cond_6
    add-int/lit8 v5, p3, -0x6

    invoke-virtual {p2, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x2f

    const/16 v6, 0x2e

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    .line 341
    .local v2, "classname":Ljava/lang/String;
    :try_start_14
    iget-object v4, p0, Ljavassist/tools/web/Webserver;->translator:Ljavassist/Translator;

    if-eqz v4, :cond_1f

    .line 342
    iget-object v4, p0, Ljavassist/tools/web/Webserver;->translator:Ljavassist/Translator;

    iget-object v5, p0, Ljavassist/tools/web/Webserver;->classPool:Ljavassist/ClassPool;

    invoke-interface {v4, v5, v2}, Ljavassist/Translator;->onLoad(Ljavassist/ClassPool;Ljava/lang/String;)V

    .line 344
    :cond_1f
    iget-object v4, p0, Ljavassist/tools/web/Webserver;->classPool:Ljavassist/ClassPool;

    invoke-virtual {v4, v2}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    .line 345
    .local v0, "c":Ljavassist/CtClass;
    invoke-virtual {v0}, Ljavassist/CtClass;->toBytecode()[B

    move-result-object v1

    .line 346
    .local v1, "classfile":[B
    iget-object v4, p0, Ljavassist/tools/web/Webserver;->debugDir:Ljava/lang/String;

    if-eqz v4, :cond_32

    .line 347
    iget-object v4, p0, Ljavassist/tools/web/Webserver;->debugDir:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljavassist/CtClass;->writeFile(Ljava/lang/String;)V
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_32} :catch_3d

    .line 353
    :cond_32
    array-length v4, v1

    int-to-long v4, v4

    const/4 v6, 0x2

    invoke-direct {p0, p1, v4, v5, v6}, Ljavassist/tools/web/Webserver;->sendHeader(Ljava/io/OutputStream;JI)V

    .line 354
    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write([B)V

    .line 355
    const/4 v4, 0x1

    goto :goto_5

    .line 349
    .end local v0    # "c":Ljavassist/CtClass;
    .end local v1    # "classfile":[B
    :catch_3d
    move-exception v3

    .line 350
    .local v3, "e":Ljava/lang/Exception;
    new-instance v4, Ljavassist/tools/web/BadHttpRequest;

    invoke-direct {v4, v3}, Ljavassist/tools/web/BadHttpRequest;-><init>(Ljava/lang/Exception;)V

    throw v4
.end method

.method public static main([Ljava/lang/String;)V
    .registers 4
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    array-length v1, p0

    const/4 v2, 0x1

    if-ne v1, v2, :cond_10

    .line 80
    new-instance v0, Ljavassist/tools/web/Webserver;

    const/4 v1, 0x0

    aget-object v1, p0, v1

    invoke-direct {v0, v1}, Ljavassist/tools/web/Webserver;-><init>(Ljava/lang/String;)V

    .line 81
    .local v0, "web":Ljavassist/tools/web/Webserver;
    invoke-virtual {v0}, Ljavassist/tools/web/Webserver;->run()V

    .line 86
    .end local v0    # "web":Ljavassist/tools/web/Webserver;
    :goto_f
    return-void

    .line 84
    :cond_10
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v2, "Usage: java javassist.tools.web.Webserver <port number>"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_f
.end method

.method private readLine(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 5
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 212
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 214
    .local v0, "buf":Ljava/lang/StringBuffer;
    :goto_5
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v1

    .local v1, "c":I
    if-ltz v1, :cond_14

    const/16 v2, 0xd

    if-eq v1, v2, :cond_14

    .line 215
    int-to-char v2, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_5

    .line 217
    :cond_14
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    .line 218
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private replyError(Ljava/io/OutputStream;Ljavassist/tools/web/BadHttpRequest;)V
    .registers 5
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "e"    # Ljavassist/tools/web/BadHttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 384
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "bad request: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Ljavassist/tools/web/BadHttpRequest;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljavassist/tools/web/Webserver;->logging2(Ljava/lang/String;)V

    .line 385
    const-string v0, "HTTP/1.0 400 Bad Request"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 386
    sget-object v0, Ljavassist/tools/web/Webserver;->endofline:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 387
    sget-object v0, Ljavassist/tools/web/Webserver;->endofline:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 388
    const-string v0, "<H1>Bad Request</H1>"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 389
    return-void
.end method

.method private sendHeader(Ljava/io/OutputStream;JI)V
    .registers 6
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "dataLength"    # J
    .param p4, "filetype"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 361
    const-string v0, "HTTP/1.0 200 OK"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 362
    sget-object v0, Ljavassist/tools/web/Webserver;->endofline:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 363
    const-string v0, "Content-Length: "

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 364
    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 365
    sget-object v0, Ljavassist/tools/web/Webserver;->endofline:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 366
    const/4 v0, 0x2

    if-ne p4, v0, :cond_3e

    .line 367
    const-string v0, "Content-Type: application/octet-stream"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 377
    :cond_33
    :goto_33
    sget-object v0, Ljavassist/tools/web/Webserver;->endofline:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 378
    sget-object v0, Ljavassist/tools/web/Webserver;->endofline:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 379
    return-void

    .line 368
    :cond_3e
    const/4 v0, 0x1

    if-ne p4, v0, :cond_4b

    .line 369
    const-string v0, "Content-Type: text/html"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    goto :goto_33

    .line 370
    :cond_4b
    const/4 v0, 0x3

    if-ne p4, v0, :cond_58

    .line 371
    const-string v0, "Content-Type: image/gif"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    goto :goto_33

    .line 372
    :cond_58
    const/4 v0, 0x4

    if-ne p4, v0, :cond_65

    .line 373
    const-string v0, "Content-Type: image/jpg"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    goto :goto_33

    .line 374
    :cond_65
    const/4 v0, 0x5

    if-ne p4, v0, :cond_33

    .line 375
    const-string v0, "Content-Type: text/plain"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    goto :goto_33
.end method

.method private skipLine(Ljava/io/InputStream;)I
    .registers 5
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 223
    const/4 v1, 0x0

    .line 224
    .local v1, "len":I
    :goto_1
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v0

    .local v0, "c":I
    if-ltz v0, :cond_e

    const/16 v2, 0xd

    if-eq v0, v2, :cond_e

    .line 225
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 227
    :cond_e
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    .line 228
    return v1
.end method


# virtual methods
.method public addTranslator(Ljavassist/ClassPool;Ljavassist/Translator;)V
    .registers 4
    .param p1, "cp"    # Ljavassist/ClassPool;
    .param p2, "t"    # Ljavassist/Translator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;,
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 127
    iput-object p1, p0, Ljavassist/tools/web/Webserver;->classPool:Ljavassist/ClassPool;

    .line 128
    iput-object p2, p0, Ljavassist/tools/web/Webserver;->translator:Ljavassist/Translator;

    .line 129
    iget-object v0, p0, Ljavassist/tools/web/Webserver;->classPool:Ljavassist/ClassPool;

    invoke-interface {p2, v0}, Ljavassist/Translator;->start(Ljavassist/ClassPool;)V

    .line 130
    return-void
.end method

.method public doReply(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/lang/String;)V
    .registers 16
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
    .line 244
    const-string v9, "GET /"

    invoke-virtual {p3, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2c

    .line 245
    const/4 v9, 0x5

    const/16 v10, 0x20

    const/4 v11, 0x5

    invoke-virtual {p3, v10, v11}, Ljava/lang/String;->indexOf(II)I

    move-result v10

    invoke-virtual {p3, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .local v8, "urlName":Ljava/lang/String;
    move-object v5, v8

    .line 249
    .local v5, "filename":Ljava/lang/String;
    const-string v9, ".class"

    invoke-virtual {v5, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_32

    .line 250
    const/4 v3, 0x2

    .line 260
    .local v3, "fileType":I
    :goto_1e
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    .line 261
    .local v7, "len":I
    const/4 v9, 0x2

    if-ne v3, v9, :cond_5a

    invoke-direct {p0, p2, v5, v7}, Ljavassist/tools/web/Webserver;->letUsersSendClassfile(Ljava/io/OutputStream;Ljava/lang/String;I)Z

    move-result v9

    if-eqz v9, :cond_5a

    .line 310
    :goto_2b
    return-void

    .line 247
    .end local v3    # "fileType":I
    .end local v5    # "filename":Ljava/lang/String;
    .end local v7    # "len":I
    .end local v8    # "urlName":Ljava/lang/String;
    :cond_2c
    new-instance v9, Ljavassist/tools/web/BadHttpRequest;

    invoke-direct {v9}, Ljavassist/tools/web/BadHttpRequest;-><init>()V

    throw v9

    .line 251
    .restart local v5    # "filename":Ljava/lang/String;
    .restart local v8    # "urlName":Ljava/lang/String;
    :cond_32
    const-string v9, ".html"

    invoke-virtual {v5, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_42

    const-string v9, ".htm"

    invoke-virtual {v5, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_44

    .line 252
    :cond_42
    const/4 v3, 0x1

    .restart local v3    # "fileType":I
    goto :goto_1e

    .line 253
    .end local v3    # "fileType":I
    :cond_44
    const-string v9, ".gif"

    invoke-virtual {v5, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4e

    .line 254
    const/4 v3, 0x3

    .restart local v3    # "fileType":I
    goto :goto_1e

    .line 255
    .end local v3    # "fileType":I
    :cond_4e
    const-string v9, ".jpg"

    invoke-virtual {v5, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_58

    .line 256
    const/4 v3, 0x4

    .restart local v3    # "fileType":I
    goto :goto_1e

    .line 258
    .end local v3    # "fileType":I
    :cond_58
    const/4 v3, 0x5

    .restart local v3    # "fileType":I
    goto :goto_1e

    .line 265
    .restart local v7    # "len":I
    :cond_5a
    invoke-direct {p0, v5, v7}, Ljavassist/tools/web/Webserver;->checkFilename(Ljava/lang/String;I)V

    .line 266
    iget-object v9, p0, Ljavassist/tools/web/Webserver;->htmlfileBase:Ljava/lang/String;

    if-eqz v9, :cond_74

    .line 267
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v10, p0, Ljavassist/tools/web/Webserver;->htmlfileBase:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 269
    :cond_74
    sget-char v9, Ljava/io/File;->separatorChar:C

    const/16 v10, 0x2f

    if-eq v9, v10, :cond_82

    .line 270
    const/16 v9, 0x2f

    sget-char v10, Ljava/io/File;->separatorChar:C

    invoke-virtual {v5, v9, v10}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v5

    .line 272
    :cond_82
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 273
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->canRead()Z

    move-result v9

    if-eqz v9, :cond_ac

    .line 274
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v9

    invoke-direct {p0, p2, v9, v10, v3}, Ljavassist/tools/web/Webserver;->sendHeader(Ljava/io/OutputStream;JI)V

    .line 275
    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 276
    .local v6, "fin":Ljava/io/FileInputStream;
    const/16 v9, 0x1000

    new-array v4, v9, [B

    .line 278
    .local v4, "filebuffer":[B
    :goto_9d
    invoke-virtual {v6, v4}, Ljava/io/FileInputStream;->read([B)I

    move-result v7

    .line 279
    if-gtz v7, :cond_a7

    .line 285
    invoke-virtual {v6}, Ljava/io/FileInputStream;->close()V

    goto :goto_2b

    .line 282
    :cond_a7
    const/4 v9, 0x0

    invoke-virtual {p2, v4, v9, v7}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_9d

    .line 292
    .end local v4    # "filebuffer":[B
    .end local v6    # "fin":Ljava/io/FileInputStream;
    :cond_ac
    const/4 v9, 0x2

    if-ne v3, v9, :cond_f2

    .line 293
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    .line 295
    .local v6, "fin":Ljava/io/InputStream;
    if-eqz v6, :cond_f2

    .line 296
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 297
    .local v0, "barray":Ljava/io/ByteArrayOutputStream;
    const/16 v9, 0x1000

    new-array v4, v9, [B

    .line 299
    .restart local v4    # "filebuffer":[B
    :goto_d5
    invoke-virtual {v6, v4}, Ljava/io/InputStream;->read([B)I

    move-result v7

    .line 300
    if-gtz v7, :cond_ed

    .line 306
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 307
    .local v1, "classfile":[B
    array-length v9, v1

    int-to-long v9, v9

    const/4 v11, 0x2

    invoke-direct {p0, p2, v9, v10, v11}, Ljavassist/tools/web/Webserver;->sendHeader(Ljava/io/OutputStream;JI)V

    .line 308
    invoke-virtual {p2, v1}, Ljava/io/OutputStream;->write([B)V

    .line 309
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    goto/16 :goto_2b

    .line 303
    .end local v1    # "classfile":[B
    :cond_ed
    const/4 v9, 0x0

    invoke-virtual {v0, v4, v9, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_d5

    .line 314
    .end local v0    # "barray":Ljava/io/ByteArrayOutputStream;
    .end local v4    # "filebuffer":[B
    .end local v6    # "fin":Ljava/io/InputStream;
    :cond_f2
    new-instance v9, Ljavassist/tools/web/BadHttpRequest;

    invoke-direct {v9}, Ljavassist/tools/web/BadHttpRequest;-><init>()V

    throw v9
.end method

.method public end()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 136
    iget-object v0, p0, Ljavassist/tools/web/Webserver;->socket:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->close()V

    .line 137
    return-void
.end method

.method public logging(Ljava/lang/String;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 143
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 144
    return-void
.end method

.method public logging(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "msg1"    # Ljava/lang/String;
    .param p2, "msg2"    # Ljava/lang/String;

    .prologue
    .line 150
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 151
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 152
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 153
    return-void
.end method

.method public logging(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "msg1"    # Ljava/lang/String;
    .param p2, "msg2"    # Ljava/lang/String;
    .param p3, "msg3"    # Ljava/lang/String;

    .prologue
    .line 159
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 160
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 161
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 162
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 163
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 164
    return-void
.end method

.method public logging2(Ljava/lang/String;)V
    .registers 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 170
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "    "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 171
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 172
    return-void
.end method

.method final process(Ljava/net/Socket;)V
    .registers 8
    .param p1, "clnt"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    new-instance v2, Ljava/io/BufferedInputStream;

    invoke-virtual {p1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 191
    .local v2, "in":Ljava/io/InputStream;
    invoke-direct {p0, v2}, Ljavassist/tools/web/Webserver;->readLine(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    .line 192
    .local v0, "cmd":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v5}, Ljava/util/Date;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5, v0}, Ljavassist/tools/web/Webserver;->logging(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    :cond_21
    invoke-direct {p0, v2}, Ljavassist/tools/web/Webserver;->skipLine(Ljava/io/InputStream;)I

    move-result v4

    if-gtz v4, :cond_21

    .line 197
    new-instance v3, Ljava/io/BufferedOutputStream;

    invoke-virtual {p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 199
    .local v3, "out":Ljava/io/OutputStream;
    :try_start_30
    invoke-virtual {p0, v2, v3, v0}, Ljavassist/tools/web/Webserver;->doReply(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_33
    .catch Ljavassist/tools/web/BadHttpRequest; {:try_start_30 .. :try_end_33} :catch_40

    .line 205
    :goto_33
    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V

    .line 206
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 207
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 208
    invoke-virtual {p1}, Ljava/net/Socket;->close()V

    .line 209
    return-void

    .line 201
    :catch_40
    move-exception v1

    .line 202
    .local v1, "e":Ljavassist/tools/web/BadHttpRequest;
    invoke-direct {p0, v3, v1}, Ljavassist/tools/web/Webserver;->replyError(Ljava/io/OutputStream;Ljavassist/tools/web/BadHttpRequest;)V

    goto :goto_33
.end method

.method public run()V
    .registers 5

    .prologue
    .line 178
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v3, "ready to service..."

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 181
    :goto_7
    :try_start_7
    new-instance v1, Ljavassist/tools/web/ServiceThread;

    iget-object v2, p0, Ljavassist/tools/web/Webserver;->socket:Ljava/net/ServerSocket;

    invoke-virtual {v2}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Ljavassist/tools/web/ServiceThread;-><init>(Ljavassist/tools/web/Webserver;Ljava/net/Socket;)V

    .line 182
    .local v1, "th":Ljavassist/tools/web/ServiceThread;
    invoke-virtual {v1}, Ljavassist/tools/web/ServiceThread;->start()V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_15} :catch_16

    goto :goto_7

    .line 184
    .end local v1    # "th":Ljavassist/tools/web/ServiceThread;
    :catch_16
    move-exception v0

    .line 185
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljavassist/tools/web/Webserver;->logging(Ljava/lang/String;)V

    goto :goto_7
.end method

.method public setClassPool(Ljavassist/ClassPool;)V
    .registers 2
    .param p1, "loader"    # Ljavassist/ClassPool;

    .prologue
    .line 113
    iput-object p1, p0, Ljavassist/tools/web/Webserver;->classPool:Ljavassist/ClassPool;

    .line 114
    return-void
.end method
