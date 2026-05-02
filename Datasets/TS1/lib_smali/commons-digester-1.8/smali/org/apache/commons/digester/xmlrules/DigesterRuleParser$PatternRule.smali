.class Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;
.super Lorg/apache/commons/digester/Rule;
.source "DigesterRuleParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PatternRule"
.end annotation


# instance fields
.field private attrName:Ljava/lang/String;

.field private pattern:Ljava/lang/String;

.field private final this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;


# direct methods
.method public constructor <init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Ljava/lang/String;)V
    .registers 4
    .param p1, "this$0"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;
    .param p2, "attrName"    # Ljava/lang/String;

    .prologue
    .line 302
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 301
    iput-object p1, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    .line 296
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;->pattern:Ljava/lang/String;

    .line 303
    iput-object p2, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;->attrName:Ljava/lang/String;

    .line 304
    return-void
.end method


# virtual methods
.method public begin(Lorg/xml/sax/Attributes;)V
    .registers 4
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 311
    iget-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;->attrName:Ljava/lang/String;

    invoke-interface {p1, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;->pattern:Ljava/lang/String;

    .line 312
    iget-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;->pattern:Ljava/lang/String;

    if-eqz v0, :cond_15

    .line 313
    iget-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    iget-object v0, v0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->patternStack:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;

    iget-object v1, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;->pattern:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    :cond_15
    return-void
.end method

.method public end()V
    .registers 2

    .prologue
    .line 322
    iget-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;->pattern:Ljava/lang/String;

    if-eqz v0, :cond_b

    .line 323
    iget-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    iget-object v0, v0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->patternStack:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;

    invoke-virtual {v0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;->pop()Ljava/lang/Object;

    .line 325
    :cond_b
    return-void
.end method
