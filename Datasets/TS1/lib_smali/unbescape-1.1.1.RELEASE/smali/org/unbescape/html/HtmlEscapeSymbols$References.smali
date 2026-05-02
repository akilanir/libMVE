.class final Lorg/unbescape/html/HtmlEscapeSymbols$References;
.super Ljava/lang/Object;
.source "HtmlEscapeSymbols.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/unbescape/html/HtmlEscapeSymbols;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "References"
.end annotation


# instance fields
.field private final references:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/unbescape/html/HtmlEscapeSymbols$Reference;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    .line 515
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 512
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xc8

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/unbescape/html/HtmlEscapeSymbols$References;->references:Ljava/util/List;

    .line 516
    return-void
.end method

.method static synthetic access$000(Lorg/unbescape/html/HtmlEscapeSymbols$References;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lorg/unbescape/html/HtmlEscapeSymbols$References;

    .prologue
    .line 510
    iget-object v0, p0, Lorg/unbescape/html/HtmlEscapeSymbols$References;->references:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method addReference(IILjava/lang/String;)V
    .registers 8
    .param p1, "codepoint0"    # I
    .param p2, "codepoint1"    # I
    .param p3, "ncr"    # Ljava/lang/String;

    .prologue
    .line 523
    iget-object v0, p0, Lorg/unbescape/html/HtmlEscapeSymbols$References;->references:Ljava/util/List;

    new-instance v1, Lorg/unbescape/html/HtmlEscapeSymbols$Reference;

    const/4 v2, 0x2

    new-array v2, v2, [I

    const/4 v3, 0x0

    aput p1, v2, v3

    const/4 v3, 0x1

    aput p2, v2, v3

    const/4 v3, 0x0

    invoke-direct {v1, p3, v2, v3}, Lorg/unbescape/html/HtmlEscapeSymbols$Reference;-><init>(Ljava/lang/String;[ILorg/unbescape/html/HtmlEscapeSymbols$1;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 524
    return-void
.end method

.method addReference(ILjava/lang/String;)V
    .registers 7
    .param p1, "codepoint"    # I
    .param p2, "ncr"    # Ljava/lang/String;

    .prologue
    .line 519
    iget-object v0, p0, Lorg/unbescape/html/HtmlEscapeSymbols$References;->references:Ljava/util/List;

    new-instance v1, Lorg/unbescape/html/HtmlEscapeSymbols$Reference;

    const/4 v2, 0x1

    new-array v2, v2, [I

    const/4 v3, 0x0

    aput p1, v2, v3

    const/4 v3, 0x0

    invoke-direct {v1, p2, v2, v3}, Lorg/unbescape/html/HtmlEscapeSymbols$Reference;-><init>(Ljava/lang/String;[ILorg/unbescape/html/HtmlEscapeSymbols$1;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 520
    return-void
.end method
