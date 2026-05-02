.class public Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$CallMethodRuleFactory;
.super Lorg/apache/commons/digester/AbstractObjectCreationFactory;
.source "DigesterRuleParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "CallMethodRuleFactory"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V
    .registers 2
    .param p1, "this$0"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    .prologue
    .line 546
    invoke-direct {p0}, Lorg/apache/commons/digester/AbstractObjectCreationFactory;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$CallMethodRuleFactory;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    return-void
.end method

.method private getParamTypes(Ljava/lang/String;)[Ljava/lang/String;
    .registers 7
    .param p1, "paramTypes"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 584
    if-eqz p1, :cond_26

    .line 585
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 586
    .local v1, "paramTypesList":Ljava/util/ArrayList;
    new-instance v2, Ljava/util/StringTokenizer;

    const-string v3, " \t\n\r,"

    invoke-direct {v2, p1, v3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 588
    .local v2, "tokens":Ljava/util/StringTokenizer;
    :goto_f
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-nez v3, :cond_1e

    .line 591
    new-array v3, v4, [Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 595
    .end local v1    # "paramTypesList":Ljava/util/ArrayList;
    .end local v2    # "tokens":Ljava/util/StringTokenizer;
    .local v0, "paramTypesArray":[Ljava/lang/String;
    :goto_1d
    return-object v0

    .line 589
    .end local v0    # "paramTypesArray":[Ljava/lang/String;
    .restart local v1    # "paramTypesList":Ljava/util/ArrayList;
    .restart local v2    # "tokens":Ljava/util/StringTokenizer;
    :cond_1e
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f

    .line 593
    .end local v1    # "paramTypesList":Ljava/util/ArrayList;
    .end local v2    # "tokens":Ljava/util/StringTokenizer;
    :cond_26
    new-array v0, v4, [Ljava/lang/String;

    .restart local v0    # "paramTypesArray":[Ljava/lang/String;
    goto :goto_1d
.end method


# virtual methods
.method public createObject(Lorg/xml/sax/Attributes;)Ljava/lang/Object;
    .registers 10
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 548
    const/4 v0, 0x0

    .line 549
    .local v0, "callMethodRule":Lorg/apache/commons/digester/Rule;
    const-string v7, "methodname"

    invoke-interface {p1, v7}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 553
    .local v1, "methodName":Ljava/lang/String;
    const/4 v5, 0x0

    .line 554
    .local v5, "targetOffset":I
    const-string v7, "targetoffset"

    invoke-interface {p1, v7}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 555
    .local v6, "targetOffsetStr":Ljava/lang/String;
    if-eqz v6, :cond_14

    .line 556
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 559
    :cond_14
    const-string v7, "paramcount"

    invoke-interface {p1, v7}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_22

    .line 561
    new-instance v0, Lorg/apache/commons/digester/CallMethodRule;

    .end local v0    # "callMethodRule":Lorg/apache/commons/digester/Rule;
    invoke-direct {v0, v5, v1}, Lorg/apache/commons/digester/CallMethodRule;-><init>(ILjava/lang/String;)V

    .line 575
    .restart local v0    # "callMethodRule":Lorg/apache/commons/digester/Rule;
    :goto_21
    return-object v0

    .line 564
    :cond_22
    const-string v7, "paramcount"

    invoke-interface {p1, v7}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 566
    .local v2, "paramCount":I
    const-string v7, "paramtypes"

    invoke-interface {p1, v7}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 567
    .local v4, "paramTypesAttr":Ljava/lang/String;
    if-eqz v4, :cond_3a

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_40

    .line 568
    :cond_3a
    new-instance v0, Lorg/apache/commons/digester/CallMethodRule;

    .end local v0    # "callMethodRule":Lorg/apache/commons/digester/Rule;
    invoke-direct {v0, v5, v1, v2}, Lorg/apache/commons/digester/CallMethodRule;-><init>(ILjava/lang/String;I)V

    .restart local v0    # "callMethodRule":Lorg/apache/commons/digester/Rule;
    goto :goto_21

    .line 570
    :cond_40
    invoke-direct {p0, v4}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$CallMethodRuleFactory;->getParamTypes(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 571
    .local v3, "paramTypes":[Ljava/lang/String;
    new-instance v0, Lorg/apache/commons/digester/CallMethodRule;

    .end local v0    # "callMethodRule":Lorg/apache/commons/digester/Rule;
    invoke-direct {v0, v5, v1, v2, v3}, Lorg/apache/commons/digester/CallMethodRule;-><init>(ILjava/lang/String;I[Ljava/lang/String;)V

    .restart local v0    # "callMethodRule":Lorg/apache/commons/digester/Rule;
    goto :goto_21
.end method
