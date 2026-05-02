.class public Lorg/msgpack/template/builder/beans/XMLDecoder;
.super Ljava/lang/Object;
.source "XMLDecoder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/msgpack/template/builder/beans/XMLDecoder$1;,
        Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;,
        Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;,
        Lorg/msgpack/template/builder/beans/XMLDecoder$DefaultExceptionListener;
    }
.end annotation


# instance fields
.field private defaultClassLoader:Ljava/lang/ClassLoader;

.field private inputStream:Ljava/io/InputStream;

.field private listener:Lorg/msgpack/template/builder/beans/ExceptionListener;

.field private owner:Ljava/lang/Object;

.field private readObjIndex:I

.field private readObjs:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;",
            ">;"
        }
    .end annotation
.end field

.field private saxHandler:Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "inputStream"    # Ljava/io/InputStream;

    .prologue
    const/4 v0, 0x0

    .line 579
    invoke-direct {p0, p1, v0, v0, v0}, Lorg/msgpack/template/builder/beans/XMLDecoder;-><init>(Ljava/io/InputStream;Ljava/lang/Object;Lorg/msgpack/template/builder/beans/ExceptionListener;Ljava/lang/ClassLoader;)V

    .line 580
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/Object;)V
    .registers 4
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "owner"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 591
    invoke-direct {p0, p1, p2, v0, v0}, Lorg/msgpack/template/builder/beans/XMLDecoder;-><init>(Ljava/io/InputStream;Ljava/lang/Object;Lorg/msgpack/template/builder/beans/ExceptionListener;Ljava/lang/ClassLoader;)V

    .line 592
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/Object;Lorg/msgpack/template/builder/beans/ExceptionListener;)V
    .registers 5
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "owner"    # Ljava/lang/Object;
    .param p3, "listener"    # Lorg/msgpack/template/builder/beans/ExceptionListener;

    .prologue
    .line 606
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/msgpack/template/builder/beans/XMLDecoder;-><init>(Ljava/io/InputStream;Ljava/lang/Object;Lorg/msgpack/template/builder/beans/ExceptionListener;Ljava/lang/ClassLoader;)V

    .line 607
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/Object;Lorg/msgpack/template/builder/beans/ExceptionListener;Ljava/lang/ClassLoader;)V
    .registers 7
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "owner"    # Ljava/lang/Object;
    .param p3, "listener"    # Lorg/msgpack/template/builder/beans/ExceptionListener;
    .param p4, "cl"    # Ljava/lang/ClassLoader;

    .prologue
    const/4 v1, 0x0

    .line 610
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object v1, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->defaultClassLoader:Ljava/lang/ClassLoader;

    .line 566
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjs:Ljava/util/Stack;

    .line 568
    const/4 v0, 0x0

    iput v0, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjIndex:I

    .line 570
    iput-object v1, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->saxHandler:Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;

    .line 611
    iput-object p1, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->inputStream:Ljava/io/InputStream;

    .line 612
    iput-object p2, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->owner:Ljava/lang/Object;

    .line 613
    if-nez p3, :cond_1d

    new-instance p3, Lorg/msgpack/template/builder/beans/XMLDecoder$DefaultExceptionListener;

    .end local p3    # "listener":Lorg/msgpack/template/builder/beans/ExceptionListener;
    invoke-direct {p3, v1}, Lorg/msgpack/template/builder/beans/XMLDecoder$DefaultExceptionListener;-><init>(Lorg/msgpack/template/builder/beans/XMLDecoder$1;)V

    :cond_1d
    iput-object p3, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->listener:Lorg/msgpack/template/builder/beans/ExceptionListener;

    .line 615
    iput-object p4, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->defaultClassLoader:Ljava/lang/ClassLoader;

    .line 616
    return-void
.end method

