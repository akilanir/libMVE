.class Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$URLXMLRulesLoader;
.super Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$XMLRulesLoader;
.source "FromXmlRuleSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "URLXMLRulesLoader"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;

.field private url:Ljava/net/URL;


# direct methods
.method public constructor <init>(Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;Ljava/net/URL;)V
    .registers 4
    .param p1, "this$0"    # Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;
    .param p2, "url"    # Ljava/net/URL;

    .prologue
    .line 191
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$XMLRulesLoader;-><init>(Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$1;)V

    iput-object p1, p0, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$URLXMLRulesLoader;->this$0:Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;

    .line 192
    iput-object p2, p0, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$URLXMLRulesLoader;->url:Ljava/net/URL;

    .line 193
    return-void
.end method


# virtual methods
.method public loadRules()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/xmlrules/XmlLoadException;
        }
    .end annotation

    .prologue
    .line 197
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$URLXMLRulesLoader;->this$0:Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;

    invoke-static {v1}, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;->access$100(Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;)Lorg/apache/commons/digester/Digester;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$URLXMLRulesLoader;->url:Ljava/net/URL;

    invoke-virtual {v2}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/commons/digester/Digester;->parse(Ljava/io/InputStream;)Ljava/lang/Object;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_f} :catch_10

    .line 201
    return-void

    .line 199
    :catch_10
    move-exception v0

    .local v0, "ex":Ljava/lang/Exception;
    new-instance v1, Lorg/apache/commons/digester/xmlrules/XmlLoadException;

    invoke-direct {v1, v0}, Lorg/apache/commons/digester/xmlrules/XmlLoadException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
