.class final Lfreemarker/ext/jsp/TaglibFactory$Taglib;
.super Ljava/lang/Object;
.source "TaglibFactory.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/jsp/TaglibFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Taglib"
.end annotation


# instance fields
.field private final tags:Ljava/util/Map;


# direct methods
.method constructor <init>(Ljavax/servlet/ServletContext;Lfreemarker/ext/jsp/TaglibFactory$TldPath;Ljava/lang/String;)V
    .registers 5
    .param p1, "ctx"    # Ljavax/servlet/ServletContext;
    .param p2, "tldPath"    # Lfreemarker/ext/jsp/TaglibFactory$TldPath;
    .param p3, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 496
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 497
    invoke-static {p1, p2, p3}, Lfreemarker/ext/jsp/TaglibFactory$Taglib;->loadTaglib(Ljavax/servlet/ServletContext;Lfreemarker/ext/jsp/TaglibFactory$TldPath;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$Taglib;->tags:Ljava/util/Map;

    .line 498
    return-void
.end method

.method private static final loadTaglib(Ljavax/servlet/ServletContext;Lfreemarker/ext/jsp/TaglibFactory$TldPath;Ljava/lang/String;)Ljava/util/Map;
    .registers 15
    .param p0, "ctx"    # Ljavax/servlet/ServletContext;
    .param p1, "tldPath"    # Lfreemarker/ext/jsp/TaglibFactory$TldPath;
    .param p2, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 511
    new-instance v5, Lfreemarker/ext/jsp/TaglibFactory$TldParser;

    const/4 v9, 0x0

    invoke-direct {v5, v9}, Lfreemarker/ext/jsp/TaglibFactory$TldParser;-><init>(Lfreemarker/ext/jsp/TaglibFactory$1;)V

    .line 512
    .local v5, "tldParser":Lfreemarker/ext/jsp/TaglibFactory$TldParser;
    iget-object v1, p1, Lfreemarker/ext/jsp/TaglibFactory$TldPath;->filePath:Ljava/lang/String;

    .line 513
    .local v1, "filePath":Ljava/lang/String;
    invoke-interface {p0, v1}, Ljavax/servlet/ServletContext;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 514
    .local v3, "in":Ljava/io/InputStream;
    if-nez v3, :cond_31

    .line 515
    new-instance v9, Lfreemarker/template/TemplateModelException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "Could not find webapp resource "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, " for URI "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 518
    :cond_31
    invoke-interface {p0, v1}, Ljavax/servlet/ServletContext;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v9

    invoke-virtual {v9}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v2

    .line 520
    .local v2, "fileUrl":Ljava/lang/String;
    :try_start_39
    iget-object v4, p1, Lfreemarker/ext/jsp/TaglibFactory$TldPath;->jarItemPath:Ljava/lang/String;

    .line 521
    .local v4, "jarItemPath":Ljava/lang/String;
    if-eqz v4, :cond_b9

    .line 522
    new-instance v7, Ljava/util/zip/ZipInputStream;

    invoke-direct {v7, v3}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 524
    .local v7, "zin":Ljava/util/zip/ZipInputStream;
    :cond_42
    invoke-virtual {v7}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v6

    .line 525
    .local v6, "ze":Ljava/util/zip/ZipEntry;
    if-nez v6, :cond_7a

    .line 526
    new-instance v9, Lfreemarker/template/TemplateModelException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "Could not find JAR entry "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, " inside webapp resource "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, " for URI "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_75
    .catchall {:try_start_39 .. :try_end_75} :catchall_75

    .line 543
    .end local v4    # "jarItemPath":Ljava/lang/String;
    .end local v6    # "ze":Ljava/util/zip/ZipEntry;
    .end local v7    # "zin":Ljava/util/zip/ZipInputStream;
    :catchall_75
    move-exception v9

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    throw v9

    .line 531
    .restart local v4    # "jarItemPath":Ljava/lang/String;
    .restart local v6    # "ze":Ljava/util/zip/ZipEntry;
    .restart local v7    # "zin":Ljava/util/zip/ZipInputStream;
    :cond_7a
    :try_start_7a
    invoke-virtual {v6}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v8

    .line 532
    .local v8, "zname":Ljava/lang/String;
    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_42

    .line 533
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "jar:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "!"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9, v5}, Lfreemarker/ext/jsp/TaglibFactory;->access$500(Ljava/io/InputStream;Ljava/lang/String;Lorg/xml/sax/helpers/DefaultHandler;)V
    :try_end_a4
    .catchall {:try_start_7a .. :try_end_a4} :catchall_75

    .line 543
    .end local v6    # "ze":Ljava/util/zip/ZipEntry;
    .end local v7    # "zin":Ljava/util/zip/ZipInputStream;
    .end local v8    # "zname":Ljava/lang/String;
    :goto_a4
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 545
    invoke-static {p0}, Lfreemarker/ext/jsp/EventForwarding;->getInstance(Ljavax/servlet/ServletContext;)Lfreemarker/ext/jsp/EventForwarding;

    move-result-object v0

    .line 546
    .local v0, "eventForwarding":Lfreemarker/ext/jsp/EventForwarding;
    if-eqz v0, :cond_bd

    .line 547
    invoke-virtual {v5}, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->getListeners()Ljava/util/List;

    move-result-object v9

    invoke-virtual {v0, v9}, Lfreemarker/ext/jsp/EventForwarding;->addListeners(Ljava/util/List;)V

    .line 559
    :cond_b4
    invoke-virtual {v5}, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->getTags()Ljava/util/Map;

    move-result-object v9

    return-object v9

    .line 539
    .end local v0    # "eventForwarding":Lfreemarker/ext/jsp/EventForwarding;
    :cond_b9
    :try_start_b9
    invoke-static {v3, v2, v5}, Lfreemarker/ext/jsp/TaglibFactory;->access$500(Ljava/io/InputStream;Ljava/lang/String;Lorg/xml/sax/helpers/DefaultHandler;)V
    :try_end_bc
    .catchall {:try_start_b9 .. :try_end_bc} :catchall_75

    goto :goto_a4

    .line 549
    .restart local v0    # "eventForwarding":Lfreemarker/ext/jsp/EventForwarding;
    :cond_bd
    invoke-virtual {v5}, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->getListeners()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    if-lez v9, :cond_b4

    .line 550
    new-instance v10, Lfreemarker/template/TemplateModelException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "Event listeners specified in the TLD could not be  registered since the web application doesn\'t have a listener of class "

    invoke-virtual {v9, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    sget-object v9, Lfreemarker/ext/jsp/TaglibFactory;->class$freemarker$ext$jsp$EventForwarding:Ljava/lang/Class;

    if-nez v9, :cond_122

    const-string v9, "freemarker.ext.jsp.EventForwarding"

    invoke-static {v9}, Lfreemarker/ext/jsp/TaglibFactory;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    sput-object v9, Lfreemarker/ext/jsp/TaglibFactory;->class$freemarker$ext$jsp$EventForwarding:Ljava/lang/Class;

    :goto_e0
    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v11, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v11, ". To remedy this, add this element to web.xml:\n"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v11, "| <listener>\n"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v11, "|   <listener-class>"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    sget-object v9, Lfreemarker/ext/jsp/TaglibFactory;->class$freemarker$ext$jsp$EventForwarding:Ljava/lang/Class;

    if-nez v9, :cond_125

    const-string v9, "freemarker.ext.jsp.EventForwarding"

    invoke-static {v9}, Lfreemarker/ext/jsp/TaglibFactory;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    sput-object v9, Lfreemarker/ext/jsp/TaglibFactory;->class$freemarker$ext$jsp$EventForwarding:Ljava/lang/Class;

    :goto_106
    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v11, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v11, "</listener-class>\n"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v11, "| </listener>"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v10, v9}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v10

    :cond_122
    sget-object v9, Lfreemarker/ext/jsp/TaglibFactory;->class$freemarker$ext$jsp$EventForwarding:Ljava/lang/Class;

    goto :goto_e0

    :cond_125
    sget-object v9, Lfreemarker/ext/jsp/TaglibFactory;->class$freemarker$ext$jsp$EventForwarding:Ljava/lang/Class;

    goto :goto_106
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 501
    iget-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$Taglib;->tags:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateModel;

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 505
    iget-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$Taglib;->tags:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method
