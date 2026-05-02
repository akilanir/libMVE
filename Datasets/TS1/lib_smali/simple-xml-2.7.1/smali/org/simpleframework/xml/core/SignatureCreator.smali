.class Lorg/simpleframework/xml/core/SignatureCreator;
.super Ljava/lang/Object;
.source "SignatureCreator.java"

# interfaces
.implements Lorg/simpleframework/xml/core/Creator;


# instance fields
.field private final list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/simpleframework/xml/core/Parameter;",
            ">;"
        }
    .end annotation
.end field

.field private final signature:Lorg/simpleframework/xml/core/Signature;

.field private final type:Ljava/lang/Class;


# direct methods
.method public constructor <init>(Lorg/simpleframework/xml/core/Signature;)V
    .registers 3
    .param p1, "signature"    # Lorg/simpleframework/xml/core/Signature;

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    invoke-virtual {p1}, Lorg/simpleframework/xml/core/Signature;->getType()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lorg/simpleframework/xml/core/SignatureCreator;->type:Ljava/lang/Class;

    .line 62
    invoke-virtual {p1}, Lorg/simpleframework/xml/core/Signature;->getAll()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/simpleframework/xml/core/SignatureCreator;->list:Ljava/util/List;

    .line 63
    iput-object p1, p0, Lorg/simpleframework/xml/core/SignatureCreator;->signature:Lorg/simpleframework/xml/core/Signature;

    .line 64
    return-void
.end method

.method private getAdjustment(D)D
    .registers 9
    .param p1, "score"    # D

    .prologue
    .line 228
    iget-object v2, p0, Lorg/simpleframework/xml/core/SignatureCreator;->list:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    int-to-double v2, v2

    const-wide v4, 0x408f400000000000L    # 1000.0

    div-double v0, v2, v4

    .line 230
    .local v0, "adjustment":D
    const-wide/16 v2, 0x0

    cmpl-double v2, p1, v2

    if-lez v2, :cond_1f

    .line 231
    iget-object v2, p0, Lorg/simpleframework/xml/core/SignatureCreator;->list:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    int-to-double v2, v2

    div-double v2, p1, v2

    add-double/2addr v2, v0

    .line 233
    :goto_1e
    return-wide v2

    :cond_1f
    iget-object v2, p0, Lorg/simpleframework/xml/core/SignatureCreator;->list:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    int-to-double v2, v2

    div-double v2, p1, v2

    goto :goto_1e
.end method

.method private getPercentage(Lorg/simpleframework/xml/core/Criteria;)D
    .registers 12
    .param p1, "criteria"    # Lorg/simpleframework/xml/core/Criteria;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const-wide/high16 v6, -0x4010000000000000L    # -1.0

    .line 197
    const-wide/16 v3, 0x0

    .line 199
    .local v3, "score":D
    iget-object v8, p0, Lorg/simpleframework/xml/core/SignatureCreator;->list:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_a
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_32

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/simpleframework/xml/core/Parameter;

    .line 200
    .local v5, "value":Lorg/simpleframework/xml/core/Parameter;
    invoke-interface {v5}, Lorg/simpleframework/xml/core/Parameter;->getKey()Ljava/lang/Object;

    move-result-object v1

    .line 201
    .local v1, "key":Ljava/lang/Object;
    invoke-interface {p1, v1}, Lorg/simpleframework/xml/core/Criteria;->get(Ljava/lang/Object;)Lorg/simpleframework/xml/core/Variable;

    move-result-object v2

    .line 203
    .local v2, "label":Lorg/simpleframework/xml/core/Label;
    if-nez v2, :cond_2e

    .line 204
    invoke-interface {v5}, Lorg/simpleframework/xml/core/Parameter;->isRequired()Z

    move-result v8

    if-eqz v8, :cond_27

    .line 214
    .end local v1    # "key":Ljava/lang/Object;
    .end local v2    # "label":Lorg/simpleframework/xml/core/Label;
    .end local v5    # "value":Lorg/simpleframework/xml/core/Parameter;
    :goto_26
    return-wide v6

    .line 207
    .restart local v1    # "key":Ljava/lang/Object;
    .restart local v2    # "label":Lorg/simpleframework/xml/core/Label;
    .restart local v5    # "value":Lorg/simpleframework/xml/core/Parameter;
    :cond_27
    invoke-interface {v5}, Lorg/simpleframework/xml/core/Parameter;->isPrimitive()Z

    move-result v8

    if-eqz v8, :cond_a

    goto :goto_26

    .line 211
    :cond_2e
    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    add-double/2addr v3, v8

    goto :goto_a

    .line 214
    .end local v1    # "key":Ljava/lang/Object;
    .end local v2    # "label":Lorg/simpleframework/xml/core/Label;
    .end local v5    # "value":Lorg/simpleframework/xml/core/Parameter;
    :cond_32
    invoke-direct {p0, v3, v4}, Lorg/simpleframework/xml/core/SignatureCreator;->getAdjustment(D)D

    move-result-wide v6

    goto :goto_26
