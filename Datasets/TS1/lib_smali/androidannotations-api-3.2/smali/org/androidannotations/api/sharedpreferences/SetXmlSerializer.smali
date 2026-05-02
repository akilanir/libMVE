.class public final Lorg/androidannotations/api/sharedpreferences/SetXmlSerializer;
.super Ljava/lang/Object;
.source "SetXmlSerializer.java"


# static fields
.field private static final NAMESPACE:Ljava/lang/String; = ""

.field private static final SET_TAG:Ljava/lang/String; = "AA_set"

.field private static final STRING_TAG:Ljava/lang/String; = "AA_string"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    return-void
.end method

.method public static deserialize(Ljava/lang/String;)Ljava/util/Set;
    .registers 9
    .param p0, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v7, 0x3

    const/4 v3, 0x0

    .line 75
    new-instance v2, Ljava/util/TreeSet;

    invoke-direct {v2}, Ljava/util/TreeSet;-><init>()V

    .line 76
    .local v2, "stringSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v1

    .line 79
    .local v1, "parser":Lorg/xmlpull/v1/XmlPullParser;
    :try_start_b
    new-instance v4, Ljava/io/StringReader;

    invoke-direct {v4, p0}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v4}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V

    .line 80
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 81
    const/4 v4, 0x2

    const-string v5, ""

    const-string v6, "AA_set"

    invoke-interface {v1, v4, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 83
    :goto_1e
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v4

    if-eq v4, v7, :cond_4e

    .line 84
    const/4 v4, 0x2

    const-string v5, ""

    const-string v6, "AA_string"

    invoke-interface {v1, v4, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 86
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 87
    const/4 v4, 0x4

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-interface {v1, v4, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 88
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 90
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 91
    const/4 v4, 0x3

    const/4 v5, 0x0

    const-string v6, "AA_string"

    invoke-interface {v1, v4, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_46
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_b .. :try_end_46} :catch_47
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_46} :catch_4f

    goto :goto_1e

    .line 93
    :catch_47
    move-exception v0

    .line 94
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    const-string v4, "getStringSet"

    invoke-static {v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v2, v3

    .line 101
    .end local v0    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    .end local v2    # "stringSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_4e
    :goto_4e
    return-object v2

    .line 96
    .restart local v2    # "stringSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :catch_4f
    move-exception v0

    .line 97
    .local v0, "e":Ljava/io/IOException;
    const-string v4, "getStringSet"

    invoke-static {v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v2, v3

    .line 98
    goto :goto_4e
.end method

.method public static serialize(Ljava/util/Set;)Ljava/lang/String;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-nez p0, :cond_6

    .line 44
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object p0

    .line 47
    :cond_6
    new-instance v3, Ljava/io/StringWriter;

    invoke-direct {v3}, Ljava/io/StringWriter;-><init>()V

    .line 48
    .local v3, "writer":Ljava/io/StringWriter;
    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v1

    .line 51
    .local v1, "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :try_start_f
    invoke-interface {v1, v3}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/Writer;)V

    .line 52
    const-string v4, ""

    const-string v5, "AA_set"

    invoke-interface {v1, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 54
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_43

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 55
    .local v2, "string":Ljava/lang/String;
    const-string v4, ""

    const-string v5, "AA_string"

    invoke-interface {v1, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v4

    invoke-interface {v4, v2}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v4

    const-string v5, ""

    const-string v6, "AA_string"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_3c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_f .. :try_end_3c} :catch_3d
    .catch Ljava/lang/IllegalStateException; {:try_start_f .. :try_end_3c} :catch_4f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_3c} :catch_51

    goto :goto_1d

    .line 63
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "string":Ljava/lang/String;
    :catch_3d
    move-exception v4

    .line 71
    :goto_3e
    invoke-virtual {v3}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 60
    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_43
    :try_start_43
    const-string v4, ""

    const-string v5, "AA_set"

    invoke-interface {v1, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v4

    invoke-interface {v4}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V
    :try_end_4e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_43 .. :try_end_4e} :catch_3d
    .catch Ljava/lang/IllegalStateException; {:try_start_43 .. :try_end_4e} :catch_4f
    .catch Ljava/io/IOException; {:try_start_43 .. :try_end_4e} :catch_51

    goto :goto_3e

    .line 65
    .end local v0    # "i$":Ljava/util/Iterator;
    :catch_4f
    move-exception v4

    goto :goto_3e

    .line 67
    :catch_51
    move-exception v4

    goto :goto_3e
.end method
