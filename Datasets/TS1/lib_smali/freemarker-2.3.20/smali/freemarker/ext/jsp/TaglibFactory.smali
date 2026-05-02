.class public Lfreemarker/ext/jsp/TaglibFactory;
.super Ljava/lang/Object;
.source "TaglibFactory.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/ext/jsp/TaglibFactory$LocalTaglibDtds;,
        Lfreemarker/ext/jsp/TaglibFactory$TldParser;,
        Lfreemarker/ext/jsp/TaglibFactory$Taglib;,
        Lfreemarker/ext/jsp/TaglibFactory$TldUriReader;,
        Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;,
        Lfreemarker/ext/jsp/TaglibFactory$TldPath;
    }
.end annotation


# static fields
.field private static final ABS_URI:I = 0x0

.field private static final DEFAULT_JAR_TLD:Ljava/lang/String; = "META-INF/taglib.tld"

.field private static final LOOKUP_NONE:I = 0x0

.field private static final LOOKUP_WEB_APP:I = 0x2

.field private static final LOOKUP_WEB_XML:I = 0x1

.field private static final NOROOT_REL_URI:I = 0x2

.field private static final ROOT_REL_URI:I = 0x1

.field static class$freemarker$ext$jsp$EventForwarding:Ljava/lang/Class;

.field static class$javax$servlet$jsp$tagext$Tag:Ljava/lang/Class;

.field private static final dtds:Ljava/util/Map;

.field private static final logger:Lfreemarker/log/Logger;


# instance fields
.field private final ctx:Ljavax/servlet/ServletContext;

.field private final locations:Ljava/util/Map;

.field private lookupPhase:I

.field private final taglibs:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 101
    const-string v0, "freemarker.jsp"

    invoke-static {v0}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jsp/TaglibFactory;->logger:Lfreemarker/log/Logger;

    .line 686
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lfreemarker/ext/jsp/TaglibFactory;->dtds:Ljava/util/Map;

    .line 690
    sget-object v0, Lfreemarker/ext/jsp/TaglibFactory;->dtds:Ljava/util/Map;

    const-string v1, "http://java.sun.com/xml/ns/jee/web-jsptaglibrary_2_1.xsd"

    const-string v2, "web-jsptaglibrary_2_1.xsd"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 692
    sget-object v0, Lfreemarker/ext/jsp/TaglibFactory;->dtds:Ljava/util/Map;

    const-string v1, "http://java.sun.com/xml/ns/j2ee/web-jsptaglibrary_2_0.xsd"

    const-string v2, "web-jsptaglibrary_2_0.xsd"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 694
    sget-object v0, Lfreemarker/ext/jsp/TaglibFactory;->dtds:Ljava/util/Map;

    const-string v1, "-//Sun Microsystems, Inc.//DTD JSP Tag Library 1.2//EN"

    const-string v2, "web-jsptaglibrary_1_2.dtd"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 695
    sget-object v0, Lfreemarker/ext/jsp/TaglibFactory;->dtds:Ljava/util/Map;

    const-string v1, "http://java.sun.com/dtd/web-jsptaglibrary_1_2.dtd"

    const-string v2, "web-jsptaglibrary_1_2.dtd"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 697
    sget-object v0, Lfreemarker/ext/jsp/TaglibFactory;->dtds:Ljava/util/Map;

    const-string v1, "-//Sun Microsystems, Inc.//DTD JSP Tag Library 1.1//EN"

    const-string v2, "web-jsptaglibrary_1_1.dtd"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 698
    sget-object v0, Lfreemarker/ext/jsp/TaglibFactory;->dtds:Ljava/util/Map;

    const-string v1, "http://java.sun.com/j2ee/dtds/web-jsptaglibrary_1_1.dtd"

    const-string v2, "web-jsptaglibrary_1_1.dtd"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 700
    sget-object v0, Lfreemarker/ext/jsp/TaglibFactory;->dtds:Ljava/util/Map;

    const-string v1, "http://java.sun.com/xml/ns/jee/web-app_2_5.xsd"

    const-string v2, "web-app_2_5.xsd"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 702
    sget-object v0, Lfreemarker/ext/jsp/TaglibFactory;->dtds:Ljava/util/Map;

    const-string v1, "http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd"

    const-string v2, "web-app_2_4.xsd"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 704
    sget-object v0, Lfreemarker/ext/jsp/TaglibFactory;->dtds:Ljava/util/Map;

    const-string v1, "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"

    const-string v2, "web-app_2_3.dtd"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 705
    sget-object v0, Lfreemarker/ext/jsp/TaglibFactory;->dtds:Ljava/util/Map;

    const-string v1, "http://java.sun.com/dtd/web-app_2_3.dtd"

    const-string v2, "web-app_2_3.dtd"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 707
    sget-object v0, Lfreemarker/ext/jsp/TaglibFactory;->dtds:Ljava/util/Map;

    const-string v1, "-//Sun Microsystems, Inc.//DTD Web Application 2.2//EN"

    const-string v2, "web-app_2_2.dtd"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 708
    sget-object v0, Lfreemarker/ext/jsp/TaglibFactory;->dtds:Ljava/util/Map;

    const-string v1, "http://java.sun.com/j2ee/dtds/web-app_2_2.dtd"

    const-string v2, "web-app_2_2.dtd"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 709
    return-void
