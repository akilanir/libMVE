.class public Lorg/apache/commons/digester/xmlrules/DigesterLoader;
.super Ljava/lang/Object;
.source "DigesterLoader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createDigester(Ljava/net/URL;)Lorg/apache/commons/digester/Digester;
    .registers 3
    .param p0, "rulesXml"    # Ljava/net/URL;

    .prologue
    .line 78
    new-instance v1, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;

    invoke-direct {v1, p0}, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;-><init>(Ljava/net/URL;)V

    .line 79
    .local v1, "ruleSet":Lorg/apache/commons/digester/RuleSet;
    new-instance v0, Lorg/apache/commons/digester/Digester;

    invoke-direct {v0}, Lorg/apache/commons/digester/Digester;-><init>()V

    .line 80
    .local v0, "digester":Lorg/apache/commons/digester/Digester;
    invoke-virtual {v0, v1}, Lorg/apache/commons/digester/Digester;->addRuleSet(Lorg/apache/commons/digester/RuleSet;)V

    .line 81
    return-object v0
.end method

.method public static createDigester(Ljava/net/URL;Lorg/apache/commons/digester/Digester;)Lorg/apache/commons/digester/Digester;
    .registers 4
    .param p0, "rulesXml"    # Ljava/net/URL;
    .param p1, "rulesDigester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 96
    new-instance v1, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;

    invoke-direct {v1, p0, p1}, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;-><init>(Ljava/net/URL;Lorg/apache/commons/digester/Digester;)V

    .line 97
    .local v1, "ruleSet":Lorg/apache/commons/digester/RuleSet;
    new-instance v0, Lorg/apache/commons/digester/Digester;

    invoke-direct {v0}, Lorg/apache/commons/digester/Digester;-><init>()V

    .line 98
    .local v0, "digester":Lorg/apache/commons/digester/Digester;
    invoke-virtual {v0, v1}, Lorg/apache/commons/digester/Digester;->addRuleSet(Lorg/apache/commons/digester/RuleSet;)V

    .line 99
    return-object v0
.end method

.method public static createDigester(Lorg/xml/sax/InputSource;)Lorg/apache/commons/digester/Digester;
    .registers 3
    .param p0, "rulesSource"    # Lorg/xml/sax/InputSource;

    .prologue
    .line 50
    new-instance v1, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;

    invoke-direct {v1, p0}, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;-><init>(Lorg/xml/sax/InputSource;)V

    .line 51
    .local v1, "ruleSet":Lorg/apache/commons/digester/RuleSet;
    new-instance v0, Lorg/apache/commons/digester/Digester;

    invoke-direct {v0}, Lorg/apache/commons/digester/Digester;-><init>()V

    .line 52
    .local v0, "digester":Lorg/apache/commons/digester/Digester;
    invoke-virtual {v0, v1}, Lorg/apache/commons/digester/Digester;->addRuleSet(Lorg/apache/commons/digester/RuleSet;)V

    .line 53
    return-object v0
.end method

.method public static createDigester(Lorg/xml/sax/InputSource;Lorg/apache/commons/digester/Digester;)Lorg/apache/commons/digester/Digester;
    .registers 4
    .param p0, "rulesSource"    # Lorg/xml/sax/InputSource;
    .param p1, "rulesDigester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 66
    new-instance v1, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;

    invoke-direct {v1, p0, p1}, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;-><init>(Lorg/xml/sax/InputSource;Lorg/apache/commons/digester/Digester;)V

    .line 67
    .local v1, "ruleSet":Lorg/apache/commons/digester/RuleSet;
    new-instance v0, Lorg/apache/commons/digester/Digester;

    invoke-direct {v0}, Lorg/apache/commons/digester/Digester;-><init>()V

    .line 68
    .local v0, "digester":Lorg/apache/commons/digester/Digester;
    invoke-virtual {v0, v1}, Lorg/apache/commons/digester/Digester;->addRuleSet(Lorg/apache/commons/digester/RuleSet;)V

    .line 69
    return-object v0
.end method

