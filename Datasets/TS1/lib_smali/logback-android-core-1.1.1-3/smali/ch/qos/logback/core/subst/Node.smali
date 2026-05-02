.class public Lch/qos/logback/core/subst/Node;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lch/qos/logback/core/subst/Node$1;,
        Lch/qos/logback/core/subst/Node$Type;
    }
.end annotation


# instance fields
.field defaultPart:Ljava/lang/Object;

.field next:Lch/qos/logback/core/subst/Node;

.field payload:Ljava/lang/Object;

.field type:Lch/qos/logback/core/subst/Node$Type;


# direct methods
.method public constructor <init>(Lch/qos/logback/core/subst/Node$Type;Ljava/lang/Object;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lch/qos/logback/core/subst/Node;->type:Lch/qos/logback/core/subst/Node$Type;

    iput-object p2, p0, Lch/qos/logback/core/subst/Node;->payload:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lch/qos/logback/core/subst/Node$Type;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lch/qos/logback/core/subst/Node;->type:Lch/qos/logback/core/subst/Node$Type;

    iput-object p2, p0, Lch/qos/logback/core/subst/Node;->payload:Ljava/lang/Object;

    iput-object p3, p0, Lch/qos/logback/core/subst/Node;->defaultPart:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method append(Lch/qos/logback/core/subst/Node;)V
    .registers 3

    if-nez p1, :cond_5

    :goto_2
    return-void

    :cond_3
    iget-object p0, p0, Lch/qos/logback/core/subst/Node;->next:Lch/qos/logback/core/subst/Node;

    :cond_5
    iget-object v0, p0, Lch/qos/logback/core/subst/Node;->next:Lch/qos/logback/core/subst/Node;

    if-nez v0, :cond_3

    iput-object p1, p0, Lch/qos/logback/core/subst/Node;->next:Lch/qos/logback/core/subst/Node;

    goto :goto_2
.end method

.method public dump()V
    .registers 3

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0}, Lch/qos/logback/core/subst/Node;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, " -> "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lch/qos/logback/core/subst/Node;->next:Lch/qos/logback/core/subst/Node;

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lch/qos/logback/core/subst/Node;->next:Lch/qos/logback/core/subst/Node;

    invoke-virtual {v0}, Lch/qos/logback/core/subst/Node;->dump()V

    :goto_19
    return-void

    :cond_1a
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, " null"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_19
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p0, p1, :cond_5

    :cond_4
    :goto_4
    return v0

    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_13

    :cond_11
    move v0, v1

    goto :goto_4

    :cond_13
    check-cast p1, Lch/qos/logback/core/subst/Node;

    iget-object v2, p0, Lch/qos/logback/core/subst/Node;->type:Lch/qos/logback/core/subst/Node$Type;

    iget-object v3, p1, Lch/qos/logback/core/subst/Node;->type:Lch/qos/logback/core/subst/Node$Type;

    if-eq v2, v3, :cond_1d

    move v0, v1

    goto :goto_4

    :cond_1d
    iget-object v2, p0, Lch/qos/logback/core/subst/Node;->payload:Ljava/lang/Object;

    if-eqz v2, :cond_2d

    iget-object v2, p0, Lch/qos/logback/core/subst/Node;->payload:Ljava/lang/Object;

    iget-object v3, p1, Lch/qos/logback/core/subst/Node;->payload:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_31

    :cond_2b
    move v0, v1

    goto :goto_4

    :cond_2d
    iget-object v2, p1, Lch/qos/logback/core/subst/Node;->payload:Ljava/lang/Object;

    if-nez v2, :cond_2b

    :cond_31
    iget-object v2, p0, Lch/qos/logback/core/subst/Node;->defaultPart:Ljava/lang/Object;

    if-eqz v2, :cond_41

    iget-object v2, p0, Lch/qos/logback/core/subst/Node;->defaultPart:Ljava/lang/Object;

    iget-object v3, p1, Lch/qos/logback/core/subst/Node;->defaultPart:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_45

    :cond_3f
    move v0, v1

    goto :goto_4

    :cond_41
    iget-object v2, p1, Lch/qos/logback/core/subst/Node;->defaultPart:Ljava/lang/Object;

    if-nez v2, :cond_3f

    :cond_45
    iget-object v2, p0, Lch/qos/logback/core/subst/Node;->next:Lch/qos/logback/core/subst/Node;

    if-eqz v2, :cond_55

    iget-object v2, p0, Lch/qos/logback/core/subst/Node;->next:Lch/qos/logback/core/subst/Node;

    iget-object v3, p1, Lch/qos/logback/core/subst/Node;->next:Lch/qos/logback/core/subst/Node;

    invoke-virtual {v2, v3}, Lch/qos/logback/core/subst/Node;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    :goto_53
    move v0, v1

    goto :goto_4

    :cond_55
    iget-object v2, p1, Lch/qos/logback/core/subst/Node;->next:Lch/qos/logback/core/subst/Node;

    if-eqz v2, :cond_4

    goto :goto_53