.end method

.method public constructor <init>(Ljavax/servlet/ServletContext;)V
    .registers 3
    .param p1, "ctx"    # Ljavax/servlet/ServletContext;

    .prologue
    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory;->taglibs:Ljava/util/Map;

    .line 117
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory;->locations:Ljava/util/Map;

    .line 118
    const/4 v0, 0x0

    iput v0, p0, Lfreemarker/ext/jsp/TaglibFactory;->lookupPhase:I

    .line 127
    iput-object p1, p0, Lfreemarker/ext/jsp/TaglibFactory;->ctx:Ljavax/servlet/ServletContext;

    .line 128
    return-void
.end method

.method static access$100(Ljava/lang/String;)I
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 100
    invoke-static {p0}, Lfreemarker/ext/jsp/TaglibFactory;->getUriType(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static access$200(Lfreemarker/ext/jsp/TaglibFactory;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p0, "x0"    # Lfreemarker/ext/jsp/TaglibFactory;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Ljava/lang/String;

    .prologue
    .line 100
    invoke-direct {p0, p1, p2, p3, p4}, Lfreemarker/ext/jsp/TaglibFactory;->addLocation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static access$500(Ljava/io/InputStream;Ljava/lang/String;Lorg/xml/sax/helpers/DefaultHandler;)V
    .registers 3
    .param p0, "x0"    # Ljava/io/InputStream;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lorg/xml/sax/helpers/DefaultHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 100
    invoke-static {p0, p1, p2}, Lfreemarker/ext/jsp/TaglibFactory;->parseXml(Ljava/io/InputStream;Ljava/lang/String;Lorg/xml/sax/helpers/DefaultHandler;)V

    return-void
.end method

.method static access$600()Ljava/util/Map;
    .registers 1

    .prologue
    .line 100
    sget-object v0, Lfreemarker/ext/jsp/TaglibFactory;->dtds:Ljava/util/Map;

    return-object v0
.end method

.method private addLocation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "source"    # Ljava/lang/String;
    .param p2, "filePath"    # Ljava/lang/String;
    .param p3, "jarItemPath"    # Ljava/lang/String;
    .param p4, "uri"    # Ljava/lang/String;

    .prologue
    .line 422
    new-instance v0, Lfreemarker/ext/jsp/TaglibFactory$TldPath;

    invoke-direct {v0, p2, p3}, Lfreemarker/ext/jsp/TaglibFactory$TldPath;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 423
    .local v0, "tldPath":Lfreemarker/ext/jsp/TaglibFactory$TldPath;
    iget-object v1, p0, Lfreemarker/ext/jsp/TaglibFactory;->locations:Ljava/util/Map;

    invoke-interface {v1, p4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_42

    .line 424
    sget-object v1, Lfreemarker/ext/jsp/TaglibFactory;->logger:Lfreemarker/log/Logger;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Ignored duplicate URI "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-static {p4}, Lfreemarker/template/utility/StringUtil;->jQuoteNoXSS(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-static {v0}, Lfreemarker/template/utility/StringUtil;->jQuoteNoXSS(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;)V

    .line 433
    :cond_41
    :goto_41
    return-void

    .line 427
    :cond_42
    iget-object v1, p0, Lfreemarker/ext/jsp/TaglibFactory;->locations:Ljava/util/Map;

    invoke-interface {v1, p4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 428
    sget-object v1, Lfreemarker/ext/jsp/TaglibFactory;->logger:Lfreemarker/log/Logger;

    invoke-virtual {v1}, Lfreemarker/log/Logger;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_41

    .line 429
    sget-object v1, Lfreemarker/ext/jsp/TaglibFactory;->logger:Lfreemarker/log/Logger;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " assigned URI "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-static {p4}, Lfreemarker/template/utility/StringUtil;->jQuoteNoXSS(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " to location "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-static {v0}, Lfreemarker/template/utility/StringUtil;->jQuoteNoXSS(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;)V

    goto :goto_41
.end method

.method private addLocationFromTldFile(Ljava/lang/String;)V
    .registers 5
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 404
    iget-object v1, p0, Lfreemarker/ext/jsp/TaglibFactory;->ctx:Ljavax/servlet/ServletContext;

    invoke-interface {v1, p1}, Ljavax/servlet/ServletContext;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 406
    .local v0, "in":Ljava/io/InputStream;
    const/4 v1, 0x0

    :try_start_7
    iget-object v2, p0, Lfreemarker/ext/jsp/TaglibFactory;->ctx:Ljavax/servlet/ServletContext;

    invoke-interface {v2, p1}, Ljavax/servlet/ServletContext;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0, p1, v1, v2}, Lfreemarker/ext/jsp/TaglibFactory;->addLocationFromTldResource(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_14
    .catchall {:try_start_7 .. :try_end_14} :catchall_18

    .line 409
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 411
    return-void

    .line 409
    :catchall_18
    move-exception v1

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw v1
.end method

.method private addLocationFromTldResource(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "uin"    # Ljava/io/InputStream;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "zname"    # Ljava/lang/String;
    .param p4, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 415
    invoke-direct {p0, p1, p4}, Lfreemarker/ext/jsp/TaglibFactory;->getTldUri(Ljava/io/InputStream;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 416
    .local v0, "uri":Ljava/lang/String;
    if-eqz v0, :cond_d

    .line 417
    if-nez p3, :cond_e

    const-string v1, "tld file"

    :goto_a
    invoke-direct {p0, v1, p2, p3, v0}, Lfreemarker/ext/jsp/TaglibFactory;->addLocation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 419
    :cond_d
    return-void

    .line 417
    :cond_e
    const-string v1, "jar file"

    goto :goto_a
.end method

.method private addLocationsFromJarFile(Ljava/lang/String;)V
    .registers 9
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 377
    new-instance v3, Ljava/util/zip/ZipInputStream;

    iget-object v5, p0, Lfreemarker/ext/jsp/TaglibFactory;->ctx:Ljavax/servlet/ServletContext;

    invoke-interface {v5, p1}, Ljavax/servlet/ServletContext;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 379
    .local v3, "zin":Ljava/util/zip/ZipInputStream;
    new-instance v0, Lfreemarker/ext/jsp/TaglibFactory$1;

    invoke-direct {v0, p0, v3}, Lfreemarker/ext/jsp/TaglibFactory$1;-><init>(Lfreemarker/ext/jsp/TaglibFactory;Ljava/io/InputStream;)V

    .line 385
    .local v0, "uin":Ljava/io/InputStream;
    :cond_10
    :goto_10
    :try_start_10
    invoke-virtual {v3}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;
    :try_end_13
    .catchall {:try_start_10 .. :try_end_13} :catchall_59

    move-result-object v2

    .line 386
    .local v2, "ze":Ljava/util/zip/ZipEntry;
    if-nez v2, :cond_1a

    .line 399
    invoke-virtual {v3}, Ljava/util/zip/ZipInputStream;->close()V

    .line 401
    return-void

    .line 389
    :cond_1a
    :try_start_1a
    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v4

    .line 390
    .local v4, "zname":Ljava/lang/String;
    const-string v5, "META-INF/"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_10

    const-string v5, ".tld"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_10

    .line 391
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "jar:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lfreemarker/ext/jsp/TaglibFactory;->ctx:Ljavax/servlet/ServletContext;

    invoke-interface {v6, p1}, Ljavax/servlet/ServletContext;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v6

    invoke-virtual {v6}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "!"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 394
    .local v1, "url":Ljava/lang/String;
    invoke-direct {p0, v0, p1, v4, v1}, Lfreemarker/ext/jsp/TaglibFactory;->addLocationFromTldResource(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_58
    .catchall {:try_start_1a .. :try_end_58} :catchall_59

    goto :goto_10

    .line 399
    .end local v1    # "url":Ljava/lang/String;
    .end local v2    # "ze":Ljava/util/zip/ZipEntry;
    .end local v4    # "zname":Ljava/lang/String;
    :catchall_59
    move-exception v5

    invoke-virtual {v3}, Ljava/util/zip/ZipInputStream;->close()V

    throw v5
.end method

.method private addLocationsFromWebApp()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 353
    iget-object v3, p0, Lfreemarker/ext/jsp/TaglibFactory;->ctx:Ljavax/servlet/ServletContext;

    const-string v4, "/WEB-INF/lib"

    invoke-interface {v3, v4}, Ljavax/servlet/ServletContext;->getResourcePaths(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v1

    .line 354
    .local v1, "libs":Ljava/util/Set;
    if-eqz v1, :cond_3a

    .line 355
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/Iterator;
    :cond_e
    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3a

    .line 356
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 357
    .local v2, "path":Ljava/lang/String;
    const-string v3, ".jar"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2a

    const-string v3, ".zip"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 358
    :cond_2a
    invoke-direct {p0, v2}, Lfreemarker/ext/jsp/TaglibFactory;->addLocationsFromJarFile(Ljava/lang/String;)V

    goto :goto_e

    .line 360
    :cond_2e
    const-string v3, ".tld"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 361
    invoke-direct {p0, v2}, Lfreemarker/ext/jsp/TaglibFactory;->addLocationFromTldFile(Ljava/lang/String;)V

    goto :goto_e

    .line 365
    .end local v0    # "iter":Ljava/util/Iterator;
    .end local v2    # "path":Ljava/lang/String;
    :cond_3a
    iget-object v3, p0, Lfreemarker/ext/jsp/TaglibFactory;->ctx:Ljavax/servlet/ServletContext;

    const-string v4, "/WEB-INF"

    invoke-interface {v3, v4}, Ljavax/servlet/ServletContext;->getResourcePaths(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v1

    .line 366
    if-eqz v1, :cond_60

    .line 367
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .restart local v0    # "iter":Ljava/util/Iterator;
    :cond_48
    :goto_48
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_60

    .line 368
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 369
    .restart local v2    # "path":Ljava/lang/String;
    const-string v3, ".tld"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_48

    .line 370
    invoke-direct {p0, v2}, Lfreemarker/ext/jsp/TaglibFactory;->addLocationFromTldFile(Ljava/lang/String;)V

    goto :goto_48

    .line 374
    .end local v0    # "iter":Ljava/util/Iterator;
    .end local v2    # "path":Ljava/lang/String;
    :cond_60
    return-void
.end method

.method private addLocationsFromWebXml()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 280
    new-instance v1, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;-><init>(Lfreemarker/ext/jsp/TaglibFactory;Lfreemarker/ext/jsp/TaglibFactory$1;)V

    .line 281
    .local v1, "webXmlParser":Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;
    iget-object v2, p0, Lfreemarker/ext/jsp/TaglibFactory;->ctx:Ljavax/servlet/ServletContext;

    const-string v3, "/WEB-INF/web.xml"

    invoke-interface {v2, v3}, Ljavax/servlet/ServletContext;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 282
    .local v0, "in":Ljava/io/InputStream;
    if-nez v0, :cond_11

    .line 292
    :goto_10
    return-void

    .line 287
    :cond_11
    :try_start_11
    iget-object v2, p0, Lfreemarker/ext/jsp/TaglibFactory;->ctx:Ljavax/servlet/ServletContext;

    const-string v3, "/WEB-INF/web.xml"

    invoke-interface {v2, v3}, Ljavax/servlet/ServletContext;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v1}, Lfreemarker/ext/jsp/TaglibFactory;->parseXml(Ljava/io/InputStream;Ljava/lang/String;Lorg/xml/sax/helpers/DefaultHandler;)V
    :try_end_20
    .catchall {:try_start_11 .. :try_end_20} :catchall_24

    .line 290
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    goto :goto_10

    :catchall_24
    move-exception v2

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw v2
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 553
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private getTldUri(Ljava/io/InputStream;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 437
    new-instance v0, Lfreemarker/ext/jsp/TaglibFactory$TldUriReader;

    invoke-direct {v0}, Lfreemarker/ext/jsp/TaglibFactory$TldUriReader;-><init>()V

    .line 438
    .local v0, "tur":Lfreemarker/ext/jsp/TaglibFactory$TldUriReader;
    invoke-static {p1, p2, v0}, Lfreemarker/ext/jsp/TaglibFactory;->parseXml(Ljava/io/InputStream;Ljava/lang/String;Lorg/xml/sax/helpers/DefaultHandler;)V

    .line 439
    invoke-virtual {v0}, Lfreemarker/ext/jsp/TaglibFactory$TldUriReader;->getUri()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static getUriType(Ljava/lang/String;)I
    .registers 10
    .param p0, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x7a

    const/16 v7, 0x61

    const/4 v5, 0x0

    const/4 v4, 0x2

    .line 244
    if-nez p0, :cond_10

    .line 245
    new-instance v4, Lfreemarker/template/TemplateModelException;

    const-string v5, "null is not a valid URI"

    invoke-direct {v4, v5}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 247
    :cond_10
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_1e

    .line 248
    new-instance v4, Lfreemarker/template/TemplateModelException;

    const-string v5, "empty string is not a valid URI"

    invoke-direct {v4, v5}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 250
    :cond_1e
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 251
    .local v1, "c0":C
    const/16 v6, 0x2f

    if-ne v1, v6, :cond_28

    .line 252
    const/4 v4, 0x1

    .line 269
    :cond_27
    :goto_27
    return v4

    .line 255
    :cond_28
    if-lt v1, v7, :cond_27

    if-gt v1, v8, :cond_27

    .line 258
    const/16 v6, 0x3a

    invoke-virtual {p0, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 259
    .local v2, "colon":I
    const/4 v6, -0x1

    if-eq v2, v6, :cond_27

    .line 263
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_36
    if-ge v3, v2, :cond_57

    .line 264
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 265
    .local v0, "c":C
    if-lt v0, v7, :cond_40

    if-le v0, v8, :cond_54

    :cond_40
    const/16 v6, 0x30

    if-lt v0, v6, :cond_48

    const/16 v6, 0x39

    if-le v0, v6, :cond_54

    :cond_48
    const/16 v6, 0x2b

    if-eq v0, v6, :cond_54

    const/16 v6, 0x2d

    if-eq v0, v6, :cond_54

    const/16 v6, 0x2e

    if-ne v0, v6, :cond_27

    .line 263
    :cond_54
    add-int/lit8 v3, v3, 0x1

    goto :goto_36

    .end local v0    # "c":C
    :cond_57
    move v4, v5

    .line 269
    goto :goto_27
.end method

.method private loadTaglib(Lfreemarker/ext/jsp/TaglibFactory$TldPath;Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 7
    .param p1, "tldPath"    # Lfreemarker/ext/jsp/TaglibFactory$TldPath;
    .param p2, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 233
    sget-object v1, Lfreemarker/ext/jsp/TaglibFactory;->logger:Lfreemarker/log/Logger;

    invoke-virtual {v1}, Lfreemarker/log/Logger;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_32

    .line 234
    sget-object v1, Lfreemarker/ext/jsp/TaglibFactory;->logger:Lfreemarker/log/Logger;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Loading taglib "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-static {p2}, Lfreemarker/template/utility/StringUtil;->jQuoteNoXSS(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " from location "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-static {p1}, Lfreemarker/template/utility/StringUtil;->jQuoteNoXSS(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;)V

    .line 237
    :cond_32
    new-instance v0, Lfreemarker/ext/jsp/TaglibFactory$Taglib;

    iget-object v1, p0, Lfreemarker/ext/jsp/TaglibFactory;->ctx:Ljavax/servlet/ServletContext;

    invoke-direct {v0, v1, p1, p2}, Lfreemarker/ext/jsp/TaglibFactory$Taglib;-><init>(Ljavax/servlet/ServletContext;Lfreemarker/ext/jsp/TaglibFactory$TldPath;Ljava/lang/String;)V

    .line 238
    .local v0, "taglib":Lfreemarker/ext/jsp/TaglibFactory$Taglib;
    iget-object v1, p0, Lfreemarker/ext/jsp/TaglibFactory;->taglibs:Ljava/util/Map;

    invoke-interface {v1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    iget-object v1, p0, Lfreemarker/ext/jsp/TaglibFactory;->locations:Ljava/util/Map;

    invoke-interface {v1, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    return-object v0
.end method

.method private static parseXml(Ljava/io/InputStream;Ljava/lang/String;Lorg/xml/sax/helpers/DefaultHandler;)V
    .registers 8
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "handler"    # Lorg/xml/sax/helpers/DefaultHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 480
    new-instance v1, Lorg/xml/sax/InputSource;

    invoke-direct {v1}, Lorg/xml/sax/InputSource;-><init>()V

    .line 481
    .local v1, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v1, p0}, Lorg/xml/sax/InputSource;->setByteStream(Ljava/io/InputStream;)V

    .line 482
    invoke-virtual {v1, p1}, Lorg/xml/sax/InputSource;->setSystemId(Ljava/lang/String;)V

    .line 483
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v0

    .line 484
    .local v0, "factory":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v0, v3}, Ljavax/xml/parsers/SAXParserFactory;->setNamespaceAware(Z)V

    .line 485
    invoke-virtual {v0, v3}, Ljavax/xml/parsers/SAXParserFactory;->setValidating(Z)V

    .line 486
    invoke-virtual {v0}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v3

    invoke-virtual {v3}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v2

    .line 487
    .local v2, "reader":Lorg/xml/sax/XMLReader;
    new-instance v3, Lfreemarker/ext/jsp/TaglibFactory$LocalTaglibDtds;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lfreemarker/ext/jsp/TaglibFactory$LocalTaglibDtds;-><init>(Lfreemarker/ext/jsp/TaglibFactory$1;)V

    invoke-interface {v2, v3}, Lorg/xml/sax/XMLReader;->setEntityResolver(Lorg/xml/sax/EntityResolver;)V

    .line 488
    invoke-interface {v2, p2}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 489
    invoke-interface {v2, p2}, Lorg/xml/sax/XMLReader;->setErrorHandler(Lorg/xml/sax/ErrorHandler;)V

    .line 490
    invoke-interface {v2, v1}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 491
    return-void
.end method

.method private static resolveRelativeUri(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p0, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x2f

    .line 567
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v5

    const-string v6, "__FreeMarkerServlet.Request__"

    invoke-virtual {v5, v6}, Lfreemarker/core/Environment;->getVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v3

    .line 570
    .local v3, "reqHash":Lfreemarker/template/TemplateModel;
    instance-of v5, v3, Lfreemarker/ext/servlet/HttpRequestHashModel;

    if-eqz v5, :cond_69

    .line 571
    check-cast v3, Lfreemarker/ext/servlet/HttpRequestHashModel;

    .end local v3    # "reqHash":Lfreemarker/template/TemplateModel;
    invoke-virtual {v3}, Lfreemarker/ext/servlet/HttpRequestHashModel;->getRequest()Ljavax/servlet/http/HttpServletRequest;

    move-result-object v2

    .line 573
    .local v2, "req":Ljavax/servlet/http/HttpServletRequest;
    invoke-interface {v2}, Ljavax/servlet/http/HttpServletRequest;->getPathInfo()Ljava/lang/String;

    move-result-object v1

    .line 574
    .local v1, "pi":Ljava/lang/String;
    invoke-interface {v2}, Ljavax/servlet/http/HttpServletRequest;->getServletPath()Ljava/lang/String;

    move-result-object v4

    .line 575
    .local v4, "reqPath":Ljava/lang/String;
    if-nez v4, :cond_22

    .line 576
    const-string v4, ""

    .line 578
    :cond_22
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    if-nez v1, :cond_2f

    const-string v1, ""

    .end local v1    # "pi":Ljava/lang/String;
    :cond_2f
    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 581
    invoke-virtual {v4, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 582
    .local v0, "lastSlash":I
    const/4 v5, -0x1

    if-eq v0, v5, :cond_57

    .line 583
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v6, 0x0

    add-int/lit8 v7, v0, 0x1

    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 586
    :goto_56
    return-object v5

    :cond_57
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_56

    .line 589
    .end local v0    # "lastSlash":I
    .end local v2    # "req":Ljavax/servlet/http/HttpServletRequest;
    .end local v4    # "reqPath":Ljava/lang/String;
    .restart local v3    # "reqHash":Lfreemarker/template/TemplateModel;
    :cond_69
    new-instance v5, Lfreemarker/template/TemplateModelException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Can\'t resolve relative URI "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " as request URL information is unavailable."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v5
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 9
    .param p1, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 147
    iget-object v4, p0, Lfreemarker/ext/jsp/TaglibFactory;->taglibs:Ljava/util/Map;

    monitor-enter v4

    .line 148
    :try_start_4
    iget-object v3, p0, Lfreemarker/ext/jsp/TaglibFactory;->taglibs:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/ext/jsp/TaglibFactory$Taglib;

    .line 149
    .local v2, "taglib":Lfreemarker/ext/jsp/TaglibFactory$Taglib;
    if-eqz v2, :cond_10

    .line 150
    monitor-exit v4
    :try_end_f
    .catchall {:try_start_4 .. :try_end_f} :catchall_2a

    .line 192
    .end local v2    # "taglib":Lfreemarker/ext/jsp/TaglibFactory$Taglib;
    :goto_f
    return-object v2

    .line 154
    .restart local v2    # "taglib":Lfreemarker/ext/jsp/TaglibFactory$Taglib;
    :cond_10
    :try_start_10
    iget v3, p0, Lfreemarker/ext/jsp/TaglibFactory;->lookupPhase:I

    if-nez v3, :cond_1a

    .line 155
    invoke-direct {p0}, Lfreemarker/ext/jsp/TaglibFactory;->addLocationsFromWebXml()V

    .line 156
    const/4 v3, 0x1

    iput v3, p0, Lfreemarker/ext/jsp/TaglibFactory;->lookupPhase:I

    .line 159
    :cond_1a
    iget-object v3, p0, Lfreemarker/ext/jsp/TaglibFactory;->locations:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/ext/jsp/TaglibFactory$TldPath;

    .line 160
    .local v1, "path":Lfreemarker/ext/jsp/TaglibFactory$TldPath;
    if-eqz v1, :cond_2d

    .line 161
    invoke-direct {p0, v1, p1}, Lfreemarker/ext/jsp/TaglibFactory;->loadTaglib(Lfreemarker/ext/jsp/TaglibFactory$TldPath;Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    :try_end_27
    .catch Lfreemarker/template/TemplateModelException; {:try_start_10 .. :try_end_27} :catch_56
    .catch Ljava/lang/RuntimeException; {:try_start_10 .. :try_end_27} :catch_71
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_27} :catch_a1
    .catchall {:try_start_10 .. :try_end_27} :catchall_2a

    move-result-object v2

    .end local v2    # "taglib":Lfreemarker/ext/jsp/TaglibFactory$Taglib;
    :try_start_28
    monitor-exit v4

    goto :goto_f

    .line 208
    .end local v1    # "path":Lfreemarker/ext/jsp/TaglibFactory$TldPath;
    :catchall_2a
    move-exception v3

    monitor-exit v4
    :try_end_2c
    .catchall {:try_start_28 .. :try_end_2c} :catchall_2a

    throw v3

    .line 166
    .restart local v1    # "path":Lfreemarker/ext/jsp/TaglibFactory$TldPath;
    .restart local v2    # "taglib":Lfreemarker/ext/jsp/TaglibFactory$Taglib;
    :cond_2d
    :try_start_2d
    iget v3, p0, Lfreemarker/ext/jsp/TaglibFactory;->lookupPhase:I

    if-ne v3, v5, :cond_47

    .line 167
    invoke-direct {p0}, Lfreemarker/ext/jsp/TaglibFactory;->addLocationsFromWebApp()V

    .line 168
    const/4 v3, 0x2

    iput v3, p0, Lfreemarker/ext/jsp/TaglibFactory;->lookupPhase:I

    .line 170
    iget-object v3, p0, Lfreemarker/ext/jsp/TaglibFactory;->locations:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "path":Lfreemarker/ext/jsp/TaglibFactory$TldPath;
    check-cast v1, Lfreemarker/ext/jsp/TaglibFactory$TldPath;

    .line 171
    .restart local v1    # "path":Lfreemarker/ext/jsp/TaglibFactory$TldPath;
    if-eqz v1, :cond_47

    .line 172
    invoke-direct {p0, v1, p1}, Lfreemarker/ext/jsp/TaglibFactory;->loadTaglib(Lfreemarker/ext/jsp/TaglibFactory$TldPath;Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    :try_end_44
    .catch Lfreemarker/template/TemplateModelException; {:try_start_2d .. :try_end_44} :catch_56
    .catch Ljava/lang/RuntimeException; {:try_start_2d .. :try_end_44} :catch_71
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_44} :catch_a1
    .catchall {:try_start_2d .. :try_end_44} :catchall_2a

    move-result-object v2

    .end local v2    # "taglib":Lfreemarker/ext/jsp/TaglibFactory$Taglib;
    :try_start_45
    monitor-exit v4
    :try_end_46
    .catchall {:try_start_45 .. :try_end_46} :catchall_2a

    goto :goto_f

    .line 176
    .restart local v2    # "taglib":Lfreemarker/ext/jsp/TaglibFactory$Taglib;
    :cond_47
    :try_start_47
    invoke-static {p1}, Lfreemarker/ext/jsp/TaglibFactory;->getUriType(Ljava/lang/String;)I

    move-result v3

    packed-switch v3, :pswitch_data_bc

    .line 195
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v5, "Cannot happen"

    invoke-direct {v3, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_56
    .catch Lfreemarker/template/TemplateModelException; {:try_start_47 .. :try_end_56} :catch_56
    .catch Ljava/lang/RuntimeException; {:try_start_47 .. :try_end_56} :catch_71
    .catch Ljava/lang/Exception; {:try_start_47 .. :try_end_56} :catch_a1
    .catchall {:try_start_47 .. :try_end_56} :catchall_2a

    .line 199
    .end local v1    # "path":Lfreemarker/ext/jsp/TaglibFactory$TldPath;
    :catch_56
    move-exception v0

    .line 200
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    :try_start_57
    throw v0
    :try_end_58
    .catchall {:try_start_57 .. :try_end_58} :catchall_2a

    .line 179
    .end local v0    # "e":Lfreemarker/template/TemplateModelException;
    .restart local v1    # "path":Lfreemarker/ext/jsp/TaglibFactory$TldPath;
    :pswitch_58
    :try_start_58
    new-instance v3, Lfreemarker/template/TemplateModelException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "No mapping defined for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_71
    .catch Lfreemarker/template/TemplateModelException; {:try_start_58 .. :try_end_71} :catch_56
    .catch Ljava/lang/RuntimeException; {:try_start_58 .. :try_end_71} :catch_71
    .catch Ljava/lang/Exception; {:try_start_58 .. :try_end_71} :catch_a1
    .catchall {:try_start_58 .. :try_end_71} :catchall_2a

    .line 202
    .end local v1    # "path":Lfreemarker/ext/jsp/TaglibFactory$TldPath;
    :catch_71
    move-exception v0

    .line 203
    .local v0, "e":Ljava/lang/RuntimeException;
    :try_start_72
    throw v0
    :try_end_73
    .catchall {:try_start_72 .. :try_end_73} :catchall_2a

    .line 183
    .end local v0    # "e":Ljava/lang/RuntimeException;
    .restart local v1    # "path":Lfreemarker/ext/jsp/TaglibFactory$TldPath;
    :pswitch_73
    :try_start_73
    invoke-static {p1}, Lfreemarker/ext/jsp/TaglibFactory;->resolveRelativeUri(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 188
    :pswitch_77
    const-string v3, ".jar"

    invoke-virtual {p1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_87

    const-string v3, ".zip"

    invoke-virtual {p1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_95

    .line 189
    :cond_87
    new-instance v3, Lfreemarker/ext/jsp/TaglibFactory$TldPath;

    const-string v5, "META-INF/taglib.tld"

    invoke-direct {v3, p1, v5}, Lfreemarker/ext/jsp/TaglibFactory$TldPath;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v3, p1}, Lfreemarker/ext/jsp/TaglibFactory;->loadTaglib(Lfreemarker/ext/jsp/TaglibFactory$TldPath;Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    :try_end_91
    .catch Lfreemarker/template/TemplateModelException; {:try_start_73 .. :try_end_91} :catch_56
    .catch Ljava/lang/RuntimeException; {:try_start_73 .. :try_end_91} :catch_71
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_91} :catch_a1
    .catchall {:try_start_73 .. :try_end_91} :catchall_2a

    move-result-object v2

    .end local v2    # "taglib":Lfreemarker/ext/jsp/TaglibFactory$Taglib;
    :try_start_92
    monitor-exit v4
    :try_end_93
    .catchall {:try_start_92 .. :try_end_93} :catchall_2a

    goto/16 :goto_f

    .line 192
    .restart local v2    # "taglib":Lfreemarker/ext/jsp/TaglibFactory$Taglib;
    :cond_95
    :try_start_95
    new-instance v3, Lfreemarker/ext/jsp/TaglibFactory$TldPath;

    invoke-direct {v3, p1}, Lfreemarker/ext/jsp/TaglibFactory$TldPath;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v3, p1}, Lfreemarker/ext/jsp/TaglibFactory;->loadTaglib(Lfreemarker/ext/jsp/TaglibFactory$TldPath;Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    :try_end_9d
    .catch Lfreemarker/template/TemplateModelException; {:try_start_95 .. :try_end_9d} :catch_56
    .catch Ljava/lang/RuntimeException; {:try_start_95 .. :try_end_9d} :catch_71
    .catch Ljava/lang/Exception; {:try_start_95 .. :try_end_9d} :catch_a1
    .catchall {:try_start_95 .. :try_end_9d} :catchall_2a

    move-result-object v2

    .end local v2    # "taglib":Lfreemarker/ext/jsp/TaglibFactory$Taglib;
    :try_start_9e
    monitor-exit v4

    goto/16 :goto_f

    .line 205
    .end local v1    # "path":Lfreemarker/ext/jsp/TaglibFactory$TldPath;
    .restart local v2    # "taglib":Lfreemarker/ext/jsp/TaglibFactory$Taglib;
    :catch_a1
    move-exception v0

    .line 206
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Lfreemarker/template/TemplateModelException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Could not load taglib information for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3
    :try_end_bb
    .catchall {:try_start_9e .. :try_end_bb} :catchall_2a

    .line 176
    nop

    :pswitch_data_bc
    .packed-switch 0x0
        :pswitch_58
        :pswitch_77
        :pswitch_73
    .end packed-switch
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 275
    const/4 v0, 0x0

    return v0
.end method
