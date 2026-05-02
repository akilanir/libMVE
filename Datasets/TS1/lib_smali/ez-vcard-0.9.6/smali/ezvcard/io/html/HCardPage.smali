.class public Lezvcard/io/html/HCardPage;
.super Ljava/lang/Object;
.source "HCardPage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lezvcard/io/html/HCardPage$TemplateUtils;
    }
.end annotation


# static fields
.field private static final template:Lfreemarker/template/Template;


# instance fields
.field private final vcards:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lezvcard/VCard;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 84
    new-instance v0, Lfreemarker/template/Configuration;

    invoke-direct {v0}, Lfreemarker/template/Configuration;-><init>()V

    .line 85
    .local v0, "cfg":Lfreemarker/template/Configuration;
    const-class v2, Lezvcard/io/html/HCardPage;

    const-string v3, ""

    invoke-virtual {v0, v2, v3}, Lfreemarker/template/Configuration;->setClassForTemplateLoading(Ljava/lang/Class;Ljava/lang/String;)V

    .line 86
    new-instance v2, Lfreemarker/template/DefaultObjectWrapper;

    invoke-direct {v2}, Lfreemarker/template/DefaultObjectWrapper;-><init>()V

    invoke-virtual {v0, v2}, Lfreemarker/template/Configuration;->setObjectWrapper(Lfreemarker/template/ObjectWrapper;)V

    .line 87
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lfreemarker/template/Configuration;->setWhitespaceStripping(Z)V

    .line 89
    :try_start_18
    const-string v2, "hcard-template.html"

    invoke-virtual {v0, v2}, Lfreemarker/template/Configuration;->getTemplate(Ljava/lang/String;)Lfreemarker/template/Template;

    move-result-object v2

    sput-object v2, Lezvcard/io/html/HCardPage;->template:Lfreemarker/template/Template;
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_20} :catch_21

    .line 94
    return-void

    .line 90
    :catch_21
    move-exception v1

    .line 92
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lezvcard/io/html/HCardPage;->vcards:Ljava/util/List;

    .line 181
    return-void
.end method

.method private readImage(Ljava/lang/String;Lezvcard/parameter/ImageType;)Lezvcard/property/Photo;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "mediaType"    # Lezvcard/parameter/ImageType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 175
    new-instance v0, Lezvcard/property/Photo;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Lezvcard/property/Photo;-><init>(Ljava/io/InputStream;Lezvcard/parameter/ImageType;)V

    return-object v0
.end method


# virtual methods
.method public add(Lezvcard/VCard;)V
    .registers 3
    .param p1, "vcard"    # Lezvcard/VCard;

    .prologue
    .line 103
    iget-object v0, p0, Lezvcard/io/html/HCardPage;->vcards:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    return-void
.end method

.method public write()Ljava/lang/String;
    .registers 3

    .prologue
    .line 111
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 113
    .local v0, "sw":Ljava/io/StringWriter;
    :try_start_5
    invoke-virtual {p0, v0}, Lezvcard/io/html/HCardPage;->write(Ljava/io/Writer;)V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_8} :catch_d

    .line 117
    :goto_8
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 114
    :catch_d
    move-exception v1

    goto :goto_8
.end method

.method public write(Ljava/io/File;)V
    .registers 5
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    const/4 v0, 0x0

    .line 137
    .local v0, "writer":Ljava/io/FileWriter;
    :try_start_1
    new-instance v1, Ljava/io/FileWriter;

    invoke-direct {v1, p1}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_d

    .line 138
    .end local v0    # "writer":Ljava/io/FileWriter;
    .local v1, "writer":Ljava/io/FileWriter;
    :try_start_6
    invoke-virtual {p0, v1}, Lezvcard/io/html/HCardPage;->write(Ljava/io/Writer;)V
    :try_end_9
    .catchall {:try_start_6 .. :try_end_9} :catchall_12

    .line 140
    invoke-static {v1}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 142
    return-void

    .line 140
    .end local v1    # "writer":Ljava/io/FileWriter;
    .restart local v0    # "writer":Ljava/io/FileWriter;
    :catchall_d
    move-exception v2

    :goto_e
    invoke-static {v0}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw v2

    .end local v0    # "writer":Ljava/io/FileWriter;
    .restart local v1    # "writer":Ljava/io/FileWriter;
    :catchall_12
    move-exception v2

    move-object v0, v1

    .end local v1    # "writer":Ljava/io/FileWriter;
    .restart local v0    # "writer":Ljava/io/FileWriter;
    goto :goto_e
.end method

.method public write(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 126
    new-instance v0, Ljava/io/OutputStreamWriter;

    invoke-direct {v0, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {p0, v0}, Lezvcard/io/html/HCardPage;->write(Ljava/io/Writer;)V

    .line 127
    return-void
.end method

.method public write(Ljava/io/Writer;)V
    .registers 7
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 150
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 151
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "vcards"

    iget-object v3, p0, Lezvcard/io/html/HCardPage;->vcards:Ljava/util/List;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    const-string v2, "utils"

    new-instance v3, Lezvcard/io/html/HCardPage$TemplateUtils;

    invoke-direct {v3}, Lezvcard/io/html/HCardPage$TemplateUtils;-><init>()V

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    const-string v2, "translucentBg"

    const-string v3, "translucent-bg.png"

    sget-object v4, Lezvcard/parameter/ImageType;->PNG:Lezvcard/parameter/ImageType;

    invoke-direct {p0, v3, v4}, Lezvcard/io/html/HCardPage;->readImage(Ljava/lang/String;Lezvcard/parameter/ImageType;)Lezvcard/property/Photo;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    const-string v2, "noProfile"

    const-string v3, "no-profile.png"

    sget-object v4, Lezvcard/parameter/ImageType;->PNG:Lezvcard/parameter/ImageType;

    invoke-direct {p0, v3, v4}, Lezvcard/io/html/HCardPage;->readImage(Ljava/lang/String;Lezvcard/parameter/ImageType;)Lezvcard/property/Photo;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    const-string v2, "ezVCardVersion"

    sget-object v3, Lezvcard/Ezvcard;->VERSION:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    const-string v2, "ezVCardUrl"

    sget-object v3, Lezvcard/Ezvcard;->URL:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    const-string v2, "scribeIndex"

    new-instance v3, Lezvcard/io/scribe/ScribeIndex;

    invoke-direct {v3}, Lezvcard/io/scribe/ScribeIndex;-><init>()V

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    :try_start_48
    sget-object v2, Lezvcard/io/html/HCardPage;->template:Lfreemarker/template/Template;

    invoke-virtual {v2, v1, p1}, Lfreemarker/template/Template;->process(Ljava/lang/Object;Ljava/io/Writer;)V
    :try_end_4d
    .catch Lfreemarker/template/TemplateException; {:try_start_48 .. :try_end_4d} :catch_51

    .line 164
    invoke-virtual {p1}, Ljava/io/Writer;->flush()V

    .line 165
    return-void

    .line 160
    :catch_51
    move-exception v0

    .line 162
    .local v0, "e":Lfreemarker/template/TemplateException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method