.end method

.method public hashCode()I
    .registers 4

    const/4 v1, 0x0

    iget-object v0, p0, Lch/qos/logback/core/subst/Node;->type:Lch/qos/logback/core/subst/Node$Type;

    if-eqz v0, :cond_33

    iget-object v0, p0, Lch/qos/logback/core/subst/Node;->type:Lch/qos/logback/core/subst/Node$Type;

    invoke-virtual {v0}, Lch/qos/logback/core/subst/Node$Type;->hashCode()I

    move-result v0

    :goto_b
    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lch/qos/logback/core/subst/Node;->payload:Ljava/lang/Object;

    if-eqz v0, :cond_35

    iget-object v0, p0, Lch/qos/logback/core/subst/Node;->payload:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_17
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lch/qos/logback/core/subst/Node;->defaultPart:Ljava/lang/Object;

    if-eqz v0, :cond_37

    iget-object v0, p0, Lch/qos/logback/core/subst/Node;->defaultPart:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_24
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lch/qos/logback/core/subst/Node;->next:Lch/qos/logback/core/subst/Node;

    if-eqz v2, :cond_31

    iget-object v1, p0, Lch/qos/logback/core/subst/Node;->next:Lch/qos/logback/core/subst/Node;

    invoke-virtual {v1}, Lch/qos/logback/core/subst/Node;->hashCode()I

    move-result v1

    :cond_31
    add-int/2addr v0, v1

    return v0

    :cond_33
    move v0, v1

    goto :goto_b

    :cond_35
    move v0, v1

    goto :goto_17

    :cond_37
    move v0, v1

    goto :goto_24
.end method

.method recursive(Lch/qos/logback/core/subst/Node;Ljava/lang/StringBuilder;)V
    .registers 5

    :goto_0
    if-eqz p1, :cond_12

    invoke-virtual {p1}, Lch/qos/logback/core/subst/Node;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " --> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lch/qos/logback/core/subst/Node;->next:Lch/qos/logback/core/subst/Node;

    goto :goto_0

    :cond_12
    const-string v0, "null "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method public setNext(Lch/qos/logback/core/subst/Node;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/subst/Node;->next:Lch/qos/logback/core/subst/Node;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    sget-object v0, Lch/qos/logback/core/subst/Node$1;->$SwitchMap$ch$qos$logback$core$subst$Node$Type:[I

    iget-object v1, p0, Lch/qos/logback/core/subst/Node;->type:Lch/qos/logback/core/subst/Node$Type;

    invoke-virtual {v1}, Lch/qos/logback/core/subst/Node$Type;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_b0

    const/4 v0, 0x0

    :goto_e
    return-object v0

    :pswitch_f
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Node{type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/subst/Node;->type:Lch/qos/logback/core/subst/Node$Type;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", payload=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/subst/Node;->payload:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    :pswitch_37
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lch/qos/logback/core/subst/Node;->defaultPart:Ljava/lang/Object;

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lch/qos/logback/core/subst/Node;->defaultPart:Ljava/lang/Object;

    check-cast v0, Lch/qos/logback/core/subst/Node;

    invoke-virtual {p0, v0, v2}, Lch/qos/logback/core/subst/Node;->recursive(Lch/qos/logback/core/subst/Node;Ljava/lang/StringBuilder;)V

    :cond_4c
    iget-object v0, p0, Lch/qos/logback/core/subst/Node;->payload:Ljava/lang/Object;

    check-cast v0, Lch/qos/logback/core/subst/Node;

    invoke-virtual {p0, v0, v1}, Lch/qos/logback/core/subst/Node;->recursive(Lch/qos/logback/core/subst/Node;Ljava/lang/StringBuilder;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Node{type="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, p0, Lch/qos/logback/core/subst/Node;->type:Lch/qos/logback/core/subst/Node$Type;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ", payload=\'"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/subst/Node;->defaultPart:Ljava/lang/Object;

    if-eqz v1, :cond_9b

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", defaultPart="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_9b
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_e

    :pswitch_data_b0
    .packed-switch 0x1
        :pswitch_f
        :pswitch_37
    .end packed-switch
.end method
