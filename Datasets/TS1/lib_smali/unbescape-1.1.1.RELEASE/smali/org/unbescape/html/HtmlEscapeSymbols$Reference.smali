.class final Lorg/unbescape/html/HtmlEscapeSymbols$Reference;
.super Ljava/lang/Object;
.source "HtmlEscapeSymbols.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/unbescape/html/HtmlEscapeSymbols;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Reference"
.end annotation


# instance fields
.field private final codepoints:[I

.field private final ncr:[C


# direct methods
.method private constructor <init>(Ljava/lang/String;[I)V
    .registers 4
    .param p1, "ncr"    # Ljava/lang/String;
    .param p2, "codepoints"    # [I

    .prologue
    .line 535
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 536
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    iput-object v0, p0, Lorg/unbescape/html/HtmlEscapeSymbols$Reference;->ncr:[C

    .line 537
    iput-object p2, p0, Lorg/unbescape/html/HtmlEscapeSymbols$Reference;->codepoints:[I

    .line 538
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;[ILorg/unbescape/html/HtmlEscapeSymbols$1;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # [I
    .param p3, "x2"    # Lorg/unbescape/html/HtmlEscapeSymbols$1;

    .prologue
    .line 529
    invoke-direct {p0, p1, p2}, Lorg/unbescape/html/HtmlEscapeSymbols$Reference;-><init>(Ljava/lang/String;[I)V

    return-void
.end method

.method static synthetic access$100(Lorg/unbescape/html/HtmlEscapeSymbols$Reference;)[C
    .registers 2
    .param p0, "x0"    # Lorg/unbescape/html/HtmlEscapeSymbols$Reference;

    .prologue
    .line 529
    iget-object v0, p0, Lorg/unbescape/html/HtmlEscapeSymbols$Reference;->ncr:[C

    return-object v0
.end method

.method static synthetic access$200(Lorg/unbescape/html/HtmlEscapeSymbols$Reference;)[I
    .registers 2
    .param p0, "x0"    # Lorg/unbescape/html/HtmlEscapeSymbols$Reference;

    .prologue
    .line 529
    iget-object v0, p0, Lorg/unbescape/html/HtmlEscapeSymbols$Reference;->codepoints:[I

    return-object v0
.end method
