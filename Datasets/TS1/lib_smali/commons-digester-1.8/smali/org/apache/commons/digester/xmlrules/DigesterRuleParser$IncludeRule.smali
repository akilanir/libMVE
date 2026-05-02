.class Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;
.super Lorg/apache/commons/digester/Rule;
.source "DigesterRuleParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "IncludeRule"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;


# direct methods
.method public constructor <init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V
    .registers 2
    .param p1, "this$0"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    .prologue
    .line 339
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 338
    iput-object p1, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    .line 340
    return-void
.end method

.method private includeProgrammaticRules(Ljava/lang/String;)V
    .registers 8
    .param p1, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/lang/ClassCastException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 406
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 407
    .local v0, "cls":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/digester/xmlrules/DigesterRulesSource;

    .line 410
    .local v3, "rulesSource":Lorg/apache/commons/digester/xmlrules/DigesterRulesSource;
    iget-object v4, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    iget-object v4, v4, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->targetDigester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v4}, Lorg/apache/commons/digester/Digester;->getRules()Lorg/apache/commons/digester/Rules;

    move-result-object v1

    .line 411
    .local v1, "digesterRules":Lorg/apache/commons/digester/Rules;
    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$RulesPrefixAdapter;

    iget-object v4, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    iget-object v5, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    iget-object v5, v5, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->patternStack:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;

    invoke-virtual {v5}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v4, v5, v1}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$RulesPrefixAdapter;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Ljava/lang/String;Lorg/apache/commons/digester/Rules;)V

    .line 414
    .local v2, "prefixWrapper":Lorg/apache/commons/digester/Rules;
    iget-object v4, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    iget-object v4, v4, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->targetDigester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v4, v2}, Lorg/apache/commons/digester/Digester;->setRules(Lorg/apache/commons/digester/Rules;)V

    .line 416
    :try_start_28
    iget-object v4, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    iget-object v4, v4, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->targetDigester:Lorg/apache/commons/digester/Digester;

    invoke-interface {v3, v4}, Lorg/apache/commons/digester/xmlrules/DigesterRulesSource;->getRules(Lorg/apache/commons/digester/Digester;)V
    :try_end_2f
    .catchall {:try_start_28 .. :try_end_2f} :catchall_37

    .line 419
    iget-object v4, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    iget-object v4, v4, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->targetDigester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v4, v1}, Lorg/apache/commons/digester/Digester;->setRules(Lorg/apache/commons/digester/Rules;)V

    .line 421
    return-void

    .line 419
    :catchall_37
    move-exception v4

    iget-object v5, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    iget-object v5, v5, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->targetDigester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v5, v1}, Lorg/apache/commons/digester/Digester;->setRules(Lorg/apache/commons/digester/Rules;)V

    throw v4
.end method

.method private includeXMLRules(Ljava/lang/String;)V
    .registers 10
    .param p1, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;,
            Lorg/apache/commons/digester/xmlrules/CircularIncludeException;
        }
    .end annotation

    .prologue
    .line 370
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 371
    .local v0, "cl":Ljava/lang/ClassLoader;
    if-nez v0, :cond_14

    .line 372
    iget-object v4, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 374
    :cond_14
    invoke-virtual {v0, p1}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    .line 375
    .local v2, "fileURL":Ljava/net/URL;
    if-nez v2, :cond_39

    .line 376
    new-instance v4, Ljava/io/FileNotFoundException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "File \""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\" not found."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 378
    :cond_39
    invoke-virtual {v2}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object p1

    .line 379
    iget-object v4, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    invoke-static {v4}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->access$100(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4f

    .line 381
    new-instance v4, Lorg/apache/commons/digester/xmlrules/CircularIncludeException;

    invoke-direct {v4, p1}, Lorg/apache/commons/digester/xmlrules/CircularIncludeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 384
    :cond_4f
    new-instance v3, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    iget-object v4, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    iget-object v4, v4, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->targetDigester:Lorg/apache/commons/digester/Digester;

    iget-object v5, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    iget-object v5, v5, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->patternStack:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;

    iget-object v6, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    invoke-static {v6}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->access$100(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)Ljava/util/Set;

    move-result-object v6

    const/4 v7, 0x0

    invoke-direct {v3, v4, v5, v6, v7}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;-><init>(Lorg/apache/commons/digester/Digester;Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;Ljava/util/Set;Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$1;)V

    .line 386
    .local v3, "includedSet":Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;
    iget-object v4, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    invoke-virtual {v4}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->getDigesterRulesDTD()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->setDigesterRulesDTD(Ljava/lang/String;)V

    .line 387
    new-instance v1, Lorg/apache/commons/digester/Digester;

    invoke-direct {v1}, Lorg/apache/commons/digester/Digester;-><init>()V

    .line 388
    .local v1, "digester":Lorg/apache/commons/digester/Digester;
    invoke-virtual {v1, v3}, Lorg/apache/commons/digester/Digester;->addRuleSet(Lorg/apache/commons/digester/RuleSet;)V

    .line 389
    iget-object v4, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    invoke-virtual {v1, v4}, Lorg/apache/commons/digester/Digester;->push(Ljava/lang/Object;)V

    .line 390
    invoke-virtual {v1, p1}, Lorg/apache/commons/digester/Digester;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 391
    iget-object v4, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    invoke-static {v4}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->access$100(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 392
    return-void
.end method


# virtual methods
.method public begin(Lorg/xml/sax/Attributes;)V
    .registers 5
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 350
    const-string v2, "path"

    invoke-interface {p1, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 351
    .local v1, "fileName":Ljava/lang/String;
    if-eqz v1, :cond_11

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_11

    .line 352
    invoke-direct {p0, v1}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;->includeXMLRules(Ljava/lang/String;)V

    .line 357
    :cond_11
    const-string v2, "class"

    invoke-interface {p1, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 358
    .local v0, "className":Ljava/lang/String;
    if-eqz v0, :cond_22

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_22

    .line 359
    invoke-direct {p0, v0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;->includeProgrammaticRules(Ljava/lang/String;)V

    .line 361
    :cond_22
    return-void
.end method
