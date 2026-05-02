.class public Lcom/wutka/dtd/DTDDecl;
.super Ljava/lang/Object;
.source "DTDDecl.java"

# interfaces
.implements Lcom/wutka/dtd/DTDOutput;


# static fields
.field public static final FIXED:Lcom/wutka/dtd/DTDDecl;

.field public static final IMPLIED:Lcom/wutka/dtd/DTDDecl;

.field public static final REQUIRED:Lcom/wutka/dtd/DTDDecl;

.field public static final VALUE:Lcom/wutka/dtd/DTDDecl;


# instance fields
.field public name:Ljava/lang/String;

.field public type:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 12
    new-instance v0, Lcom/wutka/dtd/DTDDecl;

    const/4 v1, 0x0

    const-string v2, "FIXED"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/DTDDecl;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/DTDDecl;->FIXED:Lcom/wutka/dtd/DTDDecl;

    .line 13
    new-instance v0, Lcom/wutka/dtd/DTDDecl;

    const/4 v1, 0x1

    const-string v2, "REQUIRED"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/DTDDecl;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/DTDDecl;->REQUIRED:Lcom/wutka/dtd/DTDDecl;

    .line 14
    new-instance v0, Lcom/wutka/dtd/DTDDecl;

    const/4 v1, 0x2

    const-string v2, "IMPLIED"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/DTDDecl;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/DTDDecl;->IMPLIED:Lcom/wutka/dtd/DTDDecl;

    .line 15
    new-instance v0, Lcom/wutka/dtd/DTDDecl;

    const/4 v1, 0x3

    const-string v2, "VALUE"

    invoke-direct {v0, v1, v2}, Lcom/wutka/dtd/DTDDecl;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/wutka/dtd/DTDDecl;->VALUE:Lcom/wutka/dtd/DTDDecl;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .registers 3
    .param p1, "aType"    # I
    .param p2, "aName"    # Ljava/lang/String;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput p1, p0, Lcom/wutka/dtd/DTDDecl;->type:I

    .line 23
    iput-object p2, p0, Lcom/wutka/dtd/DTDDecl;->name:Ljava/lang/String;

    .line 24
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "ob"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 28
    if-ne p1, p0, :cond_5

    .line 33
    :cond_4
    :goto_4
    return v1

    .line 29
    :cond_5
    instance-of v3, p1, Lcom/wutka/dtd/DTDDecl;

    if-nez v3, :cond_b

    move v1, v2

    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 31
    check-cast v0, Lcom/wutka/dtd/DTDDecl;

    .line 32
    .local v0, "other":Lcom/wutka/dtd/DTDDecl;
    iget v3, v0, Lcom/wutka/dtd/DTDDecl;->type:I

    iget v4, p0, Lcom/wutka/dtd/DTDDecl;->type:I

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 33
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
    .line 39
    sget-object v0, Lcom/wutka/dtd/DTDDecl;->FIXED:Lcom/wutka/dtd/DTDDecl;

    if-ne p0, v0, :cond_a

    .line 41
    const-string v0, " #FIXED"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 52
    :cond_9
    :goto_9
    return-void

    .line 43
    :cond_a
    sget-object v0, Lcom/wutka/dtd/DTDDecl;->REQUIRED:Lcom/wutka/dtd/DTDDecl;

    if-ne p0, v0, :cond_14

    .line 45
    const-string v0, " #REQUIRED"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_9

    .line 47
    :cond_14
    sget-object v0, Lcom/wutka/dtd/DTDDecl;->IMPLIED:Lcom/wutka/dtd/DTDDecl;

    if-ne p0, v0, :cond_9

    .line 49
    const-string v0, " #IMPLIED"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_9
.end method