.method public static load(Ljava/net/URL;Ljava/lang/ClassLoader;Ljava/io/InputStream;)Ljava/lang/Object;
    .registers 7
    .param p0, "digesterRules"    # Ljava/net/URL;
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .param p2, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;,
            Lorg/apache/commons/digester/xmlrules/DigesterLoadingException;
        }
    .end annotation

    .prologue
    .line 129
    invoke-static {p0}, Lorg/apache/commons/digester/xmlrules/DigesterLoader;->createDigester(Ljava/net/URL;)Lorg/apache/commons/digester/Digester;

    move-result-object v0

    .line 130
    .local v0, "digester":Lorg/apache/commons/digester/Digester;
    invoke-virtual {v0, p1}, Lorg/apache/commons/digester/Digester;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 132
    :try_start_7
    invoke-virtual {v0, p2}, Lorg/apache/commons/digester/Digester;->parse(Ljava/io/InputStream;)Ljava/lang/Object;
    :try_end_a
    .catch Lorg/apache/commons/digester/xmlrules/XmlLoadException; {:try_start_7 .. :try_end_a} :catch_c

    move-result-object v2

    return-object v2

    .line 137
    :catch_c
    move-exception v1

    .local v1, "ex":Lorg/apache/commons/digester/xmlrules/XmlLoadException;
    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterLoadingException;

    invoke-virtual {v1}, Lorg/apache/commons/digester/xmlrules/XmlLoadException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lorg/apache/commons/digester/xmlrules/DigesterLoadingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static load(Ljava/net/URL;Ljava/lang/ClassLoader;Ljava/io/InputStream;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .param p0, "digesterRules"    # Ljava/net/URL;
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .param p2, "input"    # Ljava/io/InputStream;
    .param p3, "rootObject"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;,
            Lorg/apache/commons/digester/xmlrules/DigesterLoadingException;
        }
    .end annotation

    .prologue
    .line 206
    invoke-static {p0}, Lorg/apache/commons/digester/xmlrules/DigesterLoader;->createDigester(Ljava/net/URL;)Lorg/apache/commons/digester/Digester;

    move-result-object v0

    .line 207
    .local v0, "digester":Lorg/apache/commons/digester/Digester;
    invoke-virtual {v0, p1}, Lorg/apache/commons/digester/Digester;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 208
    invoke-virtual {v0, p3}, Lorg/apache/commons/digester/Digester;->push(Ljava/lang/Object;)V

    .line 210
    :try_start_a
    invoke-virtual {v0, p2}, Lorg/apache/commons/digester/Digester;->parse(Ljava/io/InputStream;)Ljava/lang/Object;
    :try_end_d
    .catch Lorg/apache/commons/digester/xmlrules/XmlLoadException; {:try_start_a .. :try_end_d} :catch_f

    move-result-object v2

    return-object v2

    .line 215
    :catch_f
    move-exception v1

    .local v1, "ex":Lorg/apache/commons/digester/xmlrules/XmlLoadException;
    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterLoadingException;

    invoke-virtual {v1}, Lorg/apache/commons/digester/xmlrules/XmlLoadException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lorg/apache/commons/digester/xmlrules/DigesterLoadingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static load(Ljava/net/URL;Ljava/lang/ClassLoader;Ljava/io/Reader;)Ljava/lang/Object;
    .registers 7
    .param p0, "digesterRules"    # Ljava/net/URL;
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .param p2, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;,
            Lorg/apache/commons/digester/xmlrules/DigesterLoadingException;
        }
    .end annotation

    .prologue
    .line 159
    invoke-static {p0}, Lorg/apache/commons/digester/xmlrules/DigesterLoader;->createDigester(Ljava/net/URL;)Lorg/apache/commons/digester/Digester;

    move-result-object v0

    .line 160
    .local v0, "digester":Lorg/apache/commons/digester/Digester;
    invoke-virtual {v0, p1}, Lorg/apache/commons/digester/Digester;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 162
    :try_start_7
    invoke-virtual {v0, p2}, Lorg/apache/commons/digester/Digester;->parse(Ljava/io/Reader;)Ljava/lang/Object;
    :try_end_a
    .catch Lorg/apache/commons/digester/xmlrules/XmlLoadException; {:try_start_7 .. :try_end_a} :catch_c

    move-result-object v2

    return-object v2

    .line 167
    :catch_c
    move-exception v1

    .local v1, "ex":Lorg/apache/commons/digester/xmlrules/XmlLoadException;
    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterLoadingException;

    invoke-virtual {v1}, Lorg/apache/commons/digester/xmlrules/XmlLoadException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lorg/apache/commons/digester/xmlrules/DigesterLoadingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static load(Ljava/net/URL;Ljava/lang/ClassLoader;Ljava/io/Reader;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .param p0, "digesterRules"    # Ljava/net/URL;
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .param p2, "input"    # Ljava/io/Reader;
    .param p3, "rootObject"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;,
            Lorg/apache/commons/digester/xmlrules/DigesterLoadingException;
        }
    .end annotation

    .prologue
    .line 240
    invoke-static {p0}, Lorg/apache/commons/digester/xmlrules/DigesterLoader;->createDigester(Ljava/net/URL;)Lorg/apache/commons/digester/Digester;

    move-result-object v0

    .line 241
    .local v0, "digester":Lorg/apache/commons/digester/Digester;
    invoke-virtual {v0, p1}, Lorg/apache/commons/digester/Digester;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 242
    invoke-virtual {v0, p3}, Lorg/apache/commons/digester/Digester;->push(Ljava/lang/Object;)V

    .line 244
    :try_start_a
    invoke-virtual {v0, p2}, Lorg/apache/commons/digester/Digester;->parse(Ljava/io/Reader;)Ljava/lang/Object;
    :try_end_d
    .catch Lorg/apache/commons/digester/xmlrules/XmlLoadException; {:try_start_a .. :try_end_d} :catch_f

    move-result-object v2

    return-object v2

    .line 249
    :catch_f
    move-exception v1

    .local v1, "ex":Lorg/apache/commons/digester/xmlrules/XmlLoadException;
    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterLoadingException;

    invoke-virtual {v1}, Lorg/apache/commons/digester/xmlrules/XmlLoadException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lorg/apache/commons/digester/xmlrules/DigesterLoadingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static load(Ljava/net/URL;Ljava/lang/ClassLoader;Ljava/net/URL;)Ljava/lang/Object;
    .registers 4
    .param p0, "digesterRules"    # Ljava/net/URL;
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .param p2, "fileURL"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;,
            Lorg/apache/commons/digester/xmlrules/DigesterLoadingException;
        }
    .end annotation

    .prologue
    .line 114
    invoke-virtual {p2}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/digester/xmlrules/DigesterLoader;->load(Ljava/net/URL;Ljava/lang/ClassLoader;Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static load(Ljava/net/URL;Ljava/lang/ClassLoader;Ljava/net/URL;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p0, "digesterRules"    # Ljava/net/URL;
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .param p2, "fileURL"    # Ljava/net/URL;
    .param p3, "rootObject"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;,
            Lorg/apache/commons/digester/xmlrules/DigesterLoadingException;
        }
    .end annotation

    .prologue
    .line 188
    invoke-virtual {p2}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-static {p0, p1, v0, p3}, Lorg/apache/commons/digester/xmlrules/DigesterLoader;->load(Ljava/net/URL;Ljava/lang/ClassLoader;Ljava/io/InputStream;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
