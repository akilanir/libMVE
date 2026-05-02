.class public Lcom/wutka/dtd/DTDCardinal;
.super Ljava/lang/Object;
.source "DTDCardinal.java"

# interfaces
.implements Lcom/wutka/dtd/DTDOutput;


# static fields
.field public static final NONE:Lcom/wutka/dtd/DTDCardinal;

.field public static final ONEMANY:Lcom/wutka/dtd/DTDCardinal;

.field public static final OPTIONAL:Lcom/wutka/dtd/DTDCardinal;

.field public static final ZEROMANY:Lcom/wutka/dtd/DTDCardinal;


# instance fields
.field public name:Ljava/lang/String;

.field public type:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 19
    new-instance v0, Lcom/wutka/dtd/DTDCardinal;

    const/4 v1, 0x0

    const-string v2, "NONE"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/DTDCardinal;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/DTDCardinal;->NONE:Lcom/wutka/dtd/DTDCardinal;

    .line 22
    new-instance v0, Lcom/wutka/dtd/DTDCardinal;

    const/4 v1, 0x1

    const-string v2, "OPTIONAL"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/DTDCardinal;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/DTDCardinal;->OPTIONAL:Lcom/wutka/dtd/DTDCardinal;

    .line 25
    new-instance v0, Lcom/wutka/dtd/DTDCardinal;

    const/4 v1, 0x2

    const-string v2, "ZEROMANY"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/DTDCardinal;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/DTDCardinal;->ZEROMANY:Lcom/wutka/dtd/DTDCardinal;

    .line 28
    new-instance v0, Lcom/wutka/dtd/DTDCardinal;

    const/4 v1, 0x3

    const-string v2, "ONEMANY"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/DTDCardinal;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/DTDCardinal;->ONEMANY:Lcom/wutka/dtd/DTDCardinal;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .registers 3
    .param p1, "aType"    # I
    .param p2, "aName"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput p1, p0, Lcom/wutka/dtd/DTDCardinal;->type:I

    .line 36
    iput-object p2, p0, Lcom/wutka/dtd/DTDCardinal;->name:Ljava/lang/String;

    .line 37
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "ob"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 41
    if-ne p1, p0, :cond_5

    .line 46
    :cond_4
    :goto_4
    return v1

    .line 42
    :cond_5
    instance-of v3, p1, Lcom/wutka/dtd/DTDCardinal;

    if-nez v3, :cond_b

    move v1, v2

    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 44
    check-cast v0, Lcom/wutka/dtd/DTDCardinal;

    .line 45
    .local v0, "other":Lcom/wutka/dtd/DTDCardinal;
    iget v3, v0, Lcom/wutka/dtd/DTDCardinal;->type:I

    iget v4, p0, Lcom/wutka/dtd/DTDCardinal;->type:I

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 46
    goto :goto_4
.end method

.method public write(Ljava/io/PrintWriter;)V
    .registers 3
    .param p1, "out"    # Ljava/io/PrintWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    sget-object v0, Lcom/wutka/dtd/DTDCardinal;->NONE:Lcom/wutka/dtd/DTDCardinal;

    if-ne p0, v0, :cond_5

    .line 66
    :cond_4
    :goto_4
    return-void

    .line 54
    :cond_5
    sget-object v0, Lcom/wutka/dtd/DTDCardinal;->OPTIONAL:Lcom/wutka/dtd/DTDCardinal;

    if-ne p0, v0, :cond_f

    .line 56
    const-string v0, "?"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_4

    .line 58
    :cond_f
    sget-object v0, Lcom/wutka/dtd/DTDCardinal;->ZEROMANY:Lcom/wutka/dtd/DTDCardinal;

    if-ne p0, v0, :cond_19

    .line 60
    const-string v0, "*"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_4

    .line 62
    :cond_19
    sget-object v0, Lcom/wutka/dtd/DTDCardinal;->ONEMANY:Lcom/wutka/dtd/DTDCardinal;

    if-ne p0, v0, :cond_4

    .line 64
    const-string v0, "+"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_4
.end method
