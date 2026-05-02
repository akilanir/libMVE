.class public Lorg/apache/commons/digester/SetNestedPropertiesRule;
.super Lorg/apache/commons/digester/Rule;
.source "SetNestedPropertiesRule.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/digester/SetNestedPropertiesRule$1;,
        Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;,
        Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;
    }
.end annotation


# instance fields
.field private allowUnknownChildElements:Z

.field private elementNames:Ljava/util/HashMap;

.field private log:Lorg/apache/commons/logging/Log;

.field private trimData:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 121
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 104
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->log:Lorg/apache/commons/logging/Log;

    .line 106
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->trimData:Z

    .line 107
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->allowUnknownChildElements:Z

    .line 109
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->elementNames:Ljava/util/HashMap;

    .line 123
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "elementName"    # Ljava/lang/String;
    .param p2, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 138
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 104
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->log:Lorg/apache/commons/logging/Log;

    .line 106
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->trimData:Z

    .line 107
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->allowUnknownChildElements:Z

    .line 109
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->elementNames:Ljava/util/HashMap;

    .line 139
    iget-object v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->elementNames:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;[Ljava/lang/String;)V
    .registers 8
    .param p1, "elementNames"    # [Ljava/lang/String;
    .param p2, "propertyNames"    # [Ljava/lang/String;

    .prologue
    .line 183
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 104
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->log:Lorg/apache/commons/logging/Log;

    .line 106
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->trimData:Z

    .line 107
    const/4 v3, 0x0

    iput-boolean v3, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->allowUnknownChildElements:Z

    .line 109
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->elementNames:Ljava/util/HashMap;

    .line 184
    const/4 v0, 0x0

    .local v0, "i":I
    array-length v2, p1

    .local v2, "size":I
    :goto_15
    if-lt v0, v2, :cond_18

    .line 192
    return-void

    .line 185
    :cond_18
    const/4 v1, 0x0

    .line 186
    .local v1, "propName":Ljava/lang/String;
    array-length v3, p2

    if-ge v0, v3, :cond_1e

    .line 187
    aget-object v1, p2, v0

    .line 190
    :cond_1e
    iget-object v3, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->elementNames:Ljava/util/HashMap;

    aget-object v4, p1, v0

    invoke-virtual {v3, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    add-int/lit8 v0, v0, 0x1

    goto :goto_15
.end method

.method static access$100(Lorg/apache/commons/digester/SetNestedPropertiesRule;)Lorg/apache/commons/logging/Log;
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/digester/SetNestedPropertiesRule;

    .prologue
    .line 102
    iget-object v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->log:Lorg/apache/commons/logging/Log;

    return-object v0
.end method

.method static access$200(Lorg/apache/commons/digester/SetNestedPropertiesRule;)Ljava/util/HashMap;
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/digester/SetNestedPropertiesRule;

    .prologue
    .line 102
    iget-object v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->elementNames:Ljava/util/HashMap;

    return-object v0
.end method

.method static access$300(Lorg/apache/commons/digester/SetNestedPropertiesRule;)Z
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/digester/SetNestedPropertiesRule;

    .prologue
    .line 102
    iget-boolean v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->trimData:Z

    return v0
.end method

.method static access$400(Lorg/apache/commons/digester/SetNestedPropertiesRule;)Z
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/digester/SetNestedPropertiesRule;

    .prologue
    .line 102
    iget-boolean v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->allowUnknownChildElements:Z

    return v0
.end method


# virtual methods
.method public addAlias(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "elementName"    # Ljava/lang/String;
    .param p2, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 275
    iget-object v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->elementNames:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 276
    return-void
.end method

.method public begin(Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 9
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 248
    iget-object v3, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v3}, Lorg/apache/commons/digester/Digester;->getRules()Lorg/apache/commons/digester/Rules;

    move-result-object v2

    .line 249
    .local v2, "oldRules":Lorg/apache/commons/digester/Rules;
    new-instance v0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;

    const/4 v3, 0x0

    invoke-direct {v0, p0, v3}, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;-><init>(Lorg/apache/commons/digester/SetNestedPropertiesRule;Lorg/apache/commons/digester/SetNestedPropertiesRule$1;)V

    .line 250
    .local v0, "anyChildRule":Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;
    iget-object v3, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v0, v3}, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->setDigester(Lorg/apache/commons/digester/Digester;)V

    .line 251
    new-instance v1, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;

    invoke-direct {v1, p0, v0}, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;-><init>(Lorg/apache/commons/digester/SetNestedPropertiesRule;Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;)V

    .line 252
    .local v1, "newRules":Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v4, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v4}, Lorg/apache/commons/digester/Digester;->getMatch()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3, v2}, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;->init(Ljava/lang/String;Lorg/apache/commons/digester/Rules;)V

    .line 253
    iget-object v3, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v3, v1}, Lorg/apache/commons/digester/Digester;->setRules(Lorg/apache/commons/digester/Rules;)V

    .line 254
    return-void
.end method

.method public body(Ljava/lang/String;)V
    .registers 5
    .param p1, "bodyText"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 262
    iget-object v1, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v1}, Lorg/apache/commons/digester/Digester;->getRules()Lorg/apache/commons/digester/Rules;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;

    .line 263
    .local v0, "newRules":Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;
    iget-object v1, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v0}, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules;->getOldRules()Lorg/apache/commons/digester/Rules;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/commons/digester/Digester;->setRules(Lorg/apache/commons/digester/Rules;)V

    .line 264
    return-void
.end method

.method public getAllowUnknownChildElements()Z
    .registers 2

    .prologue
    .line 236
    iget-boolean v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->allowUnknownChildElements:Z

    return v0
.end method

.method public getTrimData()Z
    .registers 2

    .prologue
    .line 213
    iget-boolean v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->trimData:Z

    return v0
.end method

.method public setAllowUnknownChildElements(Z)V
    .registers 2
    .param p1, "allowUnknownChildElements"    # Z

    .prologue
    .line 231
    iput-boolean p1, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->allowUnknownChildElements:Z

    .line 232
    return-void
.end method

.method public setDigester(Lorg/apache/commons/digester/Digester;)V
    .registers 3
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 198
    invoke-super {p0, p1}, Lorg/apache/commons/digester/Rule;->setDigester(Lorg/apache/commons/digester/Digester;)V

    .line 199
    invoke-virtual {p1}, Lorg/apache/commons/digester/Digester;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->log:Lorg/apache/commons/logging/Log;

    .line 200
    return-void
.end method

.method public setTrimData(Z)V
    .registers 2
    .param p1, "trimData"    # Z

    .prologue
    .line 208
    iput-boolean p1, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->trimData:Z

    .line 209
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 282
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "SetNestedPropertiesRule["

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 283
    .local v0, "sb":Ljava/lang/StringBuffer;
    const-string v1, "allowUnknownChildElements="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 284
    iget-boolean v1, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->allowUnknownChildElements:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 285
    const-string v1, ", trimData="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 286
    iget-boolean v1, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->trimData:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 287
    const-string v1, ", elementNames="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 288
    iget-object v1, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule;->elementNames:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 289
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 290
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
