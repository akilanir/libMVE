.class public Lcom/wutka/dtd/DTDAttribute;
.super Ljava/lang/Object;
.source "DTDAttribute.java"

# interfaces
.implements Lcom/wutka/dtd/DTDOutput;


# instance fields
.field public decl:Lcom/wutka/dtd/DTDDecl;

.field public defaultValue:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public type:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "aName"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/wutka/dtd/DTDAttribute;->name:Ljava/lang/String;

    .line 33
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "ob"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 71
    if-ne p1, p0, :cond_5

    .line 112
    :cond_4
    :goto_4
    return v1

    .line 72
    :cond_5
    instance-of v3, p1, Lcom/wutka/dtd/DTDAttribute;

    if-nez v3, :cond_b

    move v1, v2

    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 74
    check-cast v0, Lcom/wutka/dtd/DTDAttribute;

    .line 76
    .local v0, "other":Lcom/wutka/dtd/DTDAttribute;
    iget-object v3, p0, Lcom/wutka/dtd/DTDAttribute;->name:Ljava/lang/String;

    if-nez v3, :cond_18

    .line 78
    iget-object v3, v0, Lcom/wutka/dtd/DTDAttribute;->name:Ljava/lang/String;

    if-eqz v3, :cond_24

    move v1, v2

    goto :goto_4

    .line 82
    :cond_18
    iget-object v3, p0, Lcom/wutka/dtd/DTDAttribute;->name:Ljava/lang/String;

    iget-object v4, v0, Lcom/wutka/dtd/DTDAttribute;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_24

    move v1, v2

    goto :goto_4

    .line 85
    :cond_24
    iget-object v3, p0, Lcom/wutka/dtd/DTDAttribute;->type:Ljava/lang/Object;

    if-nez v3, :cond_2e

    .line 87
    iget-object v3, v0, Lcom/wutka/dtd/DTDAttribute;->type:Ljava/lang/Object;

    if-eqz v3, :cond_3a

    move v1, v2

    goto :goto_4

    .line 91
    :cond_2e
    iget-object v3, p0, Lcom/wutka/dtd/DTDAttribute;->type:Ljava/lang/Object;

    iget-object v4, v0, Lcom/wutka/dtd/DTDAttribute;->type:Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3a

    move v1, v2

    goto :goto_4

    .line 94
    :cond_3a
    iget-object v3, p0, Lcom/wutka/dtd/DTDAttribute;->decl:Lcom/wutka/dtd/DTDDecl;

    if-nez v3, :cond_44

    .line 96
    iget-object v3, v0, Lcom/wutka/dtd/DTDAttribute;->decl:Lcom/wutka/dtd/DTDDecl;

    if-eqz v3, :cond_50

    move v1, v2

    goto :goto_4

    .line 100
    :cond_44
    iget-object v3, p0, Lcom/wutka/dtd/DTDAttribute;->decl:Lcom/wutka/dtd/DTDDecl;

    iget-object v4, v0, Lcom/wutka/dtd/DTDAttribute;->decl:Lcom/wutka/dtd/DTDDecl;

    invoke-virtual {v3, v4}, Lcom/wutka/dtd/DTDDecl;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_50

    move v1, v2

    goto :goto_4

    .line 103
    :cond_50
    iget-object v3, p0, Lcom/wutka/dtd/DTDAttribute;->defaultValue:Ljava/lang/String;

    if-nez v3, :cond_5a

    .line 105
    iget-object v3, v0, Lcom/wutka/dtd/DTDAttribute;->defaultValue:Ljava/lang/String;

    if-eqz v3, :cond_4

    move v1, v2

    goto :goto_4

    .line 109
    :cond_5a
    iget-object v3, p0, Lcom/wutka/dtd/DTDAttribute;->defaultValue:Ljava/lang/String;

    iget-object v4, v0, Lcom/wutka/dtd/DTDAttribute;->defaultValue:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    goto :goto_4
.end method

.method public getDecl()Lcom/wutka/dtd/DTDDecl;
    .registers 2

    .prologue
    .line 156
    iget-object v0, p0, Lcom/wutka/dtd/DTDAttribute;->decl:Lcom/wutka/dtd/DTDDecl;

    return-object v0
.end method

.method public getDefaultValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 168
    iget-object v0, p0, Lcom/wutka/dtd/DTDAttribute;->defaultValue:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Lcom/wutka/dtd/DTDAttribute;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 144
    iget-object v0, p0, Lcom/wutka/dtd/DTDAttribute;->type:Ljava/lang/Object;

    return-object v0
.end method

