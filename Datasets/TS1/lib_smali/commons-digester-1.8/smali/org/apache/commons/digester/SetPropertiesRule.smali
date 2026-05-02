.class public Lorg/apache/commons/digester/SetPropertiesRule;
.super Lorg/apache/commons/digester/Rule;
.source "SetPropertiesRule.java"


# instance fields
.field private attributeNames:[Ljava/lang/String;

.field private ignoreMissingProperty:Z

.field private propertyNames:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 65
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 153
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/digester/SetPropertiesRule;->ignoreMissingProperty:Z

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "attributeName"    # Ljava/lang/String;
    .param p2, "propertyName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 80
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 153
    iput-boolean v1, p0, Lorg/apache/commons/digester/SetPropertiesRule;->ignoreMissingProperty:Z

    .line 82
    new-array v0, v1, [Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/commons/digester/SetPropertiesRule;->attributeNames:[Ljava/lang/String;

    .line 83
    iget-object v0, p0, Lorg/apache/commons/digester/SetPropertiesRule;->attributeNames:[Ljava/lang/String;

    aput-object p1, v0, v2

    .line 84
    new-array v0, v1, [Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/commons/digester/SetPropertiesRule;->propertyNames:[Ljava/lang/String;

    .line 85
    iget-object v0, p0, Lorg/apache/commons/digester/SetPropertiesRule;->propertyNames:[Ljava/lang/String;

    aput-object p2, v0, v2

    .line 86
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;)V
    .registers 2
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 57
    invoke-direct {p0}, Lorg/apache/commons/digester/SetPropertiesRule;-><init>()V

    .line 59
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;[Ljava/lang/String;)V
    .registers 7
    .param p1, "attributeNames"    # [Ljava/lang/String;
    .param p2, "propertyNames"    # [Ljava/lang/String;

    .prologue
    .line 125
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 153
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/apache/commons/digester/SetPropertiesRule;->ignoreMissingProperty:Z

    .line 127
    array-length v2, p1

    new-array v2, v2, [Ljava/lang/String;

    iput-object v2, p0, Lorg/apache/commons/digester/SetPropertiesRule;->attributeNames:[Ljava/lang/String;

    .line 128
    const/4 v0, 0x0

    .local v0, "i":I
    array-length v1, p1

    .local v1, "size":I
    :goto_d
    if-lt v0, v1, :cond_19

    .line 132
    array-length v2, p2

    new-array v2, v2, [Ljava/lang/String;

    iput-object v2, p0, Lorg/apache/commons/digester/SetPropertiesRule;->propertyNames:[Ljava/lang/String;

    .line 133
    const/4 v0, 0x0

    array-length v1, p2

    :goto_16
    if-lt v0, v1, :cond_22

    .line 136
    return-void

    .line 129
    :cond_19
    iget-object v2, p0, Lorg/apache/commons/digester/SetPropertiesRule;->attributeNames:[Ljava/lang/String;

    aget-object v3, p1, v0

    aput-object v3, v2, v0

    .line 128
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 134
    :cond_22
    iget-object v2, p0, Lorg/apache/commons/digester/SetPropertiesRule;->propertyNames:[Ljava/lang/String;

    aget-object v3, p2, v0

    aput-object v3, v2, v0

    .line 133
    add-int/lit8 v0, v0, 0x1

    goto :goto_16
.end method


# virtual methods
.method public addAlias(Ljava/lang/String;Ljava/lang/String;)V
    .registers 10
    .param p1, "attributeName"    # Ljava/lang/String;
    .param p2, "propertyName"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 267
    iget-object v4, p0, Lorg/apache/commons/digester/SetPropertiesRule;->attributeNames:[Ljava/lang/String;

    if-nez v4, :cond_17

    .line 269
    new-array v4, v6, [Ljava/lang/String;

    iput-object v4, p0, Lorg/apache/commons/digester/SetPropertiesRule;->attributeNames:[Ljava/lang/String;

    .line 270
    iget-object v4, p0, Lorg/apache/commons/digester/SetPropertiesRule;->attributeNames:[Ljava/lang/String;

    aput-object p1, v4, v5

    .line 271
    new-array v4, v6, [Ljava/lang/String;

    iput-object v4, p0, Lorg/apache/commons/digester/SetPropertiesRule;->propertyNames:[Ljava/lang/String;

    .line 272
    iget-object v4, p0, Lorg/apache/commons/digester/SetPropertiesRule;->propertyNames:[Ljava/lang/String;

    aput-object p2, v4, v5

    .line 291
    :goto_16
    return-void

    .line 275
    :cond_17
    iget-object v4, p0, Lorg/apache/commons/digester/SetPropertiesRule;->attributeNames:[Ljava/lang/String;

    array-length v1, v4

    .line 276
    .local v1, "length":I
    add-int/lit8 v4, v1, 0x1

    new-array v2, v4, [Ljava/lang/String;

    .line 277
    .local v2, "tempAttributes":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1f
    if-lt v0, v1, :cond_36

    .line 280
    aput-object p1, v2, v1

    .line 282
    add-int/lit8 v4, v1, 0x1

    new-array v3, v4, [Ljava/lang/String;

    .line 283
    .local v3, "tempProperties":[Ljava/lang/String;
    const/4 v0, 0x0

    :goto_28
    if-ge v0, v1, :cond_2f

    iget-object v4, p0, Lorg/apache/commons/digester/SetPropertiesRule;->propertyNames:[Ljava/lang/String;

    array-length v4, v4

    if-lt v0, v4, :cond_3f

    .line 286
    :cond_2f
    aput-object p2, v3, v1

    .line 288
    iput-object v3, p0, Lorg/apache/commons/digester/SetPropertiesRule;->propertyNames:[Ljava/lang/String;

    .line 289
    iput-object v2, p0, Lorg/apache/commons/digester/SetPropertiesRule;->attributeNames:[Ljava/lang/String;

    goto :goto_16

    .line 278
    .end local v3    # "tempProperties":[Ljava/lang/String;
    :cond_36
    iget-object v4, p0, Lorg/apache/commons/digester/SetPropertiesRule;->attributeNames:[Ljava/lang/String;

    aget-object v4, v4, v0

    aput-object v4, v2, v0

    .line 277
    add-int/lit8 v0, v0, 0x1

    goto :goto_1f

    .line 284
    .restart local v3    # "tempProperties":[Ljava/lang/String;
    :cond_3f
    iget-object v4, p0, Lorg/apache/commons/digester/SetPropertiesRule;->propertyNames:[Ljava/lang/String;

    aget-object v4, v4, v0

    aput-object v4, v3, v0

    .line 283
    add-int/lit8 v0, v0, 0x1

    goto :goto_28
.end method

.method public begin(Lorg/xml/sax/Attributes;)V
    .registers 14
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 167
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 170
    .local v8, "values":Ljava/util/HashMap;
    const/4 v0, 0x0

    .line 171
    .local v0, "attNamesLength":I
    iget-object v9, p0, Lorg/apache/commons/digester/SetPropertiesRule;->attributeNames:[Ljava/lang/String;

    if-eqz v9, :cond_d

    .line 172
    iget-object v9, p0, Lorg/apache/commons/digester/SetPropertiesRule;->attributeNames:[Ljava/lang/String;

    array-length v0, v9

    .line 174
    :cond_d
    const/4 v4, 0x0

    .line 175
    .local v4, "propNamesLength":I
    iget-object v9, p0, Lorg/apache/commons/digester/SetPropertiesRule;->propertyNames:[Ljava/lang/String;

    if-eqz v9, :cond_15

    .line 176
    iget-object v9, p0, Lorg/apache/commons/digester/SetPropertiesRule;->propertyNames:[Ljava/lang/String;

    array-length v4, v9

    .line 180
    :cond_15
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_16
    invoke-interface {p1}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v9

    if-lt v1, v9, :cond_68

    .line 241
    iget-object v9, p0, Lorg/apache/commons/digester/SetPropertiesRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v9}, Lorg/apache/commons/digester/Digester;->peek()Ljava/lang/Object;

    move-result-object v6

    .line 242
    .local v6, "top":Ljava/lang/Object;
    iget-object v9, p0, Lorg/apache/commons/digester/SetPropertiesRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v9, v9, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v9}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v9

    if-eqz v9, :cond_64

    .line 243
    if-eqz v6, :cond_114

    .line 244
    iget-object v9, p0, Lorg/apache/commons/digester/SetPropertiesRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v9, v9, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "[SetPropertiesRule]{"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/commons/digester/SetPropertiesRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v11, v11, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "} Set "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, " properties"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 252
    :cond_64
    :goto_64
    invoke-static {v6, v8}, Lorg/apache/commons/beanutils/BeanUtils;->populate(Ljava/lang/Object;Ljava/util/Map;)V

    .line 255
    return-void

    .line 181
    .end local v6    # "top":Ljava/lang/Object;
    :cond_68
    invoke-interface {p1, v1}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v3

    .line 182
    .local v3, "name":Ljava/lang/String;
    const-string v9, ""

    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_78

    .line 183
    invoke-interface {p1, v1}, Lorg/xml/sax/Attributes;->getQName(I)Ljava/lang/String;

    move-result-object v3

    .line 185
    :cond_78
    invoke-interface {p1, v1}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v7

    .line 188
    .local v7, "value":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "n":I
    :goto_7d
    if-lt v2, v0, :cond_f2

    .line 203
    :goto_7f
    iget-object v9, p0, Lorg/apache/commons/digester/SetPropertiesRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v9, v9, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v9}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v9

    if-eqz v9, :cond_c1

    .line 204
    iget-object v9, p0, Lorg/apache/commons/digester/SetPropertiesRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v9, v9, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "[SetPropertiesRule]{"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/commons/digester/SetPropertiesRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v11, v11, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "} Setting property \'"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\' to \'"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\'"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 209
    :cond_c1
    iget-boolean v9, p0, Lorg/apache/commons/digester/SetPropertiesRule;->ignoreMissingProperty:Z

    if-nez v9, :cond_10b

    if-eqz v3, :cond_10b

    .line 229
    iget-object v9, p0, Lorg/apache/commons/digester/SetPropertiesRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v9}, Lorg/apache/commons/digester/Digester;->peek()Ljava/lang/Object;

    move-result-object v6

    .line 230
    .restart local v6    # "top":Ljava/lang/Object;
    invoke-static {v6, v3}, Lorg/apache/commons/beanutils/PropertyUtils;->isWriteable(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v5

    .line 231
    .local v5, "test":Z
    if-nez v5, :cond_10b

    .line 232
    new-instance v9, Ljava/lang/NoSuchMethodException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "Property "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, " can\'t be set"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 189
    .end local v5    # "test":Z
    .end local v6    # "top":Ljava/lang/Object;
    :cond_f2
    iget-object v9, p0, Lorg/apache/commons/digester/SetPropertiesRule;->attributeNames:[Ljava/lang/String;

    aget-object v9, v9, v2

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_107

    .line 190
    if-ge v2, v4, :cond_104

    .line 192
    iget-object v9, p0, Lorg/apache/commons/digester/SetPropertiesRule;->propertyNames:[Ljava/lang/String;

    aget-object v3, v9, v2

    goto/16 :goto_7f

    .line 197
    :cond_104
    const/4 v3, 0x0

    .line 199
    goto/16 :goto_7f

    .line 188
    :cond_107
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_7d

    .line 235
    :cond_10b
    if-eqz v3, :cond_110

    .line 236
    invoke-virtual {v8, v3, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    :cond_110
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_16

    .line 248
    .end local v2    # "n":I
    .end local v3    # "name":Ljava/lang/String;
    .end local v7    # "value":Ljava/lang/String;
    .restart local v6    # "top":Ljava/lang/Object;
    :cond_114
    iget-object v9, p0, Lorg/apache/commons/digester/SetPropertiesRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v9, v9, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "[SetPropertiesRule]{"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/commons/digester/SetPropertiesRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v11, v11, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "} Set NULL properties"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto/16 :goto_64
.end method

.method public isIgnoreMissingProperty()Z
    .registers 2

    .prologue
    .line 315
    iget-boolean v0, p0, Lorg/apache/commons/digester/SetPropertiesRule;->ignoreMissingProperty:Z

    return v0
.end method

.method public setIgnoreMissingProperty(Z)V
    .registers 2
    .param p1, "ignoreMissingProperty"    # Z

    .prologue
    .line 328
    iput-boolean p1, p0, Lorg/apache/commons/digester/SetPropertiesRule;->ignoreMissingProperty:Z

    .line 329
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 299
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "SetPropertiesRule["

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 300
    .local v0, "sb":Ljava/lang/StringBuffer;
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 301
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
