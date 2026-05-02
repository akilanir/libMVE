.class Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;
.super Ljava/lang/Object;
.source "SetNestedPropertiesRule.java"

# interfaces
.implements Lorg/apache/commons/digester/Rules;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/digester/SetNestedPropertiesRule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AnyChildRules"
.end annotation


# instance fields
.field private decoratedRules:Lorg/apache/commons/digester/Rules;

.field private matchPrefix:Ljava/lang/String;

.field private rule:Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;

.field private rules:Ljava/util/ArrayList;

.field private final this$0:Lorg/apache/commons/digester/SetNestedPropertiesRule;


# direct methods
.method public constructor <init>(Lorg/apache/commons/digester/SetNestedPropertiesRule;Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;)V
    .registers 5
    .param p1, "this$0"    # Lorg/apache/commons/digester/SetNestedPropertiesRule;
    .param p2, "rule"    # Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;

    .prologue
    const/4 v0, 0x0

    .line 303
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;->this$0:Lorg/apache/commons/digester/SetNestedPropertiesRule;

    .line 297
    iput-object v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;->matchPrefix:Ljava/lang/String;

    .line 298
    iput-object v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;->decoratedRules:Lorg/apache/commons/digester/Rules;

    .line 300
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;->rules:Ljava/util/ArrayList;

    .line 304
    iput-object p2, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;->rule:Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;

    .line 305
    iget-object v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;->rules:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 306
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V
    .registers 3
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "rule"    # Lorg/apache/commons/digester/Rule;

    .prologue
    .line 312
    return-void
.end method

.method public clear()V
    .registers 1

    .prologue
    .line 313
    return-void
.end method

.method public getDigester()Lorg/apache/commons/digester/Digester;
    .registers 2

    .prologue
    .line 308
    const/4 v0, 0x0

    return-object v0
.end method

.method public getNamespaceURI()Ljava/lang/String;
    .registers 2

    .prologue
    .line 310
    const/4 v0, 0x0

    return-object v0
.end method

.method public getOldRules()Lorg/apache/commons/digester/Rules;
    .registers 2

    .prologue
    .line 379
    iget-object v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;->decoratedRules:Lorg/apache/commons/digester/Rules;

    return-object v0
.end method

.method public init(Ljava/lang/String;Lorg/apache/commons/digester/Rules;)V
    .registers 3
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "rules"    # Lorg/apache/commons/digester/Rules;

    .prologue
    .line 374
    iput-object p1, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;->matchPrefix:Ljava/lang/String;

    .line 375
    iput-object p2, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;->decoratedRules:Lorg/apache/commons/digester/Rules;

    .line 376
    return-void
.end method

.method public match(Ljava/lang/String;)Ljava/util/List;
    .registers 3
    .param p1, "matchPath"    # Ljava/lang/String;

    .prologue
    .line 316
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .registers 7
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "matchPath"    # Ljava/lang/String;

    .prologue
    .line 320
    iget-object v2, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;->decoratedRules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v2, p1, p2}, Lorg/apache/commons/digester/Rules;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 322
    .local v0, "match":Ljava/util/List;
    iget-object v2, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;->matchPrefix:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_33

    const/16 v2, 0x2f

    iget-object v3, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;->matchPrefix:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p2, v2, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_33

    .line 330
    if-eqz v0, :cond_25

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_28

    .line 335
    :cond_25
    iget-object v1, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;->rules:Ljava/util/ArrayList;

    .line 350
    :goto_27
    return-object v1

    .line 344
    :cond_28
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1, v0}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    .line 345
    .local v1, "newMatch":Ljava/util/LinkedList;
    iget-object v2, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;->rule:Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    goto :goto_27

    .end local v1    # "newMatch":Ljava/util/LinkedList;
    :cond_33
    move-object v1, v0

    .line 350
    goto :goto_27
.end method

.method public rules()Ljava/util/List;
    .registers 3

    .prologue
    .line 369
    iget-object v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;->this$0:Lorg/apache/commons/digester/SetNestedPropertiesRule;

    invoke-static {v0}, Lorg/apache/commons/digester/SetNestedPropertiesRule;->access$100(Lorg/apache/commons/digester/SetNestedPropertiesRule;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    const-string v1, "AnyChildRules.rules invoked."

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 370
    iget-object v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;->decoratedRules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0}, Lorg/apache/commons/digester/Rules;->rules()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public setDigester(Lorg/apache/commons/digester/Digester;)V
    .registers 2
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 309
    return-void
.end method

.method public setNamespaceURI(Ljava/lang/String;)V
    .registers 2
    .param p1, "namespaceURI"    # Ljava/lang/String;

    .prologue
    .line 311
    return-void
.end method
