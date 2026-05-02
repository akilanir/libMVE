.class final Lfreemarker/ext/jsp/TaglibFactory$LocalTaglibDtds;
.super Ljava/lang/Object;
.source "TaglibFactory.java"

# interfaces
.implements Lorg/xml/sax/EntityResolver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/jsp/TaglibFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LocalTaglibDtds"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 710
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jsp/TaglibFactory$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/ext/jsp/TaglibFactory$1;

    .prologue
    .line 710
    invoke-direct {p0}, Lfreemarker/ext/jsp/TaglibFactory$LocalTaglibDtds;-><init>()V

    return-void
.end method


# virtual methods
.method public resolveEntity(Ljava/lang/String;Ljava/lang/String;)Lorg/xml/sax/InputSource;
    .registers 7
    .param p1, "publicId"    # Ljava/lang/String;
    .param p2, "systemId"    # Ljava/lang/String;

    .prologue
    .line 713
    invoke-static {}, Lfreemarker/ext/jsp/TaglibFactory;->access$600()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 714
    .local v1, "resourceName":Ljava/lang/String;
    if-nez v1, :cond_16

    .line 716
    invoke-static {}, Lfreemarker/ext/jsp/TaglibFactory;->access$600()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "resourceName":Ljava/lang/String;
    check-cast v1, Ljava/lang/String;

    .line 719
    .restart local v1    # "resourceName":Ljava/lang/String;
    :cond_16
    if-eqz v1, :cond_2f

    .line 721
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 728
    .local v2, "resourceStream":Ljava/io/InputStream;
    :goto_20
    new-instance v0, Lorg/xml/sax/InputSource;

    invoke-direct {v0}, Lorg/xml/sax/InputSource;-><init>()V

    .line 729
    .local v0, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v0, p1}, Lorg/xml/sax/InputSource;->setPublicId(Ljava/lang/String;)V

    .line 730
    invoke-virtual {v0, p2}, Lorg/xml/sax/InputSource;->setSystemId(Ljava/lang/String;)V

    .line 731
    invoke-virtual {v0, v2}, Lorg/xml/sax/InputSource;->setByteStream(Ljava/io/InputStream;)V

    .line 732
    return-object v0

    .line 726
    .end local v0    # "is":Lorg/xml/sax/InputSource;
    .end local v2    # "resourceStream":Ljava/io/InputStream;
    :cond_2f
    new-instance v2, Ljava/io/ByteArrayInputStream;

    const/4 v3, 0x0

    new-array v3, v3, [B

    invoke-direct {v2, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .restart local v2    # "resourceStream":Ljava/io/InputStream;
    goto :goto_20
.end method
