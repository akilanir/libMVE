.class public Lch/qos/logback/core/subst/Parser;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lch/qos/logback/core/subst/Parser$1;
    }
.end annotation


# instance fields
.field pointer:I

.field final tokenList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/subst/Token;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/subst/Token;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lch/qos/logback/core/subst/Parser;->pointer:I

    iput-object p1, p0, Lch/qos/logback/core/subst/Parser;->tokenList:Ljava/util/List;

    return-void
.end method

.method private C()Lch/qos/logback/core/subst/Node;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/spi/ScanException;
        }
    .end annotation

    invoke-direct {p0}, Lch/qos/logback/core/subst/Parser;->E()Lch/qos/logback/core/subst/Node;

    move-result-object v0

    invoke-virtual {p0}, Lch/qos/logback/core/subst/Parser;->peekAtCurentToken()Lch/qos/logback/core/subst/Token;

    move-result-object v1

    invoke-direct {p0, v1}, Lch/qos/logback/core/subst/Parser;->isDefaultToken(Lch/qos/logback/core/subst/Token;)Z

    move-result v1

    if-eqz v1, :cond_21

    invoke-virtual {p0}, Lch/qos/logback/core/subst/Parser;->advanceTokenPointer()V

    const-string v1, ":-"

    invoke-direct {p0, v1}, Lch/qos/logback/core/subst/Parser;->makeNewLiteralNode(Ljava/lang/String;)Lch/qos/logback/core/subst/Node;

    move-result-object v1

    invoke-virtual {v0, v1}, Lch/qos/logback/core/subst/Node;->append(Lch/qos/logback/core/subst/Node;)V

    invoke-direct {p0}, Lch/qos/logback/core/subst/Parser;->E()Lch/qos/logback/core/subst/Node;

    move-result-object v1

    invoke-virtual {v0, v1}, Lch/qos/logback/core/subst/Node;->append(Lch/qos/logback/core/subst/Node;)V

    :cond_21
    return-object v0
.end method

.method private E()Lch/qos/logback/core/subst/Node;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/spi/ScanException;
        }
    .end annotation

    invoke-direct {p0}, Lch/qos/logback/core/subst/Parser;->T()Lch/qos/logback/core/subst/Node;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :cond_7
    :goto_7
    return-object v0

    :cond_8
    invoke-direct {p0}, Lch/qos/logback/core/subst/Parser;->Eopt()Lch/qos/logback/core/subst/Node;

    move-result-object v1

    if-eqz v1, :cond_7

    invoke-virtual {v0, v1}, Lch/qos/logback/core/subst/Node;->append(Lch/qos/logback/core/subst/Node;)V

    goto :goto_7
.end method

.method private Eopt()Lch/qos/logback/core/subst/Node;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/spi/ScanException;
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/core/subst/Parser;->peekAtCurentToken()Lch/qos/logback/core/subst/Token;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    invoke-direct {p0}, Lch/qos/logback/core/subst/Parser;->E()Lch/qos/logback/core/subst/Node;

    move-result-object v0

    goto :goto_7
.end method

