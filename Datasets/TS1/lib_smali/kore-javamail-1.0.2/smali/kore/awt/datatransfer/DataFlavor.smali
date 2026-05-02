.class public Lkore/awt/datatransfer/DataFlavor;
.super Ljava/lang/Object;
.source "DataFlavor.java"

# interfaces
.implements Ljava/io/Externalizable;
.implements Ljava/lang/Cloneable;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final javaFileListFlavor:Lkore/awt/datatransfer/DataFlavor;

.field public static final javaJVMLocalObjectMimeType:Ljava/lang/String; = "application/x-java-jvm-local-objectref"

.field public static final javaRemoteObjectMimeType:Ljava/lang/String; = "application/x-java-remote-object"

.field public static final javaSerializedObjectMimeType:Ljava/lang/String; = "application/x-java-serialized-object"

.field public static final plainTextFlavor:Lkore/awt/datatransfer/DataFlavor;

.field static final serialVersionUID:J = 0x741da5db78a37333L

.field public static final stringFlavor:Lkore/awt/datatransfer/DataFlavor;


# instance fields
.field private humanPresentableName:Ljava/lang/String;

.field private mimeType:Lkore/awt/datatransfer/MimeType;

.field private representationClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 62
    const-class v0, Lkore/awt/datatransfer/DataFlavor;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_2d

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lkore/awt/datatransfer/DataFlavor;->$assertionsDisabled:Z

    .line 76
    new-instance v0, Lkore/awt/datatransfer/DataFlavor;

    const-string v1, "text/plain; charset=unicode; class=java.io.InputStream"

    const-string v2, "plain unicode text"

    invoke-direct {v0, v1, v2}, Lkore/awt/datatransfer/DataFlavor;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lkore/awt/datatransfer/DataFlavor;->plainTextFlavor:Lkore/awt/datatransfer/DataFlavor;

    .line 85
    new-instance v0, Lkore/awt/datatransfer/DataFlavor;

    const-class v1, Ljava/lang/String;

    const-string v2, "Java Unicode String"

    invoke-direct {v0, v1, v2}, Lkore/awt/datatransfer/DataFlavor;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lkore/awt/datatransfer/DataFlavor;->stringFlavor:Lkore/awt/datatransfer/DataFlavor;

    .line 93
    new-instance v0, Lkore/awt/datatransfer/DataFlavor;

    const-string v1, "application/x-java-file-list; class=java.util.List"

    const-string v2, "Java File List"

    invoke-direct {v0, v1, v2}, Lkore/awt/datatransfer/DataFlavor;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lkore/awt/datatransfer/DataFlavor;->javaFileListFlavor:Lkore/awt/datatransfer/DataFlavor;

    return-void

    .line 62
    :cond_2d
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 263
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 265
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .registers 6
    .param p2, "humanPresentableName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 278
    .local p1, "representationClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 279
    if-nez p1, :cond_d

    .line 280
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "representationClass must not be null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 283
    :cond_d
    :try_start_d
    new-instance v1, Lkore/awt/datatransfer/MimeType;

    const-string v2, "application/x-java-serialized-object"

    invoke-direct {v1, v2}, Lkore/awt/datatransfer/MimeType;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;
    :try_end_16
    .catch Lkore/awt/datatransfer/MimeTypeParseException; {:try_start_d .. :try_end_16} :catch_1f

    .line 290
    :cond_16
    if-nez p2, :cond_1a

    .line 291
    const-string p2, "application/x-java-serialized-object"

    .line 292
    :cond_1a
    iput-object p2, p0, Lkore/awt/datatransfer/DataFlavor;->humanPresentableName:Ljava/lang/String;

    .line 293
    iput-object p1, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    .line 294
    return-void

    .line 285
    :catch_1f
    move-exception v0

    .line 288
    .local v0, "ex":Lkore/awt/datatransfer/MimeTypeParseException;
    sget-boolean v1, Lkore/awt/datatransfer/DataFlavor;->$assertionsDisabled:Z

    if-nez v1, :cond_16

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "mimeType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 367
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 368
    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lkore/awt/datatransfer/DataFlavor;->init(Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 369
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "humanPresentableName"    # Ljava/lang/String;

    .prologue
    .line 338
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 341
    :try_start_3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-direct {p0, p1, p2, v2}, Lkore/awt/datatransfer/DataFlavor;->init(Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V
    :try_end_e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_e} :catch_f

    .line 350
    return-void

    .line 343
    :catch_f
    move-exception v0

    .line 345
    .local v0, "ex":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Class not found: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 346
    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 347
    .local v1, "iae":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v1, v0}, Ljava/lang/IllegalArgumentException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 348
    throw v1
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V
    .registers 4
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "humanPresentableName"    # Ljava/lang/String;
    .param p3, "classLoader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 317
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 318
    invoke-direct {p0, p1, p2, p3}, Lkore/awt/datatransfer/DataFlavor;->init(Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 319
    return-void
.end method

.method public static final getTextPlainUnicodeFlavor()Lkore/awt/datatransfer/DataFlavor;
    .registers 1

    .prologue
    .line 202
    sget-object v0, Lkore/awt/datatransfer/DataFlavor;->plainTextFlavor:Lkore/awt/datatransfer/DataFlavor;

    return-object v0
.end method

.method private init(Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V
    .registers 10
    .param p1, "mime"    # Ljava/lang/String;
    .param p2, "humanPresentableName"    # Ljava/lang/String;
    .param p3, "loader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 383
    if-nez p1, :cond_a

    .line 384
    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "The mime type must not be null"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 387
    :cond_a
    :try_start_a
    new-instance v3, Lkore/awt/datatransfer/MimeType;

    invoke-direct {v3, p1}, Lkore/awt/datatransfer/MimeType;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;
    :try_end_11
    .catch Lkore/awt/datatransfer/MimeTypeParseException; {:try_start_a .. :try_end_11} :catch_31

    .line 396
    iget-object v3, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;

    const-string v4, "class"

    invoke-virtual {v3, v4}, Lkore/awt/datatransfer/MimeType;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 397
    .local v0, "className":Ljava/lang/String;
    if-nez v0, :cond_63

    .line 399
    iget-object v3, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;

    invoke-virtual {v3}, Lkore/awt/datatransfer/MimeType;->getBaseType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "application/x-java-serialized-object"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3d

    .line 400
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Serialized object type must have a representation class parameter"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 389
    .end local v0    # "className":Ljava/lang/String;
    :catch_31
    move-exception v1

    .line 391
    .local v1, "ex":Lkore/awt/datatransfer/MimeTypeParseException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Invalid mime type"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 393
    .local v2, "iae":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v2, v1}, Ljava/lang/IllegalArgumentException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 394
    throw v2

    .line 403
    .end local v1    # "ex":Lkore/awt/datatransfer/MimeTypeParseException;
    .end local v2    # "iae":Ljava/lang/IllegalArgumentException;
    .restart local v0    # "className":Ljava/lang/String;
    :cond_3d
    const-class v3, Ljava/io/InputStream;

    iput-object v3, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    .line 407
    :goto_41
    iget-object v3, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;

    const-string v4, "class"

    iget-object v5, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lkore/awt/datatransfer/MimeType;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 409
    if-nez p2, :cond_60

    .line 411
    iget-object v3, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;

    const-string v4, "humanPresentableName"

    invoke-virtual {v3, v4}, Lkore/awt/datatransfer/MimeType;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 412
    if-nez p2, :cond_60

    .line 413
    iget-object v3, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;

    invoke-virtual {v3}, Lkore/awt/datatransfer/MimeType;->getBaseType()Ljava/lang/String;

    move-result-object p2

    .line 415
    :cond_60
    iput-object p2, p0, Lkore/awt/datatransfer/DataFlavor;->humanPresentableName:Ljava/lang/String;

    .line 416
    return-void

    .line 406
    :cond_63
    invoke-static {v0, p3}, Lkore/awt/datatransfer/DataFlavor;->tryToLoadClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v3

    iput-object v3, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    goto :goto_41
.end method

.method public static final selectBestTextFlavor([Lkore/awt/datatransfer/DataFlavor;)Lkore/awt/datatransfer/DataFlavor;
    .registers 9
    .param p0, "availableFlavors"    # [Lkore/awt/datatransfer/DataFlavor;

    .prologue
    .line 218
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    array-length v6, p0

    if-ge v3, v6, :cond_4d

    .line 220
    aget-object v1, p0, v3

    .line 221
    .local v1, "df":Lkore/awt/datatransfer/DataFlavor;
    iget-object v0, v1, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    .line 224
    .local v0, "c":Ljava/lang/Class;
    const-class v6, Ljava/io/Reader;

    invoke-virtual {v6, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-nez v6, :cond_18

    const-class v6, Ljava/lang/String;

    .line 225
    invoke-virtual {v6, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_19

    .line 250
    .end local v0    # "c":Ljava/lang/Class;
    .end local v1    # "df":Lkore/awt/datatransfer/DataFlavor;
    :cond_18
    :goto_18
    return-object v1

    .line 229
    .restart local v0    # "c":Ljava/lang/Class;
    .restart local v1    # "df":Lkore/awt/datatransfer/DataFlavor;
    :cond_19
    const-class v6, Ljava/io/InputStream;

    invoke-virtual {v6, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_4a

    const-string v6, "text"

    .line 230
    invoke-virtual {v1}, Lkore/awt/datatransfer/DataFlavor;->getPrimaryType()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4a

    .line 232
    aget-object v6, p0, v3

    const-string v7, "charset"

    invoke-virtual {v6, v7}, Lkore/awt/datatransfer/DataFlavor;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 233
    .local v2, "encoding":Ljava/lang/String;
    if-nez v2, :cond_39

    .line 234
    const-string v2, "us-ascii"

    .line 235
    :cond_39
    const/4 v4, 0x0

    .line 239
    .local v4, "r":Ljava/io/Reader;
    :try_start_3a
    new-instance v5, Ljava/io/InputStreamReader;

    new-instance v6, Ljava/io/ByteArrayInputStream;

    const/4 v7, 0x0

    new-array v7, v7, [B

    invoke-direct {v6, v7}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v5, v6, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_47
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3a .. :try_end_47} :catch_4f

    .end local v4    # "r":Ljava/io/Reader;
    .local v5, "r":Ljava/io/Reader;
    move-object v4, v5

    .line 244
    .end local v5    # "r":Ljava/io/Reader;
    .restart local v4    # "r":Ljava/io/Reader;
    :goto_48
    if-nez v4, :cond_18

    .line 218
    .end local v2    # "encoding":Ljava/lang/String;
    .end local v4    # "r":Ljava/io/Reader;
    :cond_4a
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 250
    .end local v0    # "c":Ljava/lang/Class;
    .end local v1    # "df":Lkore/awt/datatransfer/DataFlavor;
    :cond_4d
    const/4 v1, 0x0

    goto :goto_18

    .line 242
    .restart local v0    # "c":Ljava/lang/Class;
    .restart local v1    # "df":Lkore/awt/datatransfer/DataFlavor;
    .restart local v2    # "encoding":Ljava/lang/String;
    .restart local v4    # "r":Ljava/io/Reader;
    :catch_4f
    move-exception v6

    goto :goto_48
.end method

.method protected static final tryToLoadClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 5
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/ClassLoader;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 162
    :try_start_1
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_4
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_4} :catch_6

    move-result-object v1

    .line 192
    :goto_5
    return-object v1

    .line 164
    :catch_6
    move-exception v1

    .line 172
    :try_start_7
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 173
    .local v0, "loader":Ljava/lang/ClassLoader;
    const/4 v1, 0x1

    invoke-static {p0, v1, v0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_f
    .catch Ljava/lang/ClassNotFoundException; {:try_start_7 .. :try_end_f} :catch_11

    move-result-object v1

    goto :goto_5

    .line 175
    .end local v0    # "loader":Ljava/lang/ClassLoader;
    :catch_11
    move-exception v1

    .line 183
    :try_start_12
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 184
    .restart local v0    # "loader":Ljava/lang/ClassLoader;
    const/4 v1, 0x1

    invoke-static {p0, v1, v0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_1e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_12 .. :try_end_1e} :catch_20

    move-result-object v1

    goto :goto_5

    .line 186
    .end local v0    # "loader":Ljava/lang/ClassLoader;
    :catch_20
    move-exception v1

    .line 191
    if-eqz p1, :cond_28

    .line 192
    invoke-static {p0, v2, p1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_5

    .line 194
    :cond_28
    new-instance v1, Ljava/lang/ClassNotFoundException;

    invoke-direct {v1, p0}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 641
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    .line 645
    :goto_4
    return-object v1

    .line 643
    :catch_5
    move-exception v0

    .line 645
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_4
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 718
    instance-of v0, p1, Lkore/awt/datatransfer/DataFlavor;

    if-nez v0, :cond_6

    .line 719
    const/4 v0, 0x0

    .line 721
    .end local p1    # "obj":Ljava/lang/Object;
    :goto_5
    return v0

    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_6
    check-cast p1, Lkore/awt/datatransfer/DataFlavor;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lkore/awt/datatransfer/DataFlavor;->equals(Lkore/awt/datatransfer/DataFlavor;)Z

    move-result v0

    goto :goto_5
.end method

.method public equals(Ljava/lang/String;)Z
    .registers 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 738
    invoke-virtual {p0, p1}, Lkore/awt/datatransfer/DataFlavor;->isMimeTypeEqual(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public equals(Lkore/awt/datatransfer/DataFlavor;)Z
    .registers 11
    .param p1, "flavor"    # Lkore/awt/datatransfer/DataFlavor;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 665
    if-nez p1, :cond_5

    .line 696
    :cond_4
    :goto_4
    return v5

    .line 668
    :cond_5
    invoke-virtual {p0}, Lkore/awt/datatransfer/DataFlavor;->getPrimaryType()Ljava/lang/String;

    move-result-object v3

    .line 669
    .local v3, "primary":Ljava/lang/String;
    invoke-virtual {p1}, Lkore/awt/datatransfer/DataFlavor;->getPrimaryType()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 672
    invoke-virtual {p0}, Lkore/awt/datatransfer/DataFlavor;->getSubType()Ljava/lang/String;

    move-result-object v4

    .line 673
    .local v4, "sub":Ljava/lang/String;
    invoke-virtual {p1}, Lkore/awt/datatransfer/DataFlavor;->getSubType()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 676
    iget-object v7, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    iget-object v8, p1, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    invoke-virtual {v7, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 679
    const-string v7, "text"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_82

    .line 680
    invoke-virtual {p0}, Lkore/awt/datatransfer/DataFlavor;->isRepresentationClassCharBuffer()Z

    move-result v7

    if-nez v7, :cond_82

    .line 681
    invoke-virtual {p0}, Lkore/awt/datatransfer/DataFlavor;->isRepresentationClassReader()Z

    move-result v7

    if-nez v7, :cond_82

    iget-object v7, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    const-class v8, Ljava/lang/String;

    if-eq v7, v8, :cond_82

    iget-object v7, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    .line 683
    invoke-virtual {v7}, Ljava/lang/Class;->isArray()Z

    move-result v7

    if-eqz v7, :cond_57

    iget-object v7, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    .line 684
    invoke-virtual {v7}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v7

    sget-object v8, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-eq v7, v8, :cond_82

    .line 686
    :cond_57
    const-string v7, "charset"

    invoke-virtual {p0, v7}, Lkore/awt/datatransfer/DataFlavor;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 687
    .local v0, "charset":Ljava/lang/String;
    const-string v7, "charset"

    invoke-virtual {p1, v7}, Lkore/awt/datatransfer/DataFlavor;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 688
    .local v2, "otherset":Ljava/lang/String;
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v7

    invoke-virtual {v7}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    .line 690
    .local v1, "defaultset":Ljava/lang/String;
    if-eqz v0, :cond_73

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7d

    .line 691
    :cond_73
    if-eqz v2, :cond_7b

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    :cond_7b
    move v5, v6

    goto :goto_4

    .line 693
    :cond_7d
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    goto :goto_4

    .end local v0    # "charset":Ljava/lang/String;
    .end local v1    # "defaultset":Ljava/lang/String;
    .end local v2    # "otherset":Ljava/lang/String;
    :cond_82
    move v5, v6

    .line 696
    goto :goto_4
.end method

.method public final getDefaultRepresentationClass()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 874
    const-class v0, Ljava/io/InputStream;

    return-object v0
.end method

.method public final getDefaultRepresentationClassAsString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 882
    invoke-virtual {p0}, Lkore/awt/datatransfer/DataFlavor;->getDefaultRepresentationClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHumanPresentableName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 445
    iget-object v0, p0, Lkore/awt/datatransfer/DataFlavor;->humanPresentableName:Ljava/lang/String;

    return-object v0
.end method

.method public getMimeType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 425
    iget-object v0, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;

    invoke-virtual {v0}, Lkore/awt/datatransfer/MimeType;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "paramName"    # Ljava/lang/String;

    .prologue
    .line 478
    const-string v0, "humanPresentableName"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 479
    invoke-virtual {p0}, Lkore/awt/datatransfer/DataFlavor;->getHumanPresentableName()Ljava/lang/String;

    move-result-object v0

    .line 481
    :goto_c
    return-object v0

    :cond_d
    iget-object v0, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;

    invoke-virtual {v0, p1}, Lkore/awt/datatransfer/MimeType;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_c
.end method

.method public getPrimaryType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 455
    iget-object v0, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;

    invoke-virtual {v0}, Lkore/awt/datatransfer/MimeType;->getPrimaryType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getReaderForText(Lkore/awt/datatransfer/Transferable;)Ljava/io/Reader;
    .registers 6
    .param p1, "transferable"    # Lkore/awt/datatransfer/Transferable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkore/awt/datatransfer/UnsupportedFlavorException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 913
    invoke-interface {p1, p0}, Lkore/awt/datatransfer/Transferable;->isDataFlavorSupported(Lkore/awt/datatransfer/DataFlavor;)Z

    move-result v2

    if-nez v2, :cond_c

    .line 914
    new-instance v2, Lkore/awt/datatransfer/UnsupportedFlavorException;

    invoke-direct {v2, p0}, Lkore/awt/datatransfer/UnsupportedFlavorException;-><init>(Lkore/awt/datatransfer/DataFlavor;)V

    throw v2

    .line 916
    :cond_c
    const-class v2, Ljava/io/Reader;

    iget-object v3, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    invoke-virtual {v2, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 917
    invoke-interface {p1, p0}, Lkore/awt/datatransfer/Transferable;->getTransferData(Lkore/awt/datatransfer/DataFlavor;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/Reader;

    .line 929
    :goto_1c
    return-object v2

    .line 919
    :cond_1d
    const-class v2, Ljava/lang/String;

    iget-object v3, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    invoke-virtual {v2, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_34

    .line 920
    new-instance v3, Ljava/io/StringReader;

    invoke-interface {p1, p0}, Lkore/awt/datatransfer/Transferable;->getTransferData(Lkore/awt/datatransfer/DataFlavor;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-direct {v3, v2}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    move-object v2, v3

    goto :goto_1c

    .line 922
    :cond_34
    const-class v2, Ljava/io/InputStream;

    iget-object v3, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    invoke-virtual {v2, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_60

    const-string v2, "text"

    .line 923
    invoke-virtual {p0}, Lkore/awt/datatransfer/DataFlavor;->getPrimaryType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_60

    .line 925
    invoke-interface {p1, p0}, Lkore/awt/datatransfer/Transferable;->getTransferData(Lkore/awt/datatransfer/DataFlavor;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/InputStream;

    .line 926
    .local v1, "in":Ljava/io/InputStream;
    const-string v2, "charset"

    invoke-virtual {p0, v2}, Lkore/awt/datatransfer/DataFlavor;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 927
    .local v0, "encoding":Ljava/lang/String;
    if-nez v0, :cond_5a

    .line 928
    const-string v0, "us-ascii"

    .line 929
    :cond_5a
    new-instance v2, Ljava/io/InputStreamReader;

    invoke-direct {v2, v1, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    goto :goto_1c

    .line 932
    .end local v0    # "encoding":Ljava/lang/String;
    .end local v1    # "in":Ljava/io/InputStream;
    :cond_60
    new-instance v2, Lkore/awt/datatransfer/UnsupportedFlavorException;

    invoke-direct {v2, p0}, Lkore/awt/datatransfer/UnsupportedFlavorException;-><init>(Lkore/awt/datatransfer/DataFlavor;)V

    throw v2
.end method

.method public getRepresentationClass()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 435
    iget-object v0, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    return-object v0
.end method

.method public getSubType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 465
    iget-object v0, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;

    invoke-virtual {v0}, Lkore/awt/datatransfer/MimeType;->getSubType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 748
    iget-object v0, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;

    invoke-virtual {v0}, Lkore/awt/datatransfer/MimeType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iget-object v1, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public isFlavorJavaFileListType()Z
    .registers 3

    .prologue
    .line 618
    invoke-virtual {p0}, Lkore/awt/datatransfer/DataFlavor;->getPrimaryType()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lkore/awt/datatransfer/DataFlavor;->javaFileListFlavor:Lkore/awt/datatransfer/DataFlavor;

    invoke-virtual {v1}, Lkore/awt/datatransfer/DataFlavor;->getPrimaryType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 619
    invoke-virtual {p0}, Lkore/awt/datatransfer/DataFlavor;->getSubType()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lkore/awt/datatransfer/DataFlavor;->javaFileListFlavor:Lkore/awt/datatransfer/DataFlavor;

    invoke-virtual {v1}, Lkore/awt/datatransfer/DataFlavor;->getSubType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    sget-object v0, Lkore/awt/datatransfer/DataFlavor;->javaFileListFlavor:Lkore/awt/datatransfer/DataFlavor;

    iget-object v0, v0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    iget-object v1, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    .line 621
    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 622
    const/4 v0, 0x1

    .line 624
    :goto_2d
    return v0

    :cond_2e
    const/4 v0, 0x0

    goto :goto_2d
.end method

.method public isFlavorRemoteObjectType()Z
    .registers 2

    .prologue
    .line 605
    invoke-virtual {p0}, Lkore/awt/datatransfer/DataFlavor;->isRepresentationClassRemote()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 606
    invoke-virtual {p0}, Lkore/awt/datatransfer/DataFlavor;->isRepresentationClassSerializable()Z

    move-result v0

    if-eqz v0, :cond_16

    const-string v0, "application/x-java-remote-object"

    .line 607
    invoke-virtual {p0, v0}, Lkore/awt/datatransfer/DataFlavor;->isMimeTypeEqual(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public isFlavorSerializedObjectType()Z
    .registers 2

    .prologue
    .line 593
    invoke-virtual {p0}, Lkore/awt/datatransfer/DataFlavor;->isRepresentationClassSerializable()Z

    move-result v0

    if-eqz v0, :cond_10

    const-string v0, "application/x-java-serialized-object"

    .line 594
    invoke-virtual {p0, v0}, Lkore/awt/datatransfer/DataFlavor;->isMimeTypeEqual(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public isFlavorTextType()Z
    .registers 6

    .prologue
    const/4 v2, 0x1

    .line 999
    sget-object v3, Lkore/awt/datatransfer/DataFlavor;->stringFlavor:Lkore/awt/datatransfer/DataFlavor;

    invoke-virtual {p0, v3}, Lkore/awt/datatransfer/DataFlavor;->equals(Lkore/awt/datatransfer/DataFlavor;)Z

    move-result v3

    if-nez v3, :cond_15

    invoke-virtual {p0}, Lkore/awt/datatransfer/DataFlavor;->getPrimaryType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "text"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5f

    .line 1001
    :cond_15
    const-string v3, "charset"

    invoke-virtual {p0, v3}, Lkore/awt/datatransfer/DataFlavor;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1002
    .local v1, "charset":Ljava/lang/String;
    invoke-virtual {p0}, Lkore/awt/datatransfer/DataFlavor;->getRepresentationClass()Ljava/lang/Class;

    move-result-object v0

    .line 1003
    .local v0, "c":Ljava/lang/Class;
    if-eqz v1, :cond_4f

    .line 1005
    const-class v3, Ljava/io/Reader;

    invoke-virtual {v3, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_39

    const-class v3, Ljava/nio/CharBuffer;

    .line 1006
    invoke-virtual {v3, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_39

    const-class v3, Ljava/lang/String;

    .line 1007
    invoke-virtual {v3, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_3a

    .line 1023
    .end local v0    # "c":Ljava/lang/Class;
    .end local v1    # "charset":Ljava/lang/String;
    :cond_39
    :goto_39
    return v2

    .line 1011
    .restart local v0    # "c":Ljava/lang/Class;
    .restart local v1    # "charset":Ljava/lang/String;
    :cond_3a
    const-class v2, Ljava/io/InputStream;

    invoke-virtual {v2, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-nez v2, :cond_4a

    const-class v2, Ljava/nio/ByteBuffer;

    .line 1012
    invoke-virtual {v2, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_5f

    .line 1014
    :cond_4a
    invoke-static {v1}, Ljava/nio/charset/Charset;->isSupported(Ljava/lang/String;)Z

    move-result v2

    goto :goto_39

    .line 1017
    :cond_4f
    const-class v3, Ljava/io/InputStream;

    invoke-virtual {v3, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_39

    const-class v3, Ljava/nio/ByteBuffer;

    .line 1018
    invoke-virtual {v3, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_39

    .line 1023
    .end local v0    # "c":Ljava/lang/Class;
    .end local v1    # "charset":Ljava/lang/String;
    :cond_5f
    const/4 v2, 0x0

    goto :goto_39
.end method

.method public isMimeTypeEqual(Ljava/lang/String;)Z
    .registers 6
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 507
    if-nez p1, :cond_a

    .line 508
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "mimeType must not be null"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 509
    :cond_a
    const/4 v0, 0x0

    .line 512
    .local v0, "equal":Z
    :try_start_b
    iget-object v2, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;

    if-eqz v2, :cond_1a

    .line 514
    new-instance v1, Lkore/awt/datatransfer/MimeType;

    invoke-direct {v1, p1}, Lkore/awt/datatransfer/MimeType;-><init>(Ljava/lang/String;)V

    .line 515
    .local v1, "other":Lkore/awt/datatransfer/MimeType;
    iget-object v2, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;

    invoke-virtual {v2, v1}, Lkore/awt/datatransfer/MimeType;->matches(Lkore/awt/datatransfer/MimeType;)Z
    :try_end_19
    .catch Lkore/awt/datatransfer/MimeTypeParseException; {:try_start_b .. :try_end_19} :catch_1b

    move-result v0

    .line 522
    .end local v1    # "other":Lkore/awt/datatransfer/MimeType;
    :cond_1a
    :goto_1a
    return v0

    .line 518
    :catch_1b
    move-exception v2

    goto :goto_1a
.end method

.method public final isMimeTypeEqual(Lkore/awt/datatransfer/DataFlavor;)Z
    .registers 3
    .param p1, "flavor"    # Lkore/awt/datatransfer/DataFlavor;

    .prologue
    .line 536
    invoke-virtual {p1}, Lkore/awt/datatransfer/DataFlavor;->getMimeType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lkore/awt/datatransfer/DataFlavor;->isMimeTypeEqual(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isMimeTypeSerializedObject()Z
    .registers 2

    .prologue
    .line 547
    const-string v0, "application/x-java-serialized-object"

    invoke-virtual {p0, v0}, Lkore/awt/datatransfer/DataFlavor;->isMimeTypeEqual(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isRepresentationClassByteBuffer()Z
    .registers 3

    .prologue
    .line 943
    const-class v0, Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method public isRepresentationClassCharBuffer()Z
    .registers 3

    .prologue
    .line 954
    const-class v0, Ljava/nio/CharBuffer;

    iget-object v1, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method public isRepresentationClassInputStream()Z
    .registers 3

    .prologue
    .line 559
    const-class v0, Ljava/io/InputStream;

    iget-object v1, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method public isRepresentationClassReader()Z
    .registers 3

    .prologue
    .line 965
    const-class v0, Ljava/io/Reader;

    iget-object v1, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method public isRepresentationClassRemote()Z
    .registers 2

    .prologue
    .line 582
    const/4 v0, 0x0

    return v0
.end method

.method public isRepresentationClassSerializable()Z
    .registers 3

    .prologue
    .line 571
    const-class v0, Ljava/io/Serializable;

    iget-object v1, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method public match(Lkore/awt/datatransfer/DataFlavor;)Z
    .registers 3
    .param p1, "dataFlavor"    # Lkore/awt/datatransfer/DataFlavor;

    .prologue
    .line 758
    invoke-virtual {p0, p1}, Lkore/awt/datatransfer/DataFlavor;->equals(Lkore/awt/datatransfer/DataFlavor;)Z

    move-result v0

    return v0
.end method

.method protected normalizeMimeType(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 789
    return-object p1
.end method

.method protected normalizeMimeTypeParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 774
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readExternal(Ljava/io/ObjectInput;)V
    .registers 6
    .param p1, "stream"    # Ljava/io/ObjectInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 826
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkore/awt/datatransfer/MimeType;

    iput-object v2, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;

    .line 827
    const/4 v0, 0x0

    .line 828
    .local v0, "className":Ljava/lang/String;
    iget-object v2, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;

    if-eqz v2, :cond_30

    .line 830
    iget-object v2, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;

    const-string v3, "humanPresentableName"

    .line 831
    invoke-virtual {v2, v3}, Lkore/awt/datatransfer/MimeType;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lkore/awt/datatransfer/DataFlavor;->humanPresentableName:Ljava/lang/String;

    .line 832
    iget-object v2, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;

    const-string v3, "humanPresentableName"

    invoke-virtual {v2, v3}, Lkore/awt/datatransfer/MimeType;->removeParameter(Ljava/lang/String;)V

    .line 833
    iget-object v2, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;

    const-string v3, "class"

    invoke-virtual {v2, v3}, Lkore/awt/datatransfer/MimeType;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 834
    if-nez v0, :cond_30

    .line 835
    new-instance v2, Ljava/io/IOException;

    const-string v3, "No class in mime type"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 839
    :cond_30
    :try_start_30
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    iput-object v2, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;
    :try_end_38
    .catch Ljava/io/OptionalDataException; {:try_start_30 .. :try_end_38} :catch_39

    .line 852
    :cond_38
    :goto_38
    return-void

    .line 841
    :catch_39
    move-exception v1

    .line 843
    .local v1, "ex":Ljava/io/OptionalDataException;
    iget-boolean v2, v1, Ljava/io/OptionalDataException;->eof:Z

    if-eqz v2, :cond_53

    iget v2, v1, Ljava/io/OptionalDataException;->length:I

    if-nez v2, :cond_53

    .line 845
    if-eqz v0, :cond_38

    .line 847
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    .line 846
    invoke-static {v0, v2}, Lkore/awt/datatransfer/DataFlavor;->tryToLoadClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v2

    iput-object v2, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    goto :goto_38

    .line 850
    :cond_53
    throw v1
.end method

.method public setHumanPresentableName(Ljava/lang/String;)V
    .registers 2
    .param p1, "humanPresentableName"    # Ljava/lang/String;

    .prologue
    .line 491
    iput-object p1, p0, Lkore/awt/datatransfer/DataFlavor;->humanPresentableName:Ljava/lang/String;

    .line 492
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 860
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "[representationClass="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 861
    invoke-virtual {p0}, Lkore/awt/datatransfer/DataFlavor;->getRepresentationClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",mimeType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 862
    invoke-virtual {p0}, Lkore/awt/datatransfer/DataFlavor;->getMimeType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",humanPresentableName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 863
    invoke-virtual {p0}, Lkore/awt/datatransfer/DataFlavor;->getHumanPresentableName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeExternal(Ljava/io/ObjectOutput;)V
    .registers 5
    .param p1, "stream"    # Ljava/io/ObjectOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 802
    iget-object v0, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;

    if-eqz v0, :cond_1f

    .line 804
    iget-object v0, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;

    const-string v1, "humanPresentableName"

    iget-object v2, p0, Lkore/awt/datatransfer/DataFlavor;->humanPresentableName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lkore/awt/datatransfer/MimeType;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 805
    iget-object v0, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 806
    iget-object v0, p0, Lkore/awt/datatransfer/DataFlavor;->mimeType:Lkore/awt/datatransfer/MimeType;

    const-string v1, "humanPresentableName"

    invoke-virtual {v0, v1}, Lkore/awt/datatransfer/MimeType;->removeParameter(Ljava/lang/String;)V

    .line 810
    :goto_19
    iget-object v0, p0, Lkore/awt/datatransfer/DataFlavor;->representationClass:Ljava/lang/Class;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 811
    return-void

    .line 809
    :cond_1f
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    goto :goto_19
.end method