.method static synthetic access$000(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/util/Stack;
    .registers 2
    .param p0, "x0"    # Lorg/msgpack/template/builder/beans/XMLDecoder;

    .prologue
    .line 45
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjs:Ljava/util/Stack;

    return-object v0
.end method

.method static synthetic access$100(Lorg/msgpack/template/builder/beans/XMLDecoder;)Lorg/msgpack/template/builder/beans/ExceptionListener;
    .registers 2
    .param p0, "x0"    # Lorg/msgpack/template/builder/beans/XMLDecoder;

    .prologue
    .line 45
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->listener:Lorg/msgpack/template/builder/beans/ExceptionListener;

    return-object v0
.end method

.method static synthetic access$300(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lorg/msgpack/template/builder/beans/XMLDecoder;

    .prologue
    .line 45
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->owner:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$400(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/lang/ClassLoader;
    .registers 2
    .param p0, "x0"    # Lorg/msgpack/template/builder/beans/XMLDecoder;

    .prologue
    .line 45
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->defaultClassLoader:Ljava/lang/ClassLoader;

    return-object v0
.end method


# virtual methods
.method public close()V
    .registers 3

    .prologue
    .line 622
    iget-object v1, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->inputStream:Ljava/io/InputStream;

    if-nez v1, :cond_5

    .line 630
    :goto_4
    return-void

    .line 626
    :cond_5
    :try_start_5
    iget-object v1, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_a} :catch_b

    goto :goto_4

    .line 627
    :catch_b
    move-exception v0

    .line 628
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->listener:Lorg/msgpack/template/builder/beans/ExceptionListener;

    invoke-interface {v1, v0}, Lorg/msgpack/template/builder/beans/ExceptionListener;->exceptionThrown(Ljava/lang/Exception;)V

    goto :goto_4
.end method

.method public getExceptionListener()Lorg/msgpack/template/builder/beans/ExceptionListener;
    .registers 2

    .prologue
    .line 638
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->listener:Lorg/msgpack/template/builder/beans/ExceptionListener;

    return-object v0
.end method

.method public getOwner()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 647
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->owner:Ljava/lang/Object;

    return-object v0
.end method

.method public readObject()Ljava/lang/Object;
    .registers 6

    .prologue
    const/4 v2, 0x0

    .line 659
    iget-object v3, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->inputStream:Ljava/io/InputStream;

    if-nez v3, :cond_6

    .line 681
    :goto_5
    return-object v2

    .line 662
    :cond_6
    iget-object v3, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->saxHandler:Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;

    if-nez v3, :cond_20

    .line 663
    new-instance v3, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;

    invoke-direct {v3, p0, v2}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;-><init>(Lorg/msgpack/template/builder/beans/XMLDecoder;Lorg/msgpack/template/builder/beans/XMLDecoder$1;)V

    iput-object v3, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->saxHandler:Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;

    .line 665
    :try_start_11
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v2

    invoke-virtual {v2}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v2

    iget-object v3, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->inputStream:Ljava/io/InputStream;

    iget-object v4, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->saxHandler:Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;

    invoke-virtual {v2, v3, v4}, Ljavax/xml/parsers/SAXParser;->parse(Ljava/io/InputStream;Lorg/xml/sax/helpers/DefaultHandler;)V
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_20} :catch_36

    .line 672
    :cond_20
    :goto_20
    iget v2, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjIndex:I

    iget-object v3, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjs:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->size()I

    move-result v3

    if-lt v2, v3, :cond_3d

    .line 673
    new-instance v2, Ljava/lang/ArrayIndexOutOfBoundsException;

    const-string v3, "custom.beans.70"

    invoke-static {v3}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 667
    :catch_36
    move-exception v0

    .line 668
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->listener:Lorg/msgpack/template/builder/beans/ExceptionListener;

    invoke-interface {v2, v0}, Lorg/msgpack/template/builder/beans/ExceptionListener;->exceptionThrown(Ljava/lang/Exception;)V

    goto :goto_20

    .line 675
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_3d
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjs:Ljava/util/Stack;

    iget v3, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjIndex:I

    invoke-virtual {v2, v3}, Ljava/util/Stack;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;

    .line 676
    .local v1, "elem":Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    iget-boolean v2, v1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->isClosed:Z

    if-nez v2, :cond_57

    .line 678
    new-instance v2, Ljava/lang/ArrayIndexOutOfBoundsException;

    const-string v3, "custom.beans.70"

    invoke-static {v3}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 680
    :cond_57
    iget v2, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjIndex:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjIndex:I

    .line 681
    iget-object v2, v1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->result:Ljava/lang/Object;

    goto :goto_5
.end method

.method public setExceptionListener(Lorg/msgpack/template/builder/beans/ExceptionListener;)V
    .registers 2
    .param p1, "listener"    # Lorg/msgpack/template/builder/beans/ExceptionListener;

    .prologue
    .line 691
    if-eqz p1, :cond_4

    .line 692
    iput-object p1, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->listener:Lorg/msgpack/template/builder/beans/ExceptionListener;

    .line 694
    :cond_4
    return-void
.end method

.method public setOwner(Ljava/lang/Object;)V
    .registers 2
    .param p1, "owner"    # Ljava/lang/Object;

    .prologue
    .line 703
    iput-object p1, p0, Lorg/msgpack/template/builder/beans/XMLDecoder;->owner:Ljava/lang/Object;

    .line 704
    return-void
.end method