.method private T()Lch/qos/logback/core/subst/Node;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/spi/ScanException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0}, Lch/qos/logback/core/subst/Parser;->peekAtCurentToken()Lch/qos/logback/core/subst/Token;

    move-result-object v1

    if-nez v1, :cond_8

    :goto_7
    return-object v0

    :cond_8
    sget-object v2, Lch/qos/logback/core/subst/Parser$1;->$SwitchMap$ch$qos$logback$core$subst$Token$Type:[I

    iget-object v3, v1, Lch/qos/logback/core/subst/Token;->type:Lch/qos/logback/core/subst/Token$Type;

    invoke-virtual {v3}, Lch/qos/logback/core/subst/Token$Type;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_56

    goto :goto_7

    :pswitch_16
    invoke-virtual {p0}, Lch/qos/logback/core/subst/Parser;->advanceTokenPointer()V

    iget-object v0, v1, Lch/qos/logback/core/subst/Token;->payload:Ljava/lang/String;

    invoke-direct {p0, v0}, Lch/qos/logback/core/subst/Parser;->makeNewLiteralNode(Ljava/lang/String;)Lch/qos/logback/core/subst/Node;

    move-result-object v0

    goto :goto_7

    :pswitch_20
    invoke-virtual {p0}, Lch/qos/logback/core/subst/Parser;->advanceTokenPointer()V

    invoke-direct {p0}, Lch/qos/logback/core/subst/Parser;->C()Lch/qos/logback/core/subst/Node;

    move-result-object v1

    invoke-virtual {p0}, Lch/qos/logback/core/subst/Parser;->peekAtCurentToken()Lch/qos/logback/core/subst/Token;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/subst/Parser;->expectCurlyRight(Lch/qos/logback/core/subst/Token;)V

    invoke-virtual {p0}, Lch/qos/logback/core/subst/Parser;->advanceTokenPointer()V

    sget-object v0, Lch/qos/logback/core/CoreConstants;->LEFT_ACCOLADE:Ljava/lang/String;

    invoke-direct {p0, v0}, Lch/qos/logback/core/subst/Parser;->makeNewLiteralNode(Ljava/lang/String;)Lch/qos/logback/core/subst/Node;

    move-result-object v0

    invoke-virtual {v0, v1}, Lch/qos/logback/core/subst/Node;->append(Lch/qos/logback/core/subst/Node;)V

    sget-object v1, Lch/qos/logback/core/CoreConstants;->RIGHT_ACCOLADE:Ljava/lang/String;

    invoke-direct {p0, v1}, Lch/qos/logback/core/subst/Parser;->makeNewLiteralNode(Ljava/lang/String;)Lch/qos/logback/core/subst/Node;

    move-result-object v1

    invoke-virtual {v0, v1}, Lch/qos/logback/core/subst/Node;->append(Lch/qos/logback/core/subst/Node;)V

    goto :goto_7

    :pswitch_44
    invoke-virtual {p0}, Lch/qos/logback/core/subst/Parser;->advanceTokenPointer()V

    invoke-direct {p0}, Lch/qos/logback/core/subst/Parser;->V()Lch/qos/logback/core/subst/Node;

    move-result-object v0

    invoke-virtual {p0}, Lch/qos/logback/core/subst/Parser;->peekAtCurentToken()Lch/qos/logback/core/subst/Token;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/core/subst/Parser;->expectCurlyRight(Lch/qos/logback/core/subst/Token;)V

    invoke-virtual {p0}, Lch/qos/logback/core/subst/Parser;->advanceTokenPointer()V

    goto :goto_7

    :pswitch_data_56
    .packed-switch 0x1
        :pswitch_16
        :pswitch_20
        :pswitch_44
    .end packed-switch
.end method

.method private V()Lch/qos/logback/core/subst/Node;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/spi/ScanException;
        }
    .end annotation

    invoke-direct {p0}, Lch/qos/logback/core/subst/Parser;->E()Lch/qos/logback/core/subst/Node;

    move-result-object v0

    new-instance v1, Lch/qos/logback/core/subst/Node;

    sget-object v2, Lch/qos/logback/core/subst/Node$Type;->VARIABLE:Lch/qos/logback/core/subst/Node$Type;

    invoke-direct {v1, v2, v0}, Lch/qos/logback/core/subst/Node;-><init>(Lch/qos/logback/core/subst/Node$Type;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lch/qos/logback/core/subst/Parser;->peekAtCurentToken()Lch/qos/logback/core/subst/Token;

    move-result-object v0

    invoke-direct {p0, v0}, Lch/qos/logback/core/subst/Parser;->isDefaultToken(Lch/qos/logback/core/subst/Token;)Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-virtual {p0}, Lch/qos/logback/core/subst/Parser;->advanceTokenPointer()V

    invoke-direct {p0}, Lch/qos/logback/core/subst/Parser;->E()Lch/qos/logback/core/subst/Node;

    move-result-object v0

    iput-object v0, v1, Lch/qos/logback/core/subst/Node;->defaultPart:Ljava/lang/Object;

    :cond_1e
    return-object v1
.end method

.method private isDefaultToken(Lch/qos/logback/core/subst/Token;)Z
    .registers 4

    if-eqz p1, :cond_a

    iget-object v0, p1, Lch/qos/logback/core/subst/Token;->type:Lch/qos/logback/core/subst/Token$Type;

    sget-object v1, Lch/qos/logback/core/subst/Token$Type;->DEFAULT:Lch/qos/logback/core/subst/Token$Type;

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private makeNewLiteralNode(Ljava/lang/String;)Lch/qos/logback/core/subst/Node;
    .registers 4

    new-instance v0, Lch/qos/logback/core/subst/Node;

    sget-object v1, Lch/qos/logback/core/subst/Node$Type;->LITERAL:Lch/qos/logback/core/subst/Node$Type;

    invoke-direct {v0, v1, p1}, Lch/qos/logback/core/subst/Node;-><init>(Lch/qos/logback/core/subst/Node$Type;Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method advanceTokenPointer()V
    .registers 2

    iget v0, p0, Lch/qos/logback/core/subst/Parser;->pointer:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lch/qos/logback/core/subst/Parser;->pointer:I

    return-void
.end method

.method expectCurlyRight(Lch/qos/logback/core/subst/Token;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/spi/ScanException;
        }
    .end annotation

    const-string v0, "}"

    invoke-virtual {p0, p1, v0}, Lch/qos/logback/core/subst/Parser;->expectNotNull(Lch/qos/logback/core/subst/Token;Ljava/lang/String;)V

    iget-object v0, p1, Lch/qos/logback/core/subst/Token;->type:Lch/qos/logback/core/subst/Token$Type;

    sget-object v1, Lch/qos/logback/core/subst/Token$Type;->CURLY_RIGHT:Lch/qos/logback/core/subst/Token$Type;

    if-eq v0, v1, :cond_13

    new-instance v0, Lch/qos/logback/core/spi/ScanException;

    const-string v1, "Expecting }"

    invoke-direct {v0, v1}, Lch/qos/logback/core/spi/ScanException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_13
    return-void
.end method

.method expectNotNull(Lch/qos/logback/core/subst/Token;Ljava/lang/String;)V
    .registers 6

    if-nez p1, :cond_21

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "All tokens consumed but was expecting \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_21
    return-void
.end method

.method public parse()Lch/qos/logback/core/subst/Node;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/spi/ScanException;
        }
    .end annotation

    invoke-direct {p0}, Lch/qos/logback/core/subst/Parser;->E()Lch/qos/logback/core/subst/Node;

    move-result-object v0

    return-object v0
.end method

.method peekAtCurentToken()Lch/qos/logback/core/subst/Token;
    .registers 3

    iget v0, p0, Lch/qos/logback/core/subst/Parser;->pointer:I

    iget-object v1, p0, Lch/qos/logback/core/subst/Parser;->tokenList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_15

    iget-object v0, p0, Lch/qos/logback/core/subst/Parser;->tokenList:Ljava/util/List;

    iget v1, p0, Lch/qos/logback/core/subst/Parser;->pointer:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/subst/Token;

    :goto_14
    return-object v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method