.method public setDecl(Lcom/wutka/dtd/DTDDecl;)V
    .registers 2
    .param p1, "aDecl"    # Lcom/wutka/dtd/DTDDecl;

    .prologue
    .line 150
    iput-object p1, p0, Lcom/wutka/dtd/DTDAttribute;->decl:Lcom/wutka/dtd/DTDDecl;

    .line 151
    return-void
.end method

.method public setDefaultValue(Ljava/lang/String;)V
    .registers 2
    .param p1, "aDefaultValue"    # Ljava/lang/String;

    .prologue
    .line 162
    iput-object p1, p0, Lcom/wutka/dtd/DTDAttribute;->defaultValue:Ljava/lang/String;

    .line 163
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "aName"    # Ljava/lang/String;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/wutka/dtd/DTDAttribute;->name:Ljava/lang/String;

    .line 119
    return-void
.end method

.method public setType(Ljava/lang/Object;)V
    .registers 4
    .param p1, "aType"    # Ljava/lang/Object;

    .prologue
    .line 130
    instance-of v0, p1, Ljava/lang/String;

    if-nez v0, :cond_14

    instance-of v0, p1, Lcom/wutka/dtd/DTDEnumeration;

    if-nez v0, :cond_14

    instance-of v0, p1, Lcom/wutka/dtd/DTDNotationList;

    if-nez v0, :cond_14

    .line 134
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Must be String, DTDEnumeration or DTDNotationList"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 138
    :cond_14
    iput-object p1, p0, Lcom/wutka/dtd/DTDAttribute;->type:Ljava/lang/Object;

    .line 139
    return-void
.end method

.method public write(Ljava/io/PrintWriter;)V
    .registers 6
    .param p1, "out"    # Ljava/io/PrintWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v3, p0, Lcom/wutka/dtd/DTDAttribute;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 40
    iget-object v2, p0, Lcom/wutka/dtd/DTDAttribute;->type:Ljava/lang/Object;

    instance-of v2, v2, Ljava/lang/String;

    if-eqz v2, :cond_40

    .line 42
    iget-object v2, p0, Lcom/wutka/dtd/DTDAttribute;->type:Ljava/lang/Object;

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/Object;)V

    .line 55
    :cond_23
    :goto_23
    iget-object v2, p0, Lcom/wutka/dtd/DTDAttribute;->decl:Lcom/wutka/dtd/DTDDecl;

    if-eqz v2, :cond_2c

    .line 57
    iget-object v2, p0, Lcom/wutka/dtd/DTDAttribute;->decl:Lcom/wutka/dtd/DTDDecl;

    invoke-virtual {v2, p1}, Lcom/wutka/dtd/DTDDecl;->write(Ljava/io/PrintWriter;)V

    .line 60
    :cond_2c
    iget-object v2, p0, Lcom/wutka/dtd/DTDAttribute;->defaultValue:Ljava/lang/String;

    if-eqz v2, :cond_3f

    .line 62
    const-string v2, " \""

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 63
    iget-object v2, p0, Lcom/wutka/dtd/DTDAttribute;->defaultValue:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 64
    const-string v2, "\""

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 67
    :cond_3f
    return-void

    .line 44
    :cond_40
    iget-object v2, p0, Lcom/wutka/dtd/DTDAttribute;->type:Ljava/lang/Object;

    instance-of v2, v2, Lcom/wutka/dtd/DTDEnumeration;

    if-eqz v2, :cond_4e

    .line 46
    iget-object v0, p0, Lcom/wutka/dtd/DTDAttribute;->type:Ljava/lang/Object;

    check-cast v0, Lcom/wutka/dtd/DTDEnumeration;

    .line 47
    .local v0, "dtdEnum":Lcom/wutka/dtd/DTDEnumeration;
    invoke-virtual {v0, p1}, Lcom/wutka/dtd/DTDEnumeration;->write(Ljava/io/PrintWriter;)V

    goto :goto_23

    .line 49
    .end local v0    # "dtdEnum":Lcom/wutka/dtd/DTDEnumeration;
    :cond_4e
    iget-object v2, p0, Lcom/wutka/dtd/DTDAttribute;->type:Ljava/lang/Object;

    instance-of v2, v2, Lcom/wutka/dtd/DTDNotationList;

    if-eqz v2, :cond_23

    .line 51
    iget-object v1, p0, Lcom/wutka/dtd/DTDAttribute;->type:Ljava/lang/Object;

    check-cast v1, Lcom/wutka/dtd/DTDNotationList;

    .line 52
    .local v1, "dtdnl":Lcom/wutka/dtd/DTDNotationList;
    invoke-virtual {v1, p1}, Lcom/wutka/dtd/DTDNotationList;->write(Ljava/io/PrintWriter;)V

    goto :goto_23
.end method
