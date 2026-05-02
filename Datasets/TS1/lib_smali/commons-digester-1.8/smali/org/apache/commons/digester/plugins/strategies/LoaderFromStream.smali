.class public Lorg/apache/commons/digester/plugins/strategies/LoaderFromStream;
.super Lorg/apache/commons/digester/plugins/RuleLoader;
.source "LoaderFromStream.java"


# instance fields
.field private input:[B

.field private ruleSet:Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 2
    .param p1, "s"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/apache/commons/digester/plugins/RuleLoader;-><init>()V

    .line 48
    invoke-direct {p0, p1}, Lorg/apache/commons/digester/plugins/strategies/LoaderFromStream;->load(Ljava/io/InputStream;)V

    .line 49
    return-void
.end method

.method private load(Ljava/io/InputStream;)V
    .registers 6
    .param p1, "s"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 60
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    const/16 v3, 0x100

    new-array v1, v3, [B

    .line 62
    .local v1, "buf":[B
    :goto_9
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .line 63
    .local v2, "i":I
    const/4 v3, -0x1

    if-ne v2, v3, :cond_17

    .line 67
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    iput-object v3, p0, Lorg/apache/commons/digester/plugins/strategies/LoaderFromStream;->input:[B

    .line 68
    return-void

    .line 65
    :cond_17
    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_9
.end method


# virtual methods
.method public addRules(Lorg/apache/commons/digester/Digester;Ljava/lang/String;)V
    .registers 9
    .param p1, "d"    # Lorg/apache/commons/digester/Digester;
    .param p2, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/plugins/PluginException;
        }
    .end annotation

    .prologue
    .line 75
    invoke-virtual {p1}, Lorg/apache/commons/digester/Digester;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v1

    .line 76
    .local v1, "log":Lorg/apache/commons/logging/Log;
    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    .line 77
    .local v0, "debug":Z
    if-eqz v0, :cond_26

    .line 78
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "LoaderFromStream: loading rules for plugin at path ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 89
    :cond_26
    new-instance v3, Lorg/xml/sax/InputSource;

    new-instance v4, Ljava/io/ByteArrayInputStream;

    iget-object v5, p0, Lorg/apache/commons/digester/plugins/strategies/LoaderFromStream;->input:[B

    invoke-direct {v4, v5}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v3, v4}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 90
    .local v3, "source":Lorg/xml/sax/InputSource;
    new-instance v2, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;

    invoke-direct {v2, v3}, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;-><init>(Lorg/xml/sax/InputSource;)V

    .line 91
    .local v2, "ruleSet":Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;
    invoke-virtual {v2, p1, p2}, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;->addRuleInstances(Lorg/apache/commons/digester/Digester;Ljava/lang/String;)V

    .line 92
    return-void
.end method
