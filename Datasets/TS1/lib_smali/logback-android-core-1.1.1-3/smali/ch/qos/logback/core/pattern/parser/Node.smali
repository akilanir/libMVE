.class public Lch/qos/logback/core/pattern/parser/Node;
.super Ljava/lang/Object;


# static fields
.field static final COMPOSITE_KEYWORD:I = 0x2

.field static final LITERAL:I = 0x0

.field static final SIMPLE_KEYWORD:I = 0x1


# instance fields
.field next:Lch/qos/logback/core/pattern/parser/Node;

.field final type:I

.field final value:Ljava/lang/Object;


# direct methods
.method constructor <init>(I)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lch/qos/logback/core/pattern/parser/Node;-><init>(ILjava/lang/Object;)V

    return-void
.end method

.method constructor <init>(ILjava/lang/Object;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lch/qos/logback/core/pattern/parser/Node;->type:I

    iput-object p2, p0, Lch/qos/logback/core/pattern/parser/Node;->value:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p0, p1, :cond_5

    :cond_4
    :goto_4
    return v0

    :cond_5
    instance-of v2, p1, Lch/qos/logback/core/pattern/parser/Node;

    if-nez v2, :cond_b

    move v0, v1

    goto :goto_4

    :cond_b
    check-cast p1, Lch/qos/logback/core/pattern/parser/Node;

    iget v2, p0, Lch/qos/logback/core/pattern/parser/Node;->type:I

    iget v3, p1, Lch/qos/logback/core/pattern/parser/Node;->type:I

    if-ne v2, v3, :cond_2f

    iget-object v2, p0, Lch/qos/logback/core/pattern/parser/Node;->value:Ljava/lang/Object;

    if-eqz v2, :cond_31

    iget-object v2, p0, Lch/qos/logback/core/pattern/parser/Node;->value:Ljava/lang/Object;

    iget-object v3, p1, Lch/qos/logback/core/pattern/parser/Node;->value:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2f

    :goto_21
    iget-object v2, p0, Lch/qos/logback/core/pattern/parser/Node;->next:Lch/qos/logback/core/pattern/parser/Node;

    if-eqz v2, :cond_36

    iget-object v2, p0, Lch/qos/logback/core/pattern/parser/Node;->next:Lch/qos/logback/core/pattern/parser/Node;

    iget-object v3, p1, Lch/qos/logback/core/pattern/parser/Node;->next:Lch/qos/logback/core/pattern/parser/Node;

    invoke-virtual {v2, v3}, Lch/qos/logback/core/pattern/parser/Node;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    :cond_2f
    move v0, v1

    goto :goto_4

    :cond_31
    iget-object v2, p1, Lch/qos/logback/core/pattern/parser/Node;->value:Ljava/lang/Object;

    if-nez v2, :cond_2f

    goto :goto_21

    :cond_36
    iget-object v2, p1, Lch/qos/logback/core/pattern/parser/Node;->next:Lch/qos/logback/core/pattern/parser/Node;

    if-nez v2, :cond_2f

    goto :goto_4
.end method

.method public getNext()Lch/qos/logback/core/pattern/parser/Node;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/Node;->next:Lch/qos/logback/core/pattern/parser/Node;

    return-object v0
.end method

.method public getType()I
    .registers 2

    iget v0, p0, Lch/qos/logback/core/pattern/parser/Node;->type:I

    return v0
.end method

.method public getValue()Ljava/lang/Object;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/Node;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    iget v0, p0, Lch/qos/logback/core/pattern/parser/Node;->type:I

    mul-int/lit8 v1, v0, 0x1f

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/Node;->value:Ljava/lang/Object;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/Node;->value:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_e
    add-int/2addr v0, v1

    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_e
.end method

.method printNext()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/Node;->next:Lch/qos/logback/core/pattern/parser/Node;

    if-eqz v0, :cond_1a

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " -> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/pattern/parser/Node;->next:Lch/qos/logback/core/pattern/parser/Node;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_19
    return-object v0

    :cond_1a
    const-string v0, ""

    goto :goto_19
.end method

.method public setNext(Lch/qos/logback/core/pattern/parser/Node;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/pattern/parser/Node;->next:Lch/qos/logback/core/pattern/parser/Node;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget v1, p0, Lch/qos/logback/core/pattern/parser/Node;->type:I

    packed-switch v1, :pswitch_data_3c

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :goto_11
    invoke-virtual {p0}, Lch/qos/logback/core/pattern/parser/Node;->printNext()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_1d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "LITERAL("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/pattern/parser/Node;->value:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_11

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method