.end method

.method private getVariable(Lorg/simpleframework/xml/core/Criteria;I)Ljava/lang/Object;
    .registers 7
    .param p1, "criteria"    # Lorg/simpleframework/xml/core/Criteria;
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 130
    iget-object v3, p0, Lorg/simpleframework/xml/core/SignatureCreator;->list:Ljava/util/List;

    invoke-interface {v3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/simpleframework/xml/core/Parameter;

    .line 131
    .local v1, "parameter":Lorg/simpleframework/xml/core/Parameter;
    invoke-interface {v1}, Lorg/simpleframework/xml/core/Parameter;->getKey()Ljava/lang/Object;

    move-result-object v0

    .line 132
    .local v0, "key":Ljava/lang/Object;
    invoke-interface {p1, v0}, Lorg/simpleframework/xml/core/Criteria;->remove(Ljava/lang/Object;)Lorg/simpleframework/xml/core/Variable;

    move-result-object v2

    .line 134
    .local v2, "variable":Lorg/simpleframework/xml/core/Variable;
    if-eqz v2, :cond_17

    .line 135
    invoke-virtual {v2}, Lorg/simpleframework/xml/core/Variable;->getValue()Ljava/lang/Object;

    move-result-object v3

    .line 137
    :goto_16
    return-object v3

    :cond_17
    const/4 v3, 0x0

    goto :goto_16
.end method


# virtual methods
.method public getInstance()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 96
    iget-object v0, p0, Lorg/simpleframework/xml/core/SignatureCreator;->signature:Lorg/simpleframework/xml/core/Signature;

    invoke-virtual {v0}, Lorg/simpleframework/xml/core/Signature;->create()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getInstance(Lorg/simpleframework/xml/core/Criteria;)Ljava/lang/Object;
    .registers 5
    .param p1, "criteria"    # Lorg/simpleframework/xml/core/Criteria;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 110
    iget-object v2, p0, Lorg/simpleframework/xml/core/SignatureCreator;->list:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v1

    .line 112
    .local v1, "values":[Ljava/lang/Object;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    iget-object v2, p0, Lorg/simpleframework/xml/core/SignatureCreator;->list:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_18

    .line 113
    invoke-direct {p0, p1, v0}, Lorg/simpleframework/xml/core/SignatureCreator;->getVariable(Lorg/simpleframework/xml/core/Criteria;I)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v1, v0

    .line 112
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 115
    :cond_18
    iget-object v2, p0, Lorg/simpleframework/xml/core/SignatureCreator;->signature:Lorg/simpleframework/xml/core/Signature;

    invoke-virtual {v2, v1}, Lorg/simpleframework/xml/core/Signature;->create([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public getScore(Lorg/simpleframework/xml/core/Criteria;)D
    .registers 14
    .param p1, "criteria"    # Lorg/simpleframework/xml/core/Criteria;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const-wide/high16 v9, -0x4010000000000000L    # -1.0

    .line 155
    iget-object v11, p0, Lorg/simpleframework/xml/core/SignatureCreator;->signature:Lorg/simpleframework/xml/core/Signature;

    invoke-virtual {v11}, Lorg/simpleframework/xml/core/Signature;->copy()Lorg/simpleframework/xml/core/Signature;

    move-result-object v6

    .line 157
    .local v6, "match":Lorg/simpleframework/xml/core/Signature;
    invoke-interface {p1}, Lorg/simpleframework/xml/core/Criteria;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_40

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 158
    .local v4, "key":Ljava/lang/Object;
    invoke-virtual {v6, v4}, Lorg/simpleframework/xml/core/Signature;->get(Ljava/lang/Object;)Lorg/simpleframework/xml/core/Parameter;

    move-result-object v7

    .line 159
    .local v7, "parameter":Lorg/simpleframework/xml/core/Parameter;
    invoke-interface {p1, v4}, Lorg/simpleframework/xml/core/Criteria;->get(Ljava/lang/Object;)Lorg/simpleframework/xml/core/Variable;

    move-result-object v5

    .line 160
    .local v5, "label":Lorg/simpleframework/xml/core/Variable;
    invoke-virtual {v5}, Lorg/simpleframework/xml/core/Variable;->getContact()Lorg/simpleframework/xml/core/Contact;

    move-result-object v1

    .line 162
    .local v1, "contact":Lorg/simpleframework/xml/core/Contact;
    if-eqz v7, :cond_37

    .line 163
    invoke-virtual {v5}, Lorg/simpleframework/xml/core/Variable;->getValue()Ljava/lang/Object;

    move-result-object v8

    .line 164
    .local v8, "value":Ljava/lang/Object;
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 165
    .local v2, "expect":Ljava/lang/Class;
    invoke-interface {v7}, Lorg/simpleframework/xml/core/Parameter;->getType()Ljava/lang/Class;

    move-result-object v0

    .line 167
    .local v0, "actual":Ljava/lang/Class;
    invoke-static {v2, v0}, Lorg/simpleframework/xml/core/Support;->isAssignable(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v11

    if-nez v11, :cond_37

    .line 177
    .end local v0    # "actual":Ljava/lang/Class;
    .end local v1    # "contact":Lorg/simpleframework/xml/core/Contact;
    .end local v2    # "expect":Ljava/lang/Class;
    .end local v4    # "key":Ljava/lang/Object;
    .end local v5    # "label":Lorg/simpleframework/xml/core/Variable;
    .end local v7    # "parameter":Lorg/simpleframework/xml/core/Parameter;
    .end local v8    # "value":Ljava/lang/Object;
    :goto_36
    return-wide v9

    .line 171
    .restart local v1    # "contact":Lorg/simpleframework/xml/core/Contact;
    .restart local v4    # "key":Ljava/lang/Object;
    .restart local v5    # "label":Lorg/simpleframework/xml/core/Variable;
    .restart local v7    # "parameter":Lorg/simpleframework/xml/core/Parameter;
    :cond_37
    invoke-interface {v1}, Lorg/simpleframework/xml/core/Contact;->isReadOnly()Z

    move-result v11

    if-eqz v11, :cond_c

    .line 172
    if-nez v7, :cond_c

    goto :goto_36

    .line 177
    .end local v1    # "contact":Lorg/simpleframework/xml/core/Contact;
    .end local v4    # "key":Ljava/lang/Object;
    .end local v5    # "label":Lorg/simpleframework/xml/core/Variable;
    .end local v7    # "parameter":Lorg/simpleframework/xml/core/Parameter;
    :cond_40
    invoke-direct {p0, p1}, Lorg/simpleframework/xml/core/SignatureCreator;->getPercentage(Lorg/simpleframework/xml/core/Criteria;)D

    move-result-wide v9

    goto :goto_36
.end method

.method public getSignature()Lorg/simpleframework/xml/core/Signature;
    .registers 2

    .prologue
    .line 85
    iget-object v0, p0, Lorg/simpleframework/xml/core/SignatureCreator;->signature:Lorg/simpleframework/xml/core/Signature;

    return-object v0
.end method

.method public getType()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lorg/simpleframework/xml/core/SignatureCreator;->type:Ljava/lang/Class;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 244
    iget-object v0, p0, Lorg/simpleframework/xml/core/SignatureCreator;->signature:Lorg/simpleframework/xml/core/Signature;

    invoke-virtual {v0}, Lorg/simpleframework/xml/core/Signature;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
