.class Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$RulesPrefixAdapter;
.super Ljava/lang/Object;
.source "DigesterRuleParser.java"

# interfaces
.implements Lorg/apache/commons/digester/Rules;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RulesPrefixAdapter"
.end annotation


# instance fields
.field private delegate:Lorg/apache/commons/digester/Rules;

.field private prefix:Ljava/lang/String;

.field private final this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;


# direct methods
.method public constructor <init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Ljava/lang/String;Lorg/apache/commons/digester/Rules;)V
    .registers 4
    .param p1, "this$0"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;
    .param p2, "patternPrefix"    # Ljava/lang/String;
    .param p3, "rules"    # Lorg/apache/commons/digester/Rules;

    .prologue
    .line 441
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$RulesPrefixAdapter;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    .line 442
    iput-object p2, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$RulesPrefixAdapter;->prefix:Ljava/lang/String;

    .line 443
    iput-object p3, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$RulesPrefixAdapter;->delegate:Lorg/apache/commons/digester/Rules;

    .line 444
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V
    .registers 6
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "rule"    # Lorg/apache/commons/digester/Rule;

    .prologue
    .line 451
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 452
    .local v0, "buffer":Ljava/lang/StringBuffer;
    iget-object v1, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$RulesPrefixAdapter;->prefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 453
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_17

    .line 454
    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 456
    :cond_17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 457
    iget-object v1, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$RulesPrefixAdapter;->delegate:Lorg/apache/commons/digester/Rules;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, p2}, Lorg/apache/commons/digester/Rules;->add(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 458
    return-void
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 464
    iget-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$RulesPrefixAdapter;->delegate:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0}, Lorg/apache/commons/digester/Rules;->clear()V

    .line 465
    return-void
.end method

.method public getDigester()Lorg/apache/commons/digester/Digester;
    .registers 2

    .prologue
    .line 471
    iget-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$RulesPrefixAdapter;->delegate:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0}, Lorg/apache/commons/digester/Rules;->getDigester()Lorg/apache/commons/digester/Digester;

    move-result-object v0

    return-object v0
.end method

.method public getNamespaceURI()Ljava/lang/String;
    .registers 2

    .prologue
    .line 478
    iget-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$RulesPrefixAdapter;->delegate:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0}, Lorg/apache/commons/digester/Rules;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public match(Ljava/lang/String;)Ljava/util/List;
    .registers 3
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 485
    iget-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$RulesPrefixAdapter;->delegate:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0, p1}, Lorg/apache/commons/digester/Rules;->match(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .registers 4
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 492
    iget-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$RulesPrefixAdapter;->delegate:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/digester/Rules;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public rules()Ljava/util/List;
    .registers 2

    .prologue
    .line 499
    iget-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$RulesPrefixAdapter;->delegate:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0}, Lorg/apache/commons/digester/Rules;->rules()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public setDigester(Lorg/apache/commons/digester/Digester;)V
    .registers 3
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 506
    iget-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$RulesPrefixAdapter;->delegate:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0, p1}, Lorg/apache/commons/digester/Rules;->setDigester(Lorg/apache/commons/digester/Digester;)V

    .line 507
    return-void
.end method

.method public setNamespaceURI(Ljava/lang/String;)V
    .registers 3
    .param p1, "namespaceURI"    # Ljava/lang/String;

    .prologue
    .line 513
    iget-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$RulesPrefixAdapter;->delegate:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0, p1}, Lorg/apache/commons/digester/Rules;->setNamespaceURI(Ljava/lang/String;)V

    .line 514
    return-void
.end method
