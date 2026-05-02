.class public Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;
.super Lorg/apache/commons/digester/RuleSetBase;
.source "FromXmlRuleSet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$1;,
        Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$InputSourceXMLRulesLoader;,
        Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$URLXMLRulesLoader;,
        Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$XMLRulesLoader;
    }
.end annotation


# static fields
.field public static final DIGESTER_DTD_PATH:Ljava/lang/String; = "org/apache/commons/digester/xmlrules/digester-rules.dtd"


# instance fields
.field private parser:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

.field private rulesDigester:Lorg/apache/commons/digester/Digester;

.field private rulesLoader:Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$XMLRulesLoader;


# direct methods
.method public constructor <init>(Ljava/net/URL;)V
    .registers 4
    .param p1, "rulesXml"    # Ljava/net/URL;

    .prologue
    .line 60
    new-instance v0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    invoke-direct {v0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;-><init>()V

    new-instance v1, Lorg/apache/commons/digester/Digester;

    invoke-direct {v1}, Lorg/apache/commons/digester/Digester;-><init>()V

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;-><init>(Ljava/net/URL;Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Lorg/apache/commons/digester/Digester;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;Lorg/apache/commons/digester/Digester;)V
    .registers 4
    .param p1, "rulesXml"    # Ljava/net/URL;
    .param p2, "rulesDigester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 70
    new-instance v0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    invoke-direct {v0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;-><init>()V

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;-><init>(Ljava/net/URL;Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Lorg/apache/commons/digester/Digester;)V

    .line 71
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V
    .registers 4
    .param p1, "rulesXml"    # Ljava/net/URL;
    .param p2, "parser"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    .prologue
    .line 78
    new-instance v0, Lorg/apache/commons/digester/Digester;

    invoke-direct {v0}, Lorg/apache/commons/digester/Digester;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;-><init>(Ljava/net/URL;Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Lorg/apache/commons/digester/Digester;)V

    .line 79
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Lorg/apache/commons/digester/Digester;)V
    .registers 5
    .param p1, "rulesXml"    # Ljava/net/URL;
    .param p2, "parser"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;
    .param p3, "rulesDigester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 86
    invoke-direct {p0}, Lorg/apache/commons/digester/RuleSetBase;-><init>()V

    .line 87
    new-instance v0, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$URLXMLRulesLoader;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$URLXMLRulesLoader;-><init>(Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;Ljava/net/URL;)V

    invoke-direct {p0, v0, p2, p3}, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;->init(Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$XMLRulesLoader;Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Lorg/apache/commons/digester/Digester;)V

    .line 88
    return-void
.end method

.method public constructor <init>(Lorg/xml/sax/InputSource;)V
    .registers 4
    .param p1, "inputSource"    # Lorg/xml/sax/InputSource;

    .prologue
    .line 96
    new-instance v0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    invoke-direct {v0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;-><init>()V

    new-instance v1, Lorg/apache/commons/digester/Digester;

    invoke-direct {v1}, Lorg/apache/commons/digester/Digester;-><init>()V

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;-><init>(Lorg/xml/sax/InputSource;Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Lorg/apache/commons/digester/Digester;)V

    .line 97
    return-void
.end method

.method public constructor <init>(Lorg/xml/sax/InputSource;Lorg/apache/commons/digester/Digester;)V
    .registers 4
    .param p1, "inputSource"    # Lorg/xml/sax/InputSource;
    .param p2, "rulesDigester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 106
    new-instance v0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    invoke-direct {v0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;-><init>()V

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;-><init>(Lorg/xml/sax/InputSource;Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Lorg/apache/commons/digester/Digester;)V

    .line 107
    return-void
.end method

.method public constructor <init>(Lorg/xml/sax/InputSource;Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V
    .registers 4
    .param p1, "inputSource"    # Lorg/xml/sax/InputSource;
    .param p2, "parser"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    .prologue
    .line 114
    new-instance v0, Lorg/apache/commons/digester/Digester;

    invoke-direct {v0}, Lorg/apache/commons/digester/Digester;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;-><init>(Lorg/xml/sax/InputSource;Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Lorg/apache/commons/digester/Digester;)V

    .line 115
    return-void
.end method

.method public constructor <init>(Lorg/xml/sax/InputSource;Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Lorg/apache/commons/digester/Digester;)V
    .registers 5
    .param p1, "inputSource"    # Lorg/xml/sax/InputSource;
    .param p2, "parser"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;
    .param p3, "rulesDigester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 122
    invoke-direct {p0}, Lorg/apache/commons/digester/RuleSetBase;-><init>()V

    .line 123
    new-instance v0, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$InputSourceXMLRulesLoader;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$InputSourceXMLRulesLoader;-><init>(Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;Lorg/xml/sax/InputSource;)V

    invoke-direct {p0, v0, p2, p3}, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;->init(Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$XMLRulesLoader;Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Lorg/apache/commons/digester/Digester;)V

    .line 124
    return-void
.end method

.method static access$100(Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;)Lorg/apache/commons/digester/Digester;
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;

    .prologue
    .line 35
    iget-object v0, p0, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;->rulesDigester:Lorg/apache/commons/digester/Digester;

    return-object v0
.end method

.method private init(Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$XMLRulesLoader;Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Lorg/apache/commons/digester/Digester;)V
    .registers 4
    .param p1, "rulesLoader"    # Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$XMLRulesLoader;
    .param p2, "parser"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;
    .param p3, "rulesDigester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 130
    iput-object p1, p0, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;->rulesLoader:Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$XMLRulesLoader;

    .line 131
    iput-object p2, p0, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;->parser:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    .line 132
    iput-object p3, p0, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;->rulesDigester:Lorg/apache/commons/digester/Digester;

    .line 133
    return-void
.end method


# virtual methods
.method public addRuleInstances(Lorg/apache/commons/digester/Digester;)V
    .registers 3
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/xmlrules/XmlLoadException;
        }
    .end annotation

    .prologue
    .line 141
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;->addRuleInstances(Lorg/apache/commons/digester/Digester;Ljava/lang/String;)V

    .line 142
    return-void
.end method

.method public addRuleInstances(Lorg/apache/commons/digester/Digester;Ljava/lang/String;)V
    .registers 6
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "basePath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/xmlrules/XmlLoadException;
        }
    .end annotation

    .prologue
    .line 164
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const-string v2, "org/apache/commons/digester/xmlrules/digester-rules.dtd"

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 165
    .local v0, "dtdURL":Ljava/net/URL;
    if-nez v0, :cond_18

    .line 166
    new-instance v1, Lorg/apache/commons/digester/xmlrules/XmlLoadException;

    const-string v2, "Cannot find resource \"org/apache/commons/digester/xmlrules/digester-rules.dtd\""

    invoke-direct {v1, v2}, Lorg/apache/commons/digester/xmlrules/XmlLoadException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 169
    :cond_18
    iget-object v1, p0, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;->parser:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->setDigesterRulesDTD(Ljava/lang/String;)V

    .line 170
    iget-object v1, p0, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;->parser:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    invoke-virtual {v1, p1}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->setTarget(Lorg/apache/commons/digester/Digester;)V

    .line 171
    iget-object v1, p0, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;->parser:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    invoke-virtual {v1, p2}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->setBasePath(Ljava/lang/String;)V

    .line 173
    iget-object v1, p0, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;->rulesDigester:Lorg/apache/commons/digester/Digester;

    iget-object v2, p0, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;->parser:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    invoke-virtual {v1, v2}, Lorg/apache/commons/digester/Digester;->addRuleSet(Lorg/apache/commons/digester/RuleSet;)V

    .line 174
    iget-object v1, p0, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;->rulesDigester:Lorg/apache/commons/digester/Digester;

    iget-object v2, p0, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;->parser:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    invoke-virtual {v1, v2}, Lorg/apache/commons/digester/Digester;->push(Ljava/lang/Object;)V

    .line 176
    iget-object v1, p0, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;->rulesLoader:Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$XMLRulesLoader;

    invoke-virtual {v1}, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$XMLRulesLoader;->loadRules()V

    .line 177
    return-void
.end method
